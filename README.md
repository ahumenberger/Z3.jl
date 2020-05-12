# Z3.jl

[![Build Status](https://travis-ci.com/ahumenberger/Z3.jl.svg?branch=master)](https://travis-ci.com/ahumenberger/Z3.jl)

This package provides an interface to the [Z3 Theorem Prover](https://github.com/Z3Prover/z3) by wrapping the [C++ API](https://z3prover.github.io/api/html/namespacez3.html) of Z3 using [CxxWrap.jl](https://github.com/JuliaInterop/CxxWrap.jl).

```julia
ctx = Context()
x = real_const(ctx, "x")
y = real_const(ctx, "y")

s = Solver(ctx, "QF_NRA")
add(s, x == y^2)
add(s, x > 1)

res = check(s)
@assert res == Z3.sat

m = get_model(s)

for (k, v) in consts(m)
    println("$k = $v")
end
```

## C++ API vs. Julia API

This package wraps the [C++ API](https://z3prover.github.io/api/html/namespacez3.html) of Z3. As such Z3's types are available in Julia by using its camel case name variant, e.g. `z3::func_entry` is available as `FuncEntry`. Furthermore, member functions are called with the object as its first argument, that is, `real_const(ctx, "x")` would be the Julia equivalent of `ctx.real_const("x")` for an object `ctx` of type `Context`.