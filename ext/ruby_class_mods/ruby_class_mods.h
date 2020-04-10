// encoding: utf-8

#ifndef CRUUUBY_H3_MACRO_UTILITIES
#include "c3_macro_utilities.h"
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

static inline void internal_only_before_loading_extension(void);
static inline void internal_only_add_ruuuby_c_extensions(void);
static inline void internal_only_load_needed_ruuuby_files(void);
static inline void internal_only_protect_against_gc(void);
static inline void internal_only_prepare_f16(void);

static inline void assign_exponential_index_position(unsigned long object_id, const int represented_integer);
static int internal_only_compare_func_4_object_id(const void * l , const void * r);

/*
//unsigned long id_7 = NUM2ULONG(rb_obj_id(rb_const_get_at(rb_cNumeric, rb_intern("EXPONENTIAL_ID_7"))));

// static VALUE cached_module_virtual_types; // = ext_api_add_module_under(module_ruuuby, "VirtualTypes")
//static VALUE cached_class_wrong_param_type; // = ext_api_add_new_sub_class_under(cached_module_param_err, R_ERR_ARG, "WrongParamType")
*/


/*____________________________________________________________________________________________________________________________________________________________________
            __   __   __   __       __   __   ___     __   __   __   __   ___  __   __          __
 |\/|  /\  /  ` |__) /  \ /__` .   |__) |__) |__  __ |__) |__) /  \ /  ` |__  /__` /__` | |\ | / _`
 |  | /~~\ \__, |  \ \__/ .__/ .   |    |  \ |___    |    |  \ \__/ \__, |___ .__/ .__/ | | \| \__>
____________________________________________________________________________________________________________________________________________________________________ */

#define ext_api_add_public_method_kargs_to_class(r_class, func_name, the_func)  rb_define_method(r_class, func_name, RUBY_METHOD_FUNC(the_func), -1);
#define ext_api_add_public_method_0args_to_class(r_class, func_name, the_func)  rb_define_method(r_class, func_name, RUBY_METHOD_FUNC(the_func), 0);
#define ext_api_add_public_method_1args_to_class(r_class, func_name, the_func)  rb_define_method(r_class, func_name, RUBY_METHOD_FUNC(the_func), 1);
#define ext_api_add_public_method_2args_to_class(r_class, func_name, the_func)  rb_define_method(r_class, func_name, RUBY_METHOD_FUNC(the_func), 2);
#define ext_api_add_private_method_0args_to_class(r_class, func_name, the_func) rb_define_private_method(r_class, func_name, RUBY_METHOD_FUNC(the_func), 0);
#define ext_api_add_private_method_1args_to_class(r_class, func_name, the_func) rb_define_private_method(r_class, func_name, RUBY_METHOD_FUNC(the_func), 1);

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

#define ext_api_add_func_alias(kclass, new_func_name, previous_func_name) rb_define_alias(kclass, new_func_name, previous_func_name);
#define ext_api_add_const_under(kclass, const_name, const_value)          rb_define_const(kclass, const_name, const_value);
//#define ext_api_add_frozen_const_under(kclass, const_name, const_value)


#define macro_only_raise_err_bad_arg_type(err_msg, err_prm) rb_raise(R_ERR_ARG, err_msg, rb_obj_classname(err_prm));

//#define macro_only_raise_func_err_bad_arg_type(err_msg, err_prm) macro_only_raise_err_bad_arg_type("| c{" #the_class "}-> m{" #the_func "}")

#define ext_api_raise_err_array_arg_type(func_name, them)   macro_only_raise_err_bad_arg_type("| c{Array}-> m{" #func_name "} got arg(them) w/ type{%s}, required-type{Array} |", them)
//#define ext_api_raise_err_array_arg_type(func_name, them)   macro_only_raise_err_bad_arg_type("| c{Array}-> m{" #func_name "} got arg(them) w/ type{%s}, required-type{Array} |", them)

#define ext_api_raise_err_string_arg_type(func_name, them)  macro_only_raise_err_bad_arg_type("| c{String}-> m{" #func_name "} got arg(them) w/ type{%s}, required-type{String} |", them)

