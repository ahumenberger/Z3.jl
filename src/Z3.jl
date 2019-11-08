module Z3

import Libdl
using CxxWrap

import Base: +, -, *, /, ^, ==, !=, !, <=, >=, <, >
import Base: string

@wrapmodule(realpath(joinpath(@__DIR__, "..", "deps", "src", "libz3jl." * Libdl.dlext)))

function __init__()
    @initcxx
end

# Base.show(io::IO, x::expr) = print(io, get_string(x))

end # module
