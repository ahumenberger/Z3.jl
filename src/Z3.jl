module Z3

import Libdl
using CxxWrap
import Base: +, -, *, /, ^, ==, !=, !, <=, >=, <, >
import Base: string, getindex, size, length, push!
import Base: numerator, denominator
import Base: Int, Rational

@wrapmodule(realpath(joinpath(Base.@__DIR__, "..", "deps", "src", "libz3jl." * Libdl.dlext)))

function __init__()
    @initcxx
end

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

or(vec::ExprVector) = mk_or(vec)
or(vec::AbstractVector{Expr}) = or(vec...)
function or(xs::Expr...)
    vec = ExprVector(ctx(first(xs)))
    for x in xs
        push!(vec, x)
    end
    or(vec)
end

and(vec::ExprVector) = mk_and(vec)
and(vec::AbstractVector{Expr}) = and(vec...)
function and(xs::Expr...)
    vec = ExprVector(ctx(first(xs)))
    for x in xs
        push!(vec, x)
    end
    and(vec)
end

# ------------------------------------------------------------------------------

types_show = [
    Expr,
    ExprVector,
    Solver,
    Model,
    # FuncDecl
]

for T in types_show
    Base.show(io::IO, x::T) = print(io, string(x))
end

# ------------------------------------------------------------------------------

function __should_be_exported(sym::Symbol)
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
    true
end

for name in names(Z3, all=true, imported=false)
    if __should_be_exported(name)
        @eval export $name 
    end
end

end # module
