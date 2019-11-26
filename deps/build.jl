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
run(`$cmake $z3_dir`)
run(`make`)

JlCxx_dir = joinpath(dirname(CxxWrap.jlcxx_path), "cmake", "JlCxx")

cd(srcdir)
if Sys.iswindows()
    run(`$cmake -G"NMake Makefiles" -DJlCxx_DIR=$JlCxx_dir -DZ3_DIR=$z3_builddir`)
    run(`nmake`)
else
    run(`$cmake -DJlCxx_DIR=$JlCxx_dir -DZ3_DIR=$z3_builddir`)
    run(`make`)
end