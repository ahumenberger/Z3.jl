module Libz3

using z3_jll
export z3_jll

using CEnum

mutable struct _Z3_sort end

const Z3_sort = Ptr{_Z3_sort}

mutable struct _Z3_ast end

const Z3_ast = Ptr{_Z3_ast}

mutable struct _Z3_func_interp end

const Z3_func_interp = Ptr{_Z3_func_interp}

mutable struct _Z3_symbol end

const Z3_symbol = Ptr{_Z3_symbol}

mutable struct _Z3_config end

const Z3_config = Ptr{_Z3_config}

mutable struct _Z3_context end

const Z3_context = Ptr{_Z3_context}

mutable struct _Z3_func_decl end

const Z3_func_decl = Ptr{_Z3_func_decl}

mutable struct _Z3_app end

const Z3_app = Ptr{_Z3_app}

mutable struct _Z3_pattern end

const Z3_pattern = Ptr{_Z3_pattern}

mutable struct _Z3_model end

const Z3_model = Ptr{_Z3_model}

mutable struct _Z3_constructor end

const Z3_constructor = Ptr{_Z3_constructor}

mutable struct _Z3_constructor_list end

const Z3_constructor_list = Ptr{_Z3_constructor_list}

mutable struct _Z3_params end

const Z3_params = Ptr{_Z3_params}

mutable struct _Z3_param_descrs end

const Z3_param_descrs = Ptr{_Z3_param_descrs}

mutable struct _Z3_parser_context end

const Z3_parser_context = Ptr{_Z3_parser_context}

mutable struct _Z3_goal end

const Z3_goal = Ptr{_Z3_goal}

mutable struct _Z3_tactic end

const Z3_tactic = Ptr{_Z3_tactic}

mutable struct _Z3_simplifier end

const Z3_simplifier = Ptr{_Z3_simplifier}

mutable struct _Z3_probe end

const Z3_probe = Ptr{_Z3_probe}

mutable struct _Z3_stats end

const Z3_stats = Ptr{_Z3_stats}

mutable struct _Z3_solver end

const Z3_solver = Ptr{_Z3_solver}

mutable struct _Z3_solver_callback end

const Z3_solver_callback = Ptr{_Z3_solver_callback}

mutable struct _Z3_ast_vector end

const Z3_ast_vector = Ptr{_Z3_ast_vector}

mutable struct _Z3_ast_map end

const Z3_ast_map = Ptr{_Z3_ast_map}

mutable struct _Z3_apply_result end

const Z3_apply_result = Ptr{_Z3_apply_result}

mutable struct _Z3_func_entry end

const Z3_func_entry = Ptr{_Z3_func_entry}

mutable struct _Z3_fixedpoint end

const Z3_fixedpoint = Ptr{_Z3_fixedpoint}

mutable struct _Z3_optimize end

const Z3_optimize = Ptr{_Z3_optimize}

mutable struct _Z3_rcf_num end

const Z3_rcf_num = Ptr{_Z3_rcf_num}

const Z3_string = Ptr{Cchar}

const Z3_char_ptr = Ptr{Cchar}

const Z3_string_ptr = Ptr{Z3_string}

@cenum Z3_lbool::Int32 begin
    Z3_L_FALSE = -1
    Z3_L_UNDEF = 0
    Z3_L_TRUE = 1
end

@cenum Z3_symbol_kind::UInt32 begin
    Z3_INT_SYMBOL = 0
    Z3_STRING_SYMBOL = 1
end

@cenum Z3_parameter_kind::UInt32 begin
    Z3_PARAMETER_INT = 0
    Z3_PARAMETER_DOUBLE = 1
    Z3_PARAMETER_RATIONAL = 2
    Z3_PARAMETER_SYMBOL = 3
    Z3_PARAMETER_SORT = 4
    Z3_PARAMETER_AST = 5
    Z3_PARAMETER_FUNC_DECL = 6
end

@cenum Z3_sort_kind::UInt32 begin
    Z3_UNINTERPRETED_SORT = 0
    Z3_BOOL_SORT = 1
    Z3_INT_SORT = 2
    Z3_REAL_SORT = 3
    Z3_BV_SORT = 4
    Z3_ARRAY_SORT = 5
    Z3_DATATYPE_SORT = 6
    Z3_RELATION_SORT = 7
    Z3_FINITE_DOMAIN_SORT = 8
    Z3_FLOATING_POINT_SORT = 9
    Z3_ROUNDING_MODE_SORT = 10
    Z3_SEQ_SORT = 11
    Z3_RE_SORT = 12
    Z3_CHAR_SORT = 13
    Z3_TYPE_VAR = 14
    Z3_UNKNOWN_SORT = 1000
end

@cenum Z3_ast_kind::UInt32 begin
    Z3_NUMERAL_AST = 0
    Z3_APP_AST = 1
    Z3_VAR_AST = 2
    Z3_QUANTIFIER_AST = 3
    Z3_SORT_AST = 4
    Z3_FUNC_DECL_AST = 5
    Z3_UNKNOWN_AST = 1000
end

@cenum Z3_decl_kind::UInt32 begin
    Z3_OP_TRUE = 256
    Z3_OP_FALSE = 257
    Z3_OP_EQ = 258
    Z3_OP_DISTINCT = 259
    Z3_OP_ITE = 260
    Z3_OP_AND = 261
    Z3_OP_OR = 262
    Z3_OP_IFF = 263
    Z3_OP_XOR = 264
    Z3_OP_NOT = 265
    Z3_OP_IMPLIES = 266
    Z3_OP_OEQ = 267
    Z3_OP_ANUM = 512
    Z3_OP_AGNUM = 513
    Z3_OP_LE = 514
    Z3_OP_GE = 515
    Z3_OP_LT = 516
    Z3_OP_GT = 517
    Z3_OP_ADD = 518
    Z3_OP_SUB = 519
    Z3_OP_UMINUS = 520
    Z3_OP_MUL = 521
    Z3_OP_DIV = 522
    Z3_OP_IDIV = 523
    Z3_OP_REM = 524
    Z3_OP_MOD = 525
    Z3_OP_TO_REAL = 526
    Z3_OP_TO_INT = 527
    Z3_OP_IS_INT = 528
    Z3_OP_POWER = 529
    Z3_OP_STORE = 768
    Z3_OP_SELECT = 769
    Z3_OP_CONST_ARRAY = 770
    Z3_OP_ARRAY_MAP = 771
    Z3_OP_ARRAY_DEFAULT = 772
    Z3_OP_SET_UNION = 773
    Z3_OP_SET_INTERSECT = 774
    Z3_OP_SET_DIFFERENCE = 775
    Z3_OP_SET_COMPLEMENT = 776
    Z3_OP_SET_SUBSET = 777
    Z3_OP_AS_ARRAY = 778
    Z3_OP_ARRAY_EXT = 779
    Z3_OP_SET_HAS_SIZE = 780
    Z3_OP_SET_CARD = 781
    Z3_OP_BNUM = 1024
    Z3_OP_BIT1 = 1025
    Z3_OP_BIT0 = 1026
    Z3_OP_BNEG = 1027
    Z3_OP_BADD = 1028
    Z3_OP_BSUB = 1029
    Z3_OP_BMUL = 1030
    Z3_OP_BSDIV = 1031
    Z3_OP_BUDIV = 1032
    Z3_OP_BSREM = 1033
    Z3_OP_BUREM = 1034
    Z3_OP_BSMOD = 1035
    Z3_OP_BSDIV0 = 1036
    Z3_OP_BUDIV0 = 1037
    Z3_OP_BSREM0 = 1038
    Z3_OP_BUREM0 = 1039
    Z3_OP_BSMOD0 = 1040
    Z3_OP_ULEQ = 1041
    Z3_OP_SLEQ = 1042
    Z3_OP_UGEQ = 1043
    Z3_OP_SGEQ = 1044
    Z3_OP_ULT = 1045
    Z3_OP_SLT = 1046
    Z3_OP_UGT = 1047
    Z3_OP_SGT = 1048
    Z3_OP_BAND = 1049
    Z3_OP_BOR = 1050
    Z3_OP_BNOT = 1051
    Z3_OP_BXOR = 1052
    Z3_OP_BNAND = 1053
    Z3_OP_BNOR = 1054
    Z3_OP_BXNOR = 1055
    Z3_OP_CONCAT = 1056
    Z3_OP_SIGN_EXT = 1057
    Z3_OP_ZERO_EXT = 1058
    Z3_OP_EXTRACT = 1059
    Z3_OP_REPEAT = 1060
    Z3_OP_BREDOR = 1061
    Z3_OP_BREDAND = 1062
    Z3_OP_BCOMP = 1063
    Z3_OP_BSHL = 1064
    Z3_OP_BLSHR = 1065
    Z3_OP_BASHR = 1066
    Z3_OP_ROTATE_LEFT = 1067
    Z3_OP_ROTATE_RIGHT = 1068
    Z3_OP_EXT_ROTATE_LEFT = 1069
    Z3_OP_EXT_ROTATE_RIGHT = 1070
    Z3_OP_BIT2BOOL = 1071
    Z3_OP_INT2BV = 1072
    Z3_OP_BV2INT = 1073
    Z3_OP_CARRY = 1074
    Z3_OP_XOR3 = 1075
    Z3_OP_BSMUL_NO_OVFL = 1076
    Z3_OP_BUMUL_NO_OVFL = 1077
    Z3_OP_BSMUL_NO_UDFL = 1078
    Z3_OP_BSDIV_I = 1079
    Z3_OP_BUDIV_I = 1080
    Z3_OP_BSREM_I = 1081
    Z3_OP_BUREM_I = 1082
    Z3_OP_BSMOD_I = 1083
    Z3_OP_PR_UNDEF = 1280
    Z3_OP_PR_TRUE = 1281
    Z3_OP_PR_ASSERTED = 1282
    Z3_OP_PR_GOAL = 1283
    Z3_OP_PR_MODUS_PONENS = 1284
    Z3_OP_PR_REFLEXIVITY = 1285
    Z3_OP_PR_SYMMETRY = 1286
    Z3_OP_PR_TRANSITIVITY = 1287
    Z3_OP_PR_TRANSITIVITY_STAR = 1288
    Z3_OP_PR_MONOTONICITY = 1289
    Z3_OP_PR_QUANT_INTRO = 1290
    Z3_OP_PR_BIND = 1291
    Z3_OP_PR_DISTRIBUTIVITY = 1292
    Z3_OP_PR_AND_ELIM = 1293
    Z3_OP_PR_NOT_OR_ELIM = 1294
    Z3_OP_PR_REWRITE = 1295
    Z3_OP_PR_REWRITE_STAR = 1296
    Z3_OP_PR_PULL_QUANT = 1297
    Z3_OP_PR_PUSH_QUANT = 1298
    Z3_OP_PR_ELIM_UNUSED_VARS = 1299
    Z3_OP_PR_DER = 1300
    Z3_OP_PR_QUANT_INST = 1301
    Z3_OP_PR_HYPOTHESIS = 1302
    Z3_OP_PR_LEMMA = 1303
    Z3_OP_PR_UNIT_RESOLUTION = 1304
    Z3_OP_PR_IFF_TRUE = 1305
    Z3_OP_PR_IFF_FALSE = 1306
    Z3_OP_PR_COMMUTATIVITY = 1307
    Z3_OP_PR_DEF_AXIOM = 1308
    Z3_OP_PR_ASSUMPTION_ADD = 1309
    Z3_OP_PR_LEMMA_ADD = 1310
    Z3_OP_PR_REDUNDANT_DEL = 1311
    Z3_OP_PR_CLAUSE_TRAIL = 1312
    Z3_OP_PR_DEF_INTRO = 1313
    Z3_OP_PR_APPLY_DEF = 1314
    Z3_OP_PR_IFF_OEQ = 1315
    Z3_OP_PR_NNF_POS = 1316
    Z3_OP_PR_NNF_NEG = 1317
    Z3_OP_PR_SKOLEMIZE = 1318
    Z3_OP_PR_MODUS_PONENS_OEQ = 1319
    Z3_OP_PR_TH_LEMMA = 1320
    Z3_OP_PR_HYPER_RESOLVE = 1321
    Z3_OP_RA_STORE = 1536
    Z3_OP_RA_EMPTY = 1537
    Z3_OP_RA_IS_EMPTY = 1538
    Z3_OP_RA_JOIN = 1539
    Z3_OP_RA_UNION = 1540
    Z3_OP_RA_WIDEN = 1541
    Z3_OP_RA_PROJECT = 1542
    Z3_OP_RA_FILTER = 1543
    Z3_OP_RA_NEGATION_FILTER = 1544
    Z3_OP_RA_RENAME = 1545
    Z3_OP_RA_COMPLEMENT = 1546
    Z3_OP_RA_SELECT = 1547
    Z3_OP_RA_CLONE = 1548
    Z3_OP_FD_CONSTANT = 1549
    Z3_OP_FD_LT = 1550
    Z3_OP_SEQ_UNIT = 1551
    Z3_OP_SEQ_EMPTY = 1552
    Z3_OP_SEQ_CONCAT = 1553
    Z3_OP_SEQ_PREFIX = 1554
    Z3_OP_SEQ_SUFFIX = 1555
    Z3_OP_SEQ_CONTAINS = 1556
    Z3_OP_SEQ_EXTRACT = 1557
    Z3_OP_SEQ_REPLACE = 1558
    Z3_OP_SEQ_REPLACE_RE = 1559
    Z3_OP_SEQ_REPLACE_RE_ALL = 1560
    Z3_OP_SEQ_REPLACE_ALL = 1561
    Z3_OP_SEQ_AT = 1562
    Z3_OP_SEQ_NTH = 1563
    Z3_OP_SEQ_LENGTH = 1564
    Z3_OP_SEQ_INDEX = 1565
    Z3_OP_SEQ_LAST_INDEX = 1566
    Z3_OP_SEQ_TO_RE = 1567
    Z3_OP_SEQ_IN_RE = 1568
    Z3_OP_STR_TO_INT = 1569
    Z3_OP_INT_TO_STR = 1570
    Z3_OP_UBV_TO_STR = 1571
    Z3_OP_SBV_TO_STR = 1572
    Z3_OP_STR_TO_CODE = 1573
    Z3_OP_STR_FROM_CODE = 1574
    Z3_OP_STRING_LT = 1575
    Z3_OP_STRING_LE = 1576
    Z3_OP_RE_PLUS = 1577
    Z3_OP_RE_STAR = 1578
    Z3_OP_RE_OPTION = 1579
    Z3_OP_RE_CONCAT = 1580
    Z3_OP_RE_UNION = 1581
    Z3_OP_RE_RANGE = 1582
    Z3_OP_RE_DIFF = 1583
    Z3_OP_RE_INTERSECT = 1584
    Z3_OP_RE_LOOP = 1585
    Z3_OP_RE_POWER = 1586
    Z3_OP_RE_COMPLEMENT = 1587
    Z3_OP_RE_EMPTY_SET = 1588
    Z3_OP_RE_FULL_SET = 1589
    Z3_OP_RE_FULL_CHAR_SET = 1590
    Z3_OP_RE_OF_PRED = 1591
    Z3_OP_RE_REVERSE = 1592
    Z3_OP_RE_DERIVATIVE = 1593
    Z3_OP_CHAR_CONST = 1594
    Z3_OP_CHAR_LE = 1595
    Z3_OP_CHAR_TO_INT = 1596
    Z3_OP_CHAR_TO_BV = 1597
    Z3_OP_CHAR_FROM_BV = 1598
    Z3_OP_CHAR_IS_DIGIT = 1599
    Z3_OP_LABEL = 1792
    Z3_OP_LABEL_LIT = 1793
    Z3_OP_DT_CONSTRUCTOR = 2048
    Z3_OP_DT_RECOGNISER = 2049
    Z3_OP_DT_IS = 2050
    Z3_OP_DT_ACCESSOR = 2051
    Z3_OP_DT_UPDATE_FIELD = 2052
    Z3_OP_PB_AT_MOST = 2304
    Z3_OP_PB_AT_LEAST = 2305
    Z3_OP_PB_LE = 2306
    Z3_OP_PB_GE = 2307
    Z3_OP_PB_EQ = 2308
    Z3_OP_SPECIAL_RELATION_LO = 40960
    Z3_OP_SPECIAL_RELATION_PO = 40961
    Z3_OP_SPECIAL_RELATION_PLO = 40962
    Z3_OP_SPECIAL_RELATION_TO = 40963
    Z3_OP_SPECIAL_RELATION_TC = 40964
    Z3_OP_SPECIAL_RELATION_TRC = 40965
    Z3_OP_FPA_RM_NEAREST_TIES_TO_EVEN = 45056
    Z3_OP_FPA_RM_NEAREST_TIES_TO_AWAY = 45057
    Z3_OP_FPA_RM_TOWARD_POSITIVE = 45058
    Z3_OP_FPA_RM_TOWARD_NEGATIVE = 45059
    Z3_OP_FPA_RM_TOWARD_ZERO = 45060
    Z3_OP_FPA_NUM = 45061
    Z3_OP_FPA_PLUS_INF = 45062
    Z3_OP_FPA_MINUS_INF = 45063
    Z3_OP_FPA_NAN = 45064
    Z3_OP_FPA_PLUS_ZERO = 45065
    Z3_OP_FPA_MINUS_ZERO = 45066
    Z3_OP_FPA_ADD = 45067
    Z3_OP_FPA_SUB = 45068
    Z3_OP_FPA_NEG = 45069
    Z3_OP_FPA_MUL = 45070
    Z3_OP_FPA_DIV = 45071
    Z3_OP_FPA_REM = 45072
    Z3_OP_FPA_ABS = 45073
    Z3_OP_FPA_MIN = 45074
    Z3_OP_FPA_MAX = 45075
    Z3_OP_FPA_FMA = 45076
    Z3_OP_FPA_SQRT = 45077
    Z3_OP_FPA_ROUND_TO_INTEGRAL = 45078
    Z3_OP_FPA_EQ = 45079
    Z3_OP_FPA_LT = 45080
    Z3_OP_FPA_GT = 45081
    Z3_OP_FPA_LE = 45082
    Z3_OP_FPA_GE = 45083
    Z3_OP_FPA_IS_NAN = 45084
    Z3_OP_FPA_IS_INF = 45085
    Z3_OP_FPA_IS_ZERO = 45086
    Z3_OP_FPA_IS_NORMAL = 45087
    Z3_OP_FPA_IS_SUBNORMAL = 45088
    Z3_OP_FPA_IS_NEGATIVE = 45089
    Z3_OP_FPA_IS_POSITIVE = 45090
    Z3_OP_FPA_FP = 45091
    Z3_OP_FPA_TO_FP = 45092
    Z3_OP_FPA_TO_FP_UNSIGNED = 45093
    Z3_OP_FPA_TO_UBV = 45094
    Z3_OP_FPA_TO_SBV = 45095
    Z3_OP_FPA_TO_REAL = 45096
    Z3_OP_FPA_TO_IEEE_BV = 45097
    Z3_OP_FPA_BVWRAP = 45098
    Z3_OP_FPA_BV2RM = 45099
    Z3_OP_INTERNAL = 45100
    Z3_OP_RECURSIVE = 45101
    Z3_OP_UNINTERPRETED = 45102
end

@cenum Z3_param_kind::UInt32 begin
    Z3_PK_UINT = 0
    Z3_PK_BOOL = 1
    Z3_PK_DOUBLE = 2
    Z3_PK_SYMBOL = 3
    Z3_PK_STRING = 4
    Z3_PK_OTHER = 5
    Z3_PK_INVALID = 6
end

@cenum Z3_ast_print_mode::UInt32 begin
    Z3_PRINT_SMTLIB_FULL = 0
    Z3_PRINT_LOW_LEVEL = 1
    Z3_PRINT_SMTLIB2_COMPLIANT = 2
end

@cenum Z3_error_code::UInt32 begin
    Z3_OK = 0
    Z3_SORT_ERROR = 1
    Z3_IOB = 2
    Z3_INVALID_ARG = 3
    Z3_PARSER_ERROR = 4
    Z3_NO_PARSER = 5
    Z3_INVALID_PATTERN = 6
    Z3_MEMOUT_FAIL = 7
    Z3_FILE_ACCESS_ERROR = 8
    Z3_INTERNAL_FATAL = 9
    Z3_INVALID_USAGE = 10
    Z3_DEC_REF_ERROR = 11
    Z3_EXCEPTION = 12
end

# Z3_DECLARE_CLOSURE
const Z3_error_handler = Cvoid

# Z3_DECLARE_CLOSURE
const Z3_push_eh = Cvoid

# Z3_DECLARE_CLOSURE
const Z3_pop_eh = Cvoid

# Z3_DECLARE_CLOSURE
const Z3_fresh_eh = Cvoid

# Z3_DECLARE_CLOSURE
const Z3_fixed_eh = Cvoid

# Z3_DECLARE_CLOSURE
const Z3_eq_eh = Cvoid

# Z3_DECLARE_CLOSURE
const Z3_final_eh = Cvoid

# Z3_DECLARE_CLOSURE
const Z3_created_eh = Cvoid

# Z3_DECLARE_CLOSURE
const Z3_decide_eh = Cvoid

# Z3_DECLARE_CLOSURE
const Z3_on_clause_eh = Cvoid

