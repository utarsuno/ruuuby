// encoding: UTF-8

#ifndef CRUUUBY_H4_THETA_ANGLE
#include "c4_theta_angle.h"
#endif

#ifndef CRUUUBY_H
#define CRUUUBY_H "defined(CRUUUBY_H)"

/*____________________________________________________________________________________________________________________
  ___            __   __       __   ___  __             __       ___    __        __
 |__  |  | |\ | /  ` /__` .   |  \ |__  /  ` |     /\  |__)  /\   |  | /  \ |\ | /__`
 |    \__/ | \| \__, .__/ .   |__/ |___ \__, |___ /~~\ |  \ /~~\  |  | \__/ | \| .__/
_____________________________________________________________________________________________________________________ */

static inline void internal_only_add_frozen_const_to(VALUE kclass, VALUE * internal_global, const char * const_name, VALUE val_to_freeze);
static inline ID health_check_for_existing_func_name(VALUE context_self, VALUE * func_name_as_str);
static inline VALUE new_ary(const long known_max_size);

static inline void startup_step0_load_needed_default_ruby_libs(void);
static inline void startup_step1_before_loading_extension(void);
static inline void startup_step2_add_ruuuby_c_extensions(void);
static inline void startup_step3_load_3rd_party_gems(void);
static inline void startup_step4_load_needed_ruuuby_files(void);
static inline void startup_step5_protect_against_gc(void);
static inline void internal_only_prepare_f16(void);

static int internal_only_compare_func_4_object_id(const void * l , const void * r);

/*____________________________________________________________________________________________________________________________________________________________________
            __   __   __   __       __   __   ___     __   __   __   __   ___  __   __          __
 |\/|  /\  /  ` |__) /  \ /__` .   |__) |__) |__  __ |__) |__) /  \ /  ` |__  /__` /__` | |\ | / _`
 |  | /~~\ \__, |  \ \__/ .__/ .   |    |  \ |___    |    |  \ \__/ \__, |___ .__/ .__/ | | \| \__>
____________________________________________________________________________________________________________________________________________________________________ */

#define 💎set_field(var_name, var_var) rb_iv_set(self, var_name, var_var);
#define 💎get_field(var_name)          rb_iv_get(self, var_name);

#define 💎add_private_func_0args_to_class(kclass, func_name, the_func) rb_define_private_method(kclass, func_name, RUBY_METHOD_FUNC(the_func), 0);
#define 💎add_private_func_1args_to_class(kclass, func_name, the_func) rb_define_private_method(kclass, func_name, RUBY_METHOD_FUNC(the_func), 1);
#define 💎add_public_func_kargs_to_class(kclass, func_name, the_func)  rb_define_method(kclass, func_name, RUBY_METHOD_FUNC(the_func), -1);
#define 💎add_public_func_0args_to_class(kclass, func_name, the_func)  rb_define_method(kclass, func_name, RUBY_METHOD_FUNC(the_func), 0);
#define 💎add_public_func_1args_to_class(kclass, func_name, the_func)  rb_define_method(kclass, func_name, RUBY_METHOD_FUNC(the_func), 1);
#define 💎add_public_func_2args_to_class(kclass, func_name, the_func)  rb_define_method(kclass, func_name, RUBY_METHOD_FUNC(the_func), 2);

#define 💎add_singleton_func_1args_to(kclass, func_name, the_func)  rb_define_singleton_method(kclass, func_name, RUBY_METHOD_FUNC(the_func), 1);

#define declare_func(func_name, expr, return_type, single_param) return_type func_name(single_param);return_type func_name(single_param){expr}
#define declare_static_func(func_name, expr, return_type, single_param) static return_type func_name(single_param);static return_type func_name(single_param){expr}
#define r_func_raw(func_name, expr) declare_static_func(func_name, expr, VALUE, VALUE self)
#define r_func_raw2(func_name, param_0, param_1, expr) VALUE func_name(VALUE param_0, VALUE param_1);VALUE func_name(VALUE param_0, VALUE param_1){expr}
#define r_func_raw3(func_name, param_0, param_1, param_2, expr) VALUE func_name(VALUE param_0, VALUE param_1, VALUE param_2);VALUE func_name(VALUE param_0, VALUE param_1, VALUE param_2){expr}
#define r_func_k_args(func_name, expr) static VALUE func_name(int argc, VALUE * argv, VALUE self);static VALUE func_name(int argc, VALUE * argv, VALUE self){expr}
#define r_func_self_them(func_name, expr) r_func_raw2(func_name, self, them, expr)
#define r_func_self_a_b(func_name, expr) r_func_raw3(func_name, self, param_a, param_b, expr)
#define c_func(func_name, expr) declare_func(func_name, expr, void, void)

#define ext_api_add_global_const_str(const_name, const_value)      rb_define_global_const(const_name, r_str_new_frozen_literal(const_value));
#define ext_api_add_global_module(str)                             rb_define_module(str);
#define ext_api_add_module_under(under_me, str)                    rb_define_module_under(under_me, str);
#define ext_api_add_new_sub_class_under(under_me, base_class, str) rb_define_class_under(under_me, str, base_class);

#define 💎add_func_alias(kclass, name_alias, name_original) rb_define_alias(kclass, name_alias, name_original);
#define 💎add_const_under(kclass, const_name, const_value)  rb_define_const(kclass, const_name, const_value);
#define 💎add_const_flt(const_name, const_as_c_double)       💎add_const_under(R_FLT, const_name, DBL2NUM(const_as_c_double))
//#define ext_api_add_frozen_const_under(kclass, const_name, const_value)

