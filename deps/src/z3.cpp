#include "jlcxx/jlcxx.hpp"
#include "z3++.h"

using namespace z3;
using namespace jlcxx;

#define EXPR_OPCALL(OP) \
    mod.method(#OP, [](const expr& a, const expr& b){return a OP b;}); \
    mod.method(#OP, [](const expr& a, int b)        {return a OP b;}); \
    mod.method(#OP, [](int a, const expr& b)        {return a OP b;});
#define EXPR_FCALL(FNAME, F) \
    mod.method(#FNAME, [](const expr& a, const expr& b) {return F(a, b);}); \
    mod.method(#FNAME, [](const expr& a, int b)         {return F(a, b);}); \
    mod.method(#FNAME, [](int a, const expr& b)         {return F(a, b);});

template<> struct IsBits<check_result> : std::true_type {};

JLCXX_MODULE define_julia_module(jlcxx::Module& mod)
{
    mod.add_type<context>("context")
        .method("real_const", &context::real_const);

    mod.add_type<expr>("expr")
        .constructor<context &>()
        // .constructor<context &, Z3_ast>()
        .constructor<expr const &>()
        .method("string", [](const expr& x){
            std::ostringstream stream;
            stream << x;
            return stream.str();
        });

    EXPR_OPCALL(==)
    EXPR_OPCALL(!=)
    EXPR_OPCALL(+)
    EXPR_OPCALL(-)
    mod.method("-", [](const expr& a) {return -a;});
    EXPR_OPCALL(*)
    EXPR_OPCALL(/)
    EXPR_OPCALL(^)
    EXPR_OPCALL(&&)
    EXPR_OPCALL(||)
    mod.method("!", [](const expr& a) {return !a;});
    EXPR_OPCALL(<=)
    EXPR_OPCALL(>=)
    EXPR_OPCALL(<)
    EXPR_OPCALL(>)

    mod.add_bits<check_result>("check_result", jlcxx::julia_type("CppEnum"));
    mod.set_const("unsat", unsat);
    mod.set_const("sat", sat);
    mod.set_const("unknown", unknown);

    mod.add_type<solver>("solver")
        .constructor<context &>()
        .constructor<context &, char const *>()
        .method("add",      static_cast<void (solver::*)(const expr&)>(&solver::add))
        .method("check",    static_cast<check_result (solver::*)()>(&solver::check))
        .method("get_model", &solver::get_model)
        .method("unsat_core", &solver::unsat_core);

    mod.add_type<model>("model")
        .method("num_consts", &model::num_consts)
        .method("get_const_decl", &model::get_const_decl);

}
