// encoding: UTF-8

#ifndef CRUUUBY_H6_FEATURE_MACROS
#include "c6_feature_macros.h"
#endif

#ifndef CRUUUBY_H
#define CRUUUBY_H "defined(CRUUUBY_H)"

/*____________________________________________________________________________________________________________________
  ___            __   __       __   ___  __             __       ___    __        __
 |__  |  | |\ | /  ` /__` .   |  \ |__  /  ` |     /\  |__)  /\   |  | /  \ |\ | /__`
 |    \__/ | \| \__, .__/ .   |__/ |___ \__, |___ /~~\ |  \ /~~\  |  | \__/ | \| .__/
_____________________________________________________________________________________________________________________ */

static inline void startup_step1_before_loading_extension(void);
static void startup_step2_add_ruuuby_c_extensions(void);
static inline void startup_step4_load_needed_ruuuby_files(void);
static inline void startup_step5_protect_against_gc(void);
static void internal_only_prepare_f16(void);

static int internal_only_compare_func_4_object_id(const void * l , const void * r);

/*____________________________________________________________________________________________________________________________________________________________________
            __   __   __   __       __   __   ___     __   __   __   __   ___  __   __          __
 |\/|  /\  /  ` |__) /  \ /__` .   |__) |__) |__  __ |__) |__) /  \ /  ` |__  /__` /__` | |\ | / _`
 |  | /~~\ \__, |  \ \__/ .__/ .   |    |  \ |___    |    |  \ \__/ \__, |___ .__/ .__/ | | \| \__>
____________________________________________________________________________________________________________________________________________________________________ */

// str is of type [char *], for VALUE use func{ruby_set_script_name}
//
// @return [void]
#define 💎set_program_name(str) ruby_script(str)

#define 💎set_field(var_name, var_var) rb_iv_set(self, var_name, var_var);
#define 💎get_field(var_name)          rb_iv_get(self, var_name);

#define 💎add_private_func_0args_to(kclass, func_name, the_func) rb_define_private_method(kclass, func_name, RUBY_METHOD_FUNC(the_func), 0);
#define 💎add_private_func_1args_to(kclass, func_name, the_func) rb_define_private_method(kclass, func_name, RUBY_METHOD_FUNC(the_func), 1);
#define 💎add_public_func_kargs_to(kclass, func_name, the_func)  rb_define_method(kclass, func_name, RUBY_METHOD_FUNC(the_func), -1);
#define 💎add_public_func_0args_to(kclass, func_name, the_func)  rb_define_method(kclass, func_name, RUBY_METHOD_FUNC(the_func), 0);
#define 💎add_public_func_1args_to(kclass, func_name, the_func)  rb_define_method(kclass, func_name, RUBY_METHOD_FUNC(the_func), 1);
#define 💎add_public_func_2args_to(kclass, func_name, the_func)  rb_define_method(kclass, func_name, RUBY_METHOD_FUNC(the_func), 2);

#define 💎add_public_func_0args_by_id(kclass, func_id, the_func) rb_define_method_id(kclass, func_id, RUBY_METHOD_FUNC(the_func), 0);
#define 💎add_public_func_1args_by_id(kclass, func_id, the_func) rb_define_method_id(kclass, func_id, RUBY_METHOD_FUNC(the_func), 1);

#define 💎add_singleton_func_0args_to(kclass, func_name, the_func) rb_define_singleton_method(kclass, func_name, RUBY_METHOD_FUNC(the_func), 0);
#define 💎add_singleton_func_1args_to(kclass, func_name, the_func) rb_define_singleton_method(kclass, func_name, RUBY_METHOD_FUNC(the_func), 1);
#define 💎add_singleton_func_2args_to(kclass, func_name, the_func) rb_define_singleton_method(kclass, func_name, RUBY_METHOD_FUNC(the_func), 2);
#define 💎add_singleton_func_kargs_to(kclass, func_name, the_func) rb_define_singleton_method(kclass, func_name, RUBY_METHOD_FUNC(the_func), -1);

