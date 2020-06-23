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

static unsigned char RUUUBY_FULL_DEBUG = FLAG_FALSE;
static double memory_at_start;

/*____________________________________________________________________________________________________________________
 __        __        ___      __        __
/  `  /\  /  ` |__| |__  .   |__) |  | |__) \ /
\__, /~~\ \__, |  | |___ .   |  \ \__/ |__)  |
_____________________________________________________________________________________________________________________ */

static VALUE n_no_empty;
static VALUE n_in_set_superscripts;
static VALUE n_in_set_natural;
static VALUE n_in_set_whole;
static VALUE n_in_set_integer;
static VALUE n_in_set_universal;
static VALUE n_in_set_universal_w_str_allowed;
static VALUE n_in_set_natural_w_str_allowed;
static VALUE n_in_set_whole_w_str_allowed;
static VALUE n_in_set_integer_w_str_allowed;

static VALUE cached_flt_nan;
static VALUE cached_flt_inf;
static VALUE cached_flt_negative_inf;
static VALUE cached_flt_inf_complex;

static VALUE cached_module_param_err;

static VALUE ⓜruuuby;
static VALUE ⓜruuuby_metadata;
static VALUE ⓜruuuby_engine;

static VALUE ⓜnumber_theory;
static VALUE ⓜcombinatorics;
static VALUE ⓜtrigonometry;

static VALUE cached_global_sym_many_args;

static VALUE Ⓒbig_decimal;
static VALUE Ⓒset;
static VALUE Ⓒtheta_angle;

static VALUE cached_const_angle_golden;
static VALUE cached_const_angle_tau;
static VALUE cached_const_angle_right;
static VALUE cached_const_angle_straight;

static ID cached_rb_intern_smells_like_int;
static ID cached_rb_intern_is_finite;
static ID cached_rb_intern_is_empty;

/*____________________________________________________________________________________________________________________
 __        __        ___      __
/  `  /\  /  ` |__| |__  .   /  `
\__, /~~\ \__, |  | |___ .   \__,
_____________________________________________________________________________________________________________________ */

static unsigned long exponential_ids[NUM_EXPONENTS];
static int           exponential_indexes[NUM_EXPONENTS];



#endif
