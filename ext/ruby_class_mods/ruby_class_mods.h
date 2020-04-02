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

#define ext_api_add_public_method_0args_to_class(r_class, func_name, the_func)  rb_define_method(r_class, func_name, RUBY_METHOD_FUNC(the_func), 0);
#define ext_api_add_public_method_1args_to_class(r_class, func_name, the_func)  rb_define_method(r_class, func_name, RUBY_METHOD_FUNC(the_func), 1);
#define ext_api_add_private_method_0args_to_class(r_class, func_name, the_func) rb_define_private_method(r_class, func_name, RUBY_METHOD_FUNC(the_func), 0);
#define ext_api_add_private_method_1args_to_class(r_class, func_name, the_func) rb_define_private_method(r_class, func_name, RUBY_METHOD_FUNC(the_func), 1);

#define ext_api_add_global_const_str(const_name, const_value)      rb_define_global_const(const_name, r_str_new_frozen_literal(const_value));
#define ext_api_add_global_module(str)                             rb_define_module(str);
#define ext_api_add_module_under(under_me, str)                    rb_define_module_under(under_me, str);
#define ext_api_add_new_sub_class_under(under_me, base_class, str) rb_define_class_under(under_me, str, base_class);

#define ext_api_add_func_alias(kclass, new_func_name, previous_func_name) rb_define_alias(kclass, new_func_name, previous_func_name);
#define ext_api_add_const_under(kclass, const_name, const_value)          rb_define_const(kclass, const_name, const_value);

#define macro_only_raise_err_bad_arg_type(err_msg, err_prm) rb_raise(R_ERR_ARG, err_msg, rb_obj_classname(err_prm));
#define ext_api_raise_err_array_arg_type(func_name, them)   macro_only_raise_err_bad_arg_type("| c{Array}-> m{" #func_name "} got arg(them) w/ type{%s}, required-type{Array} |", them)
#define ext_api_raise_err_string_arg_type(func_name, them)  macro_only_raise_err_bad_arg_type("| c{String}-> m{" #func_name "} got arg(them) w/ type{%s}, required-type{String} |", them)
#define ext_api_raise_err_int_bad_power                     rb_raise(R_ERR_RUNTIME,"| c{Integer}-> m{^} self(%"PRIsVALUE") unable to match exponential(%"PRIsVALUE") |", self, them);
#define ext_api_raise_err_flt_bad_power                      rb_raise(R_ERR_RUNTIME,"| c{Float}-> m{^} self(%"PRIsVALUE") unable to match exponential(%"PRIsVALUE") |", self, them);
#define ext_api_raise_err_rational_bad_power                rb_raise(R_ERR_RUNTIME,"| c{Rational}-> m{^} self(%"PRIsVALUE") unable to match exponential(%"PRIsVALUE") |", self, them);

#endif