// -----------------------------

#define raise_err_arg(...)           rb_raise(R_ERR_ARG, __VA_ARGS__);
#define raise_err_runtime(...)       rb_raise(R_ERR_RUNTIME, __VA_ARGS__);
#define raise_err_zero_division(...) rb_raise(R_ERR_ZERO_DIVISION, __VA_ARGS__);

#define 🛑param_type(nucleotide, kclass, the_func, arg_name, the_arg, required_type) raise_err_arg("| %s{%s}-> m{%s} got arg(%s) w/ type{%s}, required-type{%s} |", nucleotide, kclass, the_func, arg_name, rb_obj_classname(the_arg), required_type);
#define 🛑c_self_got_bad_param_type(the_func, the_arg, required_type)                raise_err_arg("| c{%s}-> m{%s} got arg w/ type{%s}, required-type{%s} |", rb_obj_classname(self), the_func, rb_obj_classname(the_arg), required_type);
#define 🛑c_self_got_non_ary_param(the_func, the_arg)                                raise_err_arg("| c{%s}-> m{%s} got arg w/ type{%s}, required-type{Array} |", rb_obj_classname(self), the_func, rb_obj_classname(the_arg));
#define 🛑c_self_got_non_str_param(the_func, the_arg)                                raise_err_arg("| c{%s}-> m{%s} got arg w/ type{%s}, required-type{String} |", rb_obj_classname(self), the_func, rb_obj_classname(the_arg));

#define 🛑c_self_arg_err__print_self_them(description) raise_err_arg(description, self, them);
#define 🛑c_self_err_runtime(...)                      raise_err_arg(description, self, them);

#define 🛑m_param_type(kclass, the_func, arg_name, the_arg, required_type) 🛑param_type("m", kclass, the_func, arg_name, the_arg, required_type)
#define 🛑c_param_type(kclass, the_func, arg_name, the_arg, required_type) 🛑param_type("c", kclass, the_func, arg_name, the_arg, required_type)



#define _internal_self_throw_arg_err_1opts(kclass, func_name, err_msg) raise_err_arg("| %s{%s}-> m{%s} %s |", kclass, rb_obj_classname(self), func_name, err_msg);
#define _internal_self_throw_arg_err_2opts(kclass, func_name, err_msg_start, opt_a_format, err_msg_end, opt_a) raise_err_arg("| %s{%s}-> m{%s} %s" #opt_a_format " %s |", kclass, rb_obj_classname(self), func_name, err_msg_start, opt_a, err_msg_end);

//#define _internal_self_throw_arg_err_1opts(kclass, func_name, err_msg)        rb_raise(R_ERR_ARG, "| %s{%s}-> m{%s} %s |", kclass, rb_obj_classname(self), func_name, err_msg);
//#define _internal_self_throw_arg_err_2opts(kclass, func_name, err_msg_start, opt_a_format, err_msg_end, opt_a) rb_raise(R_ERR_ARG, "| %s{%s}-> m{%s} %s" #opt_a_format " %s |", kclass, rb_obj_classname(self), func_name, err_msg_start, opt_a, err_msg_end);
//#define _internal_self_throw_arg_err_2opts_1int(kclass, func_name, err_msg_start, opt_a_format, err_msg_end, opt_a, the_int) rb_raise(R_ERR_ARG, "| %s{%s}-> m{%s} %s" #opt_a_format " %s |", kclass, rb_obj_classname(self), func_name, err_msg_start, opt_a, err_msg_end);

#define 🛑c_self_throw_arg_err_1opts(func_name, err_msg) _internal_self_throw_arg_err_1opts("c", func_name, err_msg)

#define 🛑is_num(kclass, the_func, arg_name, the_arg) if (!(is_num(the_arg))) {🛑m_param_type(kclass, the_func, arg_name, the_arg, "Numeric")}
#define 🛑is_sym(kclass, the_func, arg_name, the_arg) if (!(is_sym(the_arg))) {🛑m_param_type(kclass, the_func, arg_name, the_arg, "Symbol")}

#define 🛑normalizer_invalid_value(func_name, the_normalizer) raise_err_arg("| <%"PRIsVALUE">-> m{%s} does not support the received normalizer{%"PRIsVALUE"} |", self, func_name, them);

#define _scan_args_1_optional_as_them_data(kclass, func_name) {\
    rb_scan_args(argc, argv, ARG_OPTS_ONE_OPTIONAL, & them);\
    if (NIL_P(them)) {\
        rb_raise(R_ERR_ARG, "| c{%s}-> m{%s} with self{%"PRIsVALUE"} got null for optional arg |", kclass, func_name, self);\
    }\
}

#define 💎scan_args_1_optional(func_name) VALUE them; _scan_args_1_optional_as_them_data(rb_obj_classname(self), func_name);

#define 💎EVAL_TO_OBJ_ID(the_expr) rb_obj_id(rb_eval_string(the_expr));

//#define 💎EVAL_TO_VAR_OF_OBJ_ID(the_var, expr) the_var = 💎EVAL_TO_OBJ_ID(expr); rb_global_variable(& the_var);
#define 💎EVAL_TO_VAR_OF_OBJ_ID(the_var, expr) {\
    the_var = rb_eval_string(expr);\
    rb_global_variable(& the_var);\
}

static inline VALUE is_finite_num(const VALUE arg) {return rb_funcall(arg, cached_rb_intern_is_finite, 0);}
static inline VALUE has_smell_of_int(const VALUE arg){return rb_funcall(arg, cached_rb_intern_smells_like_int, 0);}

#endif