@cenum Z3_goal_prec::UInt32 begin
    Z3_GOAL_PRECISE = 0
    Z3_GOAL_UNDER = 1
    Z3_GOAL_OVER = 2
    Z3_GOAL_UNDER_OVER = 3
end

function Z3_global_param_set(param_id, param_value)
    ccall((:Z3_global_param_set, libz3), Cvoid, (Z3_string, Z3_string), param_id, param_value)
end

function Z3_global_param_reset_all()
    ccall((:Z3_global_param_reset_all, libz3), Cvoid, ())
end

function Z3_global_param_get(param_id, param_value)
    ccall((:Z3_global_param_get, libz3), Bool, (Z3_string, Z3_string_ptr), param_id, param_value)
end

function Z3_mk_config()
    ccall((:Z3_mk_config, libz3), Z3_config, ())
end

function Z3_del_config(c)
    ccall((:Z3_del_config, libz3), Cvoid, (Z3_config,), c)
end

function Z3_set_param_value(c, param_id, param_value)
    ccall((:Z3_set_param_value, libz3), Cvoid, (Z3_config, Z3_string, Z3_string), c, param_id, param_value)
end

function Z3_mk_context(c)
    ccall((:Z3_mk_context, libz3), Z3_context, (Z3_config,), c)
end

function Z3_mk_context_rc(c)
    ccall((:Z3_mk_context_rc, libz3), Z3_context, (Z3_config,), c)
end

function Z3_del_context(c)
    ccall((:Z3_del_context, libz3), Cvoid, (Z3_context,), c)
end

function Z3_inc_ref(c, a)
    ccall((:Z3_inc_ref, libz3), Cvoid, (Z3_context, Z3_ast), c, a)
end

function Z3_dec_ref(c, a)
    ccall((:Z3_dec_ref, libz3), Cvoid, (Z3_context, Z3_ast), c, a)
end

function Z3_update_param_value(c, param_id, param_value)
    ccall((:Z3_update_param_value, libz3), Cvoid, (Z3_context, Z3_string, Z3_string), c, param_id, param_value)
end

function Z3_get_global_param_descrs(c)
    ccall((:Z3_get_global_param_descrs, libz3), Z3_param_descrs, (Z3_context,), c)
end

function Z3_interrupt(c)
    ccall((:Z3_interrupt, libz3), Cvoid, (Z3_context,), c)
end

function Z3_enable_concurrent_dec_ref(c)
    ccall((:Z3_enable_concurrent_dec_ref, libz3), Cvoid, (Z3_context,), c)
end

function Z3_mk_params(c)
    ccall((:Z3_mk_params, libz3), Z3_params, (Z3_context,), c)
end

function Z3_params_inc_ref(c, p)
    ccall((:Z3_params_inc_ref, libz3), Cvoid, (Z3_context, Z3_params), c, p)
end

function Z3_params_dec_ref(c, p)
    ccall((:Z3_params_dec_ref, libz3), Cvoid, (Z3_context, Z3_params), c, p)
end

function Z3_params_set_bool(c, p, k, v)
    ccall((:Z3_params_set_bool, libz3), Cvoid, (Z3_context, Z3_params, Z3_symbol, Bool), c, p, k, v)
end

function Z3_params_set_uint(c, p, k, v)
    ccall((:Z3_params_set_uint, libz3), Cvoid, (Z3_context, Z3_params, Z3_symbol, Cuint), c, p, k, v)
end

function Z3_params_set_double(c, p, k, v)
    ccall((:Z3_params_set_double, libz3), Cvoid, (Z3_context, Z3_params, Z3_symbol, Cdouble), c, p, k, v)
end

function Z3_params_set_symbol(c, p, k, v)
    ccall((:Z3_params_set_symbol, libz3), Cvoid, (Z3_context, Z3_params, Z3_symbol, Z3_symbol), c, p, k, v)
end

function Z3_params_to_string(c, p)
    ccall((:Z3_params_to_string, libz3), Z3_string, (Z3_context, Z3_params), c, p)
end

function Z3_params_validate(c, p, d)
    ccall((:Z3_params_validate, libz3), Cvoid, (Z3_context, Z3_params, Z3_param_descrs), c, p, d)
end

function Z3_param_descrs_inc_ref(c, p)
    ccall((:Z3_param_descrs_inc_ref, libz3), Cvoid, (Z3_context, Z3_param_descrs), c, p)
end

function Z3_param_descrs_dec_ref(c, p)
    ccall((:Z3_param_descrs_dec_ref, libz3), Cvoid, (Z3_context, Z3_param_descrs), c, p)
end

function Z3_param_descrs_get_kind(c, p, n)
    ccall((:Z3_param_descrs_get_kind, libz3), Z3_param_kind, (Z3_context, Z3_param_descrs, Z3_symbol), c, p, n)
end

function Z3_param_descrs_size(c, p)
    ccall((:Z3_param_descrs_size, libz3), Cuint, (Z3_context, Z3_param_descrs), c, p)
end

function Z3_param_descrs_get_name(c, p, i)
    ccall((:Z3_param_descrs_get_name, libz3), Z3_symbol, (Z3_context, Z3_param_descrs, Cuint), c, p, i)
end

function Z3_param_descrs_get_documentation(c, p, s)
    ccall((:Z3_param_descrs_get_documentation, libz3), Z3_string, (Z3_context, Z3_param_descrs, Z3_symbol), c, p, s)
end

function Z3_param_descrs_to_string(c, p)
    ccall((:Z3_param_descrs_to_string, libz3), Z3_string, (Z3_context, Z3_param_descrs), c, p)
end

function Z3_mk_int_symbol(c, i)
    ccall((:Z3_mk_int_symbol, libz3), Z3_symbol, (Z3_context, Cint), c, i)
end

function Z3_mk_string_symbol(c, s)
    ccall((:Z3_mk_string_symbol, libz3), Z3_symbol, (Z3_context, Z3_string), c, s)
end

function Z3_mk_uninterpreted_sort(c, s)
    ccall((:Z3_mk_uninterpreted_sort, libz3), Z3_sort, (Z3_context, Z3_symbol), c, s)
end

function Z3_mk_type_variable(c, s)
    ccall((:Z3_mk_type_variable, libz3), Z3_sort, (Z3_context, Z3_symbol), c, s)
end

function Z3_mk_bool_sort(c)
    ccall((:Z3_mk_bool_sort, libz3), Z3_sort, (Z3_context,), c)
end

function Z3_mk_int_sort(c)
    ccall((:Z3_mk_int_sort, libz3), Z3_sort, (Z3_context,), c)
end

function Z3_mk_real_sort(c)
    ccall((:Z3_mk_real_sort, libz3), Z3_sort, (Z3_context,), c)
end

function Z3_mk_bv_sort(c, sz)
    ccall((:Z3_mk_bv_sort, libz3), Z3_sort, (Z3_context, Cuint), c, sz)
end

function Z3_mk_finite_domain_sort(c, name, size)
    ccall((:Z3_mk_finite_domain_sort, libz3), Z3_sort, (Z3_context, Z3_symbol, UInt64), c, name, size)
end

function Z3_mk_array_sort(c, domain, range)
    ccall((:Z3_mk_array_sort, libz3), Z3_sort, (Z3_context, Z3_sort, Z3_sort), c, domain, range)
end

function Z3_mk_array_sort_n(c, n, domain, range)
    ccall((:Z3_mk_array_sort_n, libz3), Z3_sort, (Z3_context, Cuint, Ptr{Z3_sort}, Z3_sort), c, n, domain, range)
end

function Z3_mk_tuple_sort(c, mk_tuple_name, num_fields, field_names, field_sorts, mk_tuple_decl, proj_decl)
    ccall((:Z3_mk_tuple_sort, libz3), Z3_sort, (Z3_context, Z3_symbol, Cuint, Ptr{Z3_symbol}, Ptr{Z3_sort}, Ptr{Z3_func_decl}, Ptr{Z3_func_decl}), c, mk_tuple_name, num_fields, field_names, field_sorts, mk_tuple_decl, proj_decl)
end

function Z3_mk_enumeration_sort(c, name, n, enum_names, enum_consts, enum_testers)
    ccall((:Z3_mk_enumeration_sort, libz3), Z3_sort, (Z3_context, Z3_symbol, Cuint, Ptr{Z3_symbol}, Ptr{Z3_func_decl}, Ptr{Z3_func_decl}), c, name, n, enum_names, enum_consts, enum_testers)
end

function Z3_mk_list_sort(c, name, elem_sort, nil_decl, is_nil_decl, cons_decl, is_cons_decl, head_decl, tail_decl)
    ccall((:Z3_mk_list_sort, libz3), Z3_sort, (Z3_context, Z3_symbol, Z3_sort, Ptr{Z3_func_decl}, Ptr{Z3_func_decl}, Ptr{Z3_func_decl}, Ptr{Z3_func_decl}, Ptr{Z3_func_decl}, Ptr{Z3_func_decl}), c, name, elem_sort, nil_decl, is_nil_decl, cons_decl, is_cons_decl, head_decl, tail_decl)
end

function Z3_mk_constructor(c, name, recognizer, num_fields, field_names, sorts, sort_refs)
    ccall((:Z3_mk_constructor, libz3), Z3_constructor, (Z3_context, Z3_symbol, Z3_symbol, Cuint, Ptr{Z3_symbol}, Ptr{Z3_sort}, Ptr{Cuint}), c, name, recognizer, num_fields, field_names, sorts, sort_refs)
end

function Z3_constructor_num_fields(c, constr)
    ccall((:Z3_constructor_num_fields, libz3), Cuint, (Z3_context, Z3_constructor), c, constr)
end

function Z3_del_constructor(c, constr)
    ccall((:Z3_del_constructor, libz3), Cvoid, (Z3_context, Z3_constructor), c, constr)
end

function Z3_mk_datatype(c, name, num_constructors, constructors)
    ccall((:Z3_mk_datatype, libz3), Z3_sort, (Z3_context, Z3_symbol, Cuint, Ptr{Z3_constructor}), c, name, num_constructors, constructors)
end

function Z3_mk_datatype_sort(c, name)
    ccall((:Z3_mk_datatype_sort, libz3), Z3_sort, (Z3_context, Z3_symbol), c, name)
end

function Z3_mk_constructor_list(c, num_constructors, constructors)
    ccall((:Z3_mk_constructor_list, libz3), Z3_constructor_list, (Z3_context, Cuint, Ptr{Z3_constructor}), c, num_constructors, constructors)
end

function Z3_del_constructor_list(c, clist)
    ccall((:Z3_del_constructor_list, libz3), Cvoid, (Z3_context, Z3_constructor_list), c, clist)
end

function Z3_mk_datatypes(c, num_sorts, sort_names, sorts, constructor_lists)
    ccall((:Z3_mk_datatypes, libz3), Cvoid, (Z3_context, Cuint, Ptr{Z3_symbol}, Ptr{Z3_sort}, Ptr{Z3_constructor_list}), c, num_sorts, sort_names, sorts, constructor_lists)
end

function Z3_query_constructor(c, constr, num_fields, constructor, tester, accessors)
    ccall((:Z3_query_constructor, libz3), Cvoid, (Z3_context, Z3_constructor, Cuint, Ptr{Z3_func_decl}, Ptr{Z3_func_decl}, Ptr{Z3_func_decl}), c, constr, num_fields, constructor, tester, accessors)
end

function Z3_mk_func_decl(c, s, domain_size, domain, range)
    ccall((:Z3_mk_func_decl, libz3), Z3_func_decl, (Z3_context, Z3_symbol, Cuint, Ptr{Z3_sort}, Z3_sort), c, s, domain_size, domain, range)
end

function Z3_mk_app(c, d, num_args, args)
    ccall((:Z3_mk_app, libz3), Z3_ast, (Z3_context, Z3_func_decl, Cuint, Ptr{Z3_ast}), c, d, num_args, args)
end

function Z3_mk_const(c, s, ty)
    ccall((:Z3_mk_const, libz3), Z3_ast, (Z3_context, Z3_symbol, Z3_sort), c, s, ty)
end

function Z3_mk_fresh_func_decl(c, prefix, domain_size, domain, range)
    ccall((:Z3_mk_fresh_func_decl, libz3), Z3_func_decl, (Z3_context, Z3_string, Cuint, Ptr{Z3_sort}, Z3_sort), c, prefix, domain_size, domain, range)
end

function Z3_mk_fresh_const(c, prefix, ty)
    ccall((:Z3_mk_fresh_const, libz3), Z3_ast, (Z3_context, Z3_string, Z3_sort), c, prefix, ty)
end

function Z3_mk_rec_func_decl(c, s, domain_size, domain, range)
    ccall((:Z3_mk_rec_func_decl, libz3), Z3_func_decl, (Z3_context, Z3_symbol, Cuint, Ptr{Z3_sort}, Z3_sort), c, s, domain_size, domain, range)
end

function Z3_add_rec_def(c, f, n, args, body)
    ccall((:Z3_add_rec_def, libz3), Cvoid, (Z3_context, Z3_func_decl, Cuint, Ptr{Z3_ast}, Z3_ast), c, f, n, args, body)
end

function Z3_mk_true(c)
    ccall((:Z3_mk_true, libz3), Z3_ast, (Z3_context,), c)
end

function Z3_mk_false(c)
    ccall((:Z3_mk_false, libz3), Z3_ast, (Z3_context,), c)
end

function Z3_mk_eq(c, l, r)
    ccall((:Z3_mk_eq, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_ast), c, l, r)
end

function Z3_mk_distinct(c, num_args, args)
    ccall((:Z3_mk_distinct, libz3), Z3_ast, (Z3_context, Cuint, Ptr{Z3_ast}), c, num_args, args)
end

function Z3_mk_not(c, a)
    ccall((:Z3_mk_not, libz3), Z3_ast, (Z3_context, Z3_ast), c, a)
end

function Z3_mk_ite(c, t1, t2, t3)
    ccall((:Z3_mk_ite, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_ast, Z3_ast), c, t1, t2, t3)
end

function Z3_mk_iff(c, t1, t2)
    ccall((:Z3_mk_iff, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_ast), c, t1, t2)
end

function Z3_mk_implies(c, t1, t2)
    ccall((:Z3_mk_implies, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_ast), c, t1, t2)
end

function Z3_mk_xor(c, t1, t2)
    ccall((:Z3_mk_xor, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_ast), c, t1, t2)
end

function Z3_mk_and(c, num_args, args)
    ccall((:Z3_mk_and, libz3), Z3_ast, (Z3_context, Cuint, Ptr{Z3_ast}), c, num_args, args)
end

function Z3_mk_or(c, num_args, args)
    ccall((:Z3_mk_or, libz3), Z3_ast, (Z3_context, Cuint, Ptr{Z3_ast}), c, num_args, args)
end

function Z3_mk_add(c, num_args, args)
    ccall((:Z3_mk_add, libz3), Z3_ast, (Z3_context, Cuint, Ptr{Z3_ast}), c, num_args, args)
end

function Z3_mk_mul(c, num_args, args)
    ccall((:Z3_mk_mul, libz3), Z3_ast, (Z3_context, Cuint, Ptr{Z3_ast}), c, num_args, args)
end

function Z3_mk_sub(c, num_args, args)
    ccall((:Z3_mk_sub, libz3), Z3_ast, (Z3_context, Cuint, Ptr{Z3_ast}), c, num_args, args)
end

function Z3_mk_unary_minus(c, arg)
    ccall((:Z3_mk_unary_minus, libz3), Z3_ast, (Z3_context, Z3_ast), c, arg)
end

function Z3_mk_div(c, arg1, arg2)
    ccall((:Z3_mk_div, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_ast), c, arg1, arg2)
end

function Z3_mk_mod(c, arg1, arg2)
    ccall((:Z3_mk_mod, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_ast), c, arg1, arg2)
end

function Z3_mk_rem(c, arg1, arg2)
    ccall((:Z3_mk_rem, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_ast), c, arg1, arg2)
end

function Z3_mk_power(c, arg1, arg2)
    ccall((:Z3_mk_power, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_ast), c, arg1, arg2)
end

function Z3_mk_lt(c, t1, t2)
    ccall((:Z3_mk_lt, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_ast), c, t1, t2)
end

function Z3_mk_le(c, t1, t2)
    ccall((:Z3_mk_le, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_ast), c, t1, t2)
end

function Z3_mk_gt(c, t1, t2)
    ccall((:Z3_mk_gt, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_ast), c, t1, t2)
end

function Z3_mk_ge(c, t1, t2)
    ccall((:Z3_mk_ge, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_ast), c, t1, t2)
end

function Z3_mk_divides(c, t1, t2)
    ccall((:Z3_mk_divides, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_ast), c, t1, t2)
end

function Z3_mk_int2real(c, t1)
    ccall((:Z3_mk_int2real, libz3), Z3_ast, (Z3_context, Z3_ast), c, t1)
end

function Z3_mk_real2int(c, t1)
    ccall((:Z3_mk_real2int, libz3), Z3_ast, (Z3_context, Z3_ast), c, t1)
end

function Z3_mk_is_int(c, t1)
    ccall((:Z3_mk_is_int, libz3), Z3_ast, (Z3_context, Z3_ast), c, t1)
end

function Z3_mk_bvnot(c, t1)
    ccall((:Z3_mk_bvnot, libz3), Z3_ast, (Z3_context, Z3_ast), c, t1)
end

function Z3_mk_bvredand(c, t1)
    ccall((:Z3_mk_bvredand, libz3), Z3_ast, (Z3_context, Z3_ast), c, t1)
end

function Z3_mk_bvredor(c, t1)
    ccall((:Z3_mk_bvredor, libz3), Z3_ast, (Z3_context, Z3_ast), c, t1)
end

function Z3_mk_bvand(c, t1, t2)
    ccall((:Z3_mk_bvand, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_ast), c, t1, t2)
end

function Z3_mk_bvor(c, t1, t2)
    ccall((:Z3_mk_bvor, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_ast), c, t1, t2)
end

function Z3_mk_bvxor(c, t1, t2)
    ccall((:Z3_mk_bvxor, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_ast), c, t1, t2)
end

function Z3_mk_bvnand(c, t1, t2)
    ccall((:Z3_mk_bvnand, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_ast), c, t1, t2)
end

function Z3_mk_bvnor(c, t1, t2)
    ccall((:Z3_mk_bvnor, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_ast), c, t1, t2)
end

function Z3_mk_bvxnor(c, t1, t2)
    ccall((:Z3_mk_bvxnor, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_ast), c, t1, t2)
end

function Z3_mk_bvneg(c, t1)
    ccall((:Z3_mk_bvneg, libz3), Z3_ast, (Z3_context, Z3_ast), c, t1)
end

function Z3_mk_bvadd(c, t1, t2)
    ccall((:Z3_mk_bvadd, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_ast), c, t1, t2)
end

function Z3_mk_bvsub(c, t1, t2)
    ccall((:Z3_mk_bvsub, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_ast), c, t1, t2)
end

function Z3_mk_bvmul(c, t1, t2)
    ccall((:Z3_mk_bvmul, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_ast), c, t1, t2)
end

function Z3_mk_bvudiv(c, t1, t2)
    ccall((:Z3_mk_bvudiv, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_ast), c, t1, t2)
end

function Z3_mk_bvsdiv(c, t1, t2)
    ccall((:Z3_mk_bvsdiv, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_ast), c, t1, t2)
end

function Z3_mk_bvurem(c, t1, t2)
    ccall((:Z3_mk_bvurem, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_ast), c, t1, t2)
end

function Z3_mk_bvsrem(c, t1, t2)
    ccall((:Z3_mk_bvsrem, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_ast), c, t1, t2)
end

function Z3_mk_bvsmod(c, t1, t2)
    ccall((:Z3_mk_bvsmod, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_ast), c, t1, t2)
end

function Z3_mk_bvult(c, t1, t2)
    ccall((:Z3_mk_bvult, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_ast), c, t1, t2)
end

function Z3_mk_bvslt(c, t1, t2)
    ccall((:Z3_mk_bvslt, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_ast), c, t1, t2)
end

function Z3_mk_bvule(c, t1, t2)
    ccall((:Z3_mk_bvule, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_ast), c, t1, t2)
end

function Z3_mk_bvsle(c, t1, t2)
    ccall((:Z3_mk_bvsle, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_ast), c, t1, t2)
end

function Z3_mk_bvuge(c, t1, t2)
    ccall((:Z3_mk_bvuge, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_ast), c, t1, t2)
end

function Z3_mk_bvsge(c, t1, t2)
    ccall((:Z3_mk_bvsge, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_ast), c, t1, t2)
end

function Z3_mk_bvugt(c, t1, t2)
    ccall((:Z3_mk_bvugt, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_ast), c, t1, t2)
end

function Z3_mk_bvsgt(c, t1, t2)
    ccall((:Z3_mk_bvsgt, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_ast), c, t1, t2)
end

function Z3_mk_concat(c, t1, t2)
    ccall((:Z3_mk_concat, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_ast), c, t1, t2)
end

function Z3_mk_extract(c, high, low, t1)
    ccall((:Z3_mk_extract, libz3), Z3_ast, (Z3_context, Cuint, Cuint, Z3_ast), c, high, low, t1)
end

function Z3_mk_sign_ext(c, i, t1)
    ccall((:Z3_mk_sign_ext, libz3), Z3_ast, (Z3_context, Cuint, Z3_ast), c, i, t1)
end

function Z3_mk_zero_ext(c, i, t1)
    ccall((:Z3_mk_zero_ext, libz3), Z3_ast, (Z3_context, Cuint, Z3_ast), c, i, t1)
