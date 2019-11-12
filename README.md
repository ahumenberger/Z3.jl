# Z3.jl
Julia wrapper for [Z3](https://github.com/Z3Prover/z3).

There are still parts of the API missing. Feel free to contribute!

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

for (k,v) in consts(m)
    println("$k = $v")
end
```