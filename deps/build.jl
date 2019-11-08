using CxxWrap

z3dir = joinpath(pwd(), "z3")
z3builddir = joinpath(z3dir, "build")
srcdir = joinpath(pwd(), "src")

try
    run(`git clone --branch z3-4.8.6 https://github.com/Z3Prover/z3.git`)
catch
end
if !isdir(z3builddir)
    mkdir(z3builddir)
end
cd(z3builddir)
run(`cmake $z3dir`)
run(`make`)

JlCxx_dir = joinpath(dirname(CxxWrap.jlcxx_path), "cmake", "JlCxx")

cd(srcdir)
run(`cmake -DJlCxx_DIR=$JlCxx_dir -DZ3_DIR=$z3builddir`)
run(`make`)