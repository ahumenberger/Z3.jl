module Z3

include("libz3.jl")
using .Libz3
import Base: ==, isless
export init_ctx, clear_ctx, Sort, DeclareSort, BoolSort, IntSort, BitVecSort, Float16Sort, Float32Sort, Float64Sort,
BoolVal, IntVal, BitVecVal, Float32Val, Float64Val,
Const, IntVar, BoolVar, FP, FuncDecl, And, Or, Not, Exists, If, Sort,
Const, IntVar, BoolVar, FP, FuncDecl, And, Or, Not, If, Iff, Exists, Sort,
Context, Solver, del_solver, add, push, pop, check, CheckResult, model, assertions

#---------#
# Context #
#---------#

mutable struct Context
    ctx::Z3_context
    finalized::Bool
    lock::ReentrantLock
    function Context(ctx::Z3_context, finalized=false, lock=ReentrantLock())
        c = new(ctx, false, ReentrantLock())
        finalizer(finalize_ctx, c)
    end
end

function finalize_ctx(c)
    if islocked(c.lock) || !trylock(c.lock)
        finalizer(finalize_ctx, c)
        return nothing
    end
    try
        c.finalized = true
        Z3_del_context(c.ctx)
    finally
        unlock(c.lock)
    end
end

function Context()
    cfg = Z3_mk_config()
    ctx = Z3_mk_context_rc(cfg)
    Z3_del_config(cfg)
    Z3_enable_concurrent_dec_ref(ctx)
    c = Context(ctx)
    return c
end

ref(c::Context) = c.ctx

# Global Z3 context
const _main_ctx::Ref{Union{Context,Nothing}} = Ref{Union{Context,Nothing}}(nothing)

function main_ctx()
    global _main_ctx
    if isnothing(_main_ctx[])
        _main_ctx[] = Context()
    end
    return _main_ctx[]
end

function _get_ctx(ctx::Union{Context,Nothing})
    if isnothing(ctx)
        return main_ctx()
    else
        return ctx
    end
end

#-----#
# AST #
#-----#

abstract type AST end

Base.show(io::IO, x::AST) = print(io, unsafe_string(Z3_ast_to_string(ctx_ref(x), as_ast(x))))

#-------#
# Sorts #
#-------#

mutable struct Sort <: AST
    ctx::Context
    ast::Z3_sort
    function Sort(ctx::Context, ast::Z3_sort)
        s = new(ctx, ast)
        Z3_inc_ref(ctx_ref(s), s.ast)
        finalizer(finalize_sort, s)
    end
end

function finalize_sort(s)
    if !s.ctx.finalized
        if islocked(s.ctx.lock) || !trylock(s.ctx.lock)
            finalizer(finalize_sort, s)
            return nothing
        end
        try
            Z3_dec_ref(s.ctx.ctx, s.ast)
        finally
            unlock(s.ctx.lock)
        end
    end
end

as_ast(s::Sort) = Z3_sort_to_ast(ctx_ref(s), s.ast)
ctx_ref(s::Sort) = ref(s.ctx)

function DeclareSort(name::Union{String,Int}, ctx=nothing)
    ctx = _get_ctx(ctx)
    sym = to_symbol(name, ctx)
    sort = Z3_mk_uninterpreted_sort(ref(ctx), sym)
    return Sort(ctx, sort)
end

function BoolSort(ctx=nothing)
    ctx = _get_ctx(ctx)
    Sort(ctx, Z3_mk_bool_sort(ref(ctx)))
end

function IntSort(ctx=nothing)
    ctx = _get_ctx(ctx)
    Sort(ctx, Z3_mk_int_sort(ref(ctx)))
end

function BitVecSort(sz::Int, ctx=nothing)
    ctx = _get_ctx(ctx)
    Sort(ctx, Z3_mk_bv_sort(ref(ctx), sz))
end

function Float16Sort(ctx=nothing)
    ctx = _get_ctx(ctx)
    Sort(ctx, Z3_mk_fpa_sort_16(ref(ctx)))
end

function Float32Sort(ctx=nothing)
    ctx = _get_ctx(ctx)
    Sort(ctx, Z3_mk_fpa_sort_32(ref(ctx)))
end

function Float64Sort(ctx=nothing)
    ctx = _get_ctx(ctx)
    Sort(ctx, Z3_mk_fpa_sort_64(ref(ctx)))
end