end

function Z3_mk_repeat(c, i, t1)
    ccall((:Z3_mk_repeat, libz3), Z3_ast, (Z3_context, Cuint, Z3_ast), c, i, t1)
end

function Z3_mk_bit2bool(c, i, t1)
    ccall((:Z3_mk_bit2bool, libz3), Z3_ast, (Z3_context, Cuint, Z3_ast), c, i, t1)
end

function Z3_mk_bvshl(c, t1, t2)
    ccall((:Z3_mk_bvshl, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_ast), c, t1, t2)
end

function Z3_mk_bvlshr(c, t1, t2)
    ccall((:Z3_mk_bvlshr, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_ast), c, t1, t2)
end

function Z3_mk_bvashr(c, t1, t2)
    ccall((:Z3_mk_bvashr, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_ast), c, t1, t2)
end

function Z3_mk_rotate_left(c, i, t1)
    ccall((:Z3_mk_rotate_left, libz3), Z3_ast, (Z3_context, Cuint, Z3_ast), c, i, t1)
end

function Z3_mk_rotate_right(c, i, t1)
    ccall((:Z3_mk_rotate_right, libz3), Z3_ast, (Z3_context, Cuint, Z3_ast), c, i, t1)
end

function Z3_mk_ext_rotate_left(c, t1, t2)
    ccall((:Z3_mk_ext_rotate_left, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_ast), c, t1, t2)
end

function Z3_mk_ext_rotate_right(c, t1, t2)
    ccall((:Z3_mk_ext_rotate_right, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_ast), c, t1, t2)
end

function Z3_mk_int2bv(c, n, t1)
    ccall((:Z3_mk_int2bv, libz3), Z3_ast, (Z3_context, Cuint, Z3_ast), c, n, t1)
end

function Z3_mk_bv2int(c, t1, is_signed)
    ccall((:Z3_mk_bv2int, libz3), Z3_ast, (Z3_context, Z3_ast, Bool), c, t1, is_signed)
end

function Z3_mk_bvadd_no_overflow(c, t1, t2, is_signed)
    ccall((:Z3_mk_bvadd_no_overflow, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_ast, Bool), c, t1, t2, is_signed)
end

function Z3_mk_bvadd_no_underflow(c, t1, t2)
    ccall((:Z3_mk_bvadd_no_underflow, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_ast), c, t1, t2)
end

function Z3_mk_bvsub_no_overflow(c, t1, t2)
    ccall((:Z3_mk_bvsub_no_overflow, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_ast), c, t1, t2)
end

function Z3_mk_bvsub_no_underflow(c, t1, t2, is_signed)
    ccall((:Z3_mk_bvsub_no_underflow, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_ast, Bool), c, t1, t2, is_signed)
end

function Z3_mk_bvsdiv_no_overflow(c, t1, t2)
    ccall((:Z3_mk_bvsdiv_no_overflow, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_ast), c, t1, t2)
end

function Z3_mk_bvneg_no_overflow(c, t1)
    ccall((:Z3_mk_bvneg_no_overflow, libz3), Z3_ast, (Z3_context, Z3_ast), c, t1)
end

function Z3_mk_bvmul_no_overflow(c, t1, t2, is_signed)
    ccall((:Z3_mk_bvmul_no_overflow, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_ast, Bool), c, t1, t2, is_signed)
end

function Z3_mk_bvmul_no_underflow(c, t1, t2)
    ccall((:Z3_mk_bvmul_no_underflow, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_ast), c, t1, t2)
end

function Z3_mk_select(c, a, i)
    ccall((:Z3_mk_select, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_ast), c, a, i)
end

function Z3_mk_select_n(c, a, n, idxs)
    ccall((:Z3_mk_select_n, libz3), Z3_ast, (Z3_context, Z3_ast, Cuint, Ptr{Z3_ast}), c, a, n, idxs)
end

function Z3_mk_store(c, a, i, v)
    ccall((:Z3_mk_store, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_ast, Z3_ast), c, a, i, v)
end

function Z3_mk_store_n(c, a, n, idxs, v)
    ccall((:Z3_mk_store_n, libz3), Z3_ast, (Z3_context, Z3_ast, Cuint, Ptr{Z3_ast}, Z3_ast), c, a, n, idxs, v)
end

function Z3_mk_const_array(c, domain, v)
    ccall((:Z3_mk_const_array, libz3), Z3_ast, (Z3_context, Z3_sort, Z3_ast), c, domain, v)
end

function Z3_mk_map(c, f, n, args)
    ccall((:Z3_mk_map, libz3), Z3_ast, (Z3_context, Z3_func_decl, Cuint, Ptr{Z3_ast}), c, f, n, args)
end

function Z3_mk_array_default(c, array)
    ccall((:Z3_mk_array_default, libz3), Z3_ast, (Z3_context, Z3_ast), c, array)
end

function Z3_mk_as_array(c, f)
    ccall((:Z3_mk_as_array, libz3), Z3_ast, (Z3_context, Z3_func_decl), c, f)
end

function Z3_mk_set_has_size(c, set, k)
    ccall((:Z3_mk_set_has_size, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_ast), c, set, k)
end

function Z3_mk_set_sort(c, ty)
    ccall((:Z3_mk_set_sort, libz3), Z3_sort, (Z3_context, Z3_sort), c, ty)
end

function Z3_mk_empty_set(c, domain)
    ccall((:Z3_mk_empty_set, libz3), Z3_ast, (Z3_context, Z3_sort), c, domain)
end

function Z3_mk_full_set(c, domain)
    ccall((:Z3_mk_full_set, libz3), Z3_ast, (Z3_context, Z3_sort), c, domain)
end

function Z3_mk_set_add(c, set, elem)
    ccall((:Z3_mk_set_add, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_ast), c, set, elem)
end

function Z3_mk_set_del(c, set, elem)
    ccall((:Z3_mk_set_del, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_ast), c, set, elem)
end

function Z3_mk_set_union(c, num_args, args)
    ccall((:Z3_mk_set_union, libz3), Z3_ast, (Z3_context, Cuint, Ptr{Z3_ast}), c, num_args, args)
end

function Z3_mk_set_intersect(c, num_args, args)
    ccall((:Z3_mk_set_intersect, libz3), Z3_ast, (Z3_context, Cuint, Ptr{Z3_ast}), c, num_args, args)
end

function Z3_mk_set_difference(c, arg1, arg2)
    ccall((:Z3_mk_set_difference, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_ast), c, arg1, arg2)
end

function Z3_mk_set_complement(c, arg)
    ccall((:Z3_mk_set_complement, libz3), Z3_ast, (Z3_context, Z3_ast), c, arg)
end

function Z3_mk_set_member(c, elem, set)
    ccall((:Z3_mk_set_member, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_ast), c, elem, set)
end

function Z3_mk_set_subset(c, arg1, arg2)
    ccall((:Z3_mk_set_subset, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_ast), c, arg1, arg2)
end

function Z3_mk_array_ext(c, arg1, arg2)
    ccall((:Z3_mk_array_ext, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_ast), c, arg1, arg2)
end

function Z3_mk_numeral(c, numeral, ty)
    ccall((:Z3_mk_numeral, libz3), Z3_ast, (Z3_context, Z3_string, Z3_sort), c, numeral, ty)
end

function Z3_mk_real(c, num, den)
    ccall((:Z3_mk_real, libz3), Z3_ast, (Z3_context, Cint, Cint), c, num, den)
end

function Z3_mk_real_int64(c, num, den)
    ccall((:Z3_mk_real_int64, libz3), Z3_ast, (Z3_context, Int64, Int64), c, num, den)
end

function Z3_mk_int(c, v, ty)
    ccall((:Z3_mk_int, libz3), Z3_ast, (Z3_context, Cint, Z3_sort), c, v, ty)
end

function Z3_mk_unsigned_int(c, v, ty)
    ccall((:Z3_mk_unsigned_int, libz3), Z3_ast, (Z3_context, Cuint, Z3_sort), c, v, ty)
end

function Z3_mk_int64(c, v, ty)
    ccall((:Z3_mk_int64, libz3), Z3_ast, (Z3_context, Int64, Z3_sort), c, v, ty)
end

function Z3_mk_unsigned_int64(c, v, ty)
    ccall((:Z3_mk_unsigned_int64, libz3), Z3_ast, (Z3_context, UInt64, Z3_sort), c, v, ty)
end

function Z3_mk_bv_numeral(c, sz, bits)
    ccall((:Z3_mk_bv_numeral, libz3), Z3_ast, (Z3_context, Cuint, Ptr{Bool}), c, sz, bits)
end

function Z3_mk_seq_sort(c, s)
    ccall((:Z3_mk_seq_sort, libz3), Z3_sort, (Z3_context, Z3_sort), c, s)
end

function Z3_is_seq_sort(c, s)
    ccall((:Z3_is_seq_sort, libz3), Bool, (Z3_context, Z3_sort), c, s)
end

function Z3_get_seq_sort_basis(c, s)
    ccall((:Z3_get_seq_sort_basis, libz3), Z3_sort, (Z3_context, Z3_sort), c, s)
end

function Z3_mk_re_sort(c, seq)
    ccall((:Z3_mk_re_sort, libz3), Z3_sort, (Z3_context, Z3_sort), c, seq)
end

function Z3_is_re_sort(c, s)
    ccall((:Z3_is_re_sort, libz3), Bool, (Z3_context, Z3_sort), c, s)
end

function Z3_get_re_sort_basis(c, s)
    ccall((:Z3_get_re_sort_basis, libz3), Z3_sort, (Z3_context, Z3_sort), c, s)
end

function Z3_mk_string_sort(c)
    ccall((:Z3_mk_string_sort, libz3), Z3_sort, (Z3_context,), c)
end

function Z3_mk_char_sort(c)
    ccall((:Z3_mk_char_sort, libz3), Z3_sort, (Z3_context,), c)
end

function Z3_is_string_sort(c, s)
    ccall((:Z3_is_string_sort, libz3), Bool, (Z3_context, Z3_sort), c, s)
end

function Z3_is_char_sort(c, s)
    ccall((:Z3_is_char_sort, libz3), Bool, (Z3_context, Z3_sort), c, s)
end

function Z3_mk_string(c, s)
    ccall((:Z3_mk_string, libz3), Z3_ast, (Z3_context, Z3_string), c, s)
end

function Z3_mk_lstring(c, len, s)
    ccall((:Z3_mk_lstring, libz3), Z3_ast, (Z3_context, Cuint, Z3_string), c, len, s)
end

function Z3_mk_u32string(c, len, chars)
    ccall((:Z3_mk_u32string, libz3), Z3_ast, (Z3_context, Cuint, Ptr{Cuint}), c, len, chars)
end

function Z3_is_string(c, s)
    ccall((:Z3_is_string, libz3), Bool, (Z3_context, Z3_ast), c, s)
end

function Z3_get_string(c, s)
    ccall((:Z3_get_string, libz3), Z3_string, (Z3_context, Z3_ast), c, s)
end

function Z3_get_lstring(c, s, length)
    ccall((:Z3_get_lstring, libz3), Z3_char_ptr, (Z3_context, Z3_ast, Ptr{Cuint}), c, s, length)
end

function Z3_get_string_length(c, s)
    ccall((:Z3_get_string_length, libz3), Cuint, (Z3_context, Z3_ast), c, s)
end

function Z3_get_string_contents(c, s, length, contents)
    ccall((:Z3_get_string_contents, libz3), Cvoid, (Z3_context, Z3_ast, Cuint, Ptr{Cuint}), c, s, length, contents)
end

function Z3_mk_seq_empty(c, seq)
    ccall((:Z3_mk_seq_empty, libz3), Z3_ast, (Z3_context, Z3_sort), c, seq)
end

function Z3_mk_seq_unit(c, a)
    ccall((:Z3_mk_seq_unit, libz3), Z3_ast, (Z3_context, Z3_ast), c, a)
end

function Z3_mk_seq_concat(c, n, args)
    ccall((:Z3_mk_seq_concat, libz3), Z3_ast, (Z3_context, Cuint, Ptr{Z3_ast}), c, n, args)
end

function Z3_mk_seq_prefix(c, prefix, s)
    ccall((:Z3_mk_seq_prefix, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_ast), c, prefix, s)
end

function Z3_mk_seq_suffix(c, suffix, s)
    ccall((:Z3_mk_seq_suffix, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_ast), c, suffix, s)
end

function Z3_mk_seq_contains(c, container, containee)
    ccall((:Z3_mk_seq_contains, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_ast), c, container, containee)
end

function Z3_mk_str_lt(c, prefix, s)
    ccall((:Z3_mk_str_lt, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_ast), c, prefix, s)
end

function Z3_mk_str_le(c, prefix, s)
    ccall((:Z3_mk_str_le, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_ast), c, prefix, s)
end

function Z3_mk_seq_extract(c, s, offset, length)
    ccall((:Z3_mk_seq_extract, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_ast, Z3_ast), c, s, offset, length)
end

function Z3_mk_seq_replace(c, s, src, dst)
    ccall((:Z3_mk_seq_replace, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_ast, Z3_ast), c, s, src, dst)
end

function Z3_mk_seq_at(c, s, index)
    ccall((:Z3_mk_seq_at, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_ast), c, s, index)
end

function Z3_mk_seq_nth(c, s, index)
    ccall((:Z3_mk_seq_nth, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_ast), c, s, index)
end

function Z3_mk_seq_length(c, s)
    ccall((:Z3_mk_seq_length, libz3), Z3_ast, (Z3_context, Z3_ast), c, s)
end

function Z3_mk_seq_index(c, s, substr, offset)
    ccall((:Z3_mk_seq_index, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_ast, Z3_ast), c, s, substr, offset)
end

function Z3_mk_seq_last_index(c, s, substr)
    ccall((:Z3_mk_seq_last_index, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_ast), c, s, substr)
end

function Z3_mk_str_to_int(c, s)
    ccall((:Z3_mk_str_to_int, libz3), Z3_ast, (Z3_context, Z3_ast), c, s)
end

function Z3_mk_int_to_str(c, s)
    ccall((:Z3_mk_int_to_str, libz3), Z3_ast, (Z3_context, Z3_ast), c, s)
end

function Z3_mk_string_to_code(c, a)
    ccall((:Z3_mk_string_to_code, libz3), Z3_ast, (Z3_context, Z3_ast), c, a)
end

function Z3_mk_string_from_code(c, a)
    ccall((:Z3_mk_string_from_code, libz3), Z3_ast, (Z3_context, Z3_ast), c, a)
end

function Z3_mk_ubv_to_str(c, s)
    ccall((:Z3_mk_ubv_to_str, libz3), Z3_ast, (Z3_context, Z3_ast), c, s)
end

function Z3_mk_sbv_to_str(c, s)
    ccall((:Z3_mk_sbv_to_str, libz3), Z3_ast, (Z3_context, Z3_ast), c, s)
end

function Z3_mk_seq_to_re(c, seq)
    ccall((:Z3_mk_seq_to_re, libz3), Z3_ast, (Z3_context, Z3_ast), c, seq)
end

function Z3_mk_seq_in_re(c, seq, re)
    ccall((:Z3_mk_seq_in_re, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_ast), c, seq, re)
end

function Z3_mk_re_plus(c, re)
    ccall((:Z3_mk_re_plus, libz3), Z3_ast, (Z3_context, Z3_ast), c, re)
end

function Z3_mk_re_star(c, re)
    ccall((:Z3_mk_re_star, libz3), Z3_ast, (Z3_context, Z3_ast), c, re)
end

function Z3_mk_re_option(c, re)
    ccall((:Z3_mk_re_option, libz3), Z3_ast, (Z3_context, Z3_ast), c, re)
end

function Z3_mk_re_union(c, n, args)
    ccall((:Z3_mk_re_union, libz3), Z3_ast, (Z3_context, Cuint, Ptr{Z3_ast}), c, n, args)
end

function Z3_mk_re_concat(c, n, args)
    ccall((:Z3_mk_re_concat, libz3), Z3_ast, (Z3_context, Cuint, Ptr{Z3_ast}), c, n, args)
end

function Z3_mk_re_range(c, lo, hi)
    ccall((:Z3_mk_re_range, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_ast), c, lo, hi)
end

function Z3_mk_re_allchar(c, regex_sort)
    ccall((:Z3_mk_re_allchar, libz3), Z3_ast, (Z3_context, Z3_sort), c, regex_sort)
end

function Z3_mk_re_loop(c, r, lo, hi)
    ccall((:Z3_mk_re_loop, libz3), Z3_ast, (Z3_context, Z3_ast, Cuint, Cuint), c, r, lo, hi)
end

function Z3_mk_re_power(c, re, n)
    ccall((:Z3_mk_re_power, libz3), Z3_ast, (Z3_context, Z3_ast, Cuint), c, re, n)
end

function Z3_mk_re_intersect(c, n, args)
    ccall((:Z3_mk_re_intersect, libz3), Z3_ast, (Z3_context, Cuint, Ptr{Z3_ast}), c, n, args)
end

function Z3_mk_re_complement(c, re)
    ccall((:Z3_mk_re_complement, libz3), Z3_ast, (Z3_context, Z3_ast), c, re)
end

function Z3_mk_re_diff(c, re1, re2)
    ccall((:Z3_mk_re_diff, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_ast), c, re1, re2)
end

function Z3_mk_re_empty(c, re)
    ccall((:Z3_mk_re_empty, libz3), Z3_ast, (Z3_context, Z3_sort), c, re)
end

function Z3_mk_re_full(c, re)
    ccall((:Z3_mk_re_full, libz3), Z3_ast, (Z3_context, Z3_sort), c, re)
end

function Z3_mk_char(c, ch)
    ccall((:Z3_mk_char, libz3), Z3_ast, (Z3_context, Cuint), c, ch)
end

function Z3_mk_char_le(c, ch1, ch2)
    ccall((:Z3_mk_char_le, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_ast), c, ch1, ch2)
end

function Z3_mk_char_to_int(c, ch)
    ccall((:Z3_mk_char_to_int, libz3), Z3_ast, (Z3_context, Z3_ast), c, ch)
end

function Z3_mk_char_to_bv(c, ch)
    ccall((:Z3_mk_char_to_bv, libz3), Z3_ast, (Z3_context, Z3_ast), c, ch)
end

function Z3_mk_char_from_bv(c, bv)
    ccall((:Z3_mk_char_from_bv, libz3), Z3_ast, (Z3_context, Z3_ast), c, bv)
end

function Z3_mk_char_is_digit(c, ch)
    ccall((:Z3_mk_char_is_digit, libz3), Z3_ast, (Z3_context, Z3_ast), c, ch)
end

function Z3_mk_linear_order(c, a, id)
    ccall((:Z3_mk_linear_order, libz3), Z3_func_decl, (Z3_context, Z3_sort, Cuint), c, a, id)
end

function Z3_mk_partial_order(c, a, id)
    ccall((:Z3_mk_partial_order, libz3), Z3_func_decl, (Z3_context, Z3_sort, Cuint), c, a, id)
end

function Z3_mk_piecewise_linear_order(c, a, id)
    ccall((:Z3_mk_piecewise_linear_order, libz3), Z3_func_decl, (Z3_context, Z3_sort, Cuint), c, a, id)
end

function Z3_mk_tree_order(c, a, id)
    ccall((:Z3_mk_tree_order, libz3), Z3_func_decl, (Z3_context, Z3_sort, Cuint), c, a, id)
end

function Z3_mk_transitive_closure(c, f)
    ccall((:Z3_mk_transitive_closure, libz3), Z3_func_decl, (Z3_context, Z3_func_decl), c, f)
end

function Z3_mk_pattern(c, num_patterns, terms)
    ccall((:Z3_mk_pattern, libz3), Z3_pattern, (Z3_context, Cuint, Ptr{Z3_ast}), c, num_patterns, terms)
end

function Z3_mk_bound(c, index, ty)
    ccall((:Z3_mk_bound, libz3), Z3_ast, (Z3_context, Cuint, Z3_sort), c, index, ty)
end

function Z3_mk_forall(c, weight, num_patterns, patterns, num_decls, sorts, decl_names, body)
    ccall((:Z3_mk_forall, libz3), Z3_ast, (Z3_context, Cuint, Cuint, Ptr{Z3_pattern}, Cuint, Ptr{Z3_sort}, Ptr{Z3_symbol}, Z3_ast), c, weight, num_patterns, patterns, num_decls, sorts, decl_names, body)
end

function Z3_mk_exists(c, weight, num_patterns, patterns, num_decls, sorts, decl_names, body)
    ccall((:Z3_mk_exists, libz3), Z3_ast, (Z3_context, Cuint, Cuint, Ptr{Z3_pattern}, Cuint, Ptr{Z3_sort}, Ptr{Z3_symbol}, Z3_ast), c, weight, num_patterns, patterns, num_decls, sorts, decl_names, body)
end

function Z3_mk_quantifier(c, is_forall, weight, num_patterns, patterns, num_decls, sorts, decl_names, body)
    ccall((:Z3_mk_quantifier, libz3), Z3_ast, (Z3_context, Bool, Cuint, Cuint, Ptr{Z3_pattern}, Cuint, Ptr{Z3_sort}, Ptr{Z3_symbol}, Z3_ast), c, is_forall, weight, num_patterns, patterns, num_decls, sorts, decl_names, body)
end

