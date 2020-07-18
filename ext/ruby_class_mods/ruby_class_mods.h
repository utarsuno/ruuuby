// encoding: UTF-8

#ifndef CRUUUBY_H8_GRAPHS
#include "c8_graphs.h"
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

/*____________________________________________________________________________________________________________________________________________________________________
            __   __   __   __       __   __   ___     __   __   __   __   ___  __   __          __
 |\/|  /\  /  ` |__) /  \ /__` .   |__) |__) |__  __ |__) |__) /  \ /  ` |__  /__` /__` | |\ | / _`
 |  | /~~\ \__, |  \ \__/ .__/ .   |    |  \ |___    |    |  \ \__/ \__, |___ .__/ .__/ | | \| \__>
____________________________________________________________________________________________________________________________________________________________________ */

#define ensure_loaded_ruuuby(path) ensure_file_loaded("ruuuby/" #path)

#define 💎add_private_func_0args_to(kclass, func_name, the_func) rb_define_private_method(kclass, func_name, RUBY_METHOD_FUNC(the_func), 0);
#define 💎add_private_func_1args_to(kclass, func_name, the_func) rb_define_private_method(kclass, func_name, RUBY_METHOD_FUNC(the_func), 1);
#define 💎add_public_func_kargs_to(kclass, func_name, the_func)  rb_define_method(kclass, func_name, RUBY_METHOD_FUNC(the_func), -1);
#define 💎add_public_func_0args_to(kclass, func_name, the_func)  rb_define_method(kclass, func_name, RUBY_METHOD_FUNC(the_func), 0);
#define 💎add_public_func_1args_to(kclass, func_name, the_func)  rb_define_method(kclass, func_name, RUBY_METHOD_FUNC(the_func), 1);
#define 💎add_public_func_2args_to(kclass, func_name, the_func)  rb_define_method(kclass, func_name, RUBY_METHOD_FUNC(the_func), 2);
#define 💎add_public_func_3args_to(kclass, func_name, the_func)  rb_define_method(kclass, func_name, RUBY_METHOD_FUNC(the_func), 3);

#define 💎add_public_func_0args_by_id(kclass, func_id, the_func) rb_define_method_id(kclass, func_id, RUBY_METHOD_FUNC(the_func), 0);
#define 💎add_public_func_1args_by_id(kclass, func_id, the_func) rb_define_method_id(kclass, func_id, RUBY_METHOD_FUNC(the_func), 1);

#define 💎add_singleton_func_0args_to(kclass, func_name, the_func) rb_define_singleton_method(kclass, func_name, RUBY_METHOD_FUNC(the_func), 0);
#define 💎add_singleton_func_1args_to(kclass, func_name, the_func) rb_define_singleton_method(kclass, func_name, RUBY_METHOD_FUNC(the_func), 1);
#define 💎add_singleton_func_2args_to(kclass, func_name, the_func) rb_define_singleton_method(kclass, func_name, RUBY_METHOD_FUNC(the_func), 2);
#define 💎add_singleton_func_kargs_to(kclass, func_name, the_func) rb_define_singleton_method(kclass, func_name, RUBY_METHOD_FUNC(the_func), -1);

#define declare_func(func_name, expr, return_type, single_param) return_type func_name(single_param);return_type func_name(single_param){expr}
#define declare_static_func(func_name, expr, return_type, single_param) static return_type func_name(single_param);static return_type func_name(single_param){expr}

//#define r_func_pure(func_name, expr)              PUREFUNC(static VALUE func_name(const VALUE self) {expr})
#define ⓡ𝑓(func_name, expr)                                 PUREFUNC(static VALUE func_name(const VALUE self) {expr});
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
#define 💎add_const_theta_angle(const_name, dbl_angle, mode_angle, ref, initial_flags) {\
    ref = θ_new_constant(dbl_angle, mode_angle, initial_flags);\
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

#define 💎PROCEDURE_01(the_var, ary_of_code_points) ID the_var = rb_sym2id(rb_to_symbol(rb_funcall(ary_of_code_points, rb_intern_pack, 1, pack_as_utf8)));

#define 💎PROCEDURE_02(el_index, the_var, val_to_set) {\
    el_index = bsearch_power(the_var);\
    exponential_indexes[bsearch_power_position(el_index)] = val_to_set;\
}

static VALUE is_finite_num(const VALUE arg);
static VALUE has_smell_of_int(const VALUE arg);

static VALUE is_finite_num(const VALUE arg) {return rb_funcall(arg, cached_rb_intern_is_finite, 0);}
static VALUE has_smell_of_int(const VALUE arg){return rb_funcall(arg, cached_rb_intern_smells_like_int, 0);}

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
    if (sym == 🅽_universal) {
        return NORM_UNIVERSAL;
    } else if (sym == 🅽_universal_w_str_allowed) {
        return NORM_UNIVERSAL_W_STR;
    } else if (sym == 🅽_natural) {
        return NORM_NATURAL;
    } else if (sym == 🅽_natural_w_str_allowed) {
        return NORM_NATURAL_W_STR;
    } else if (sym == 🅽_whole) {
        return NORM_WHOLE;
    } else if (sym == 🅽_whole_w_str_allowed) {
        return NORM_WHOLE_W_STR;
    } else if (sym == 🅽_integer) {
        return NORM_INTEGER;
    } else if (sym == 🅽_integer_w_str_allowed) {
        return NORM_INTEGER_W_STR;
    } else {
        return NORM_ERROR;
    }
}*/

// ---------------

#endif
