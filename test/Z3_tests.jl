@testitem "create sort" begin
    sort = DeclareSort("S")
    @test "$sort" == "S"
end

@testitem "create bool sort" begin
    sort = BoolSort()
    @test "$sort" == "Bool"
end

@testitem "create bool value" begin
    t = BoolVal(true)
    @test "$t" == "true"
    f = BoolVal(false)
    @test "$f" == "false"
end

@testitem "simple solve" begin
    s = Solver()
    push(s)
    add(s, BoolVal(false))
    r = check(s)
    @test r == CheckResult(:unsat)
    pop(s)
    r = check(s)
    @test r == CheckResult(:sat)
    add(s, BoolVal(true))
    @test check(s) == CheckResult(:sat)
end

@testitem "create int sort" begin
    sort = IntSort()
    @test "$sort" == "Int"
end

@testitem "create int value" begin
    n = IntVal(42)
    @test "$n" == "42"
end

@testitem "int equality" begin
    s = Solver()
    n1 = IntVal(42)
    n2 = IntVal(42)
    add(s, n1 == n2)
    r = check(s)
    @test r == CheckResult(:sat)
    n3 = IntVal(43)
    add(s, n1 == n3)
    r = check(s)
    @test r == CheckResult(:unsat)
end

@testitem "create bitvec sort" begin
    sort = BitVecSort(8)
    @test "$sort" == "(_ BitVec 8)"
end

@testitem "create bitvec value" begin
    v = BitVecVal(42, 8)
    @test "$v" == "#x2a"
end

@testitem "create float sorts" begin
    sort = Float16Sort()
    @test "$sort" == "(_ FloatingPoint 5 11)"
    sort = Float32Sort()
    @test "$sort" == "(_ FloatingPoint 8 24)"
    sort = Float64Sort()
    @test "$sort" == "(_ FloatingPoint 11 53)"
end

@testitem "create float values" begin
    v = Float32Val(Float32(3.14))
    # hex & binary representation of 3.14
    @test "$v" == "(fp #b0 #x80 #b10010001111010111000011)"
    v = Float64Val(Float64(3.14))
    # binary & hex representation of 3.14
    @test "$v" == "(fp #b0 #b10000000000 #x91eb851eb851f)"
end

@testitem "int model" begin
    s = Solver()
    n = IntVal(42)
    m = IntVal(40)
    x = IntVar("x")
    add(s, x < n)
    add(s, x > m)
    r = check(s)
    @test r == CheckResult(:sat)
    @test "$(model(s))" == "x -> 41\n"
end

@testitem "mk constant" begin
    c = Const("c", IntSort())
    @test "$c" == "c"
end

@testitem "mk funcdecl" begin
    f = FuncDecl("f", [IntSort(), IntSort()], IntSort())
    @test "$f" == "(declare-fun f (Int Int) Int)"
end

@testitem "mk funcapp" begin
    f = FuncDecl("f", [IntSort(), IntSort()], IntSort())
    x = IntVal(42)
    y = IntVal(43)
    a = f([x, y])
    @test "$a" == "(f 42 43)"
end

@testitem "mk and" begin
    x = BoolVal(true)
    y = BoolVal(false)
    a = And([x, y, y])
    @test "$a" == "(and true false false)"
end

@testitem "mk or" begin
    x = BoolVal(true)
    y = BoolVal(false)
    a = Or([x, y, y])
    @test "$a" == "(or true false false)"
end

@testitem "mk not" begin
    x = BoolVal(true)
    a = Not(x)
    @test "$a" == "(not true)"
end

@testitem "mk exists" begin
    x = IntVar("x")
    y = IntVar("y")
    a = Exists([x, y], x < y)
    # "!" is not negation in SMT; 
    # it is an annotation for attaching weights
    # it can be treated as a no-op
    @test "$a" == "(exists ((x Int) (y Int)) (! (< x y) :weight 0))"
end

@testitem "get assertions" begin
    s = Solver()
    x = IntVar("x")
    y = IntVar("y")
    add(s, x < y)
    @test "$(assertions(s))" == "(ast-vector\n  (< x y))"
end

@testitem "If with constants: true" begin
    x = BoolVal(true)
    y = BoolVal(false)
    z = BoolVal(true)
    a = If(x, y, z)
    @test "$a" == "(ite true false true)"
end

@testitem "If with condition: false" begin
    x = BoolVal(false)
    y = BoolVal(false)
    z = BoolVal(true)
    a = If(x, y, z)
    @test "$a" == "(ite false false true)"
end

@testitem "If with symbolic booleans" begin
    x = BoolVar("x")
    y = BoolVar("y")
    z = BoolVar("z")
    a = If(x, y, z)
    @test "$a" == "(ite x y z)"
end

@testitem "Nested If" begin
    x = BoolVal(true)
    y = BoolVal(false)
    z = BoolVal(true)
    w = BoolVal(false)
    a = If(x, If(y, z, w), z)
    @test "$a" == "(ite true (ite false true false) true)"
end

@testitem "If with logical operations" begin
    x = BoolVar("x")
    y = BoolVar("y")
    z = BoolVar("z")
    a = If(x, And([y, z]), Or([y, z]))
    @test "$a" == "(ite x (and y z) (or y z))"
end

@testitem "If with contradictory branches" begin
    x = BoolVar("x")
    y = BoolVar("y")
    a = If(x, y, Not(y))
    @test "$a" == "(ite x y (not y))"
end

@testitem "Iff with symbolic booleans" begin
    x = BoolVar("x")
    y = BoolVar("y")
    a = Iff(x, y)
    @test "$a" == "(= x y)"
end

@testitem "Iff with constants" begin
    x = BoolVal(true)
    y = BoolVal(false)
    a = Iff(x, y)
    @test "$a" == "(= true false)"
end