function Z3_mk_quantifier_ex(c, is_forall, weight, quantifier_id, skolem_id, num_patterns, patterns, num_no_patterns, no_patterns, num_decls, sorts, decl_names, body)
    ccall((:Z3_mk_quantifier_ex, libz3), Z3_ast, (Z3_context, Bool, Cuint, Z3_symbol, Z3_symbol, Cuint, Ptr{Z3_pattern}, Cuint, Ptr{Z3_ast}, Cuint, Ptr{Z3_sort}, Ptr{Z3_symbol}, Z3_ast), c, is_forall, weight, quantifier_id, skolem_id, num_patterns, patterns, num_no_patterns, no_patterns, num_decls, sorts, decl_names, body)
end

function Z3_mk_forall_const(c, weight, num_bound, bound, num_patterns, patterns, body)
    ccall((:Z3_mk_forall_const, libz3), Z3_ast, (Z3_context, Cuint, Cuint, Ptr{Z3_app}, Cuint, Ptr{Z3_pattern}, Z3_ast), c, weight, num_bound, bound, num_patterns, patterns, body)
end

function Z3_mk_exists_const(c, weight, num_bound, bound, num_patterns, patterns, body)
    ccall((:Z3_mk_exists_const, libz3), Z3_ast, (Z3_context, Cuint, Cuint, Ptr{Z3_app}, Cuint, Ptr{Z3_pattern}, Z3_ast), c, weight, num_bound, bound, num_patterns, patterns, body)
end

function Z3_mk_quantifier_const(c, is_forall, weight, num_bound, bound, num_patterns, patterns, body)
    ccall((:Z3_mk_quantifier_const, libz3), Z3_ast, (Z3_context, Bool, Cuint, Cuint, Ptr{Z3_app}, Cuint, Ptr{Z3_pattern}, Z3_ast), c, is_forall, weight, num_bound, bound, num_patterns, patterns, body)
end

function Z3_mk_quantifier_const_ex(c, is_forall, weight, quantifier_id, skolem_id, num_bound, bound, num_patterns, patterns, num_no_patterns, no_patterns, body)
    ccall((:Z3_mk_quantifier_const_ex, libz3), Z3_ast, (Z3_context, Bool, Cuint, Z3_symbol, Z3_symbol, Cuint, Ptr{Z3_app}, Cuint, Ptr{Z3_pattern}, Cuint, Ptr{Z3_ast}, Z3_ast), c, is_forall, weight, quantifier_id, skolem_id, num_bound, bound, num_patterns, patterns, num_no_patterns, no_patterns, body)
end

function Z3_mk_lambda(c, num_decls, sorts, decl_names, body)
    ccall((:Z3_mk_lambda, libz3), Z3_ast, (Z3_context, Cuint, Ptr{Z3_sort}, Ptr{Z3_symbol}, Z3_ast), c, num_decls, sorts, decl_names, body)
end

function Z3_mk_lambda_const(c, num_bound, bound, body)
    ccall((:Z3_mk_lambda_const, libz3), Z3_ast, (Z3_context, Cuint, Ptr{Z3_app}, Z3_ast), c, num_bound, bound, body)
end

function Z3_get_symbol_kind(c, s)
    ccall((:Z3_get_symbol_kind, libz3), Z3_symbol_kind, (Z3_context, Z3_symbol), c, s)
end

function Z3_get_symbol_int(c, s)
    ccall((:Z3_get_symbol_int, libz3), Cint, (Z3_context, Z3_symbol), c, s)
end

function Z3_get_symbol_string(c, s)
    ccall((:Z3_get_symbol_string, libz3), Z3_string, (Z3_context, Z3_symbol), c, s)
end

function Z3_get_sort_name(c, d)
    ccall((:Z3_get_sort_name, libz3), Z3_symbol, (Z3_context, Z3_sort), c, d)
end

function Z3_get_sort_id(c, s)
    ccall((:Z3_get_sort_id, libz3), Cuint, (Z3_context, Z3_sort), c, s)
end

function Z3_sort_to_ast(c, s)
    ccall((:Z3_sort_to_ast, libz3), Z3_ast, (Z3_context, Z3_sort), c, s)
end

function Z3_is_eq_sort(c, s1, s2)
    ccall((:Z3_is_eq_sort, libz3), Bool, (Z3_context, Z3_sort, Z3_sort), c, s1, s2)
end

function Z3_get_sort_kind(c, t)
    ccall((:Z3_get_sort_kind, libz3), Z3_sort_kind, (Z3_context, Z3_sort), c, t)
end

function Z3_get_bv_sort_size(c, t)
    ccall((:Z3_get_bv_sort_size, libz3), Cuint, (Z3_context, Z3_sort), c, t)
end

function Z3_get_finite_domain_sort_size(c, s, r)
    ccall((:Z3_get_finite_domain_sort_size, libz3), Bool, (Z3_context, Z3_sort, Ptr{UInt64}), c, s, r)
end

function Z3_get_array_sort_domain(c, t)
    ccall((:Z3_get_array_sort_domain, libz3), Z3_sort, (Z3_context, Z3_sort), c, t)
end

function Z3_get_array_sort_domain_n(c, t, idx)
    ccall((:Z3_get_array_sort_domain_n, libz3), Z3_sort, (Z3_context, Z3_sort, Cuint), c, t, idx)
end

function Z3_get_array_sort_range(c, t)
    ccall((:Z3_get_array_sort_range, libz3), Z3_sort, (Z3_context, Z3_sort), c, t)
end

function Z3_get_tuple_sort_mk_decl(c, t)
    ccall((:Z3_get_tuple_sort_mk_decl, libz3), Z3_func_decl, (Z3_context, Z3_sort), c, t)
end

function Z3_get_tuple_sort_num_fields(c, t)
    ccall((:Z3_get_tuple_sort_num_fields, libz3), Cuint, (Z3_context, Z3_sort), c, t)
end

function Z3_get_tuple_sort_field_decl(c, t, i)
    ccall((:Z3_get_tuple_sort_field_decl, libz3), Z3_func_decl, (Z3_context, Z3_sort, Cuint), c, t, i)
end

function Z3_get_datatype_sort_num_constructors(c, t)
    ccall((:Z3_get_datatype_sort_num_constructors, libz3), Cuint, (Z3_context, Z3_sort), c, t)
end

function Z3_get_datatype_sort_constructor(c, t, idx)
    ccall((:Z3_get_datatype_sort_constructor, libz3), Z3_func_decl, (Z3_context, Z3_sort, Cuint), c, t, idx)
end

function Z3_get_datatype_sort_recognizer(c, t, idx)
    ccall((:Z3_get_datatype_sort_recognizer, libz3), Z3_func_decl, (Z3_context, Z3_sort, Cuint), c, t, idx)
end

function Z3_get_datatype_sort_constructor_accessor(c, t, idx_c, idx_a)
    ccall((:Z3_get_datatype_sort_constructor_accessor, libz3), Z3_func_decl, (Z3_context, Z3_sort, Cuint, Cuint), c, t, idx_c, idx_a)
end

function Z3_datatype_update_field(c, field_access, t, value)
    ccall((:Z3_datatype_update_field, libz3), Z3_ast, (Z3_context, Z3_func_decl, Z3_ast, Z3_ast), c, field_access, t, value)
end

function Z3_get_relation_arity(c, s)
    ccall((:Z3_get_relation_arity, libz3), Cuint, (Z3_context, Z3_sort), c, s)
end

function Z3_get_relation_column(c, s, col)
    ccall((:Z3_get_relation_column, libz3), Z3_sort, (Z3_context, Z3_sort, Cuint), c, s, col)
end

function Z3_mk_atmost(c, num_args, args, k)
    ccall((:Z3_mk_atmost, libz3), Z3_ast, (Z3_context, Cuint, Ptr{Z3_ast}, Cuint), c, num_args, args, k)
end

function Z3_mk_atleast(c, num_args, args, k)
    ccall((:Z3_mk_atleast, libz3), Z3_ast, (Z3_context, Cuint, Ptr{Z3_ast}, Cuint), c, num_args, args, k)
end

function Z3_mk_pble(c, num_args, args, coeffs, k)
    ccall((:Z3_mk_pble, libz3), Z3_ast, (Z3_context, Cuint, Ptr{Z3_ast}, Ptr{Cint}, Cint), c, num_args, args, coeffs, k)
end

function Z3_mk_pbge(c, num_args, args, coeffs, k)
    ccall((:Z3_mk_pbge, libz3), Z3_ast, (Z3_context, Cuint, Ptr{Z3_ast}, Ptr{Cint}, Cint), c, num_args, args, coeffs, k)
end

function Z3_mk_pbeq(c, num_args, args, coeffs, k)
    ccall((:Z3_mk_pbeq, libz3), Z3_ast, (Z3_context, Cuint, Ptr{Z3_ast}, Ptr{Cint}, Cint), c, num_args, args, coeffs, k)
end

function Z3_func_decl_to_ast(c, f)
    ccall((:Z3_func_decl_to_ast, libz3), Z3_ast, (Z3_context, Z3_func_decl), c, f)
end

function Z3_is_eq_func_decl(c, f1, f2)
    ccall((:Z3_is_eq_func_decl, libz3), Bool, (Z3_context, Z3_func_decl, Z3_func_decl), c, f1, f2)
end

function Z3_get_func_decl_id(c, f)
    ccall((:Z3_get_func_decl_id, libz3), Cuint, (Z3_context, Z3_func_decl), c, f)
end

function Z3_get_decl_name(c, d)
    ccall((:Z3_get_decl_name, libz3), Z3_symbol, (Z3_context, Z3_func_decl), c, d)
end

function Z3_get_decl_kind(c, d)
    ccall((:Z3_get_decl_kind, libz3), Z3_decl_kind, (Z3_context, Z3_func_decl), c, d)
end

function Z3_get_domain_size(c, d)
    ccall((:Z3_get_domain_size, libz3), Cuint, (Z3_context, Z3_func_decl), c, d)
end

function Z3_get_arity(c, d)
    ccall((:Z3_get_arity, libz3), Cuint, (Z3_context, Z3_func_decl), c, d)
end

function Z3_get_domain(c, d, i)
    ccall((:Z3_get_domain, libz3), Z3_sort, (Z3_context, Z3_func_decl, Cuint), c, d, i)
end

function Z3_get_range(c, d)
    ccall((:Z3_get_range, libz3), Z3_sort, (Z3_context, Z3_func_decl), c, d)
end

function Z3_get_decl_num_parameters(c, d)
    ccall((:Z3_get_decl_num_parameters, libz3), Cuint, (Z3_context, Z3_func_decl), c, d)
end

function Z3_get_decl_parameter_kind(c, d, idx)
    ccall((:Z3_get_decl_parameter_kind, libz3), Z3_parameter_kind, (Z3_context, Z3_func_decl, Cuint), c, d, idx)
end

function Z3_get_decl_int_parameter(c, d, idx)
    ccall((:Z3_get_decl_int_parameter, libz3), Cint, (Z3_context, Z3_func_decl, Cuint), c, d, idx)
end

function Z3_get_decl_double_parameter(c, d, idx)
    ccall((:Z3_get_decl_double_parameter, libz3), Cdouble, (Z3_context, Z3_func_decl, Cuint), c, d, idx)
end

function Z3_get_decl_symbol_parameter(c, d, idx)
    ccall((:Z3_get_decl_symbol_parameter, libz3), Z3_symbol, (Z3_context, Z3_func_decl, Cuint), c, d, idx)
end

function Z3_get_decl_sort_parameter(c, d, idx)
    ccall((:Z3_get_decl_sort_parameter, libz3), Z3_sort, (Z3_context, Z3_func_decl, Cuint), c, d, idx)
end

function Z3_get_decl_ast_parameter(c, d, idx)
    ccall((:Z3_get_decl_ast_parameter, libz3), Z3_ast, (Z3_context, Z3_func_decl, Cuint), c, d, idx)
end

function Z3_get_decl_func_decl_parameter(c, d, idx)
    ccall((:Z3_get_decl_func_decl_parameter, libz3), Z3_func_decl, (Z3_context, Z3_func_decl, Cuint), c, d, idx)
end

function Z3_get_decl_rational_parameter(c, d, idx)
    ccall((:Z3_get_decl_rational_parameter, libz3), Z3_string, (Z3_context, Z3_func_decl, Cuint), c, d, idx)
end

function Z3_app_to_ast(c, a)
    ccall((:Z3_app_to_ast, libz3), Z3_ast, (Z3_context, Z3_app), c, a)
end

function Z3_get_app_decl(c, a)
    ccall((:Z3_get_app_decl, libz3), Z3_func_decl, (Z3_context, Z3_app), c, a)
end

function Z3_get_app_num_args(c, a)
    ccall((:Z3_get_app_num_args, libz3), Cuint, (Z3_context, Z3_app), c, a)
end

function Z3_get_app_arg(c, a, i)
    ccall((:Z3_get_app_arg, libz3), Z3_ast, (Z3_context, Z3_app, Cuint), c, a, i)
end

function Z3_is_eq_ast(c, t1, t2)
    ccall((:Z3_is_eq_ast, libz3), Bool, (Z3_context, Z3_ast, Z3_ast), c, t1, t2)
end

function Z3_get_ast_id(c, t)
    ccall((:Z3_get_ast_id, libz3), Cuint, (Z3_context, Z3_ast), c, t)
end

function Z3_get_ast_hash(c, a)
    ccall((:Z3_get_ast_hash, libz3), Cuint, (Z3_context, Z3_ast), c, a)
end

function Z3_get_sort(c, a)
    ccall((:Z3_get_sort, libz3), Z3_sort, (Z3_context, Z3_ast), c, a)
end

function Z3_is_well_sorted(c, t)
    ccall((:Z3_is_well_sorted, libz3), Bool, (Z3_context, Z3_ast), c, t)
end

function Z3_get_bool_value(c, a)
    ccall((:Z3_get_bool_value, libz3), Z3_lbool, (Z3_context, Z3_ast), c, a)
end

function Z3_get_ast_kind(c, a)
    ccall((:Z3_get_ast_kind, libz3), Z3_ast_kind, (Z3_context, Z3_ast), c, a)
end

function Z3_is_app(c, a)
    ccall((:Z3_is_app, libz3), Bool, (Z3_context, Z3_ast), c, a)
end

function Z3_is_numeral_ast(c, a)
    ccall((:Z3_is_numeral_ast, libz3), Bool, (Z3_context, Z3_ast), c, a)
end

function Z3_is_algebraic_number(c, a)
    ccall((:Z3_is_algebraic_number, libz3), Bool, (Z3_context, Z3_ast), c, a)
end

function Z3_to_app(c, a)
    ccall((:Z3_to_app, libz3), Z3_app, (Z3_context, Z3_ast), c, a)
end

function Z3_to_func_decl(c, a)
    ccall((:Z3_to_func_decl, libz3), Z3_func_decl, (Z3_context, Z3_ast), c, a)
end

function Z3_get_numeral_string(c, a)
    ccall((:Z3_get_numeral_string, libz3), Z3_string, (Z3_context, Z3_ast), c, a)
end

function Z3_get_numeral_binary_string(c, a)
    ccall((:Z3_get_numeral_binary_string, libz3), Z3_string, (Z3_context, Z3_ast), c, a)
end

function Z3_get_numeral_decimal_string(c, a, precision)
    ccall((:Z3_get_numeral_decimal_string, libz3), Z3_string, (Z3_context, Z3_ast, Cuint), c, a, precision)
end

function Z3_get_numeral_double(c, a)
    ccall((:Z3_get_numeral_double, libz3), Cdouble, (Z3_context, Z3_ast), c, a)
end

function Z3_get_numerator(c, a)
    ccall((:Z3_get_numerator, libz3), Z3_ast, (Z3_context, Z3_ast), c, a)
end

function Z3_get_denominator(c, a)
    ccall((:Z3_get_denominator, libz3), Z3_ast, (Z3_context, Z3_ast), c, a)
end

function Z3_get_numeral_small(c, a, num, den)
    ccall((:Z3_get_numeral_small, libz3), Bool, (Z3_context, Z3_ast, Ptr{Int64}, Ptr{Int64}), c, a, num, den)
end

function Z3_get_numeral_int(c, v, i)
    ccall((:Z3_get_numeral_int, libz3), Bool, (Z3_context, Z3_ast, Ptr{Cint}), c, v, i)
end

function Z3_get_numeral_uint(c, v, u)
    ccall((:Z3_get_numeral_uint, libz3), Bool, (Z3_context, Z3_ast, Ptr{Cuint}), c, v, u)
end

function Z3_get_numeral_uint64(c, v, u)
    ccall((:Z3_get_numeral_uint64, libz3), Bool, (Z3_context, Z3_ast, Ptr{UInt64}), c, v, u)
end

function Z3_get_numeral_int64(c, v, i)
    ccall((:Z3_get_numeral_int64, libz3), Bool, (Z3_context, Z3_ast, Ptr{Int64}), c, v, i)
end

function Z3_get_numeral_rational_int64(c, v, num, den)
    ccall((:Z3_get_numeral_rational_int64, libz3), Bool, (Z3_context, Z3_ast, Ptr{Int64}, Ptr{Int64}), c, v, num, den)
end

function Z3_get_algebraic_number_lower(c, a, precision)
    ccall((:Z3_get_algebraic_number_lower, libz3), Z3_ast, (Z3_context, Z3_ast, Cuint), c, a, precision)
end

function Z3_get_algebraic_number_upper(c, a, precision)
    ccall((:Z3_get_algebraic_number_upper, libz3), Z3_ast, (Z3_context, Z3_ast, Cuint), c, a, precision)
end

function Z3_pattern_to_ast(c, p)
    ccall((:Z3_pattern_to_ast, libz3), Z3_ast, (Z3_context, Z3_pattern), c, p)
end

function Z3_get_pattern_num_terms(c, p)
    ccall((:Z3_get_pattern_num_terms, libz3), Cuint, (Z3_context, Z3_pattern), c, p)
end

function Z3_get_pattern(c, p, idx)
    ccall((:Z3_get_pattern, libz3), Z3_ast, (Z3_context, Z3_pattern, Cuint), c, p, idx)
end

function Z3_get_index_value(c, a)
    ccall((:Z3_get_index_value, libz3), Cuint, (Z3_context, Z3_ast), c, a)
end

function Z3_is_quantifier_forall(c, a)
    ccall((:Z3_is_quantifier_forall, libz3), Bool, (Z3_context, Z3_ast), c, a)
end

function Z3_is_quantifier_exists(c, a)
    ccall((:Z3_is_quantifier_exists, libz3), Bool, (Z3_context, Z3_ast), c, a)
end

function Z3_is_lambda(c, a)
    ccall((:Z3_is_lambda, libz3), Bool, (Z3_context, Z3_ast), c, a)
end

function Z3_get_quantifier_weight(c, a)
    ccall((:Z3_get_quantifier_weight, libz3), Cuint, (Z3_context, Z3_ast), c, a)
end

function Z3_get_quantifier_skolem_id(c, a)
    ccall((:Z3_get_quantifier_skolem_id, libz3), Z3_symbol, (Z3_context, Z3_ast), c, a)
end

function Z3_get_quantifier_id(c, a)
    ccall((:Z3_get_quantifier_id, libz3), Z3_symbol, (Z3_context, Z3_ast), c, a)
end

function Z3_get_quantifier_num_patterns(c, a)
    ccall((:Z3_get_quantifier_num_patterns, libz3), Cuint, (Z3_context, Z3_ast), c, a)
end

function Z3_get_quantifier_pattern_ast(c, a, i)
    ccall((:Z3_get_quantifier_pattern_ast, libz3), Z3_pattern, (Z3_context, Z3_ast, Cuint), c, a, i)
end

function Z3_get_quantifier_num_no_patterns(c, a)
    ccall((:Z3_get_quantifier_num_no_patterns, libz3), Cuint, (Z3_context, Z3_ast), c, a)
end

function Z3_get_quantifier_no_pattern_ast(c, a, i)
    ccall((:Z3_get_quantifier_no_pattern_ast, libz3), Z3_ast, (Z3_context, Z3_ast, Cuint), c, a, i)
end

function Z3_get_quantifier_num_bound(c, a)
    ccall((:Z3_get_quantifier_num_bound, libz3), Cuint, (Z3_context, Z3_ast), c, a)
end

function Z3_get_quantifier_bound_name(c, a, i)
    ccall((:Z3_get_quantifier_bound_name, libz3), Z3_symbol, (Z3_context, Z3_ast, Cuint), c, a, i)
end

function Z3_get_quantifier_bound_sort(c, a, i)
    ccall((:Z3_get_quantifier_bound_sort, libz3), Z3_sort, (Z3_context, Z3_ast, Cuint), c, a, i)
end

function Z3_get_quantifier_body(c, a)
    ccall((:Z3_get_quantifier_body, libz3), Z3_ast, (Z3_context, Z3_ast), c, a)
end

function Z3_simplify(c, a)
    ccall((:Z3_simplify, libz3), Z3_ast, (Z3_context, Z3_ast), c, a)
end

function Z3_simplify_ex(c, a, p)
    ccall((:Z3_simplify_ex, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_params), c, a, p)
end

function Z3_simplify_get_help(c)
    ccall((:Z3_simplify_get_help, libz3), Z3_string, (Z3_context,), c)
end

function Z3_simplify_get_param_descrs(c)
    ccall((:Z3_simplify_get_param_descrs, libz3), Z3_param_descrs, (Z3_context,), c)
