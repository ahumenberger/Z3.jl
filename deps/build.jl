using CxxWrap

try
    # run(`git clone --branch z3-4.8.6 https://github.com/Z3Prover/z3.git`)
catch
end
cd("z3")
# run(`python scripts/mk_make.py`)
cd("build")
# run(`make`)

JlCxx_dir = joinpath(dirname(CxxWrap.jlcxx_path), "cmake", "JlCxx")
Z3_dir = joinpath(dirname(pwd()), "build")

cd("../../src")
run(`cmake -DJlCxx_DIR=$JlCxx_dir -DZ3_DIR=$Z3_dir`)