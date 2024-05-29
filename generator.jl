using Clang.Generators
using z3_jll

cd(@__DIR__)

include_dir = normpath(z3_jll.artifact_dir, "include")

options = load_options(joinpath(@__DIR__, "generator.toml"))

args = get_default_args()  # Note you must call this function firstly and then append your own flags
push!(args, "-I$include_dir")

headers = [joinpath(include_dir, "z3.h")]
# headers = [joinpath(include_dir, header) for header in readdir(include_dir) if endswith(header, ".h")]
# there is also an experimental `detect_headers` function for auto-detecting top-level headers in the directory
# headers = detect_headers(include_dir, args)

# create context
ctx = create_context(headers, args, options)

# run generator
build!(ctx)