#define declare_func(func_name, expr, return_type, single_param) return_type func_name(single_param);return_type func_name(single_param){expr}
#define declare_static_func(func_name, expr, return_type, single_param) static return_type func_name(single_param);static return_type func_name(single_param){expr}

//#define r_func_pure(func_name, expr)              PUREFUNC(static VALUE func_name(const VALUE self) {expr})
#define ⓡ𝑓(func_name, expr)                 PUREFUNC(static VALUE func_name(const VALUE self) {expr})
#define ⓡ𝑓_def(func_name, expr)                             declare_static_func(func_name, expr, VALUE, VALUE self)
#define ⓡ𝑓_def2(func_name, param_0, param_1, expr)          VALUE func_name(const VALUE param_0, const VALUE param_1);VALUE func_name(const VALUE param_0, const VALUE param_1){expr}
#define ⓡ𝑓_def3(func_name, param_0, param_1, param_2, expr) VALUE func_name(VALUE param_0, VALUE param_1, VALUE param_2);VALUE func_name(VALUE param_0, VALUE param_1, VALUE param_2){expr}

#define ⓡ𝑓_kargs(func_name, expr)     static VALUE func_name(int argc, VALUE * argv, VALUE self);static VALUE func_name(int argc, VALUE * argv, VALUE self){expr}
#define ⓡ𝑓_self_them(func_name, expr) ⓡ𝑓_def2(func_name, self, them, expr)
#define ⓡ𝑓_self_a_b(func_name, expr)       ⓡ𝑓_def3(func_name, self, param_a, param_b, expr)

#define c_func(func_name, expr) declare_func(func_name, expr, void, void)

#define 💎add_global_module(str)                     rb_define_module(str);
#define 💎add_module_under(kclass, str)              rb_define_module_under(kclass, str);
#define 💎add_class_under(kclass, kclass_super, str) rb_define_class_under(kclass, str, kclass_super);

#define 💎add_func_alias(kclass, name_alias, name_original)  rb_define_alias(kclass, name_alias, name_original);
#define 💎add_const_under(kclass, const_name, const_value)   rb_define_const(kclass, const_name, const_value);
#define 💎add_const_flt(const_name, const_as_c_double)        💎add_const_under(R_FLT, const_name, DBL2NUM(const_as_c_double))
#define 💎add_const_theta_angle(const_name, dbl_angle, mode_angle, ref) {\
    ref = θ_new_constant(dbl_angle, mode_angle);\
    rb_define_const(R_MATH, const_name, ref);\
    rb_global_variable(& ref);\
}

#define 💎add_const_flt_wo_ref(const_name, dbl_val, ref) {\
    * ref = DBL2NUM(dbl_val);\
    RB_OBJ_FREEZE(* ref);\
    rb_define_const(R_FLT, const_name, * ref);\
}

#define 💎add_c_dbl_as_frozen_const_to(kclass, const_name, const_value, ref)

// -----------------------------

#define raise_err_arg(...)           rb_raise(R_ERR_ARG, __VA_ARGS__);
#define raise_err_runtime(...)       rb_raise(R_ERR_RUNTIME, __VA_ARGS__);
#define raise_err_zero_division(...) rb_raise(R_ERR_ZERO_DIVISION, __VA_ARGS__);

#define 🛑arg_nums rb_raise(E_ERR_ARG, __VA_ARGS__);
#define 🛑expected_kargs(the_func, num_args_expected) raise_err_arg("| self{%s}-> m{%s} w/ self{%"PRIsVALUE"} got{%d} args instead of the expected{%s} |", rb_obj_classname(self), the_func, self, argc, num_args_expected);
#define 🛑expected_sym(the_func, arg_name, the_arg)   raise_err_arg("| self{%s}-> m{%s} w/ self{%"PRIsVALUE"} got{%"PRIsVALUE"} w/ type{%s} instead of the expected type{Symbol} |", rb_obj_classname(self), the_func, self, the_arg, rb_obj_classname(the_arg));

