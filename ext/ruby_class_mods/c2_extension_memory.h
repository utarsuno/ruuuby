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

static VALUE cached_flt_nan;
static VALUE cached_flt_inf;
static VALUE cached_flt_negative_inf;
static VALUE cached_flt_inf_complex;

// | 0x0 |
static VALUE cached_module_ruuuby;
static VALUE cached_module_attribute;
static VALUE cached_module_attribute_includable;
static VALUE cached_module_attribute_extendable;

static VALUE cached_module_param_err;
// | --- |

static VALUE cached_global_sym_many_args;

static VALUE cached_class_big_decimal;
static VALUE cached_class_set;
static VALUE cached_rb_intern_ints_bitwise_xor;
static VALUE cached_rb_intern_raise_to_power;
static VALUE cached_rb_intern_is_a;
static VALUE cached_rb_intern_is_empty;

static unsigned long exponential_ids[𝔠EXPONENTS];
// make these const ints?
static int           exponential_indexes[𝔠EXPONENTS];

#endif
