#include "jlcxx/jlcxx.hpp"
#include "z3++.h"

using namespace z3;
using namespace jlcxx;

#define EXPR_OPCALL(OP, TYPE) EXPR_NAMED_OPCALL(OP, OP, TYPE)
#define EXPR_NAMED_OPCALL(FNAME, OP, TYPE) \
    mod.method(#FNAME, [](const expr& a, const expr& b) {return a OP b;}); \
    mod.method(#FNAME, [](const expr& a, TYPE b)        {return a OP b;}); \
    mod.method(#FNAME, [](TYPE a, const expr& b)        {return a OP b;});
#define EXPR_FCALL(FNAME, F, TYPE) \
    mod.method(#FNAME, [](const expr& a, const expr& b) {return F(a, b);}); \
    mod.method(#FNAME, [](const expr& a, TYPE b)        {return F(a, b);}); \
    mod.method(#FNAME, [](TYPE a, const expr& b)        {return F(a, b);});

#define STRING(TYPE) \
    .method("string", [](TYPE x){ \
        std::ostringstream stream;       \
        stream << x;                     \
        return stream.str();             \
    })

template<> struct IsBits<check_result> : std::true_type {};

#define MM(CLASS,FUNC) .method(#FUNC, &CLASS::FUNC)

JLCXX_MODULE define_julia_module(jlcxx::Module& mod)
{
    mod.add_type<context>("Context")
        MM(context, real_const);

    mod.add_type<expr>("Expr")
        .constructor<context &>()
        MM(expr, is_bool)
        MM(expr, is_int)
        MM(expr, is_real)
        MM(expr, is_arith)
        MM(expr, is_algebraic)
        MM(expr, numerator)
        MM(expr, denominator)
        MM(expr, get_numeral_int)
        MM(expr, get_decimal_string)
        STRING(expr const &);

    EXPR_OPCALL(+, int)
    EXPR_OPCALL(-, int)
    mod.method("-", [](const expr& a) {return -a;});
    EXPR_OPCALL(*, int)
    EXPR_OPCALL(/, int)
    EXPR_FCALL(^, pw, int)
    EXPR_NAMED_OPCALL(or,  ||, bool)
    EXPR_NAMED_OPCALL(and, &&, bool)
    mod.method("not", [](const expr& a) {return !a;});
    EXPR_OPCALL(==, int)
    EXPR_OPCALL(!=, int)
    EXPR_OPCALL(<=, int)
    EXPR_OPCALL(>=, int)
    EXPR_OPCALL(<,  int)
    EXPR_OPCALL(>,  int)

    mod.add_type<model>("Model")
        MM(model, size)
        MM(model, num_consts)
        MM(model, num_funcs)
        MM(model, get_const_decl)
        MM(model, get_func_decl)
        MM(model, get_const_interp)
        MM(model, get_func_interp)
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
        .method("add",      static_cast<void (solver::*)(const expr&)>(&solver::add))
        .method("check",    static_cast<check_result (solver::*)()>(&solver::check))
        .method("get_model", &solver::get_model)
        .method("unsat_core", &solver::unsat_core)
        STRING(solver const &);
}
