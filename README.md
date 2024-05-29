# Z3.jl

Uses [Clang.jl](https://github.com/JuliaInterop/Clang.jl) to wrap 
 around Z3's [C API](https://z3prover.github.io/api/html/group__capi.html),
 and [BinaryBuilder.jl](https://github.com/JuliaPackaging/BinaryBuilder.jl) to build the Z3 binary 
 (build script [here](https://github.com/JuliaPackaging/Yggdrasil/blob/master/Z/z3/build_tarballs.jl)).

Design follows [Z3Py](https://ericpony.github.io/z3py-tutorial/guide-examples.htm).
In particular, we provide an implicit global `Context`, and overload operators (like `+`,`-`,`*`, `/`)
 to create Z3 expressions.
