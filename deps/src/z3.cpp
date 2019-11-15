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
    method("string", [](TYPE x){   \
        std::ostringstream stream;  \
        stream << x;                \
        return stream.str();        \
    })

#define MM(CLASS,FUNC) method(#FUNC, &CLASS::FUNC)

template<> struct jlcxx::IsBits<check_result> : std::true_type {};
// template<> struct jlcxx::IsBits<Z3_error_code> : std::true_type {};

template<> struct jlcxx::SuperType<solver>       { typedef object type; };
template<> struct jlcxx::SuperType<goal>         { typedef object type; };
template<> struct jlcxx::SuperType<apply_result> { typedef object type; };
template<> struct jlcxx::SuperType<tactic>       { typedef object type; };
template<> struct jlcxx::SuperType<probe>        { typedef object type; };
template<> struct jlcxx::SuperType<optimize>     { typedef object type; };
template<> struct jlcxx::SuperType<fixedpoint>   { typedef object type; };
template<> struct jlcxx::SuperType<param_descrs> { typedef object type; };
template<> struct jlcxx::SuperType<params>       { typedef object type; };
template<> struct jlcxx::SuperType<ast>          { typedef object type; };
template<> struct jlcxx::SuperType<func_entry>   { typedef object type; };
template<> struct jlcxx::SuperType<func_interp>  { typedef object type; };
template<> struct jlcxx::SuperType<model>        { typedef object type; };
template<> struct jlcxx::SuperType<stats>        { typedef object type; };
template<> struct jlcxx::SuperType<expr>         { typedef ast type; };
template<> struct jlcxx::SuperType<sort>         { typedef ast type; };
template<> struct jlcxx::SuperType<func_decl>    { typedef ast type; };

JLCXX_MODULE define_julia_module(jlcxx::Module& m)
{
    m.add_type<config>("Config")
        .method("set", static_cast<void (config::*)(char const *, char const *)>(&config::set))
        .method("set", static_cast<void (config::*)(char const *, bool)>(&config::set))
        .method("set", static_cast<void (config::*)(char const *, int)>(&config::set));

    m.add_type<context>("Context")
        .constructor<config &>()
        .method("set", static_cast<void (context::*)(char const *, char const *)>(&context::set))
        .method("set", static_cast<void (context::*)(char const *, bool)>(&context::set))
        .method("set", static_cast<void (context::*)(char const *, int)>(&context::set))
        .MM(context, bool_const)
        .MM(context, int_const)
        .MM(context, real_const)
        .MM(context, bool_val)
        .method("int_val", static_cast<expr (context::*)(int)>(&context::int_val))
        .method("real_val", static_cast<expr (context::*)(int, int)>(&context::real_val));

    m.add_type<object>("Object")
        .constructor<context &>()
        .MM(object, ctx);
        // MM(object, check_error);

    m.add_type<ast>("Ast", jlcxx::julia_type<object>())
        .method("string", &ast::to_string);

    m.add_type<sort>("Sort", jlcxx::julia_type<ast>());

    m.add_type<func_decl>("FuncDecl", jlcxx::julia_type<ast>())
        .MM(func_decl, arity)
        .MM(func_decl, domain)
        .MM(func_decl, range)
        .MM(func_decl, name)
        .MM(func_decl, is_const)
        .method(static_cast<expr (func_decl::*)() const>(&func_decl::operator()));

    m.add_type<expr>("Expr", jlcxx::julia_type<ast>())
        .constructor<context &>()
        .MM(expr, is_bool)
        .MM(expr, is_int)
        .MM(expr, is_real)
        .MM(expr, is_arith)
        .MM(expr, is_algebraic)
        .MM(expr, numerator)
        .MM(expr, denominator)
        .MM(expr, get_numeral_int)
        .MM(expr, get_decimal_string)
        .MM(expr, id)
        .MM(expr, is_true);

    // Friends of expr
    EXPR_OPCALL(m, +, int)
    EXPR_OPCALL(m, -, int)
    m.method("-", [](const expr& a) {return -a;});
    EXPR_OPCALL(m, *, int)
    EXPR_OPCALL(m, /, int)
    EXPR_FNCALL(m, ^, pw, int)
    m.method("mk_or", &mk_or);
    m.method("mk_and", &mk_and);
    m.method("not", [](const expr& a) {return !a;});
    EXPR_OPCALL(m, ==, int)
    EXPR_OPCALL(m, !=, int)
    EXPR_OPCALL(m, <=, int)
    EXPR_OPCALL(m, >=, int)
    EXPR_OPCALL(m, <,  int)
    EXPR_OPCALL(m, >,  int)
    m.method("ite", &ite);

    m.add_type<jlcxx::Parametric<jlcxx::TypeVar<1>>>("AstVectorTpl")
        .apply<ast_vector_tpl<ast>, ast_vector_tpl<expr>, ast_vector_tpl<sort>, ast_vector_tpl<func_decl>>(
            [](auto wrapped)
            {
                typedef typename decltype(wrapped)::type WrappedT;
                wrapped.template constructor<context &>();
                wrapped.method("length", &WrappedT::size);
                wrapped.method("getindex", [](const WrappedT& m, int i) {return m[i-1];});
                wrapped.method("push!", &WrappedT::push_back);
                wrapped.STRING(const WrappedT&);
            });

    m.add_type<model>("Model", jlcxx::julia_type<object>())
        .MM(model, size)
        .MM(model, num_consts)
        .MM(model, num_funcs)
        .MM(model, get_const_decl)
        .MM(model, get_func_decl)
        .MM(model, get_const_interp)
        .MM(model, get_func_interp)
        .MM(model, eval)
        .method("getindex", [](const model& m, int i){return m[i-1];})
        .STRING(const model&);

    m.add_bits<check_result>("CheckResult", jlcxx::julia_type("CppEnum"));
    m.set_const("unsat", unsat);
    m.set_const("sat", sat);
    m.set_const("unknown", unknown);

    m.add_type<solver>("Solver", jlcxx::julia_type<object>())
        .constructor<context &>()
        .constructor<context &, char const *>()
        .method("add", static_cast<void (solver::*)(const expr&)>(&solver::add))
        .method("check", static_cast<check_result (solver::*)()>(&solver::check))
        .method("check", static_cast<check_result (solver::*)(expr_vector)>(&solver::check))
        .MM(solver, get_model)
        .MM(solver, unsat_core)
        .MM(solver, reason_unknown)
        .STRING(const solver&);

    m.add_type<symbol>("Symbol", jlcxx::julia_type<object>());
    m.add_type<params>("Params", jlcxx::julia_type<object>());
    m.add_type<param_descrs>("ParamDescrs", jlcxx::julia_type<object>());
    m.add_type<goal>("Goal", jlcxx::julia_type<object>());
    m.add_type<tactic>("Tactic", jlcxx::julia_type<object>());
    m.add_type<probe>("Probe", jlcxx::julia_type<object>());
    m.add_type<func_interp>("FuncInterp", jlcxx::julia_type<object>());
    m.add_type<func_entry>("FuncEntry", jlcxx::julia_type<object>());
    m.add_type<stats>("Stats", jlcxx::julia_type<object>());
    m.add_type<apply_result>("ApplyResult", jlcxx::julia_type<object>());
}