#define ext_api_raise_err_int_bad_power                     rb_raise(R_ERR_RUNTIME, "| c{Integer}-> m{^} self(%"PRIsVALUE") unable to match exponential(%"PRIsVALUE") |", self, them);
#define ext_api_raise_err_flt_bad_power                      rb_raise(R_ERR_RUNTIME, "| c{Float}-> m{^} self(%"PRIsVALUE") unable to match exponential(%"PRIsVALUE") |", self, them);
#define ext_api_raise_err_rational_bad_power                rb_raise(R_ERR_RUNTIME, "| c{Rational}-> m{^} self(%"PRIsVALUE") unable to match exponential(%"PRIsVALUE") |", self, them);

#define ext_api_raise_err_generic(the_class, the_func, the_arg, the_type, required_type) rb_raise(R_ERR_RUNTIME, "| c{" #the_class "}-> m{" #the_func "} got arg(" #the_arg ") w/ type{%s}, required-type{" #required_type "}")
#define ext_api_raise_err_module_f_add_aliases                  rb_raise(R_ERR_RUNTIME, "||")

//#define wrapped_err_msg(err_msg) ("| " err_msg " |")

#define ext_api_throw_err_bad_param_type(the_class, the_func, arg_name, the_arg, required_type) rb_raise(R_ERR_ARG, "| c{%s}-> m{%s} got arg(%s) w/ type{%s}, required-type{%s} |", the_class, the_func, arg_name, rb_obj_classname(the_arg), required_type);
#define ext_api_throw_ary_err_bad_param_type(the_func, arg_name, the_arg, required_type)        ext_api_throw_err_bad_param_type("Array", the_func, arg_name, the_arg, required_type)
#define 🛑ary_param_not_type_ary(name_func, name_arg, the_arg)                                  ext_api_throw_ary_err_bad_param_type(name_func, name_arg, the_arg, "Array")
#define 🛑flt_param_not_type_ary(name_func, name_arg, the_arg)                                   ext_api_throw_ary_err_bad_param_type(name_func, name_arg, the_arg, "Array")

#define 🛑self(the_err, the_class, the_func, the_message)  rb_raise(the_err, "| c{%s}-> m{%s} self{%"PRIsVALUE"} %s |", the_class, the_func, self, the_message)
#define 🛑flt_self(the_err, the_func, the_message) 🛑self(the_err, "Float", the_func, the_message)

#define 🛑runtime_flt_self(the_func, the_message) 🛑self(R_ERR_RUNTIME, "Float", the_func, the_message);
#define 🛑divide0_flt_self(the_func, the_message) 🛑self(R_ERR_ZERO_DIVISION, "Float", the_func, the_message);

#define 🛑param_type(nucleotide, the_class, the_func, arg_name, the_arg, required_type)            rb_raise(R_ERR_ARG, "| %s{%s}-> m{%s} got arg(%s) w/ type{%s}, required-type{%s} |", nucleotide, the_class, the_func, arg_name, rb_obj_classname(the_arg), required_type);
#define 🛑param_array_node_type(nucleotide, the_class, the_func, arg_name, the_arg, required_type) rb_raise(R_ERR_ARG, "| %s{%s}-> m{%s} got Array-arg(%s) w/ a node having type{%s}, required-type{%s} |", nucleotide, the_class, the_func, arg_name, rb_obj_classname(the_arg), required_type);
#define 🛑param_array_is_empty(nucleotide, the_class, the_func, arg_name)                          rb_raise(R_ERR_ARG, "| %s{%s}-> m{%s} got Array-arg(%s) w/o any elements |", nucleotide, the_class, the_func, arg_name);

#define 🛑m_param_array_is_empty(the_class, the_func, arg_name)                                    🛑param_array_is_empty("m", the_class, the_func, arg_name)
#define 🛑c_param_array_is_empty(the_class, the_func, arg_name)                                    🛑param_array_is_empty("c", the_class, the_func, arg_name)

#define 🛑m_param_type(the_class, the_func, arg_name, the_arg, required_type)                      🛑param_type("m", the_class, the_func, arg_name, the_arg, required_type)
#define 🛑c_param_type(the_class, the_func, arg_name, the_arg, required_type)                      🛑param_type("c", the_class, the_func, arg_name, the_arg, required_type)

#define 🛑m_param_array_node_type(the_class, the_func, arg_name, the_arg, required_type)           🛑param_array_node_type("m", the_class, the_func, arg_name, the_arg, required_type)
#define 🛑c_param_array_node_type(the_class, the_func, arg_name, the_arg, required_type)           🛑param_array_node_type("c", the_class, the_func, arg_name, the_arg, required_type)



#endif