end

function Z3_update_term(c, a, num_args, args)
    ccall((:Z3_update_term, libz3), Z3_ast, (Z3_context, Z3_ast, Cuint, Ptr{Z3_ast}), c, a, num_args, args)
end

function Z3_substitute(c, a, num_exprs, from, to)
    ccall((:Z3_substitute, libz3), Z3_ast, (Z3_context, Z3_ast, Cuint, Ptr{Z3_ast}, Ptr{Z3_ast}), c, a, num_exprs, from, to)
end

function Z3_substitute_vars(c, a, num_exprs, to)
    ccall((:Z3_substitute_vars, libz3), Z3_ast, (Z3_context, Z3_ast, Cuint, Ptr{Z3_ast}), c, a, num_exprs, to)
end

function Z3_substitute_funs(c, a, num_funs, from, to)
    ccall((:Z3_substitute_funs, libz3), Z3_ast, (Z3_context, Z3_ast, Cuint, Ptr{Z3_func_decl}, Ptr{Z3_ast}), c, a, num_funs, from, to)
end

function Z3_translate(source, a, target)
    ccall((:Z3_translate, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_context), source, a, target)
end

function Z3_mk_model(c)
    ccall((:Z3_mk_model, libz3), Z3_model, (Z3_context,), c)
end

function Z3_model_inc_ref(c, m)
    ccall((:Z3_model_inc_ref, libz3), Cvoid, (Z3_context, Z3_model), c, m)
end

function Z3_model_dec_ref(c, m)
    ccall((:Z3_model_dec_ref, libz3), Cvoid, (Z3_context, Z3_model), c, m)
end

function Z3_model_eval(c, m, t, model_completion, v)
    ccall((:Z3_model_eval, libz3), Bool, (Z3_context, Z3_model, Z3_ast, Bool, Ptr{Z3_ast}), c, m, t, model_completion, v)
end

function Z3_model_get_const_interp(c, m, a)
    ccall((:Z3_model_get_const_interp, libz3), Z3_ast, (Z3_context, Z3_model, Z3_func_decl), c, m, a)
end

function Z3_model_has_interp(c, m, a)
    ccall((:Z3_model_has_interp, libz3), Bool, (Z3_context, Z3_model, Z3_func_decl), c, m, a)
end

function Z3_model_get_func_interp(c, m, f)
    ccall((:Z3_model_get_func_interp, libz3), Z3_func_interp, (Z3_context, Z3_model, Z3_func_decl), c, m, f)
end

function Z3_model_get_num_consts(c, m)
    ccall((:Z3_model_get_num_consts, libz3), Cuint, (Z3_context, Z3_model), c, m)
end

function Z3_model_get_const_decl(c, m, i)
    ccall((:Z3_model_get_const_decl, libz3), Z3_func_decl, (Z3_context, Z3_model, Cuint), c, m, i)
end

function Z3_model_get_num_funcs(c, m)
    ccall((:Z3_model_get_num_funcs, libz3), Cuint, (Z3_context, Z3_model), c, m)
end

function Z3_model_get_func_decl(c, m, i)
    ccall((:Z3_model_get_func_decl, libz3), Z3_func_decl, (Z3_context, Z3_model, Cuint), c, m, i)
end

function Z3_model_get_num_sorts(c, m)
    ccall((:Z3_model_get_num_sorts, libz3), Cuint, (Z3_context, Z3_model), c, m)
end

function Z3_model_get_sort(c, m, i)
    ccall((:Z3_model_get_sort, libz3), Z3_sort, (Z3_context, Z3_model, Cuint), c, m, i)
end

function Z3_model_get_sort_universe(c, m, s)
    ccall((:Z3_model_get_sort_universe, libz3), Z3_ast_vector, (Z3_context, Z3_model, Z3_sort), c, m, s)
end

function Z3_model_translate(c, m, dst)
    ccall((:Z3_model_translate, libz3), Z3_model, (Z3_context, Z3_model, Z3_context), c, m, dst)
end

function Z3_is_as_array(c, a)
    ccall((:Z3_is_as_array, libz3), Bool, (Z3_context, Z3_ast), c, a)
end

function Z3_get_as_array_func_decl(c, a)
    ccall((:Z3_get_as_array_func_decl, libz3), Z3_func_decl, (Z3_context, Z3_ast), c, a)
end

function Z3_add_func_interp(c, m, f, default_value)
    ccall((:Z3_add_func_interp, libz3), Z3_func_interp, (Z3_context, Z3_model, Z3_func_decl, Z3_ast), c, m, f, default_value)
end

function Z3_add_const_interp(c, m, f, a)
    ccall((:Z3_add_const_interp, libz3), Cvoid, (Z3_context, Z3_model, Z3_func_decl, Z3_ast), c, m, f, a)
end

function Z3_func_interp_inc_ref(c, f)
    ccall((:Z3_func_interp_inc_ref, libz3), Cvoid, (Z3_context, Z3_func_interp), c, f)
end

function Z3_func_interp_dec_ref(c, f)
    ccall((:Z3_func_interp_dec_ref, libz3), Cvoid, (Z3_context, Z3_func_interp), c, f)
end

function Z3_func_interp_get_num_entries(c, f)
    ccall((:Z3_func_interp_get_num_entries, libz3), Cuint, (Z3_context, Z3_func_interp), c, f)
end

function Z3_func_interp_get_entry(c, f, i)
    ccall((:Z3_func_interp_get_entry, libz3), Z3_func_entry, (Z3_context, Z3_func_interp, Cuint), c, f, i)
end

function Z3_func_interp_get_else(c, f)
    ccall((:Z3_func_interp_get_else, libz3), Z3_ast, (Z3_context, Z3_func_interp), c, f)
end

function Z3_func_interp_set_else(c, f, else_value)
    ccall((:Z3_func_interp_set_else, libz3), Cvoid, (Z3_context, Z3_func_interp, Z3_ast), c, f, else_value)
end

function Z3_func_interp_get_arity(c, f)
    ccall((:Z3_func_interp_get_arity, libz3), Cuint, (Z3_context, Z3_func_interp), c, f)
end

function Z3_func_interp_add_entry(c, fi, args, value)
    ccall((:Z3_func_interp_add_entry, libz3), Cvoid, (Z3_context, Z3_func_interp, Z3_ast_vector, Z3_ast), c, fi, args, value)
end

function Z3_func_entry_inc_ref(c, e)
    ccall((:Z3_func_entry_inc_ref, libz3), Cvoid, (Z3_context, Z3_func_entry), c, e)
end

function Z3_func_entry_dec_ref(c, e)
    ccall((:Z3_func_entry_dec_ref, libz3), Cvoid, (Z3_context, Z3_func_entry), c, e)
end

function Z3_func_entry_get_value(c, e)
    ccall((:Z3_func_entry_get_value, libz3), Z3_ast, (Z3_context, Z3_func_entry), c, e)
end

function Z3_func_entry_get_num_args(c, e)
    ccall((:Z3_func_entry_get_num_args, libz3), Cuint, (Z3_context, Z3_func_entry), c, e)
end

function Z3_func_entry_get_arg(c, e, i)
    ccall((:Z3_func_entry_get_arg, libz3), Z3_ast, (Z3_context, Z3_func_entry, Cuint), c, e, i)
end

function Z3_open_log(filename)
    ccall((:Z3_open_log, libz3), Bool, (Z3_string,), filename)
end

function Z3_append_log(string)
    ccall((:Z3_append_log, libz3), Cvoid, (Z3_string,), string)
end

function Z3_close_log()
    ccall((:Z3_close_log, libz3), Cvoid, ())
end

function Z3_toggle_warning_messages(enabled)
    ccall((:Z3_toggle_warning_messages, libz3), Cvoid, (Bool,), enabled)
end

function Z3_set_ast_print_mode(c, mode)
    ccall((:Z3_set_ast_print_mode, libz3), Cvoid, (Z3_context, Z3_ast_print_mode), c, mode)
end

function Z3_ast_to_string(c, a)
    ccall((:Z3_ast_to_string, libz3), Z3_string, (Z3_context, Z3_ast), c, a)
end

function Z3_pattern_to_string(c, p)
    ccall((:Z3_pattern_to_string, libz3), Z3_string, (Z3_context, Z3_pattern), c, p)
end

function Z3_sort_to_string(c, s)
    ccall((:Z3_sort_to_string, libz3), Z3_string, (Z3_context, Z3_sort), c, s)
end

function Z3_func_decl_to_string(c, d)
    ccall((:Z3_func_decl_to_string, libz3), Z3_string, (Z3_context, Z3_func_decl), c, d)
end

function Z3_model_to_string(c, m)
    ccall((:Z3_model_to_string, libz3), Z3_string, (Z3_context, Z3_model), c, m)
end

function Z3_benchmark_to_smtlib_string(c, name, logic, status, attributes, num_assumptions, assumptions, formula)
    ccall((:Z3_benchmark_to_smtlib_string, libz3), Z3_string, (Z3_context, Z3_string, Z3_string, Z3_string, Z3_string, Cuint, Ptr{Z3_ast}, Z3_ast), c, name, logic, status, attributes, num_assumptions, assumptions, formula)
end

function Z3_parse_smtlib2_string(c, str, num_sorts, sort_names, sorts, num_decls, decl_names, decls)
    ccall((:Z3_parse_smtlib2_string, libz3), Z3_ast_vector, (Z3_context, Z3_string, Cuint, Ptr{Z3_symbol}, Ptr{Z3_sort}, Cuint, Ptr{Z3_symbol}, Ptr{Z3_func_decl}), c, str, num_sorts, sort_names, sorts, num_decls, decl_names, decls)
end

function Z3_parse_smtlib2_file(c, file_name, num_sorts, sort_names, sorts, num_decls, decl_names, decls)
    ccall((:Z3_parse_smtlib2_file, libz3), Z3_ast_vector, (Z3_context, Z3_string, Cuint, Ptr{Z3_symbol}, Ptr{Z3_sort}, Cuint, Ptr{Z3_symbol}, Ptr{Z3_func_decl}), c, file_name, num_sorts, sort_names, sorts, num_decls, decl_names, decls)
end

function Z3_eval_smtlib2_string(c, str)
    ccall((:Z3_eval_smtlib2_string, libz3), Z3_string, (Z3_context, Z3_string), c, str)
end

function Z3_mk_parser_context(c)
    ccall((:Z3_mk_parser_context, libz3), Z3_parser_context, (Z3_context,), c)
end

function Z3_parser_context_inc_ref(c, pc)
    ccall((:Z3_parser_context_inc_ref, libz3), Cvoid, (Z3_context, Z3_parser_context), c, pc)
end

function Z3_parser_context_dec_ref(c, pc)
    ccall((:Z3_parser_context_dec_ref, libz3), Cvoid, (Z3_context, Z3_parser_context), c, pc)
end

function Z3_parser_context_add_sort(c, pc, s)
    ccall((:Z3_parser_context_add_sort, libz3), Cvoid, (Z3_context, Z3_parser_context, Z3_sort), c, pc, s)
end

function Z3_parser_context_add_decl(c, pc, f)
    ccall((:Z3_parser_context_add_decl, libz3), Cvoid, (Z3_context, Z3_parser_context, Z3_func_decl), c, pc, f)
end

function Z3_parser_context_from_string(c, pc, s)
    ccall((:Z3_parser_context_from_string, libz3), Z3_ast_vector, (Z3_context, Z3_parser_context, Z3_string), c, pc, s)
end

function Z3_get_error_code(c)
    ccall((:Z3_get_error_code, libz3), Z3_error_code, (Z3_context,), c)
end

function Z3_set_error_handler(c, h)
    ccall((:Z3_set_error_handler, libz3), Cvoid, (Z3_context, Z3_error_handler), c, h)
end

function Z3_set_error(c, e)
    ccall((:Z3_set_error, libz3), Cvoid, (Z3_context, Z3_error_code), c, e)
end

function Z3_get_error_msg(c, err)
    ccall((:Z3_get_error_msg, libz3), Z3_string, (Z3_context, Z3_error_code), c, err)
end

function Z3_get_version(major, minor, build_number, revision_number)
    ccall((:Z3_get_version, libz3), Cvoid, (Ptr{Cuint}, Ptr{Cuint}, Ptr{Cuint}, Ptr{Cuint}), major, minor, build_number, revision_number)
end

function Z3_get_full_version()
    ccall((:Z3_get_full_version, libz3), Z3_string, ())
end

function Z3_enable_trace(tag)
    ccall((:Z3_enable_trace, libz3), Cvoid, (Z3_string,), tag)
end

function Z3_disable_trace(tag)
    ccall((:Z3_disable_trace, libz3), Cvoid, (Z3_string,), tag)
end

function Z3_reset_memory()
    ccall((:Z3_reset_memory, libz3), Cvoid, ())
end

function Z3_finalize_memory()
    ccall((:Z3_finalize_memory, libz3), Cvoid, ())
end

function Z3_mk_goal(c, models, unsat_cores, proofs)
    ccall((:Z3_mk_goal, libz3), Z3_goal, (Z3_context, Bool, Bool, Bool), c, models, unsat_cores, proofs)
end

function Z3_goal_inc_ref(c, g)
    ccall((:Z3_goal_inc_ref, libz3), Cvoid, (Z3_context, Z3_goal), c, g)
end

function Z3_goal_dec_ref(c, g)
    ccall((:Z3_goal_dec_ref, libz3), Cvoid, (Z3_context, Z3_goal), c, g)
end

function Z3_goal_precision(c, g)
    ccall((:Z3_goal_precision, libz3), Z3_goal_prec, (Z3_context, Z3_goal), c, g)
end

function Z3_goal_assert(c, g, a)
    ccall((:Z3_goal_assert, libz3), Cvoid, (Z3_context, Z3_goal, Z3_ast), c, g, a)
end

function Z3_goal_inconsistent(c, g)
    ccall((:Z3_goal_inconsistent, libz3), Bool, (Z3_context, Z3_goal), c, g)
end

function Z3_goal_depth(c, g)
    ccall((:Z3_goal_depth, libz3), Cuint, (Z3_context, Z3_goal), c, g)
end

function Z3_goal_reset(c, g)
    ccall((:Z3_goal_reset, libz3), Cvoid, (Z3_context, Z3_goal), c, g)
end

function Z3_goal_size(c, g)
    ccall((:Z3_goal_size, libz3), Cuint, (Z3_context, Z3_goal), c, g)
end

function Z3_goal_formula(c, g, idx)
    ccall((:Z3_goal_formula, libz3), Z3_ast, (Z3_context, Z3_goal, Cuint), c, g, idx)
end

function Z3_goal_num_exprs(c, g)
    ccall((:Z3_goal_num_exprs, libz3), Cuint, (Z3_context, Z3_goal), c, g)
end

function Z3_goal_is_decided_sat(c, g)
    ccall((:Z3_goal_is_decided_sat, libz3), Bool, (Z3_context, Z3_goal), c, g)
end

function Z3_goal_is_decided_unsat(c, g)
    ccall((:Z3_goal_is_decided_unsat, libz3), Bool, (Z3_context, Z3_goal), c, g)
end

function Z3_goal_translate(source, g, target)
    ccall((:Z3_goal_translate, libz3), Z3_goal, (Z3_context, Z3_goal, Z3_context), source, g, target)
end

function Z3_goal_convert_model(c, g, m)
    ccall((:Z3_goal_convert_model, libz3), Z3_model, (Z3_context, Z3_goal, Z3_model), c, g, m)
end

function Z3_goal_to_string(c, g)
    ccall((:Z3_goal_to_string, libz3), Z3_string, (Z3_context, Z3_goal), c, g)
end

function Z3_goal_to_dimacs_string(c, g, include_names)
    ccall((:Z3_goal_to_dimacs_string, libz3), Z3_string, (Z3_context, Z3_goal, Bool), c, g, include_names)
end

function Z3_mk_tactic(c, name)
    ccall((:Z3_mk_tactic, libz3), Z3_tactic, (Z3_context, Z3_string), c, name)
end

function Z3_tactic_inc_ref(c, t)
    ccall((:Z3_tactic_inc_ref, libz3), Cvoid, (Z3_context, Z3_tactic), c, t)
end

function Z3_tactic_dec_ref(c, g)
    ccall((:Z3_tactic_dec_ref, libz3), Cvoid, (Z3_context, Z3_tactic), c, g)
end

function Z3_mk_probe(c, name)
    ccall((:Z3_mk_probe, libz3), Z3_probe, (Z3_context, Z3_string), c, name)
end

function Z3_probe_inc_ref(c, p)
    ccall((:Z3_probe_inc_ref, libz3), Cvoid, (Z3_context, Z3_probe), c, p)
end

function Z3_probe_dec_ref(c, p)
    ccall((:Z3_probe_dec_ref, libz3), Cvoid, (Z3_context, Z3_probe), c, p)
end

function Z3_tactic_and_then(c, t1, t2)
    ccall((:Z3_tactic_and_then, libz3), Z3_tactic, (Z3_context, Z3_tactic, Z3_tactic), c, t1, t2)
end

function Z3_tactic_or_else(c, t1, t2)
    ccall((:Z3_tactic_or_else, libz3), Z3_tactic, (Z3_context, Z3_tactic, Z3_tactic), c, t1, t2)
end

function Z3_tactic_par_or(c, num, ts)
    ccall((:Z3_tactic_par_or, libz3), Z3_tactic, (Z3_context, Cuint, Ptr{Z3_tactic}), c, num, ts)
end

function Z3_tactic_par_and_then(c, t1, t2)
    ccall((:Z3_tactic_par_and_then, libz3), Z3_tactic, (Z3_context, Z3_tactic, Z3_tactic), c, t1, t2)
end

function Z3_tactic_try_for(c, t, ms)
    ccall((:Z3_tactic_try_for, libz3), Z3_tactic, (Z3_context, Z3_tactic, Cuint), c, t, ms)
end

function Z3_tactic_when(c, p, t)
    ccall((:Z3_tactic_when, libz3), Z3_tactic, (Z3_context, Z3_probe, Z3_tactic), c, p, t)
end

function Z3_tactic_cond(c, p, t1, t2)
    ccall((:Z3_tactic_cond, libz3), Z3_tactic, (Z3_context, Z3_probe, Z3_tactic, Z3_tactic), c, p, t1, t2)
end

function Z3_tactic_repeat(c, t, max)
    ccall((:Z3_tactic_repeat, libz3), Z3_tactic, (Z3_context, Z3_tactic, Cuint), c, t, max)
end

function Z3_tactic_skip(c)
    ccall((:Z3_tactic_skip, libz3), Z3_tactic, (Z3_context,), c)
end

function Z3_tactic_fail(c)
    ccall((:Z3_tactic_fail, libz3), Z3_tactic, (Z3_context,), c)
end

function Z3_tactic_fail_if(c, p)
    ccall((:Z3_tactic_fail_if, libz3), Z3_tactic, (Z3_context, Z3_probe), c, p)
end

function Z3_tactic_fail_if_not_decided(c)
    ccall((:Z3_tactic_fail_if_not_decided, libz3), Z3_tactic, (Z3_context,), c)
end

function Z3_tactic_using_params(c, t, p)
    ccall((:Z3_tactic_using_params, libz3), Z3_tactic, (Z3_context, Z3_tactic, Z3_params), c, t, p)
end

function Z3_mk_simplifier(c, name)
    ccall((:Z3_mk_simplifier, libz3), Z3_simplifier, (Z3_context, Z3_string), c, name)
end

function Z3_simplifier_inc_ref(c, t)
    ccall((:Z3_simplifier_inc_ref, libz3), Cvoid, (Z3_context, Z3_simplifier), c, t)
end

function Z3_simplifier_dec_ref(c, g)
    ccall((:Z3_simplifier_dec_ref, libz3), Cvoid, (Z3_context, Z3_simplifier), c, g)
end

function Z3_solver_add_simplifier(c, solver, simplifier)
    ccall((:Z3_solver_add_simplifier, libz3), Z3_solver, (Z3_context, Z3_solver, Z3_simplifier), c, solver, simplifier)
end

function Z3_simplifier_and_then(c, t1, t2)
    ccall((:Z3_simplifier_and_then, libz3), Z3_simplifier, (Z3_context, Z3_simplifier, Z3_simplifier), c, t1, t2)
end

function Z3_simplifier_using_params(c, t, p)
    ccall((:Z3_simplifier_using_params, libz3), Z3_simplifier, (Z3_context, Z3_simplifier, Z3_params), c, t, p)
end

function Z3_get_num_simplifiers(c)
    ccall((:Z3_get_num_simplifiers, libz3), Cuint, (Z3_context,), c)
end

function Z3_get_simplifier_name(c, i)
    ccall((:Z3_get_simplifier_name, libz3), Z3_string, (Z3_context, Cuint), c, i)
end

function Z3_simplifier_get_help(c, t)
    ccall((:Z3_simplifier_get_help, libz3), Z3_string, (Z3_context, Z3_simplifier), c, t)
end

function Z3_simplifier_get_param_descrs(c, t)
    ccall((:Z3_simplifier_get_param_descrs, libz3), Z3_param_descrs, (Z3_context, Z3_simplifier), c, t)
end

function Z3_simplifier_get_descr(c, name)
    ccall((:Z3_simplifier_get_descr, libz3), Z3_string, (Z3_context, Z3_string), c, name)
end