#--------------#
# Declarations #
#--------------#
mutable struct FuncDecl <: AST
    ctx::Context
    decl::Z3_func_decl
    function FuncDecl(ctx::Context, decl::Z3_func_decl)
        f = new(ctx, decl)
        Z3_inc_ref(ctx_ref(f), f.decl)
        finalizer(finalize_func_decl, f)
    end
end

function finalize_func_decl(f)
    if !f.ctx.finalized
        if islocked(f.ctx.lock) || !trylock(f.ctx.lock)
            finalizer(finalize_func_decl, f)
            return nothing
        end
        try
            Z3_dec_ref(f.ctx.ctx, f.decl)
        finally
            unlock(f.ctx.lock)
        end
    end
end

as_ast(f::FuncDecl) = Z3_func_decl_to_ast(ctx_ref(f), f.decl)
ctx_ref(f::FuncDecl) = ref(f.ctx)

function FuncDecl(name::String, domain::Vector{Sort}, range::Sort, ctx=nothing)
    ctx = _get_ctx(ctx)
    decl = Z3_mk_func_decl(ref(ctx), to_symbol(name, ctx), length(domain), map(s -> s.ast, domain), range.ast)
    return FuncDecl(ctx, decl)
end

function (f::FuncDecl)(fargs)
    return Expr(f.ctx, Z3_mk_app(ctx_ref(f), f.decl, length(fargs), map(e -> as_ast(e), fargs)))
end

#-------------#
# Expressions #
#-------------#

mutable struct Expr <: AST
    ctx::Context
    expr::Z3_ast
    function Expr(ctx::Context, expr::Z3_ast)
        e = new(ctx, expr)
        Z3_inc_ref(ctx_ref(e), e.expr)
        finalizer(finalize_expr, e)
    end
end

function finalize_expr(e)
    if !e.ctx.finalized
        if islocked(e.ctx.lock) || !trylock(e.ctx.lock)
            finalizer(finalize_expr, e)
            return nothing
        end
        try
            Z3_dec_ref(e.ctx.ctx, e.expr)
        finally
            unlock(e.ctx.lock)
        end
    end
end

as_ast(e::Expr) = e.expr
ctx_ref(e::Expr) = ref(e.ctx)

function BoolVal(b::Bool, ctx=nothing)
    ctx = _get_ctx(ctx)
    Expr(ctx, b ? Z3_mk_true(ref(ctx)) : Z3_mk_false(ref(ctx)))
end

function IntVal(n::Integer, ctx=nothing)
    ctx = _get_ctx(ctx)
    Expr(ctx, Z3_mk_numeral(ref(ctx), string(n), IntSort(ctx).ast))
end

function BitVecVal(v::Integer, sz::Int, ctx=nothing)
    ctx = _get_ctx(ctx)
    Expr(ctx, Z3_mk_numeral(ref(ctx), string(v), BitVecSort(sz, ctx).ast))
end

function Float32Val(v::Float32, ctx=nothing)
    ctx = _get_ctx(ctx)
    Expr(ctx, Z3_mk_fpa_numeral_float(ref(ctx), v, Float32Sort(ctx).ast))
end

function Float64Val(v::Float64, ctx=nothing)
    ctx = _get_ctx(ctx)
    Expr(ctx, Z3_mk_fpa_numeral_double(ref(ctx), v, Float64Sort(ctx).ast))
end

function FP(name::String, fpsort::Sort)
    Expr(fpsort.ctx, Z3_mk_const(ctx_ref(fpsort), to_symbol(name, fpsort.ctx), fpsort.ast))
end

(==)(a::Expr, b::Expr) = Expr(a.ctx, Z3_mk_eq(ctx_ref(a), as_ast(a), as_ast(b)))
Base.isless(a::Expr, b::Expr) = Expr(a.ctx, Z3_mk_lt(ctx_ref(a), as_ast(a), as_ast(b)))

function IntVar(name::String, ctx=nothing)
    ctx = _get_ctx(ctx)
    return Expr(ctx, Z3_mk_const(ref(ctx), to_symbol(name, ctx), IntSort(ctx).ast))
end

function BoolVar(name::String, ctx=nothing)
    ctx = _get_ctx(ctx)
    return Expr(ctx, Z3_mk_const(ref(ctx), to_symbol(name, ctx), BoolSort(ctx).ast))
end

function Const(name::String, sort::Sort)
    return Expr(sort.ctx, Z3_mk_const(ctx_ref(sort), to_symbol(name, sort.ctx), sort.ast))
end

