module Z3

include("libz3.jl")
using .Libz3
import Base: ==, !=, <, <=, >, >=
import Base: +, *, -, /, ^
export init_ctx, clear_ctx, Sort, DeclareSort, BoolSort, IntSort, BitVecSort, Float16Sort, Float32Sort, Float64Sort,
BoolVal, IntVal, BitVecVal, Float32Val, Float64Val,
Const, IntVar, BoolVar, FP, FuncDecl, And, Or, Not, If, Iff, Exists, Pbeq, Sort,
Context, Solver, add, push, pop, check, CheckResult, model, assertions

#---------#
# Context #
#---------#

mutable struct Context
    ctx::Z3_context
    rc::Threads.Atomic{Int}
    function Context(ctx::Z3_context, rc=Threads.Atomic{Int}(0))
        c = new(ctx, rc)
        finalizer(finalize_ctx, c)
    end
end

function finalize_ctx(c)
    if c.rc[] > 0
        finalizer(finalize_ctx, c)
    else
        Z3_del_context(c.ctx)
    end
end

function Context()
    cfg = Z3_mk_config()
    ctx = Z3_mk_context(cfg)
    Z3_del_config(cfg)
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

struct Sort <: AST
    ctx::Context
    ast::Z3_sort
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
struct FuncDecl <: AST
    ctx::Context
    decl::Z3_func_decl
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

struct Expr <: AST
    ctx::Context
    expr::Z3_ast
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
Base.:<(a::Expr, b::Expr) = Expr(a.ctx, Z3_mk_lt(ctx_ref(a), as_ast(a), as_ast(b)))
Base.:<=(a::Expr, b::Expr) = Expr(a.ctx, Z3_mk_le(ctx_ref(a), as_ast(a), as_ast(b)))
Base.:>(a::Expr, b::Expr) = Expr(a.ctx, Z3_mk_gt(ctx_ref(a), as_ast(a), as_ast(b)))
Base.:>=(a::Expr, b::Expr) = Expr(a.ctx, Z3_mk_ge(ctx_ref(a), as_ast(a), as_ast(b)))
Base.:+(args::Vararg{Expr}) = Expr(args[1].ctx, Z3_mk_add(ctx_ref(args[1]), length(args), map(as_ast, collect(args))))
Base.:*(args::Vararg{Expr}) = Expr(args[1].ctx, Z3_mk_mul(ctx_ref(args[1]), length(args), map(as_ast, collect(args))))
Base.:-(a::Expr, b::Expr) = Expr(a.ctx, Z3_mk_sub(ctx_ref(a), 2, map(as_ast, [a, b])))
Base.:-(a::Expr) = Expr(a.ctx, Z3_mk_unary_minus(ctx_ref(a), as_ast(a)))
Base.:/(a::Expr, b::Expr) = Expr(a.ctx, Z3_mk_div(ctx_ref(a), as_ast(a), as_ast(b)))
Base.:^(a::Expr, b::Expr) = Expr(a.ctx, Z3_mk_power(ctx_ref(a), as_ast(a), as_ast(b)))
Base.:!=(a::Expr, b::Expr) = Expr(a.ctx, Z3_mk_distinct(ctx_ref(a), as_ast(a), as_ast(b)))

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

function Pbeq(vars::Vector{Expr}, coeffs, k)
    ctx = vars[1].ctx
    return Expr(ctx, Z3_mk_pbeq(ref(ctx), length(vars), map(e -> as_ast(e), vars), coeffs, k) )
end

#--------#
# Solver #
#--------#

mutable struct Solver
    ctx::Context
    solver::Z3_solver
    function Solver(ctx::Context, solver::Z3_solver)
        Threads.atomic_add!(ctx.rc, 1)
        s = new(ctx, solver)
        Z3_solver_inc_ref(ctx_ref(s), s.solver)
        finalizer(finalize_solver, s)
    end
end

function finalize_solver(s)
    Z3_solver_dec_ref(s.ctx.ctx, s.solver)
    Threads.atomic_sub!(s.ctx.rc, 1)
end

ctx_ref(s::Solver) = ref(s.ctx)

function Solver(ctx=nothing)
    ctx = _get_ctx(ctx)
    Solver(ctx, Z3_mk_solver(ref(ctx)))
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
        Threads.atomic_add!(ctx.rc, 1)
        m = new(ctx, model)
        Z3_model_inc_ref(ctx_ref(m), m.model)
        finalizer(finalize_model, m)
    end
end

function finalize_model(m)
    Z3_model_dec_ref(m.ctx.ctx, m.model)
    Threads.atomic_sub!(m.ctx.rc, 1)
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

