module Z3

using CxxWrap
using z3_jll

import Base: +, -, *, /, ^, ==, !=, !, <=, >=, <, >, xor, rem, mod, &, |, ~
import Base: min, max, abs, sqrt, sum
import Base: string, getindex, size, length, push!, isequal, hash
import Base: numerator, denominator

if !isdefined(z3_jll, :libz3jl)
    error("Platform not supported")
end

@wrapmodule(z3_jll.get_libz3jl_path)

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

or(xs::ExprVector) = mk_or(xs)
function or(xs::Union{AbstractArray, Tuple})
    @assert length(xs) > 1
    or(ExprVector(ctx(first(xs)), xs))
end
or(xs...) = or(xs)

and(xs::ExprVector) = mk_and(xs)
function and(xs::Union{AbstractArray, Tuple})
    @assert length(xs) > 1
    and(ExprVector(ctx(first(xs)), xs))
end
and(xs...) = and(xs)

# ------------------------------------------------------------------------------
# ExprVector

CxxWrap.@cxxdereference function ExprVector(ctx::Context, xs)
    vec = ExprVector(ctx)
    for x in xs
        push!(vec, x)
    end
    vec
end

Base.promote(x::S, y::T) where {S <: Expr, T <: Bool}                = (x, bool_val(ctx(x), y))
Base.promote(x::S, y::T) where {S <: Expr, T <: Integer}             = (x, num_val(ctx(x), y, get_sort(x)))
Base.promote(x::S, y::T) where {S <: Expr, T <: AbstractFloat}       = promote(x, rationalize(y))
Base.promote(x::S, y::T) where {S <: Expr, T <: Rational{<:Integer}} = (x, real_val(ctx(x), numerator(y), denominator(y)))
Base.promote(x::T, y::S) where {S <: Expr, T <: Number}              = reverse(promote(y, x))

for op in [:+, :-, :*, :/, :^, :(==), :(!=), :(<=), :(>=), :(<), :(>), :&, :|, :xor]
    @eval begin
        $(op)(x::S, y::T) where {S <: Expr, T <: Number} = $(op)(promote(x, y)...)
        $(op)(x::T, y::S) where {S <: Expr, T <: Number} = $(op)(promote(x, y)...)
    end
end

# ------------------------------------------------------------------------------
# Solver

check(s::Solver, xs::AbstractVector{<:Expr}) = check(s, ExprVector(ctx(s), xs))

# ------------------------------------------------------------------------------
# Model

eval(m::Model, e::Expr, model_completion::Bool = false) = __eval(m, e, model_completion)

# ------------------------------------------------------------------------------

for T in [Ast, AstVectorTpl, Solver, Model, Symbol, Fixedpoint, Optimize, Params, ParamDescrs, Goal]
    Base.show(io::IO, x::T) = print(io, string(x))
end

# ------------------------------------------------------------------------------

# function __with_main_ctx(name::Core.Symbol, m::Method)
#     try
#         arg_types = fieldtypes(m.sig)[2:end]
#         params = [:($(Core.Symbol(string("x", i)))::$T) for (i, T) in enumerate(arg_types) if !(Context <: T)]
#         length(arg_types) == length(params) && return nothing
#         call_args = [Context <: T ? :(main_ctx()) : :($(Core.Symbol(string("x", i)))) for (i, T) in enumerate(arg_types)]
#         :($(name)($(params...)) = $(name)($(call_args...)))
#     catch
#         # TODO: varargs not supported yet
#         return nothing
#     end
# end

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

        # for m in methods(eval(name))
        #     @eval $(__with_main_ctx(name, m))
        # end
    end
end

end # module
