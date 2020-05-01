// encoding: UTF-8

#ifndef CRUUUBY_H3_MACRO_UTILITIES
#include "c3_macro_utilities.h"
#endif

#ifndef CRUUUBY_H
#define CRUUUBY_H "defined(CRUUUBY_H)"

// @see original bitwise structs from: https://www.chiefdelphi.com/t/extracting-individual-bits-in-c/48028/8

typedef union {
    struct {
        unsigned b0:1;
        unsigned b1:1;
        unsigned b2:1;
        unsigned b3:1;
        unsigned b4:1;
        unsigned b5:1;
        unsigned b6:1;
        unsigned b7:1;
    };
    unsigned char byte;
} byte;

typedef struct bits {
	unsigned char b0:1;
	unsigned char b1:1;
	unsigned char b2:1;
	unsigned char b3:1;
	unsigned char b4:1;
	unsigned char b5:1;
	unsigned char b6:1;
	unsigned char b7:1;
} BITS;

typedef union bit_char {
	unsigned char byte;
	BITS b;
} BIT_CHAR;

#define θFLAG_IS_ZERO 0
#define θFLAG_SIGN 1
#define θFLAG_IS_NORMAL 2
#define θFLAG_IS_CONSTANT 3
#define θFLAG_IS_COERCE 4
#define θFLAG_IS_CACHE_SYNCED 5

typedef struct ThetaAngles {
    double        angle_value;
    unsigned char angle_mode;
    BIT_CHAR      flags_meta_data;
} ThetaAngle;

typedef struct ThetaAngles * 👉θ;

static inline void 👉θ_flag_set_coerce(const 👉θ data);
static inline void 👉θ_flag_clr_coerce(const 👉θ data);
static inline int 👉θ_flag_is_coerce(const 👉θ data);

static inline void 👉θ_flag_set_constant(const 👉θ data);
static inline void 👉θ_flag_clr_constant(const 👉θ data);
static inline int 👉θ_flag_is_constant(const 👉θ data);

static inline void 👉θ_flag_set_cache_synced(const 👉θ data);
static inline void 👉θ_flag_clr_cache_synced(const 👉θ data);
static inline int 👉θ_flag_is_cache_synced(const 👉θ data);

static void θ_free(void * data);
static size_t θ_size(const void * data);
static VALUE θ_alloc(VALUE self);
static VALUE θ_m_initialize(VALUE self, VALUE angle, VALUE angle_mode);

PUREFUNC(static inline VALUE cθ_get_representation(const unsigned char angle_mode););
static unsigned char θSYM2MODE(const VALUE mode_as_sym);

PUREFUNC(static VALUE θ_m_get_real(const VALUE self));
PUREFUNC(static VALUE θ_m_get_repr(const VALUE self));
PUREFUNC(static VALUE θ_m_set_real(const VALUE self, const VALUE num));
PUREFUNC(static VALUE θ_get_as_radian(const VALUE self));
PUREFUNC(static VALUE θ_get_as_degree(const VALUE self));
PUREFUNC(static VALUE θ_get_as_gon(const VALUE self));
PUREFUNC(static VALUE θ_get_as_turn(const VALUE self));
PUREFUNC(static VALUE θ_get_is_radians(const VALUE self));
PUREFUNC(static VALUE θ_get_is_degrees(const VALUE self));
PUREFUNC(static VALUE θ_get_is_gons(const VALUE self));
PUREFUNC(static VALUE θ_get_is_turns(const VALUE self));

static VALUE θ_m_addition(const VALUE self, const VALUE value);
static VALUE θ_m_addition_eq(const VALUE self, const VALUE value);
static VALUE θ_m_subtraction(const VALUE self, const VALUE value);
static VALUE θ_m_subtraction_eq(const VALUE self, const VALUE value);
static VALUE θ_m_unary_subtraction(const VALUE self);
static VALUE θ_m_unary_addition(const VALUE self);
static VALUE θ_m_unary_complement(const VALUE self);
static VALUE θ_m_unary_not(const VALUE self);
static VALUE θ_m_multiplication(const VALUE self, const VALUE value);
static VALUE θ_m_multiplication_eq(const VALUE self, const VALUE value);
static VALUE θ_m_division(const VALUE self, const VALUE value);
static VALUE θ_m_division_eq(const VALUE self, const VALUE value);
static VALUE θ_m_comparable(const VALUE self, const VALUE them);
static VALUE θ_m_abs(const VALUE self);
static VALUE θ_m_abs_self(const VALUE self);

static VALUE θ_m_equals(const VALUE self, const VALUE them);
static VALUE θ_m_is_normal(const VALUE self);
static double θ_get_normalized_value(const double value, const unsigned char angle_mode);
static void 👉θ_normalize(👉θ data);
static VALUE θ_m_normalize_self(VALUE self);

static VALUE θ_new(const double angle, const VALUE sym_mode);
static VALUE θ_new_constant(const double angle, const VALUE sym_mode);

PUREFUNC(static VALUE θ_m_matches_vocab_term(VALUE self, VALUE angle_type));

