// encoding: utf-8

#ifndef CRUUUBY_H1_TYPED_CHECKS
#include "c1_typed_checks.h"
#endif

#ifndef CRUUUBY_H2_EXTENSION_MEMORY
#define CRUUUBY_H2_EXTENSION_MEMORY "defined(CRUUUBY_H2_EXTENSION_MEMORY)"

/*____________________________________________________________________________________________________________________
 __        __        ___      __        __
/  `  /\  /  ` |__| |__  .   |__) |  | |__) \ /
\__, /~~\ \__, |  | |___ .   |  \ \__/ |__)  |
_____________________________________________________________________________________________________________________ */

static VALUE 🅽_no_empty;
static VALUE 🅽_superscripts;
static VALUE 🅽_natural;
static VALUE 🅽_whole;
static VALUE 🅽_integer;
static VALUE 🅽_universal;
static VALUE 🅽_universal_w_str_allowed;
static VALUE 🅽_natural_w_str_allowed;
static VALUE 🅽_whole_w_str_allowed;
static VALUE 🅽_integer_w_str_allowed;

static VALUE cached_flt_nan;
static VALUE cached_flt_inf;
static VALUE cached_flt_negative_inf;
static VALUE cached_flt_inf_complex;

static VALUE ⓜparam_err;

static VALUE ⓜruuuby;
static VALUE ⓜruuuby_metadata;
static VALUE ⓜruuuby_engine;
static VALUE ⓜruuuby_engine_jit;
static VALUE ⓜruuuby_engine_gc;

static VALUE ⓜnumber_theory;
static VALUE ⓜgraph_theory;
static VALUE ⓜcombinatorics;
static VALUE ⓜtrigonometry;

static VALUE Ⓒbig_decimal;
static VALUE Ⓒset;
static VALUE Ⓒmatrix;
static VALUE Ⓒvector;
static VALUE Ⓒtheta_angle;
static VALUE Ⓒtime_series_data;
static VALUE Ⓒpseudo_graph;
static VALUE Ⓒruuuby_engine;

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

static ID  exponential_ids[NUM_EXPONENTS];
static int exponential_indexes[NUM_EXPONENTS];

#endif