function And(args::Vector{Expr})
    ctx = args[1].ctx
    return Expr(ctx, Z3_mk_and(ref(ctx), length(args), map(e -> as_ast(e), args)))
end

function Or(args::Vector{Expr})
    ctx = args[1].ctx
    return Expr(ctx, Z3_mk_or(ref(ctx), length(args), map(e -> as_ast(e), args)))
end

function Not(a::Expr)
    ctx = a.ctx
    return Expr(ctx, Z3_mk_not(ref(ctx), as_ast(a)))
end

function Exists(vars::Vector{Expr}, body::Expr)
    ctx = body.ctx
    return Expr(ctx, Z3_mk_exists_const(ref(ctx), 0, length(vars), map(e -> as_ast(e), vars), 0, [], as_ast(body)))
end

function If(cond::Expr, then_branch::Expr, else_branch::Expr)
    ctx = cond.ctx
    return Expr(ctx, Z3_mk_ite(ref(ctx), as_ast(cond), as_ast(then_branch), as_ast(else_branch)))
end

function Iff(t1::Expr, t2::Expr)
    ctx = t1.ctx
    return Expr(ctx, Z3_mk_iff(ref(ctx), as_ast(t1), as_ast(t2)))
end

#--------#
# Solver #
#--------#

mutable struct Solver
    ctx::Context
    solver::Z3_solver
    function Solver(ctx::Context, solver::Z3_solver)
        s = new(ctx, solver)
        Z3_solver_inc_ref(ctx_ref(s), s.solver)
        finalizer(finalize_solver, s)
    end
end

function finalize_solver(s)
    if !s.ctx.finalized
        if islocked(s.ctx.lock) || !trylock(s.ctx.lock)
            finalizer(finalize_solver, s)
            return nothing
        end
        try
            Z3_solver_dec_ref(s.ctx.ctx, s.solver)
        finally
            unlock(s.ctx.lock)
        end
    end
end

ctx_ref(s::Solver) = ref(s.ctx)

function Solver(ctx=nothing)
    ctx = _get_ctx(ctx)
    s = Solver(ctx, Z3_mk_solver(ref(ctx)))
end

function add(s::Solver, e::Expr)
    Z3_solver_assert(ref(s.ctx), s.solver, as_ast(e))
end

function push(s::Solver)
    Z3_solver_push(ref(s.ctx), s.solver)
end

function pop(s::Solver, n=1)
    Z3_solver_pop(ref(s.ctx), s.solver, n)
end

mutable struct Model
    ctx::Context
    model::Z3_model

    function Model(ctx::Context, model::Z3_model)
        m = new(ctx, model)
        Z3_model_inc_ref(ctx_ref(m), m.model)
        finalizer(finalize_model, m)
    end
end

function finalize_model(m)
    if !m.ctx.finalized
        if islocked(m.ctx.lock) || !trylock(m.ctx.lock)
            finalizer(finalize_model, m)
            return nothing
        end
        try
            Z3_model_dec_ref(m.ctx.ctx, m.model)
        finally
            unlock(m.ctx.lock)
        end
    end
end

model(s::Solver) = Model(s.ctx, Z3_solver_get_model(ctx_ref(s), s.solver))
ctx_ref(m::Model) = ref(m.ctx)

function Base.show(io::IO, m::Model)
    print(io, unsafe_string(Z3_model_to_string(ctx_ref(m), m.model)))
end

struct CheckResult
    result::Z3_lbool
end

CheckResult(r::Symbol) = r == :sat ? CheckResult(Z3_L_TRUE) : r == :unsat ? CheckResult(Z3_L_FALSE) : CheckResult(Z3_L_UNDEF)

function Base.show(io::IO, r::CheckResult)
    print(io, r.result == Z3_L_TRUE ? "sat" : r.result == Z3_L_FALSE ? "unsat" : "unknown")
end

check(s::Solver) = CheckResult(Z3_solver_check(ref(s.ctx), s.solver))

assertions(s::Solver) = unsafe_string(Z3_ast_vector_to_string(ref(s.ctx), Z3_solver_get_assertions(ref(s.ctx), s.solver)))

#--------#
# Others #
#--------#

function to_symbol(s::Union{String,Int}, ctx=nothing)
    c = ref(_get_ctx(ctx))
    _sym(s::String) = Z3_mk_string_symbol(c, s)
    _sym(s::Int) = Z3_mk_int_symbol(c, s)
    return _sym(s)
end

end