#define ERR_param_type(nucleotide, kclass, the_func, arg_name, the_arg, required_type) raise_err_arg("| %s{%s}-> m{%s} got arg(%s) w/ type{%s}, required-type{%s} |", nucleotide, kclass, the_func, arg_name, rb_obj_classname(the_arg), required_type);
#define ERR_c_self_got_bad_param_type(the_func, the_arg, required_type)                raise_err_arg("| c{%s}-> m{%s} got arg w/ type{%s}, required-type{%s} |", rb_obj_classname(self), the_func, rb_obj_classname(the_arg), required_type);
#define ERR_c_self_got_non_ary_param(the_func, the_arg)                                raise_err_arg("| c{%s}-> m{%s} got arg w/ type{%s}, required-type{Array} |", rb_obj_classname(self), the_func, rb_obj_classname(the_arg));
#define ERR_c_self_got_non_str_param(the_func, the_arg)                                raise_err_arg("| c{%s}-> m{%s} got arg w/ type{%s}, required-type{String} |", rb_obj_classname(self), the_func, rb_obj_classname(the_arg));

#define ERR_c_self_arg_err__print_self_them(description) raise_err_arg(description, self, them);
#define ERR_c_self_err_runtime(...)                      raise_err_arg(description, self, them);

#define ERR_m_param_type(kclass, the_func, arg_name, the_arg, required_type) ERR_param_type("m", kclass, the_func, arg_name, the_arg, required_type)
#define ERR_c_param_type(kclass, the_func, arg_name, the_arg, required_type) ERR_param_type("c", kclass, the_func, arg_name, the_arg, required_type)

#define _internal_self_throw_arg_err_1opts(kclass, func_name, err_msg) raise_err_arg("| %s{%s}-> m{%s} %s |", kclass, rb_obj_classname(self), func_name, err_msg);
#define _internal_self_throw_arg_err_2opts(kclass, func_name, err_msg_start, opt_a_format, err_msg_end, opt_a) raise_err_arg("| %s{%s}-> m{%s} %s" #opt_a_format " %s |", kclass, rb_obj_classname(self), func_name, err_msg_start, opt_a, err_msg_end);

//#define _internal_self_throw_arg_err_1opts(kclass, func_name, err_msg)        rb_raise(R_ERR_ARG, "| %s{%s}-> m{%s} %s |", kclass, rb_obj_classname(self), func_name, err_msg);
//#define _internal_self_throw_arg_err_2opts(kclass, func_name, err_msg_start, opt_a_format, err_msg_end, opt_a) rb_raise(R_ERR_ARG, "| %s{%s}-> m{%s} %s" #opt_a_format " %s |", kclass, rb_obj_classname(self), func_name, err_msg_start, opt_a, err_msg_end);
//#define _internal_self_throw_arg_err_2opts_1int(kclass, func_name, err_msg_start, opt_a_format, err_msg_end, opt_a, the_int) rb_raise(R_ERR_ARG, "| %s{%s}-> m{%s} %s" #opt_a_format " %s |", kclass, rb_obj_classname(self), func_name, err_msg_start, opt_a, err_msg_end);

#define ERR_c_self_throw_arg_err_1opts(func_name, err_msg) _internal_self_throw_arg_err_1opts("c", func_name, err_msg)

#define ERR_is_num(kclass, the_func, arg_name, the_arg) if (!(is_num(the_arg))) {ERR_m_param_type(kclass, the_func, arg_name, the_arg, "Numeric")}
#define ERR_is_sym(kclass, the_func, arg_name, the_arg) if (!(is_sym(the_arg))) {ERR_m_param_type(kclass, the_func, arg_name, the_arg, "Symbol")}

#define ERR_normalizer_invalid_value(func_name, the_normalizer) raise_err_arg("| <%"PRIsVALUE">-> m{%s} does not support the received normalizer{%"PRIsVALUE"} |", self, func_name, them);
#define 🛑normalizer_value(func_name, the_normalizer) ERR_normalizer_invalid_value(func_name, the_normalizer)

#define _scan_args_1_optional_as_them_data(kclass, func_name) {\
    rb_scan_args(argc, argv, ARG_OPTS_ONE_OPTIONAL, & them);\
    if (NIL_P(them)) {\
        rb_raise(R_ERR_ARG, "| c{%s}-> m{%s} with self{%"PRIsVALUE"} got null for optional arg |", kclass, func_name, self);\
    }\
}

