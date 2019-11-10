module Z3

import Libdl
using CxxWrap
import Base: +, -, *, /, ^, ==, !=, !, <=, >=, <, >
import Base: string

@wrapmodule(realpath(joinpath(Base.@__DIR__, "..", "deps", "src", "libz3jl." * Libdl.dlext)))

function __init__()
    @initcxx
end

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