//#define 💎get_θ_as_the_var_data(arg) 👉θ data; TypedData_Get_Struct(arg, ThetaAngle, & θ_type, data);
#define 💎self_to_👉θ_data 👉θ data; TypedData_Get_Struct(self, ThetaAngle, & θ_type, data);

static inline void θ_set_data(const 👉θ data, const VALUE mode, const VALUE angle);

static inline double θ_get_compatible_value_from_θ_with_mode(const unsigned char angle_mode, 👉θ them);
static inline double θ_get_compatible_value_from_θ(const 👉θ self, const 👉θ them);
static inline double θ_get_compatible_value_from_value(const 👉θ self, const VALUE value);

static inline void θ_addition_w_double(const 👉θ data, const double value);
static inline void θ_subtraction_w_double(const 👉θ data, const double value);
static inline void θ_multiplication_w_double(const 👉θ data, const double value);
static inline void θ_division_w_double(const 👉θ data, const double value);

static VALUE θ_m_bitwise_shift_right(int argc, VALUE * argv, VALUE self);
static VALUE θ_m_bitwise_shift_left(int argc, VALUE * argv, VALUE self);

static inline double 👉θ_get_const_unit(const 👉θ data);
static inline double 👉θ_get_const_quadrant(const 👉θ data);
static inline double 👉θ_get_const_straight(const 👉θ data);

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

#define 💎add_private_func_0args_to_class(kclass, func_name, the_func) rb_define_private_method(kclass, func_name, RUBY_METHOD_FUNC(the_func), 0);
#define 💎add_private_func_1args_to_class(kclass, func_name, the_func) rb_define_private_method(kclass, func_name, RUBY_METHOD_FUNC(the_func), 1);
#define 💎add_public_func_kargs_to_class(kclass, func_name, the_func)  rb_define_method(kclass, func_name, RUBY_METHOD_FUNC(the_func), -1);
#define 💎add_public_func_0args_to_class(kclass, func_name, the_func)  rb_define_method(kclass, func_name, RUBY_METHOD_FUNC(the_func), 0);
#define 💎add_public_func_1args_to_class(kclass, func_name, the_func)  rb_define_method(kclass, func_name, RUBY_METHOD_FUNC(the_func), 1);
#define 💎add_public_func_2args_to_class(kclass, func_name, the_func)  rb_define_method(kclass, func_name, RUBY_METHOD_FUNC(the_func), 2);

#define 💎add_singleton_func_1args_to(kclass, func_name, the_func)  rb_define_singleton_method(kclass, func_name, RUBY_METHOD_FUNC(the_func), 1);
//rb_define_singleton_method

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
//#define ext_api_add_frozen_const_under(kclass, const_name, const_value)

#define macro_only_raise_err_bad_arg_type(err_msg, err_prm) rb_raise(R_ERR_ARG, err_msg, rb_obj_classname(err_prm));

//#define macro_only_raise_func_err_bad_arg_type(err_msg, err_prm) macro_only_raise_err_bad_arg_type("| c{" #the_class "}-> m{" #the_func "}")

#define ext_api_raise_err_array_arg_type(func_name, them)   macro_only_raise_err_bad_arg_type("| c{Array}-> m{" #func_name "} got arg(them) w/ type{%s}, required-type{Array} |", them)
//#define ext_api_raise_err_array_arg_type(func_name, them)   macro_only_raise_err_bad_arg_type("| c{Array}-> m{" #func_name "} got arg(them) w/ type{%s}, required-type{Array} |", them)

#define ext_api_raise_err_string_arg_type(func_name, them)  macro_only_raise_err_bad_arg_type("| c{String}-> m{" #func_name "} got arg(them) w/ type{%s}, required-type{String} |", them)

#define ext_api_raise_err_int_bad_power                     rb_raise(R_ERR_ARG, "| c{Integer}-> m{^} self(%"PRIsVALUE") unable to match exponential(%"PRIsVALUE") |", self, them);
#define ext_api_raise_err_flt_bad_power                      rb_raise(R_ERR_ARG, "| c{Float}-> m{^} self(%"PRIsVALUE") unable to match exponential(%"PRIsVALUE") |", self, them);
#define ext_api_raise_err_rational_bad_power                rb_raise(R_ERR_ARG, "| c{Rational}-> m{^} self(%"PRIsVALUE") unable to match exponential(%"PRIsVALUE") |", self, them);

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


#define 🛑err_bad_num(the_class, the_func, arg_name, the_arg) 🛑m_param_type(the_class, the_func, arg_name, the_arg, "Numeric")

#define 🛑is_num(the_class, the_func, arg_name, the_arg) if (!(is_num(the_arg))) {🛑m_param_type(the_class, the_func, arg_name, the_arg, "Numeric")}
#define 🛑is_sym(the_class, the_func, arg_name, the_arg) if (!(is_sym(the_arg))) {🛑m_param_type(the_class, the_func, arg_name, the_arg, "Symbol")}


#endif
