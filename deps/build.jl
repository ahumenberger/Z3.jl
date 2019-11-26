using LibGit2
using CMake
using CxxWrap

z3_url = "https://github.com/Z3Prover/z3"
z3_version = "4.8.6"

z3_dir = joinpath(pwd(), "z3")
z3_builddir = joinpath(z3_dir, "build")
srcdir = joinpath(pwd(), "src")

if !isdir(z3_dir)
    repo = LibGit2.clone(z3_url, z3_dir)
    hash = LibGit2.GitHash(repo, "refs/tags/z3-$z3_version")
    LibGit2.checkout!(repo, string(hash))
end

if !isdir(z3_builddir)
    mkdir(z3_builddir)
end
cd(z3_builddir)
run(`$cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release $z3_dir`)
run(`make`)

JlCxx_dir = joinpath(dirname(dirname(CxxWrap.jlcxx_path)), "lib", "cmake", "JlCxx")

CMAKE_FLAGS = `-DCMAKE_BUILD_TYPE=Release -DCMAKE_LIBRARY_OUTPUT_DIRECTORY=$srcdir -DCMAKE_RUNTIME_OUTPUT_DIRECTORY=$srcdir`

cd(srcdir)
run(`$cmake -G "Unix Makefiles" $CMAKE_FLAGS -DJlCxx_DIR=$JlCxx_dir -DZ3_DIR=$z3_builddir`)
run(`make`)