function Z3_probe_const(x, val)
    ccall((:Z3_probe_const, libz3), Z3_probe, (Z3_context, Cdouble), x, val)
end

function Z3_probe_lt(x, p1, p2)
    ccall((:Z3_probe_lt, libz3), Z3_probe, (Z3_context, Z3_probe, Z3_probe), x, p1, p2)
end

function Z3_probe_gt(x, p1, p2)
    ccall((:Z3_probe_gt, libz3), Z3_probe, (Z3_context, Z3_probe, Z3_probe), x, p1, p2)
end

function Z3_probe_le(x, p1, p2)
    ccall((:Z3_probe_le, libz3), Z3_probe, (Z3_context, Z3_probe, Z3_probe), x, p1, p2)
end

function Z3_probe_ge(x, p1, p2)
    ccall((:Z3_probe_ge, libz3), Z3_probe, (Z3_context, Z3_probe, Z3_probe), x, p1, p2)
end

function Z3_probe_eq(x, p1, p2)
    ccall((:Z3_probe_eq, libz3), Z3_probe, (Z3_context, Z3_probe, Z3_probe), x, p1, p2)
end

function Z3_probe_and(x, p1, p2)
    ccall((:Z3_probe_and, libz3), Z3_probe, (Z3_context, Z3_probe, Z3_probe), x, p1, p2)
end

function Z3_probe_or(x, p1, p2)
    ccall((:Z3_probe_or, libz3), Z3_probe, (Z3_context, Z3_probe, Z3_probe), x, p1, p2)
end

function Z3_probe_not(x, p)
    ccall((:Z3_probe_not, libz3), Z3_probe, (Z3_context, Z3_probe), x, p)
end

function Z3_get_num_tactics(c)
    ccall((:Z3_get_num_tactics, libz3), Cuint, (Z3_context,), c)
end

function Z3_get_tactic_name(c, i)
    ccall((:Z3_get_tactic_name, libz3), Z3_string, (Z3_context, Cuint), c, i)
end

function Z3_get_num_probes(c)
    ccall((:Z3_get_num_probes, libz3), Cuint, (Z3_context,), c)
end

function Z3_get_probe_name(c, i)
    ccall((:Z3_get_probe_name, libz3), Z3_string, (Z3_context, Cuint), c, i)
end

function Z3_tactic_get_help(c, t)
    ccall((:Z3_tactic_get_help, libz3), Z3_string, (Z3_context, Z3_tactic), c, t)
end

function Z3_tactic_get_param_descrs(c, t)
    ccall((:Z3_tactic_get_param_descrs, libz3), Z3_param_descrs, (Z3_context, Z3_tactic), c, t)
end

function Z3_tactic_get_descr(c, name)
    ccall((:Z3_tactic_get_descr, libz3), Z3_string, (Z3_context, Z3_string), c, name)
end

function Z3_probe_get_descr(c, name)
    ccall((:Z3_probe_get_descr, libz3), Z3_string, (Z3_context, Z3_string), c, name)
end

function Z3_probe_apply(c, p, g)
    ccall((:Z3_probe_apply, libz3), Cdouble, (Z3_context, Z3_probe, Z3_goal), c, p, g)
end

function Z3_tactic_apply(c, t, g)
    ccall((:Z3_tactic_apply, libz3), Z3_apply_result, (Z3_context, Z3_tactic, Z3_goal), c, t, g)
end

function Z3_tactic_apply_ex(c, t, g, p)
    ccall((:Z3_tactic_apply_ex, libz3), Z3_apply_result, (Z3_context, Z3_tactic, Z3_goal, Z3_params), c, t, g, p)
end

function Z3_apply_result_inc_ref(c, r)
    ccall((:Z3_apply_result_inc_ref, libz3), Cvoid, (Z3_context, Z3_apply_result), c, r)
end

function Z3_apply_result_dec_ref(c, r)
    ccall((:Z3_apply_result_dec_ref, libz3), Cvoid, (Z3_context, Z3_apply_result), c, r)
end

function Z3_apply_result_to_string(c, r)
    ccall((:Z3_apply_result_to_string, libz3), Z3_string, (Z3_context, Z3_apply_result), c, r)
end

function Z3_apply_result_get_num_subgoals(c, r)
    ccall((:Z3_apply_result_get_num_subgoals, libz3), Cuint, (Z3_context, Z3_apply_result), c, r)
end

function Z3_apply_result_get_subgoal(c, r, i)
    ccall((:Z3_apply_result_get_subgoal, libz3), Z3_goal, (Z3_context, Z3_apply_result, Cuint), c, r, i)
end

function Z3_mk_solver(c)
    ccall((:Z3_mk_solver, libz3), Z3_solver, (Z3_context,), c)
end

function Z3_mk_simple_solver(c)
    ccall((:Z3_mk_simple_solver, libz3), Z3_solver, (Z3_context,), c)
end

function Z3_mk_solver_for_logic(c, logic)
    ccall((:Z3_mk_solver_for_logic, libz3), Z3_solver, (Z3_context, Z3_symbol), c, logic)
end

function Z3_mk_solver_from_tactic(c, t)
    ccall((:Z3_mk_solver_from_tactic, libz3), Z3_solver, (Z3_context, Z3_tactic), c, t)
end

function Z3_solver_translate(source, s, target)
    ccall((:Z3_solver_translate, libz3), Z3_solver, (Z3_context, Z3_solver, Z3_context), source, s, target)
end

function Z3_solver_import_model_converter(ctx, src, dst)
    ccall((:Z3_solver_import_model_converter, libz3), Cvoid, (Z3_context, Z3_solver, Z3_solver), ctx, src, dst)
end

function Z3_solver_get_help(c, s)
    ccall((:Z3_solver_get_help, libz3), Z3_string, (Z3_context, Z3_solver), c, s)
end

function Z3_solver_get_param_descrs(c, s)
    ccall((:Z3_solver_get_param_descrs, libz3), Z3_param_descrs, (Z3_context, Z3_solver), c, s)
end

function Z3_solver_set_params(c, s, p)
    ccall((:Z3_solver_set_params, libz3), Cvoid, (Z3_context, Z3_solver, Z3_params), c, s, p)
end

function Z3_solver_inc_ref(c, s)
    ccall((:Z3_solver_inc_ref, libz3), Cvoid, (Z3_context, Z3_solver), c, s)
end

function Z3_solver_dec_ref(c, s)
    ccall((:Z3_solver_dec_ref, libz3), Cvoid, (Z3_context, Z3_solver), c, s)
end

function Z3_solver_interrupt(c, s)
    ccall((:Z3_solver_interrupt, libz3), Cvoid, (Z3_context, Z3_solver), c, s)
end

function Z3_solver_push(c, s)
    ccall((:Z3_solver_push, libz3), Cvoid, (Z3_context, Z3_solver), c, s)
end

function Z3_solver_pop(c, s, n)
    ccall((:Z3_solver_pop, libz3), Cvoid, (Z3_context, Z3_solver, Cuint), c, s, n)
end

function Z3_solver_reset(c, s)
    ccall((:Z3_solver_reset, libz3), Cvoid, (Z3_context, Z3_solver), c, s)
end

function Z3_solver_get_num_scopes(c, s)
    ccall((:Z3_solver_get_num_scopes, libz3), Cuint, (Z3_context, Z3_solver), c, s)
end

function Z3_solver_assert(c, s, a)
    ccall((:Z3_solver_assert, libz3), Cvoid, (Z3_context, Z3_solver, Z3_ast), c, s, a)
end

function Z3_solver_assert_and_track(c, s, a, p)
    ccall((:Z3_solver_assert_and_track, libz3), Cvoid, (Z3_context, Z3_solver, Z3_ast, Z3_ast), c, s, a, p)
end

function Z3_solver_from_file(c, s, file_name)
    ccall((:Z3_solver_from_file, libz3), Cvoid, (Z3_context, Z3_solver, Z3_string), c, s, file_name)
end

function Z3_solver_from_string(c, s, file_name)
    ccall((:Z3_solver_from_string, libz3), Cvoid, (Z3_context, Z3_solver, Z3_string), c, s, file_name)
end

function Z3_solver_get_assertions(c, s)
    ccall((:Z3_solver_get_assertions, libz3), Z3_ast_vector, (Z3_context, Z3_solver), c, s)
end

function Z3_solver_get_units(c, s)
    ccall((:Z3_solver_get_units, libz3), Z3_ast_vector, (Z3_context, Z3_solver), c, s)
end

function Z3_solver_get_trail(c, s)
    ccall((:Z3_solver_get_trail, libz3), Z3_ast_vector, (Z3_context, Z3_solver), c, s)
end

function Z3_solver_get_non_units(c, s)
    ccall((:Z3_solver_get_non_units, libz3), Z3_ast_vector, (Z3_context, Z3_solver), c, s)
end

function Z3_solver_get_levels(c, s, literals, sz, levels)
    ccall((:Z3_solver_get_levels, libz3), Cvoid, (Z3_context, Z3_solver, Z3_ast_vector, Cuint, Ptr{Cuint}), c, s, literals, sz, levels)
end

function Z3_solver_congruence_root(c, s, a)
    ccall((:Z3_solver_congruence_root, libz3), Z3_ast, (Z3_context, Z3_solver, Z3_ast), c, s, a)
end

function Z3_solver_congruence_next(c, s, a)
    ccall((:Z3_solver_congruence_next, libz3), Z3_ast, (Z3_context, Z3_solver, Z3_ast), c, s, a)
end

function Z3_solver_register_on_clause(c, s, user_context, on_clause_eh)
    ccall((:Z3_solver_register_on_clause, libz3), Cvoid, (Z3_context, Z3_solver, Ptr{Cvoid}, Z3_on_clause_eh), c, s, user_context, on_clause_eh)
end

function Z3_solver_propagate_init(c, s, user_context, push_eh, pop_eh, fresh_eh)
    ccall((:Z3_solver_propagate_init, libz3), Cvoid, (Z3_context, Z3_solver, Ptr{Cvoid}, Z3_push_eh, Z3_pop_eh, Z3_fresh_eh), c, s, user_context, push_eh, pop_eh, fresh_eh)
end

function Z3_solver_propagate_fixed(c, s, fixed_eh)
    ccall((:Z3_solver_propagate_fixed, libz3), Cvoid, (Z3_context, Z3_solver, Z3_fixed_eh), c, s, fixed_eh)
end

function Z3_solver_propagate_final(c, s, final_eh)
    ccall((:Z3_solver_propagate_final, libz3), Cvoid, (Z3_context, Z3_solver, Z3_final_eh), c, s, final_eh)
end

function Z3_solver_propagate_eq(c, s, eq_eh)
    ccall((:Z3_solver_propagate_eq, libz3), Cvoid, (Z3_context, Z3_solver, Z3_eq_eh), c, s, eq_eh)
end

function Z3_solver_propagate_diseq(c, s, eq_eh)
    ccall((:Z3_solver_propagate_diseq, libz3), Cvoid, (Z3_context, Z3_solver, Z3_eq_eh), c, s, eq_eh)
end

function Z3_solver_propagate_created(c, s, created_eh)
    ccall((:Z3_solver_propagate_created, libz3), Cvoid, (Z3_context, Z3_solver, Z3_created_eh), c, s, created_eh)
end

function Z3_solver_propagate_decide(c, s, decide_eh)
    ccall((:Z3_solver_propagate_decide, libz3), Cvoid, (Z3_context, Z3_solver, Z3_decide_eh), c, s, decide_eh)
end

function Z3_solver_next_split(c, cb, t, idx, phase)
    ccall((:Z3_solver_next_split, libz3), Bool, (Z3_context, Z3_solver_callback, Z3_ast, Cuint, Z3_lbool), c, cb, t, idx, phase)
end

function Z3_solver_propagate_declare(c, name, n, domain, range)
    ccall((:Z3_solver_propagate_declare, libz3), Z3_func_decl, (Z3_context, Z3_symbol, Cuint, Ptr{Z3_sort}, Z3_sort), c, name, n, domain, range)
end

function Z3_solver_propagate_register(c, s, e)
    ccall((:Z3_solver_propagate_register, libz3), Cvoid, (Z3_context, Z3_solver, Z3_ast), c, s, e)
end

function Z3_solver_propagate_register_cb(c, cb, e)
    ccall((:Z3_solver_propagate_register_cb, libz3), Cvoid, (Z3_context, Z3_solver_callback, Z3_ast), c, cb, e)
end

function Z3_solver_propagate_consequence(c, cb, num_fixed, fixed, num_eqs, eq_lhs, eq_rhs, conseq)
    ccall((:Z3_solver_propagate_consequence, libz3), Bool, (Z3_context, Z3_solver_callback, Cuint, Ptr{Z3_ast}, Cuint, Ptr{Z3_ast}, Ptr{Z3_ast}, Z3_ast), c, cb, num_fixed, fixed, num_eqs, eq_lhs, eq_rhs, conseq)
end

function Z3_solver_check(c, s)
    ccall((:Z3_solver_check, libz3), Z3_lbool, (Z3_context, Z3_solver), c, s)
end

function Z3_solver_check_assumptions(c, s, num_assumptions, assumptions)
    ccall((:Z3_solver_check_assumptions, libz3), Z3_lbool, (Z3_context, Z3_solver, Cuint, Ptr{Z3_ast}), c, s, num_assumptions, assumptions)
end

function Z3_get_implied_equalities(c, s, num_terms, terms, class_ids)
    ccall((:Z3_get_implied_equalities, libz3), Z3_lbool, (Z3_context, Z3_solver, Cuint, Ptr{Z3_ast}, Ptr{Cuint}), c, s, num_terms, terms, class_ids)
end

function Z3_solver_get_consequences(c, s, assumptions, variables, consequences)
    ccall((:Z3_solver_get_consequences, libz3), Z3_lbool, (Z3_context, Z3_solver, Z3_ast_vector, Z3_ast_vector, Z3_ast_vector), c, s, assumptions, variables, consequences)
end

function Z3_solver_cube(c, s, vars, backtrack_level)
    ccall((:Z3_solver_cube, libz3), Z3_ast_vector, (Z3_context, Z3_solver, Z3_ast_vector, Cuint), c, s, vars, backtrack_level)
end

function Z3_solver_get_model(c, s)
    ccall((:Z3_solver_get_model, libz3), Z3_model, (Z3_context, Z3_solver), c, s)
end

function Z3_solver_get_proof(c, s)
    ccall((:Z3_solver_get_proof, libz3), Z3_ast, (Z3_context, Z3_solver), c, s)
end

function Z3_solver_get_unsat_core(c, s)
    ccall((:Z3_solver_get_unsat_core, libz3), Z3_ast_vector, (Z3_context, Z3_solver), c, s)
end

function Z3_solver_get_reason_unknown(c, s)
    ccall((:Z3_solver_get_reason_unknown, libz3), Z3_string, (Z3_context, Z3_solver), c, s)
end

function Z3_solver_get_statistics(c, s)
    ccall((:Z3_solver_get_statistics, libz3), Z3_stats, (Z3_context, Z3_solver), c, s)
end

function Z3_solver_to_string(c, s)
    ccall((:Z3_solver_to_string, libz3), Z3_string, (Z3_context, Z3_solver), c, s)
end

function Z3_solver_to_dimacs_string(c, s, include_names)
    ccall((:Z3_solver_to_dimacs_string, libz3), Z3_string, (Z3_context, Z3_solver, Bool), c, s, include_names)
end

function Z3_stats_to_string(c, s)
    ccall((:Z3_stats_to_string, libz3), Z3_string, (Z3_context, Z3_stats), c, s)
end

function Z3_stats_inc_ref(c, s)
    ccall((:Z3_stats_inc_ref, libz3), Cvoid, (Z3_context, Z3_stats), c, s)
end

function Z3_stats_dec_ref(c, s)
    ccall((:Z3_stats_dec_ref, libz3), Cvoid, (Z3_context, Z3_stats), c, s)
end

function Z3_stats_size(c, s)
    ccall((:Z3_stats_size, libz3), Cuint, (Z3_context, Z3_stats), c, s)
end

function Z3_stats_get_key(c, s, idx)
    ccall((:Z3_stats_get_key, libz3), Z3_string, (Z3_context, Z3_stats, Cuint), c, s, idx)
end

function Z3_stats_is_uint(c, s, idx)
    ccall((:Z3_stats_is_uint, libz3), Bool, (Z3_context, Z3_stats, Cuint), c, s, idx)
end

function Z3_stats_is_double(c, s, idx)
    ccall((:Z3_stats_is_double, libz3), Bool, (Z3_context, Z3_stats, Cuint), c, s, idx)
end

function Z3_stats_get_uint_value(c, s, idx)
    ccall((:Z3_stats_get_uint_value, libz3), Cuint, (Z3_context, Z3_stats, Cuint), c, s, idx)
end

function Z3_stats_get_double_value(c, s, idx)
    ccall((:Z3_stats_get_double_value, libz3), Cdouble, (Z3_context, Z3_stats, Cuint), c, s, idx)
end

function Z3_get_estimated_alloc_size()
    ccall((:Z3_get_estimated_alloc_size, libz3), UInt64, ())
end

function Z3_mk_ast_vector(c)
    ccall((:Z3_mk_ast_vector, libz3), Z3_ast_vector, (Z3_context,), c)
end

function Z3_ast_vector_inc_ref(c, v)
    ccall((:Z3_ast_vector_inc_ref, libz3), Cvoid, (Z3_context, Z3_ast_vector), c, v)
end

function Z3_ast_vector_dec_ref(c, v)
    ccall((:Z3_ast_vector_dec_ref, libz3), Cvoid, (Z3_context, Z3_ast_vector), c, v)
end

function Z3_ast_vector_size(c, v)
    ccall((:Z3_ast_vector_size, libz3), Cuint, (Z3_context, Z3_ast_vector), c, v)
end

function Z3_ast_vector_get(c, v, i)
    ccall((:Z3_ast_vector_get, libz3), Z3_ast, (Z3_context, Z3_ast_vector, Cuint), c, v, i)
end

function Z3_ast_vector_set(c, v, i, a)
    ccall((:Z3_ast_vector_set, libz3), Cvoid, (Z3_context, Z3_ast_vector, Cuint, Z3_ast), c, v, i, a)
end

function Z3_ast_vector_resize(c, v, n)
    ccall((:Z3_ast_vector_resize, libz3), Cvoid, (Z3_context, Z3_ast_vector, Cuint), c, v, n)
end

function Z3_ast_vector_push(c, v, a)
    ccall((:Z3_ast_vector_push, libz3), Cvoid, (Z3_context, Z3_ast_vector, Z3_ast), c, v, a)
end

function Z3_ast_vector_translate(s, v, t)
    ccall((:Z3_ast_vector_translate, libz3), Z3_ast_vector, (Z3_context, Z3_ast_vector, Z3_context), s, v, t)
end

function Z3_ast_vector_to_string(c, v)
    ccall((:Z3_ast_vector_to_string, libz3), Z3_string, (Z3_context, Z3_ast_vector), c, v)
end

function Z3_mk_ast_map(c)
    ccall((:Z3_mk_ast_map, libz3), Z3_ast_map, (Z3_context,), c)
end

function Z3_ast_map_inc_ref(c, m)
    ccall((:Z3_ast_map_inc_ref, libz3), Cvoid, (Z3_context, Z3_ast_map), c, m)
end

function Z3_ast_map_dec_ref(c, m)
    ccall((:Z3_ast_map_dec_ref, libz3), Cvoid, (Z3_context, Z3_ast_map), c, m)
end

function Z3_ast_map_contains(c, m, k)
    ccall((:Z3_ast_map_contains, libz3), Bool, (Z3_context, Z3_ast_map, Z3_ast), c, m, k)
end

function Z3_ast_map_find(c, m, k)
    ccall((:Z3_ast_map_find, libz3), Z3_ast, (Z3_context, Z3_ast_map, Z3_ast), c, m, k)
end

function Z3_ast_map_insert(c, m, k, v)
    ccall((:Z3_ast_map_insert, libz3), Cvoid, (Z3_context, Z3_ast_map, Z3_ast, Z3_ast), c, m, k, v)
end

function Z3_ast_map_erase(c, m, k)
    ccall((:Z3_ast_map_erase, libz3), Cvoid, (Z3_context, Z3_ast_map, Z3_ast), c, m, k)
end

function Z3_ast_map_reset(c, m)
    ccall((:Z3_ast_map_reset, libz3), Cvoid, (Z3_context, Z3_ast_map), c, m)
end

function Z3_ast_map_size(c, m)
    ccall((:Z3_ast_map_size, libz3), Cuint, (Z3_context, Z3_ast_map), c, m)
end

function Z3_ast_map_keys(c, m)
    ccall((:Z3_ast_map_keys, libz3), Z3_ast_vector, (Z3_context, Z3_ast_map), c, m)
end

function Z3_ast_map_to_string(c, m)
    ccall((:Z3_ast_map_to_string, libz3), Z3_string, (Z3_context, Z3_ast_map), c, m)
end

function Z3_algebraic_is_value(c, a)
    ccall((:Z3_algebraic_is_value, libz3), Bool, (Z3_context, Z3_ast), c, a)
end

function Z3_algebraic_is_pos(c, a)
    ccall((:Z3_algebraic_is_pos, libz3), Bool, (Z3_context, Z3_ast), c, a)
end

function Z3_algebraic_is_neg(c, a)
    ccall((:Z3_algebraic_is_neg, libz3), Bool, (Z3_context, Z3_ast), c, a)
