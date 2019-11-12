#include "jlcxx/jlcxx.hpp"
#include "z3++.h"

using namespace z3;

#define EXPR_OPCALL(MOD, OP, TYPE) EXPR_NAMED_OPCALL(MOD, OP, OP, TYPE)
#define EXPR_NAMED_OPCALL(MOD, FNAME, OP, TYPE) \
    MOD.method(#FNAME, [](const expr& a, const expr& b) {return a OP b;}); \
    MOD.method(#FNAME, [](const expr& a, TYPE b)        {return a OP b;}); \
    MOD.method(#FNAME, [](TYPE a, const expr& b)        {return a OP b;});
#define EXPR_FNCALL(MOD, FNAME, F, TYPE) \
    MOD.method(#FNAME, [](const expr& a, const expr& b) {return F(a, b);}); \
    MOD.method(#FNAME, [](const expr& a, TYPE b)        {return F(a, b);}); \
    MOD.method(#FNAME, [](TYPE a, const expr& b)        {return F(a, b);});

#define STRING(TYPE) \
    .method("string", [](TYPE x){   \
        std::ostringstream stream;  \
        stream << x;                \
        return stream.str();        \
    })

#define ISEQUAL(TYPE) .method("isequal", [](const TYPE& x, const TYPE& y) { return x.id() == y.id(); })


#define MM(CLASS,FUNC) .method(#FUNC, &CLASS::FUNC)

#define AST_VECTOR(MOD, TYPE, NAME) \
    MOD.add_type<TYPE>(#NAME)                                           \
        .constructor<context &>()                                       \
        .method("length", &TYPE::size)                                  \
        .method("getindex", [](const TYPE& m, int i) {return m[i-1];})  \
        .method("push!", &TYPE::push_back)                              \
        STRING(TYPE const &)

template<> struct jlcxx::IsBits<check_result> : std::true_type {};

JLCXX_MODULE define_julia_module(jlcxx::Module& mod)
{
    mod.add_type<config>("Config")
        .method("set", static_cast<void (config::*)(char const *, char const *)>(&config::set))
        .method("set", static_cast<void (config::*)(char const *, bool)>(&config::set))
        .method("set", static_cast<void (config::*)(char const *, int)>(&config::set));

    mod.add_type<context>("Context")
        .constructor<config &>()
        .method("set", static_cast<void (context::*)(char const *, char const *)>(&context::set))
        .method("set", static_cast<void (context::*)(char const *, bool)>(&context::set))
        .method("set", static_cast<void (context::*)(char const *, int)>(&context::set))
        MM(context, bool_const)
        MM(context, int_const)
        MM(context, real_const)
        MM(context, bool_val)
        .method("real_val", static_cast<expr (context::*)(int, int)>(&context::real_val));

    mod.add_type<expr>("Expr")
        .constructor<context &>()
        MM(expr, ctx)
        MM(expr, is_bool)
        MM(expr, is_int)
        MM(expr, is_real)
        MM(expr, is_arith)
        MM(expr, is_algebraic)
        MM(expr, numerator)
        MM(expr, denominator)
        MM(expr, get_numeral_int)
        MM(expr, get_decimal_string)
        MM(expr, id)
        MM(expr, is_true)
        ISEQUAL(expr)
        STRING(expr const &);

    // Friends of expr
    EXPR_OPCALL(mod, +, int)
    EXPR_OPCALL(mod, -, int)
    mod.method("-", [](const expr& a) {return -a;});
    EXPR_OPCALL(mod, *, int)
    EXPR_OPCALL(mod, /, int)
    EXPR_FNCALL(mod, ^, pw, int)
    mod.method("mk_or", &mk_or);
    mod.method("mk_and", &mk_and);
    mod.method("not", [](const expr& a) {return !a;});
    EXPR_OPCALL(mod, ==, int)
    EXPR_OPCALL(mod, !=, int)
    EXPR_OPCALL(mod, <=, int)
    EXPR_OPCALL(mod, >=, int)
    EXPR_OPCALL(mod, <,  int)
    EXPR_OPCALL(mod, >,  int)

    // AST_VECTOR(mod, ast_vector, AstVector);
    AST_VECTOR(mod, expr_vector, ExprVector);
    // AST_VECTOR(mod, sort_vector, SortVector);
    // AST_VECTOR(mod, func_decl_vector, FuncDeclVector);

    mod.add_type<model>("Model")
        MM(model, size)
        MM(model, num_consts)
        MM(model, num_funcs)
        MM(model, get_const_decl)
        MM(model, get_func_decl)
        MM(model, get_const_interp)
        MM(model, get_func_interp)
        MM(model, eval)
        .method("getindex", [](const model& m, int i){return m[i-1];})
        STRING(model const &);

    mod.add_type<func_decl>("FuncDecl")
        MM(func_decl, arity)
        MM(func_decl, domain)
        MM(func_decl, range)
        MM(func_decl, name)
        MM(func_decl, is_const)
        .method(static_cast<expr (func_decl::*)() const>(&func_decl::operator()));

    mod.add_bits<check_result>("CheckResult", jlcxx::julia_type("CppEnum"));
    mod.set_const("unsat", unsat);
    mod.set_const("sat", sat);
    mod.set_const("unknown", unknown);

    mod.add_type<solver>("Solver")
        .constructor<context &>()
        .constructor<context &, char const *>()
        .method("add", static_cast<void (solver::*)(const expr&)>(&solver::add))
        .method("check", static_cast<check_result (solver::*)()>(&solver::check))
        .method("check", static_cast<check_result (solver::*)(expr_vector)>(&solver::check))
        MM(solver, ctx)
        MM(solver, get_model)
        MM(solver, unsat_core)
        MM(solver, reason_unknown)
        STRING(solver const &);
}
