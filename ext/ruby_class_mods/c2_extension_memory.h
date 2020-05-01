// encoding: utf-8

#ifndef CRUUUBY_H1_TYPED_CHECKS
#include "c1_typed_checks.h"
#endif

#ifndef CRUUUBY_H2_EXTENSION_MEMORY
#define CRUUUBY_H2_EXTENSION_MEMORY "defined(CRUUUBY_H2_EXTENSION_MEMORY)"

/*____________________________________________________________________________________________________________________
  __        __        ___
 /  `  /\  /  ` |__| |__
 \__, /~~\ \__, |  | |___
_____________________________________________________________________________________________________________________ */

/*____________________________________________________________________________________________________________________
 __        __        ___      __        __
/  `  /\  /  ` |__| |__  .   |__) |  | |__) \ /
\__, /~~\ \__, |  | |___ .   |  \ \__/ |__)  |
_____________________________________________________________________________________________________________________ */

static VALUE cached_ref_empty_ary;

static VALUE cached_flt_one_half;
static VALUE cached_flt_two_thirds;
static VALUE cached_flt_one_third;
static VALUE cached_flt_one_fourth;
static VALUE cached_flt_three_fourths;
static VALUE cached_flt_one_fifth;
static VALUE cached_flt_two_fifths;
static VALUE cached_flt_three_fifths;
static VALUE cached_flt_four_fifths;
static VALUE cached_flt_one_sixth;
static VALUE cached_flt_five_sixth;
static VALUE cached_flt_one_seventh;
static VALUE cached_flt_one_eighth;
static VALUE cached_flt_three_eighths;
static VALUE cached_flt_five_eighths;
static VALUE cached_flt_seven_eighths;
static VALUE cached_flt_one_ninth;
static VALUE cached_flt_one_tenth;

static VALUE cached_flt_nan;
static VALUE cached_flt_inf;
static VALUE cached_flt_negative_inf;
static VALUE cached_flt_inf_complex;

// | 0x0 |
static VALUE cached_module_ruuuby;
static VALUE cached_module_ruuuby_metadata;
static VALUE cached_module_attribute;
static VALUE cached_module_attribute_includable;
static VALUE cached_module_attribute_extendable;

static VALUE cached_module_param_err;
static VALUE cached_module_virtual_types;
static VALUE cached_module_normalizers;
// | --- |

static VALUE cached_global_sym_many_args;

static VALUE cached_sym_normalizer_exponential;
static VALUE 🆔cached_sym_normalizer_exponential;
static VALUE cached_sym_set_ℕ;
static VALUE 🆔cached_sym_set_ℕ;
static VALUE cached_sym_none;
static VALUE 🆔cached_sym_none;
static VALUE cached_sym_normalizer_no_empty;
static VALUE 🆔cached_sym_normalizer_no_empty;

static VALUE cached_sym_as_radian;
static VALUE cached_sym_as_degree;
static VALUE cached_sym_as_turn;
static VALUE cached_sym_as_gon;

static VALUE cached_class_big_decimal;
static VALUE cached_class_set;
static VALUE cached_class_theta_angle;

static VALUE cached_const_golden_angle;

static VALUE cached_rb_intern_ints_bitwise_xor;
static VALUE cached_rb_intern_raise_to_power;
static VALUE cached_rb_intern_is_a;
static VALUE cached_rb_intern_is_empty;
static VALUE cached_rb_intern_new;

// ID rb_intern(const char*);

static ID cached_rb_intern_as_degree;
static ID cached_rb_intern_as_radian;
static ID cached_rb_intern_as_gon;
static ID cached_rb_intern_as_turn;

static ID cached_rb_intern_zero_angle;
static ID cached_rb_intern_acute_angle;
static ID cached_rb_intern_right_angle;
static ID cached_rb_intern_sextant_angle;
static ID cached_rb_intern_obtuse_angle;
static ID cached_rb_intern_straight_angle;
static ID cached_rb_intern_reflex_angle;
static ID cached_rb_intern_perigon_angle;
static ID cached_rb_intern_oblique_angle;

/*____________________________________________________________________________________________________________________
 __        __        ___      __
/  `  /\  /  ` |__| |__  .   /  `
\__, /~~\ \__, |  | |___ .   \__,
_____________________________________________________________________________________________________________________ */

static long long exponential_ids[𝔠EXPONENTS];
static int       exponential_indexes[𝔠EXPONENTS];

#endif