#define 💎scan_args_1_optional(func_name) VALUE them; _scan_args_1_optional_as_them_data(rb_obj_classname(self), func_name);

#define 💎EVAL_TO_VAR_OF_OBJ_ID(the_var, expr) {\
    the_var = rb_eval_string(expr);\
    rb_global_variable(& the_var);\
}

#define 💎PROCEDURE_00(the_var) {\
    the_var = rb_to_symbol(rb_funcall(code_points, rb_intern_pack, 1, pack_as_utf8));\
    rb_gc_register_mark_object(the_var);\
}

#define 💎PROCEDURE_01(the_var, ary_of_code_points) unsigned long the_var = NUM2ULONG(rb_obj_id(rb_to_symbol(rb_funcall(ary_of_code_points, rb_intern_pack, 1, pack_as_utf8))));

#define 💎PROCEDURE_02(el_index, the_var, val_to_set) {\
    el_index = bsearch_power(the_var);\
    exponential_indexes[bsearch_power_position(el_index)] = val_to_set;\
}

static inline __attribute__ ((__always_inline__)) VALUE is_finite_num(const VALUE arg);
static inline __attribute__ ((__always_inline__)) VALUE has_smell_of_int(const VALUE arg);

static inline VALUE is_finite_num(const VALUE arg) {return rb_funcall(arg, cached_rb_intern_is_finite, 0);}
static inline VALUE has_smell_of_int(const VALUE arg){return rb_funcall(arg, cached_rb_intern_smells_like_int, 0);}

static VALUE m_nil_empty(const VALUE self) __attribute__ ((const));
static VALUE m_int_is_finite(const VALUE self) __attribute__ ((const));
static VALUE m_int_is_not_finite(const VALUE self) __attribute__ ((const));

void Init_ruby_class_mods(void);

// --------------

static inline VALUE r_flt_has_decimals(const double flt){
    if (isfinite(flt)) {re_as_bool(flt != trunc(flt))} else {re_no}
}

static inline VALUE r_flt_smells_like_int(const double flt){
    if (isfinite(flt)) {re_as_bool(flt == trunc(flt))} else {re_no}
}

static inline VALUE r_flt_is_universal(const double flt){
    re_as_bool(isfinite(flt))
}

// --------------

#define 💎parse_optional_arg_as_them() VALUE them; rb_scan_args(argc, argv, ARG_OPTS_ONE_OPTIONAL, & them);
#define 💎parse_optional_arg_as_them_a_normalizer(func_name, expr) VALUE them; rb_scan_args(argc, argv, ARG_OPTS_ONE_OPTIONAL, & them); if (is_sym(them)) {expr} else {🛑expected_sym(func_name, "normalizer", them)}

#define 💎parse_kargs_with_normalizer(func_name, expr_0args, expr_1arg) if (argc == 0) {expr_0args} else if (argc == 1) {💎parse_optional_arg_as_them(); if (is_sym(them)) {expr_1arg} else {🛑expected_sym(func_name, "normalizer", them)}} else {🛑expected_kargs(func_name, "0 or 1")}

//🛑expected_sym(func_name, "did not support the received normalizer", sym)

/*static int SYM2NORM(const VALUE sym, const char * func_name) {
    if (sym == n_in_set_universal) {
        return NORM_UNIVERSAL;
    } else if (sym == n_in_set_universal_w_str_allowed) {
        return NORM_UNIVERSAL_W_STR;
    } else if (sym == n_in_set_natural) {
        return NORM_NATURAL;
    } else if (sym == n_in_set_natural_w_str_allowed) {
        return NORM_NATURAL_W_STR;
    } else if (sym == n_in_set_whole) {
        return NORM_WHOLE;
    } else if (sym == n_in_set_whole_w_str_allowed) {
        return NORM_WHOLE_W_STR;
    } else if (sym == n_in_set_integer) {
        return NORM_INTEGER;
    } else if (sym == n_in_set_integer_w_str_allowed) {
        return NORM_INTEGER_W_STR;
    } else {
        return NORM_ERROR;
    }
}*/

// ---------------

#endif
