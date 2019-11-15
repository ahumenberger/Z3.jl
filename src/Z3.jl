module Z3

import Libdl
using CxxWrap
import Base: +, -, *, /, ^, ==, !=, !, <=, >=, <, >
import Base: string, getindex, size, length, push!, isequal
import Base: numerator, denominator
import Base: Int, Rational

@wrapmodule(realpath(joinpath(Base.@__DIR__, "..", "deps", "src", "libz3jl." * Libdl.dlext)))

function __init__()
    @initcxx
end

const AstVector      = AstVectorTpl{Ast}
const ExprVector     = AstVectorTpl{Expr}
const SortVector     = AstVectorTpl{Sort}
const FuncDeclVector = AstVectorTpl{FuncDecl}

# ------------------------------------------------------------------------------
# Model

consts(m::Model) = (get_const_decl(m, i)()=>get_const_interp(m, get_const_decl(m, i)) for i in 0:num_consts(m)-1)
funcs(m::Model) = (get_func_decl(m, i)=>get_func_interp(m, get_func_decl(m, i)) for i in 0:num_funcs(m)-1)

Base.length(m::Model) = size(m)

# ------------------------------------------------------------------------------
# Expr

function Int(x::Expr)
    @assert is_int(x)
    get_numeral_int(x)
end
Rational{Int}(x::Expr) = Int(numerator(x)) // Int(denominator(x))


Base.isequal(x::Expr, y::Expr) = isequal(id(x), id(y))

or(xs::ExprVector) = mk_or(xs)
or(xs) = or(ExprVector(ctx(first(xs)), xs))
or(xs...) = or(xs)

and(xs::ExprVector) = mk_and(xs)
and(xs) = and(ExprVector(ctx(first(xs)), xs))
and(xs...) = and(xs)

# ------------------------------------------------------------------------------
# ExprVector

function ExprVector(ctx::Context, xs)
    vec = ExprVector(ctx)
    for x in xs
        push!(vec, x)
    end
    vec
end

Base.iterate(x::ExprVector, s=1) = s <= length(x) ? (x[s], s+1) : nothing

# ------------------------------------------------------------------------------
# Solver

check(s::Solver, xs::AbstractVector{<:Expr}) = check(s, ExprVector(ctx(s), xs))

# ------------------------------------------------------------------------------

types_show = [
    Ast,
    AstVectorTpl,
    Solver,
    Model
]

for T in types_show
    Base.show(io::IO, x::T) = print(io, string(x))
end

# ------------------------------------------------------------------------------

function __should_be_exported(sym::Core.Symbol)
    s = string(sym)
    # Private
    startswith(s, "__")   && return false
    startswith(s, "#")    && return false
    isequal(s, "Z3")      && return false
    isequal(s, "include") && return false
    isequal(s, "eval")    && return false
    # Types created by CxxWrap
    endswith(s, "Allocated") && return false
    endswith(s, "Ref")       && return false
    # Enums
    eval(sym) isa CheckResult && return false
    # Conflicts
    isequal(sym, :Expr) && return false
    isequal(sym, :Symbol) && return false
    true
end

for name in names(Z3, all=true, imported=false)
    if __should_be_exported(name)
        @eval export $name 
    end
end

end # module