end

function Z3_algebraic_is_zero(c, a)
    ccall((:Z3_algebraic_is_zero, libz3), Bool, (Z3_context, Z3_ast), c, a)
end

function Z3_algebraic_sign(c, a)
    ccall((:Z3_algebraic_sign, libz3), Cint, (Z3_context, Z3_ast), c, a)
end

function Z3_algebraic_add(c, a, b)
    ccall((:Z3_algebraic_add, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_ast), c, a, b)
end

function Z3_algebraic_sub(c, a, b)
    ccall((:Z3_algebraic_sub, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_ast), c, a, b)
end

function Z3_algebraic_mul(c, a, b)
    ccall((:Z3_algebraic_mul, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_ast), c, a, b)
end

function Z3_algebraic_div(c, a, b)
    ccall((:Z3_algebraic_div, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_ast), c, a, b)
end

function Z3_algebraic_root(c, a, k)
    ccall((:Z3_algebraic_root, libz3), Z3_ast, (Z3_context, Z3_ast, Cuint), c, a, k)
end

function Z3_algebraic_power(c, a, k)
    ccall((:Z3_algebraic_power, libz3), Z3_ast, (Z3_context, Z3_ast, Cuint), c, a, k)
end

function Z3_algebraic_lt(c, a, b)
    ccall((:Z3_algebraic_lt, libz3), Bool, (Z3_context, Z3_ast, Z3_ast), c, a, b)
end

function Z3_algebraic_gt(c, a, b)
    ccall((:Z3_algebraic_gt, libz3), Bool, (Z3_context, Z3_ast, Z3_ast), c, a, b)
end

function Z3_algebraic_le(c, a, b)
    ccall((:Z3_algebraic_le, libz3), Bool, (Z3_context, Z3_ast, Z3_ast), c, a, b)
end

function Z3_algebraic_ge(c, a, b)
    ccall((:Z3_algebraic_ge, libz3), Bool, (Z3_context, Z3_ast, Z3_ast), c, a, b)
end

function Z3_algebraic_eq(c, a, b)
    ccall((:Z3_algebraic_eq, libz3), Bool, (Z3_context, Z3_ast, Z3_ast), c, a, b)
end

function Z3_algebraic_neq(c, a, b)
    ccall((:Z3_algebraic_neq, libz3), Bool, (Z3_context, Z3_ast, Z3_ast), c, a, b)
end

function Z3_algebraic_roots(c, p, n, a)
    ccall((:Z3_algebraic_roots, libz3), Z3_ast_vector, (Z3_context, Z3_ast, Cuint, Ptr{Z3_ast}), c, p, n, a)
end

function Z3_algebraic_eval(c, p, n, a)
    ccall((:Z3_algebraic_eval, libz3), Cint, (Z3_context, Z3_ast, Cuint, Ptr{Z3_ast}), c, p, n, a)
end

function Z3_algebraic_get_poly(c, a)
    ccall((:Z3_algebraic_get_poly, libz3), Z3_ast_vector, (Z3_context, Z3_ast), c, a)
end

function Z3_algebraic_get_i(c, a)
    ccall((:Z3_algebraic_get_i, libz3), Cuint, (Z3_context, Z3_ast), c, a)
end

function Z3_polynomial_subresultants(c, p, q, x)
    ccall((:Z3_polynomial_subresultants, libz3), Z3_ast_vector, (Z3_context, Z3_ast, Z3_ast, Z3_ast), c, p, q, x)
end

function Z3_rcf_del(c, a)
    ccall((:Z3_rcf_del, libz3), Cvoid, (Z3_context, Z3_rcf_num), c, a)
end

function Z3_rcf_mk_rational(c, val)
    ccall((:Z3_rcf_mk_rational, libz3), Z3_rcf_num, (Z3_context, Z3_string), c, val)
end

function Z3_rcf_mk_small_int(c, val)
    ccall((:Z3_rcf_mk_small_int, libz3), Z3_rcf_num, (Z3_context, Cint), c, val)
end

function Z3_rcf_mk_pi(c)
    ccall((:Z3_rcf_mk_pi, libz3), Z3_rcf_num, (Z3_context,), c)
end

function Z3_rcf_mk_e(c)
    ccall((:Z3_rcf_mk_e, libz3), Z3_rcf_num, (Z3_context,), c)
end

function Z3_rcf_mk_infinitesimal(c)
    ccall((:Z3_rcf_mk_infinitesimal, libz3), Z3_rcf_num, (Z3_context,), c)
end

function Z3_rcf_mk_roots(c, n, a, roots)
    ccall((:Z3_rcf_mk_roots, libz3), Cuint, (Z3_context, Cuint, Ptr{Z3_rcf_num}, Ptr{Z3_rcf_num}), c, n, a, roots)
end

function Z3_rcf_add(c, a, b)
    ccall((:Z3_rcf_add, libz3), Z3_rcf_num, (Z3_context, Z3_rcf_num, Z3_rcf_num), c, a, b)
end

function Z3_rcf_sub(c, a, b)
    ccall((:Z3_rcf_sub, libz3), Z3_rcf_num, (Z3_context, Z3_rcf_num, Z3_rcf_num), c, a, b)
end

function Z3_rcf_mul(c, a, b)
    ccall((:Z3_rcf_mul, libz3), Z3_rcf_num, (Z3_context, Z3_rcf_num, Z3_rcf_num), c, a, b)
end

function Z3_rcf_div(c, a, b)
    ccall((:Z3_rcf_div, libz3), Z3_rcf_num, (Z3_context, Z3_rcf_num, Z3_rcf_num), c, a, b)
end

function Z3_rcf_neg(c, a)
    ccall((:Z3_rcf_neg, libz3), Z3_rcf_num, (Z3_context, Z3_rcf_num), c, a)
end

function Z3_rcf_inv(c, a)
    ccall((:Z3_rcf_inv, libz3), Z3_rcf_num, (Z3_context, Z3_rcf_num), c, a)
end

function Z3_rcf_power(c, a, k)
    ccall((:Z3_rcf_power, libz3), Z3_rcf_num, (Z3_context, Z3_rcf_num, Cuint), c, a, k)
end

function Z3_rcf_lt(c, a, b)
    ccall((:Z3_rcf_lt, libz3), Bool, (Z3_context, Z3_rcf_num, Z3_rcf_num), c, a, b)
end

function Z3_rcf_gt(c, a, b)
    ccall((:Z3_rcf_gt, libz3), Bool, (Z3_context, Z3_rcf_num, Z3_rcf_num), c, a, b)
end

function Z3_rcf_le(c, a, b)
    ccall((:Z3_rcf_le, libz3), Bool, (Z3_context, Z3_rcf_num, Z3_rcf_num), c, a, b)
end

function Z3_rcf_ge(c, a, b)
    ccall((:Z3_rcf_ge, libz3), Bool, (Z3_context, Z3_rcf_num, Z3_rcf_num), c, a, b)
end

function Z3_rcf_eq(c, a, b)
    ccall((:Z3_rcf_eq, libz3), Bool, (Z3_context, Z3_rcf_num, Z3_rcf_num), c, a, b)
end

function Z3_rcf_neq(c, a, b)
    ccall((:Z3_rcf_neq, libz3), Bool, (Z3_context, Z3_rcf_num, Z3_rcf_num), c, a, b)
end

function Z3_rcf_num_to_string(c, a, compact, html)
    ccall((:Z3_rcf_num_to_string, libz3), Z3_string, (Z3_context, Z3_rcf_num, Bool, Bool), c, a, compact, html)
end

function Z3_rcf_num_to_decimal_string(c, a, prec)
    ccall((:Z3_rcf_num_to_decimal_string, libz3), Z3_string, (Z3_context, Z3_rcf_num, Cuint), c, a, prec)
end

function Z3_rcf_get_numerator_denominator(c, a, n, d)
    ccall((:Z3_rcf_get_numerator_denominator, libz3), Cvoid, (Z3_context, Z3_rcf_num, Ptr{Z3_rcf_num}, Ptr{Z3_rcf_num}), c, a, n, d)
end

function Z3_rcf_is_rational(c, a)
    ccall((:Z3_rcf_is_rational, libz3), Bool, (Z3_context, Z3_rcf_num), c, a)
end

function Z3_rcf_is_algebraic(c, a)
    ccall((:Z3_rcf_is_algebraic, libz3), Bool, (Z3_context, Z3_rcf_num), c, a)
end

function Z3_rcf_is_infinitesimal(c, a)
    ccall((:Z3_rcf_is_infinitesimal, libz3), Bool, (Z3_context, Z3_rcf_num), c, a)
end

function Z3_rcf_is_transcendental(c, a)
    ccall((:Z3_rcf_is_transcendental, libz3), Bool, (Z3_context, Z3_rcf_num), c, a)
end

function Z3_rcf_extension_index(c, a)
    ccall((:Z3_rcf_extension_index, libz3), Cuint, (Z3_context, Z3_rcf_num), c, a)
end

function Z3_rcf_transcendental_name(c, a)
    ccall((:Z3_rcf_transcendental_name, libz3), Z3_symbol, (Z3_context, Z3_rcf_num), c, a)
end

function Z3_rcf_infinitesimal_name(c, a)
    ccall((:Z3_rcf_infinitesimal_name, libz3), Z3_symbol, (Z3_context, Z3_rcf_num), c, a)
end

function Z3_rcf_num_coefficients(c, a)
    ccall((:Z3_rcf_num_coefficients, libz3), Cuint, (Z3_context, Z3_rcf_num), c, a)
end

function Z3_rcf_coefficient(c, a, i)
    ccall((:Z3_rcf_coefficient, libz3), Z3_rcf_num, (Z3_context, Z3_rcf_num, Cuint), c, a, i)
end

function Z3_rcf_interval(c, a, lower_is_inf, lower_is_open, lower, upper_is_inf, upper_is_open, upper)
    ccall((:Z3_rcf_interval, libz3), Cint, (Z3_context, Z3_rcf_num, Ptr{Cint}, Ptr{Cint}, Ptr{Z3_rcf_num}, Ptr{Cint}, Ptr{Cint}, Ptr{Z3_rcf_num}), c, a, lower_is_inf, lower_is_open, lower, upper_is_inf, upper_is_open, upper)
end

function Z3_rcf_num_sign_conditions(c, a)
    ccall((:Z3_rcf_num_sign_conditions, libz3), Cuint, (Z3_context, Z3_rcf_num), c, a)
end

function Z3_rcf_sign_condition_sign(c, a, i)
    ccall((:Z3_rcf_sign_condition_sign, libz3), Cint, (Z3_context, Z3_rcf_num, Cuint), c, a, i)
end

function Z3_rcf_num_sign_condition_coefficients(c, a, i)
    ccall((:Z3_rcf_num_sign_condition_coefficients, libz3), Cuint, (Z3_context, Z3_rcf_num, Cuint), c, a, i)
end

function Z3_rcf_sign_condition_coefficient(c, a, i, j)
    ccall((:Z3_rcf_sign_condition_coefficient, libz3), Z3_rcf_num, (Z3_context, Z3_rcf_num, Cuint, Cuint), c, a, i, j)
end

function Z3_mk_fixedpoint(c)
    ccall((:Z3_mk_fixedpoint, libz3), Z3_fixedpoint, (Z3_context,), c)
end

function Z3_fixedpoint_inc_ref(c, d)
    ccall((:Z3_fixedpoint_inc_ref, libz3), Cvoid, (Z3_context, Z3_fixedpoint), c, d)
end

function Z3_fixedpoint_dec_ref(c, d)
    ccall((:Z3_fixedpoint_dec_ref, libz3), Cvoid, (Z3_context, Z3_fixedpoint), c, d)
end

function Z3_fixedpoint_add_rule(c, d, rule, name)
    ccall((:Z3_fixedpoint_add_rule, libz3), Cvoid, (Z3_context, Z3_fixedpoint, Z3_ast, Z3_symbol), c, d, rule, name)
end

function Z3_fixedpoint_add_fact(c, d, r, num_args, args)
    ccall((:Z3_fixedpoint_add_fact, libz3), Cvoid, (Z3_context, Z3_fixedpoint, Z3_func_decl, Cuint, Ptr{Cuint}), c, d, r, num_args, args)
end

function Z3_fixedpoint_assert(c, d, axiom)
    ccall((:Z3_fixedpoint_assert, libz3), Cvoid, (Z3_context, Z3_fixedpoint, Z3_ast), c, d, axiom)
end

function Z3_fixedpoint_query(c, d, query)
    ccall((:Z3_fixedpoint_query, libz3), Z3_lbool, (Z3_context, Z3_fixedpoint, Z3_ast), c, d, query)
end

function Z3_fixedpoint_query_relations(c, d, num_relations, relations)
    ccall((:Z3_fixedpoint_query_relations, libz3), Z3_lbool, (Z3_context, Z3_fixedpoint, Cuint, Ptr{Z3_func_decl}), c, d, num_relations, relations)
end

function Z3_fixedpoint_get_answer(c, d)
    ccall((:Z3_fixedpoint_get_answer, libz3), Z3_ast, (Z3_context, Z3_fixedpoint), c, d)
end

function Z3_fixedpoint_get_reason_unknown(c, d)
    ccall((:Z3_fixedpoint_get_reason_unknown, libz3), Z3_string, (Z3_context, Z3_fixedpoint), c, d)
end

function Z3_fixedpoint_update_rule(c, d, a, name)
    ccall((:Z3_fixedpoint_update_rule, libz3), Cvoid, (Z3_context, Z3_fixedpoint, Z3_ast, Z3_symbol), c, d, a, name)
end

function Z3_fixedpoint_get_num_levels(c, d, pred)
    ccall((:Z3_fixedpoint_get_num_levels, libz3), Cuint, (Z3_context, Z3_fixedpoint, Z3_func_decl), c, d, pred)
end

function Z3_fixedpoint_get_cover_delta(c, d, level, pred)
    ccall((:Z3_fixedpoint_get_cover_delta, libz3), Z3_ast, (Z3_context, Z3_fixedpoint, Cint, Z3_func_decl), c, d, level, pred)
end

function Z3_fixedpoint_add_cover(c, d, level, pred, property)
    ccall((:Z3_fixedpoint_add_cover, libz3), Cvoid, (Z3_context, Z3_fixedpoint, Cint, Z3_func_decl, Z3_ast), c, d, level, pred, property)
end

function Z3_fixedpoint_get_statistics(c, d)
    ccall((:Z3_fixedpoint_get_statistics, libz3), Z3_stats, (Z3_context, Z3_fixedpoint), c, d)
end

function Z3_fixedpoint_register_relation(c, d, f)
    ccall((:Z3_fixedpoint_register_relation, libz3), Cvoid, (Z3_context, Z3_fixedpoint, Z3_func_decl), c, d, f)
end

function Z3_fixedpoint_set_predicate_representation(c, d, f, num_relations, relation_kinds)
    ccall((:Z3_fixedpoint_set_predicate_representation, libz3), Cvoid, (Z3_context, Z3_fixedpoint, Z3_func_decl, Cuint, Ptr{Z3_symbol}), c, d, f, num_relations, relation_kinds)
end

function Z3_fixedpoint_get_rules(c, f)
    ccall((:Z3_fixedpoint_get_rules, libz3), Z3_ast_vector, (Z3_context, Z3_fixedpoint), c, f)
end

function Z3_fixedpoint_get_assertions(c, f)
    ccall((:Z3_fixedpoint_get_assertions, libz3), Z3_ast_vector, (Z3_context, Z3_fixedpoint), c, f)
end

function Z3_fixedpoint_set_params(c, f, p)
    ccall((:Z3_fixedpoint_set_params, libz3), Cvoid, (Z3_context, Z3_fixedpoint, Z3_params), c, f, p)
end

function Z3_fixedpoint_get_help(c, f)
    ccall((:Z3_fixedpoint_get_help, libz3), Z3_string, (Z3_context, Z3_fixedpoint), c, f)
end

function Z3_fixedpoint_get_param_descrs(c, f)
    ccall((:Z3_fixedpoint_get_param_descrs, libz3), Z3_param_descrs, (Z3_context, Z3_fixedpoint), c, f)
end

function Z3_fixedpoint_to_string(c, f, num_queries, queries)
    ccall((:Z3_fixedpoint_to_string, libz3), Z3_string, (Z3_context, Z3_fixedpoint, Cuint, Ptr{Z3_ast}), c, f, num_queries, queries)
end

function Z3_fixedpoint_from_string(c, f, s)
    ccall((:Z3_fixedpoint_from_string, libz3), Z3_ast_vector, (Z3_context, Z3_fixedpoint, Z3_string), c, f, s)
end

function Z3_fixedpoint_from_file(c, f, s)
    ccall((:Z3_fixedpoint_from_file, libz3), Z3_ast_vector, (Z3_context, Z3_fixedpoint, Z3_string), c, f, s)
end

# typedef void Z3_fixedpoint_reduce_assign_callback_fptr ( void * , Z3_func_decl , unsigned , Z3_ast const [ ] , unsigned , Z3_ast const [ ] )
const Z3_fixedpoint_reduce_assign_callback_fptr = Cvoid

# typedef void Z3_fixedpoint_reduce_app_callback_fptr ( void * , Z3_func_decl , unsigned , Z3_ast const [ ] , Z3_ast * )
const Z3_fixedpoint_reduce_app_callback_fptr = Cvoid

function Z3_fixedpoint_init(c, d, state)
    ccall((:Z3_fixedpoint_init, libz3), Cvoid, (Z3_context, Z3_fixedpoint, Ptr{Cvoid}), c, d, state)
end

function Z3_fixedpoint_set_reduce_assign_callback(c, d, cb)
    ccall((:Z3_fixedpoint_set_reduce_assign_callback, libz3), Cvoid, (Z3_context, Z3_fixedpoint, Z3_fixedpoint_reduce_assign_callback_fptr), c, d, cb)
end

function Z3_fixedpoint_set_reduce_app_callback(c, d, cb)
    ccall((:Z3_fixedpoint_set_reduce_app_callback, libz3), Cvoid, (Z3_context, Z3_fixedpoint, Z3_fixedpoint_reduce_app_callback_fptr), c, d, cb)
end

# typedef void ( * Z3_fixedpoint_new_lemma_eh ) ( void * state , Z3_ast lemma , unsigned level )
const Z3_fixedpoint_new_lemma_eh = Ptr{Cvoid}

# typedef void ( * Z3_fixedpoint_predecessor_eh ) ( void * state )
const Z3_fixedpoint_predecessor_eh = Ptr{Cvoid}

# typedef void ( * Z3_fixedpoint_unfold_eh ) ( void * state )
const Z3_fixedpoint_unfold_eh = Ptr{Cvoid}

function Z3_fixedpoint_add_callback(ctx, f, state, new_lemma_eh, predecessor_eh, unfold_eh)
    ccall((:Z3_fixedpoint_add_callback, libz3), Cvoid, (Z3_context, Z3_fixedpoint, Ptr{Cvoid}, Z3_fixedpoint_new_lemma_eh, Z3_fixedpoint_predecessor_eh, Z3_fixedpoint_unfold_eh), ctx, f, state, new_lemma_eh, predecessor_eh, unfold_eh)
end

function Z3_fixedpoint_add_constraint(c, d, e, lvl)
    ccall((:Z3_fixedpoint_add_constraint, libz3), Cvoid, (Z3_context, Z3_fixedpoint, Z3_ast, Cuint), c, d, e, lvl)
end

# typedef void Z3_model_eh ( void * ctx )
const Z3_model_eh = Cvoid

function Z3_mk_optimize(c)
    ccall((:Z3_mk_optimize, libz3), Z3_optimize, (Z3_context,), c)
end

function Z3_optimize_inc_ref(c, d)
    ccall((:Z3_optimize_inc_ref, libz3), Cvoid, (Z3_context, Z3_optimize), c, d)
end

function Z3_optimize_dec_ref(c, d)
    ccall((:Z3_optimize_dec_ref, libz3), Cvoid, (Z3_context, Z3_optimize), c, d)
end

function Z3_optimize_assert(c, o, a)
    ccall((:Z3_optimize_assert, libz3), Cvoid, (Z3_context, Z3_optimize, Z3_ast), c, o, a)
end

function Z3_optimize_assert_and_track(c, o, a, t)
    ccall((:Z3_optimize_assert_and_track, libz3), Cvoid, (Z3_context, Z3_optimize, Z3_ast, Z3_ast), c, o, a, t)
end

function Z3_optimize_assert_soft(c, o, a, weight, id)
    ccall((:Z3_optimize_assert_soft, libz3), Cuint, (Z3_context, Z3_optimize, Z3_ast, Z3_string, Z3_symbol), c, o, a, weight, id)
end

function Z3_optimize_maximize(c, o, t)
    ccall((:Z3_optimize_maximize, libz3), Cuint, (Z3_context, Z3_optimize, Z3_ast), c, o, t)
end

function Z3_optimize_minimize(c, o, t)
    ccall((:Z3_optimize_minimize, libz3), Cuint, (Z3_context, Z3_optimize, Z3_ast), c, o, t)
end

function Z3_optimize_push(c, d)
    ccall((:Z3_optimize_push, libz3), Cvoid, (Z3_context, Z3_optimize), c, d)
end

function Z3_optimize_pop(c, d)
    ccall((:Z3_optimize_pop, libz3), Cvoid, (Z3_context, Z3_optimize), c, d)
