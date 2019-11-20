module Z3

import Libdl
using CxxWrap
import Base: +, -, *, /, ^, ==, !=, !, <=, >=, <, >
import Base: string, getindex, size, length, push!, isequal, hash
import Base: numerator, denominator
import Base: Int, Rational

@wrapmodule(realpath(joinpath(Base.@__DIR__, "..", "deps", "src", "libz3jl." * Libdl.dlext)))

function __init__()
    @initcxx
    __main_ctx[] = Context()
end

const __main_ctx = Ref{Context}()
main_ctx() = __main_ctx[]

# ------------------------------------------------------------------------------

const AstVector      = AstVectorTpl{Ast}
const ExprVector     = AstVectorTpl{Expr}
const SortVector     = AstVectorTpl{Sort}
const FuncDeclVector = AstVectorTpl{FuncDecl}

Base.iterate(x::AstVectorTpl, s = 1) = s <= length(x) ? (x[s], s + 1) : nothing

# ------------------------------------------------------------------------------
# Model

consts(m::Model) = (get_const_decl(m, i)() => get_const_interp(m, get_const_decl(m, i)) for i in 0:num_consts(m) - 1)
funcs(m::Model) = (get_func_decl(m, i) => get_func_interp(m, get_func_decl(m, i)) for i in 0:num_funcs(m) - 1)

Base.length(m::Model) = size(m)

# ------------------------------------------------------------------------------
# Expr

function Int(x::Expr)
    @assert is_int(x)
    get_numeral_int(x)
end
Rational{Int}(x::Expr) = Int(numerator(x)) // Int(denominator(x))

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

# ------------------------------------------------------------------------------
# Solver

check(s::Solver, xs::AbstractVector{<:Expr}) = check(s, ExprVector(ctx(s), xs))

# ------------------------------------------------------------------------------
# Model

eval(m::Model, e::Expr, model_completion::Bool = false) = __eval(m, e, model_completion)

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

function __should_be_exported(s::Core.Symbol)
    str = string(s)
    # Private
    startswith(str, "__")      && return false
    startswith(str, "#")       && return false
    # Auxiliary types created by CxxWrap
    endswith(str, "Allocated") && return false
    endswith(str, "Ref")       && return false
    # Own module
    isequal(s, :Z3)            && return false
    # Methods from Base.MainInclude
    isequal(s, :include)       && return false
    isequal(s, :eval)          && return false
    # Enums
    eval(s) isa CheckResult    && return false
    eval(s) isa RoundingMode   && return false
    # Conflicting types of Z3 and Base/Core
    isequal(s, :Expr)          && return false
    isequal(s, :Symbol)        && return false
    # Export otherwise
    return true
end

for name in names(Z3, all = true, imported = false)
    if __should_be_exported(name)
        @eval export $name 
    end
end

end # module