end

function Z3_optimize_check(c, o, num_assumptions, assumptions)
    ccall((:Z3_optimize_check, libz3), Z3_lbool, (Z3_context, Z3_optimize, Cuint, Ptr{Z3_ast}), c, o, num_assumptions, assumptions)
end

function Z3_optimize_get_reason_unknown(c, d)
    ccall((:Z3_optimize_get_reason_unknown, libz3), Z3_string, (Z3_context, Z3_optimize), c, d)
end

function Z3_optimize_get_model(c, o)
    ccall((:Z3_optimize_get_model, libz3), Z3_model, (Z3_context, Z3_optimize), c, o)
end

function Z3_optimize_get_unsat_core(c, o)
    ccall((:Z3_optimize_get_unsat_core, libz3), Z3_ast_vector, (Z3_context, Z3_optimize), c, o)
end

function Z3_optimize_set_params(c, o, p)
    ccall((:Z3_optimize_set_params, libz3), Cvoid, (Z3_context, Z3_optimize, Z3_params), c, o, p)
end

function Z3_optimize_get_param_descrs(c, o)
    ccall((:Z3_optimize_get_param_descrs, libz3), Z3_param_descrs, (Z3_context, Z3_optimize), c, o)
end

function Z3_optimize_get_lower(c, o, idx)
    ccall((:Z3_optimize_get_lower, libz3), Z3_ast, (Z3_context, Z3_optimize, Cuint), c, o, idx)
end

function Z3_optimize_get_upper(c, o, idx)
    ccall((:Z3_optimize_get_upper, libz3), Z3_ast, (Z3_context, Z3_optimize, Cuint), c, o, idx)
end

function Z3_optimize_get_lower_as_vector(c, o, idx)
    ccall((:Z3_optimize_get_lower_as_vector, libz3), Z3_ast_vector, (Z3_context, Z3_optimize, Cuint), c, o, idx)
end

function Z3_optimize_get_upper_as_vector(c, o, idx)
    ccall((:Z3_optimize_get_upper_as_vector, libz3), Z3_ast_vector, (Z3_context, Z3_optimize, Cuint), c, o, idx)
end

function Z3_optimize_to_string(c, o)
    ccall((:Z3_optimize_to_string, libz3), Z3_string, (Z3_context, Z3_optimize), c, o)
end

function Z3_optimize_from_string(c, o, s)
    ccall((:Z3_optimize_from_string, libz3), Cvoid, (Z3_context, Z3_optimize, Z3_string), c, o, s)
end

function Z3_optimize_from_file(c, o, s)
    ccall((:Z3_optimize_from_file, libz3), Cvoid, (Z3_context, Z3_optimize, Z3_string), c, o, s)
end

function Z3_optimize_get_help(c, t)
    ccall((:Z3_optimize_get_help, libz3), Z3_string, (Z3_context, Z3_optimize), c, t)
end

function Z3_optimize_get_statistics(c, d)
    ccall((:Z3_optimize_get_statistics, libz3), Z3_stats, (Z3_context, Z3_optimize), c, d)
end

function Z3_optimize_get_assertions(c, o)
    ccall((:Z3_optimize_get_assertions, libz3), Z3_ast_vector, (Z3_context, Z3_optimize), c, o)
end

function Z3_optimize_get_objectives(c, o)
    ccall((:Z3_optimize_get_objectives, libz3), Z3_ast_vector, (Z3_context, Z3_optimize), c, o)
end

function Z3_optimize_register_model_eh(c, o, m, ctx, model_eh)
    ccall((:Z3_optimize_register_model_eh, libz3), Cvoid, (Z3_context, Z3_optimize, Z3_model, Ptr{Cvoid}, Z3_model_eh), c, o, m, ctx, model_eh)
end

function Z3_mk_fpa_rounding_mode_sort(c)
    ccall((:Z3_mk_fpa_rounding_mode_sort, libz3), Z3_sort, (Z3_context,), c)
end

function Z3_mk_fpa_round_nearest_ties_to_even(c)
    ccall((:Z3_mk_fpa_round_nearest_ties_to_even, libz3), Z3_ast, (Z3_context,), c)
end

function Z3_mk_fpa_rne(c)
    ccall((:Z3_mk_fpa_rne, libz3), Z3_ast, (Z3_context,), c)
end

function Z3_mk_fpa_round_nearest_ties_to_away(c)
    ccall((:Z3_mk_fpa_round_nearest_ties_to_away, libz3), Z3_ast, (Z3_context,), c)
end

function Z3_mk_fpa_rna(c)
    ccall((:Z3_mk_fpa_rna, libz3), Z3_ast, (Z3_context,), c)
end

function Z3_mk_fpa_round_toward_positive(c)
    ccall((:Z3_mk_fpa_round_toward_positive, libz3), Z3_ast, (Z3_context,), c)
end

function Z3_mk_fpa_rtp(c)
    ccall((:Z3_mk_fpa_rtp, libz3), Z3_ast, (Z3_context,), c)
end

function Z3_mk_fpa_round_toward_negative(c)
    ccall((:Z3_mk_fpa_round_toward_negative, libz3), Z3_ast, (Z3_context,), c)
end

function Z3_mk_fpa_rtn(c)
    ccall((:Z3_mk_fpa_rtn, libz3), Z3_ast, (Z3_context,), c)
end

function Z3_mk_fpa_round_toward_zero(c)
    ccall((:Z3_mk_fpa_round_toward_zero, libz3), Z3_ast, (Z3_context,), c)
end

function Z3_mk_fpa_rtz(c)
    ccall((:Z3_mk_fpa_rtz, libz3), Z3_ast, (Z3_context,), c)
end

function Z3_mk_fpa_sort(c, ebits, sbits)
    ccall((:Z3_mk_fpa_sort, libz3), Z3_sort, (Z3_context, Cuint, Cuint), c, ebits, sbits)
end

function Z3_mk_fpa_sort_half(c)
    ccall((:Z3_mk_fpa_sort_half, libz3), Z3_sort, (Z3_context,), c)
end

function Z3_mk_fpa_sort_16(c)
    ccall((:Z3_mk_fpa_sort_16, libz3), Z3_sort, (Z3_context,), c)
end

function Z3_mk_fpa_sort_single(c)
    ccall((:Z3_mk_fpa_sort_single, libz3), Z3_sort, (Z3_context,), c)
end

function Z3_mk_fpa_sort_32(c)
    ccall((:Z3_mk_fpa_sort_32, libz3), Z3_sort, (Z3_context,), c)
end

function Z3_mk_fpa_sort_double(c)
    ccall((:Z3_mk_fpa_sort_double, libz3), Z3_sort, (Z3_context,), c)
end

function Z3_mk_fpa_sort_64(c)
    ccall((:Z3_mk_fpa_sort_64, libz3), Z3_sort, (Z3_context,), c)
end

function Z3_mk_fpa_sort_quadruple(c)
    ccall((:Z3_mk_fpa_sort_quadruple, libz3), Z3_sort, (Z3_context,), c)
end

function Z3_mk_fpa_sort_128(c)
    ccall((:Z3_mk_fpa_sort_128, libz3), Z3_sort, (Z3_context,), c)
end

function Z3_mk_fpa_nan(c, s)
    ccall((:Z3_mk_fpa_nan, libz3), Z3_ast, (Z3_context, Z3_sort), c, s)
end

function Z3_mk_fpa_inf(c, s, negative)
    ccall((:Z3_mk_fpa_inf, libz3), Z3_ast, (Z3_context, Z3_sort, Bool), c, s, negative)
end

function Z3_mk_fpa_zero(c, s, negative)
    ccall((:Z3_mk_fpa_zero, libz3), Z3_ast, (Z3_context, Z3_sort, Bool), c, s, negative)
end

function Z3_mk_fpa_fp(c, sgn, exp, sig)
    ccall((:Z3_mk_fpa_fp, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_ast, Z3_ast), c, sgn, exp, sig)
end

function Z3_mk_fpa_numeral_float(c, v, ty)
    ccall((:Z3_mk_fpa_numeral_float, libz3), Z3_ast, (Z3_context, Cfloat, Z3_sort), c, v, ty)
end

function Z3_mk_fpa_numeral_double(c, v, ty)
    ccall((:Z3_mk_fpa_numeral_double, libz3), Z3_ast, (Z3_context, Cdouble, Z3_sort), c, v, ty)
end

function Z3_mk_fpa_numeral_int(c, v, ty)
    ccall((:Z3_mk_fpa_numeral_int, libz3), Z3_ast, (Z3_context, Cint, Z3_sort), c, v, ty)
end

function Z3_mk_fpa_numeral_int_uint(c, sgn, exp, sig, ty)
    ccall((:Z3_mk_fpa_numeral_int_uint, libz3), Z3_ast, (Z3_context, Bool, Cint, Cuint, Z3_sort), c, sgn, exp, sig, ty)
end

function Z3_mk_fpa_numeral_int64_uint64(c, sgn, exp, sig, ty)
    ccall((:Z3_mk_fpa_numeral_int64_uint64, libz3), Z3_ast, (Z3_context, Bool, Int64, UInt64, Z3_sort), c, sgn, exp, sig, ty)
end

function Z3_mk_fpa_abs(c, t)
    ccall((:Z3_mk_fpa_abs, libz3), Z3_ast, (Z3_context, Z3_ast), c, t)
end

function Z3_mk_fpa_neg(c, t)
    ccall((:Z3_mk_fpa_neg, libz3), Z3_ast, (Z3_context, Z3_ast), c, t)
end

function Z3_mk_fpa_add(c, rm, t1, t2)
    ccall((:Z3_mk_fpa_add, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_ast, Z3_ast), c, rm, t1, t2)
end

function Z3_mk_fpa_sub(c, rm, t1, t2)
    ccall((:Z3_mk_fpa_sub, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_ast, Z3_ast), c, rm, t1, t2)
end

function Z3_mk_fpa_mul(c, rm, t1, t2)
    ccall((:Z3_mk_fpa_mul, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_ast, Z3_ast), c, rm, t1, t2)
end

function Z3_mk_fpa_div(c, rm, t1, t2)
    ccall((:Z3_mk_fpa_div, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_ast, Z3_ast), c, rm, t1, t2)
end

function Z3_mk_fpa_fma(c, rm, t1, t2, t3)
    ccall((:Z3_mk_fpa_fma, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_ast, Z3_ast, Z3_ast), c, rm, t1, t2, t3)
end

function Z3_mk_fpa_sqrt(c, rm, t)
    ccall((:Z3_mk_fpa_sqrt, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_ast), c, rm, t)
end

function Z3_mk_fpa_rem(c, t1, t2)
    ccall((:Z3_mk_fpa_rem, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_ast), c, t1, t2)
end

function Z3_mk_fpa_round_to_integral(c, rm, t)
    ccall((:Z3_mk_fpa_round_to_integral, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_ast), c, rm, t)
end

function Z3_mk_fpa_min(c, t1, t2)
    ccall((:Z3_mk_fpa_min, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_ast), c, t1, t2)
end

function Z3_mk_fpa_max(c, t1, t2)
    ccall((:Z3_mk_fpa_max, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_ast), c, t1, t2)
end

function Z3_mk_fpa_leq(c, t1, t2)
    ccall((:Z3_mk_fpa_leq, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_ast), c, t1, t2)
end

function Z3_mk_fpa_lt(c, t1, t2)
    ccall((:Z3_mk_fpa_lt, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_ast), c, t1, t2)
end

function Z3_mk_fpa_geq(c, t1, t2)
    ccall((:Z3_mk_fpa_geq, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_ast), c, t1, t2)
end

function Z3_mk_fpa_gt(c, t1, t2)
    ccall((:Z3_mk_fpa_gt, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_ast), c, t1, t2)
end

function Z3_mk_fpa_eq(c, t1, t2)
    ccall((:Z3_mk_fpa_eq, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_ast), c, t1, t2)
end

function Z3_mk_fpa_is_normal(c, t)
    ccall((:Z3_mk_fpa_is_normal, libz3), Z3_ast, (Z3_context, Z3_ast), c, t)
end

function Z3_mk_fpa_is_subnormal(c, t)
    ccall((:Z3_mk_fpa_is_subnormal, libz3), Z3_ast, (Z3_context, Z3_ast), c, t)
end

function Z3_mk_fpa_is_zero(c, t)
    ccall((:Z3_mk_fpa_is_zero, libz3), Z3_ast, (Z3_context, Z3_ast), c, t)
end

function Z3_mk_fpa_is_infinite(c, t)
    ccall((:Z3_mk_fpa_is_infinite, libz3), Z3_ast, (Z3_context, Z3_ast), c, t)
end

function Z3_mk_fpa_is_nan(c, t)
    ccall((:Z3_mk_fpa_is_nan, libz3), Z3_ast, (Z3_context, Z3_ast), c, t)
end

function Z3_mk_fpa_is_negative(c, t)
    ccall((:Z3_mk_fpa_is_negative, libz3), Z3_ast, (Z3_context, Z3_ast), c, t)
end

function Z3_mk_fpa_is_positive(c, t)
    ccall((:Z3_mk_fpa_is_positive, libz3), Z3_ast, (Z3_context, Z3_ast), c, t)
end

function Z3_mk_fpa_to_fp_bv(c, bv, s)
    ccall((:Z3_mk_fpa_to_fp_bv, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_sort), c, bv, s)
end

function Z3_mk_fpa_to_fp_float(c, rm, t, s)
    ccall((:Z3_mk_fpa_to_fp_float, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_ast, Z3_sort), c, rm, t, s)
end

function Z3_mk_fpa_to_fp_real(c, rm, t, s)
    ccall((:Z3_mk_fpa_to_fp_real, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_ast, Z3_sort), c, rm, t, s)
end

function Z3_mk_fpa_to_fp_signed(c, rm, t, s)
    ccall((:Z3_mk_fpa_to_fp_signed, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_ast, Z3_sort), c, rm, t, s)
end

function Z3_mk_fpa_to_fp_unsigned(c, rm, t, s)
    ccall((:Z3_mk_fpa_to_fp_unsigned, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_ast, Z3_sort), c, rm, t, s)
end

function Z3_mk_fpa_to_ubv(c, rm, t, sz)
    ccall((:Z3_mk_fpa_to_ubv, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_ast, Cuint), c, rm, t, sz)
end

function Z3_mk_fpa_to_sbv(c, rm, t, sz)
    ccall((:Z3_mk_fpa_to_sbv, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_ast, Cuint), c, rm, t, sz)
end

function Z3_mk_fpa_to_real(c, t)
    ccall((:Z3_mk_fpa_to_real, libz3), Z3_ast, (Z3_context, Z3_ast), c, t)
end

function Z3_fpa_get_ebits(c, s)
    ccall((:Z3_fpa_get_ebits, libz3), Cuint, (Z3_context, Z3_sort), c, s)
end

function Z3_fpa_get_sbits(c, s)
    ccall((:Z3_fpa_get_sbits, libz3), Cuint, (Z3_context, Z3_sort), c, s)
end

function Z3_fpa_is_numeral_nan(c, t)
    ccall((:Z3_fpa_is_numeral_nan, libz3), Bool, (Z3_context, Z3_ast), c, t)
end

function Z3_fpa_is_numeral_inf(c, t)
    ccall((:Z3_fpa_is_numeral_inf, libz3), Bool, (Z3_context, Z3_ast), c, t)
end

function Z3_fpa_is_numeral_zero(c, t)
    ccall((:Z3_fpa_is_numeral_zero, libz3), Bool, (Z3_context, Z3_ast), c, t)
end

function Z3_fpa_is_numeral_normal(c, t)
    ccall((:Z3_fpa_is_numeral_normal, libz3), Bool, (Z3_context, Z3_ast), c, t)
end

function Z3_fpa_is_numeral_subnormal(c, t)
    ccall((:Z3_fpa_is_numeral_subnormal, libz3), Bool, (Z3_context, Z3_ast), c, t)
end

function Z3_fpa_is_numeral_positive(c, t)
    ccall((:Z3_fpa_is_numeral_positive, libz3), Bool, (Z3_context, Z3_ast), c, t)
end

function Z3_fpa_is_numeral_negative(c, t)
    ccall((:Z3_fpa_is_numeral_negative, libz3), Bool, (Z3_context, Z3_ast), c, t)
end

function Z3_fpa_get_numeral_sign_bv(c, t)
    ccall((:Z3_fpa_get_numeral_sign_bv, libz3), Z3_ast, (Z3_context, Z3_ast), c, t)
end

function Z3_fpa_get_numeral_significand_bv(c, t)
    ccall((:Z3_fpa_get_numeral_significand_bv, libz3), Z3_ast, (Z3_context, Z3_ast), c, t)
end

function Z3_fpa_get_numeral_sign(c, t, sgn)
    ccall((:Z3_fpa_get_numeral_sign, libz3), Bool, (Z3_context, Z3_ast, Ptr{Cint}), c, t, sgn)
end

function Z3_fpa_get_numeral_significand_string(c, t)
    ccall((:Z3_fpa_get_numeral_significand_string, libz3), Z3_string, (Z3_context, Z3_ast), c, t)
end

function Z3_fpa_get_numeral_significand_uint64(c, t, n)
    ccall((:Z3_fpa_get_numeral_significand_uint64, libz3), Bool, (Z3_context, Z3_ast, Ptr{UInt64}), c, t, n)
end

function Z3_fpa_get_numeral_exponent_string(c, t, biased)
    ccall((:Z3_fpa_get_numeral_exponent_string, libz3), Z3_string, (Z3_context, Z3_ast, Bool), c, t, biased)
end

function Z3_fpa_get_numeral_exponent_int64(c, t, n, biased)
    ccall((:Z3_fpa_get_numeral_exponent_int64, libz3), Bool, (Z3_context, Z3_ast, Ptr{Int64}, Bool), c, t, n, biased)
end

function Z3_fpa_get_numeral_exponent_bv(c, t, biased)
    ccall((:Z3_fpa_get_numeral_exponent_bv, libz3), Z3_ast, (Z3_context, Z3_ast, Bool), c, t, biased)
end

function Z3_mk_fpa_to_ieee_bv(c, t)
    ccall((:Z3_mk_fpa_to_ieee_bv, libz3), Z3_ast, (Z3_context, Z3_ast), c, t)
end

function Z3_mk_fpa_to_fp_int_real(c, rm, exp, sig, s)
    ccall((:Z3_mk_fpa_to_fp_int_real, libz3), Z3_ast, (Z3_context, Z3_ast, Z3_ast, Z3_ast, Z3_sort), c, rm, exp, sig, s)
end

function Z3_fixedpoint_query_from_lvl(c, d, query, lvl)
    ccall((:Z3_fixedpoint_query_from_lvl, libz3), Z3_lbool, (Z3_context, Z3_fixedpoint, Z3_ast, Cuint), c, d, query, lvl)
end

function Z3_fixedpoint_get_ground_sat_answer(c, d)
    ccall((:Z3_fixedpoint_get_ground_sat_answer, libz3), Z3_ast, (Z3_context, Z3_fixedpoint), c, d)
end

function Z3_fixedpoint_get_rules_along_trace(c, d)
    ccall((:Z3_fixedpoint_get_rules_along_trace, libz3), Z3_ast_vector, (Z3_context, Z3_fixedpoint), c, d)
end

function Z3_fixedpoint_get_rule_names_along_trace(c, d)
    ccall((:Z3_fixedpoint_get_rule_names_along_trace, libz3), Z3_symbol, (Z3_context, Z3_fixedpoint), c, d)
end

function Z3_fixedpoint_add_invariant(c, d, pred, property)
    ccall((:Z3_fixedpoint_add_invariant, libz3), Cvoid, (Z3_context, Z3_fixedpoint, Z3_func_decl, Z3_ast), c, d, pred, property)
end

function Z3_fixedpoint_get_reachable(c, d, pred)
    ccall((:Z3_fixedpoint_get_reachable, libz3), Z3_ast, (Z3_context, Z3_fixedpoint, Z3_func_decl), c, d, pred)
end

function Z3_qe_model_project(c, m, num_bounds, bound, body)
    ccall((:Z3_qe_model_project, libz3), Z3_ast, (Z3_context, Z3_model, Cuint, Ptr{Z3_app}, Z3_ast), c, m, num_bounds, bound, body)
end

function Z3_qe_model_project_skolem(c, m, num_bounds, bound, body, map)
    ccall((:Z3_qe_model_project_skolem, libz3), Z3_ast, (Z3_context, Z3_model, Cuint, Ptr{Z3_app}, Z3_ast, Z3_ast_map), c, m, num_bounds, bound, body, map)
end

function Z3_model_extrapolate(c, m, fml)
    ccall((:Z3_model_extrapolate, libz3), Z3_ast, (Z3_context, Z3_model, Z3_ast), c, m, fml)
end

function Z3_qe_lite(c, vars, body)
    ccall((:Z3_qe_lite, libz3), Z3_ast, (Z3_context, Z3_ast_vector, Z3_ast), c, vars, body)
end

# Skipping MacroDefinition: Z3_API __attribute__ ( ( visibility ( "default" ) ) )

const Z3_sort_opt = Z3_sort

const Z3_ast_opt = Z3_ast

const Z3_func_interp_opt = Z3_func_interp

# exports
const PREFIXES = ["Z3_"]
for name in names(@__MODULE__; all=true), prefix in PREFIXES
    if startswith(string(name), prefix)
        @eval export $name
    end
end

end # module
