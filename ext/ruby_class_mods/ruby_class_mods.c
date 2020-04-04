// encoding: utf-8

/*____________________________________________________________________________________________________________________________________________________________________
         __   __        __                  __   __   __  ___  __
 |    | |__) |__)  /\  |__) \ /    |  |\/| |__) /  \ |__)  |  /__`
 |___ | |__) |  \ /~~\ |  \  |     |  |  | |    \__/ |  \  |  .__/
____________________________________________________________________________________________________________________________________________________________________ */

//#include "ruby/encoding.h"
#include "ruby-2.7.0/x86_64-darwin18/rb_mjit_min_header-2.7.0.h"

#include <ruby.h>
#include <ruby/intern.h>
#include <ruby/debug.h>
#include <ruby/assert.h>
#include <ruby/missing.h>
#include <ruby/re.h>
#include <ruby/regex.h>
#include <ruby/ruby.h>
#include <ruby/st.h>
#include <ruby/subst.h>
//#include <ruby/thread.h>
//#include <ruby/thread_native.h>
#include <ruby/util.h>
#include <ruby/version.h>
#include <ruby/vm.h>

#include <stdio.h>
#include <stdlib.h>

#ifndef CRUUUBY_H
#include "ruby_class_mods.h"
#endif

//#include <unistd.h>
//#include <sys/types.h>
//#include <sys/stat.h>
//#include <fcntl.h>
//#include <string.h>

//#include <ruby/backward.h>
//#include <ruby/backward/classext.h>
//#include <ruby/backward/rubyio.h>
//#include <ruby/backward/st.h>
//#include <ruby/backward/util.h>
//#include <ruby/io.h>
//#include <ruby/onigmo.h>
//#include <ruby/oniguruma.h>
//#include <ruby/re.h>
//#include <ruby/regex.h>

/*____________________________________________________________________________________________________________________________________________________________________
            __   __   __   __       __   __   ___     __   __   __   __   ___  __   __          __
 |\/|  /\  /  ` |__) /  \ /__` .   |__) |__) |__  __ |__) |__) /  \ /  ` |__  /__` /__` | |\ | / _`
 |  | /~~\ \__, |  \ \__/ .__/ .   |    |  \ |___    |    |  \ \__/ \__, |___ .__/ .__/ | | \| \__>
____________________________________________________________________________________________________________________________________________________________________ */

#define raise_err_if_power_does_not_match_1337_or_1338_or_1339(err_to_raise) if(power_to_raise_to != 1337 && power_to_raise_to != 1338 && power_to_raise_to != 1339){err_to_raise}

#define ensure_not_frozen(arg_to_check) rb_check_frozen(arg_to_check);

#define r_str_prepend(str, elem) rb_str_update(str, 0L, 0L, elem);
#define r_ary_prepend(ary, elem) rb_ary_unshift(ary, elem);

#define r_str_new_frozen_literal(arg) rb_str_new_frozen(rb_str_new_cstr(arg))
#define r_str_pre_modify(str)         rb_str_modify(str);
#define cstr_to_rstr(arg)             rb_str_new_cstr(arg)

#define r_hsh_increment_keys_val(hsh, key) rb_hash_aset(hsh, key, LONG2FIX(RB_FIX2LONG(rb_hash_aref(hsh, key)) + 1));
#define r_hsh_set_val_to_one(hsh, key) rb_hash_aset(hsh, key, ℤ1);

#define r_hsh_has_key(hsh, key) (rb_hash_has_key(hsh, key) == Qtrue)
#define r_ary_has(ary, elem) rb_ary_includes(ary, elem)

#define r_add_global_const(const_name, const_value) rb_define_global_const(const_name, const_value);
#define r_add_global_const_str(const_name, const_value) r_add_global_const("" #const_name, cstr_to_rstr("" #const_value))
#define r_get_class(r_class) rb_const_get(rb_cObject, rb_intern(r_class));

#define get_numerical_const(the_num) NUM2ULONG(rb_obj_id(rb_const_get_at(rb_cNumeric, rb_intern(the_num))))
#define get_float_const(the_num) NUM2ULONG(rb_obj_id(rb_const_get_at(rb_cFloat, rb_intern(the_num))))

#define internal_define_set_exponential_negative(num_position, num_val) exponential_ids[num_position] = NUM2ULONG(rb_obj_id(rb_const_get_at(rb_cNumeric, rb_intern("EXPONENTIAL_n" #num_val))));
#define internal_define_set_exponential(num_position, num_val)          exponential_ids[num_position] = NUM2ULONG(rb_obj_id(rb_const_get_at(rb_cNumeric, rb_intern("EXPONENTIAL_" #num_val))));

#define bsearch_ulong(val_to_find) (unsigned long *) bsearch (&val_to_find, exponential_ids, 𝔠EXPONENTS, 𝔠ULONG, internal_only_compare_func_4_object_id);

/*____________________________________________________________________________________________________________________
   __            ___  ___  __                          ___       __   ___  __   __
  /  `    | |\ |  |  |__  |__) |\ |  /\  |       |__| |__  |    |__) |__  |__) /__`
  \__,    | | \|  |  |___ |  \ | \| /~~\ |___    |  | |___ |___ |    |___ |  \ .__/
_____________________________________________________________________________________________________________________ */

// in case of any errors lol, previous code to use
//ID old_id = rb_check_id(& param_a);
//if (!old_id) {rb_print_undef_str(self, param_a);}
static inline ID health_check_for_existing_func_name(VALUE context_self, VALUE * func_name_as_str) {
    ID func_id = rb_check_id(func_name_as_str);
    if (!func_id) {rb_print_undef_str(context_self, * func_name_as_str);}
    return func_id;
}

static inline void internal_only_prepare_f16() {
    cached_flt_nan          = rb_const_get_at(R_FLT, rb_intern("NAN"));
    cached_flt_inf          = rb_const_get_at(R_FLT, rb_intern("INFINITY"));
    cached_flt_negative_inf = rb_const_get_at(R_FLT, rb_intern("INFINITY_NEGATIVE"));
    cached_flt_inf_complex  = rb_const_get_at(R_FLT, rb_intern("INFINITY_COMPLEX"));

    internal_define_set_exponential_negative(0, 9)
    internal_define_set_exponential_negative(1, 8)
    internal_define_set_exponential_negative(2, 7)
    internal_define_set_exponential_negative(3, 6)
    internal_define_set_exponential_negative(4, 5)
    internal_define_set_exponential_negative(5, 4)
    internal_define_set_exponential_negative(6, 3)
    internal_define_set_exponential_negative(7, 2)
    internal_define_set_exponential_negative(8, 1)
    internal_define_set_exponential(9, 0)
    internal_define_set_exponential(10, 1)
    internal_define_set_exponential(11, 2)
    internal_define_set_exponential(12, 3)
    internal_define_set_exponential(13, 4)
    internal_define_set_exponential(14, 5)
    internal_define_set_exponential(15, 6)
    internal_define_set_exponential(16, 7)
    internal_define_set_exponential(17, 8)
    internal_define_set_exponential(18, 9)
    exponential_ids[19] = NUM2ULONG(rb_obj_id(rb_const_get_at(rb_cNumeric, rb_intern("EXPONENTIAL_INF"))));
    exponential_ids[20] = NUM2ULONG(rb_obj_id(rb_const_get_at(rb_cNumeric, rb_intern("EXPONENTIAL_NEGATIVE_INF"))));
    exponential_ids[21] = NUM2ULONG(rb_obj_id(rb_const_get_at(rb_cFloat, rb_intern("INFINITY_COMPLEX"))));

    qsort(exponential_ids, 𝔠EXPONENTS, 𝔠ULONG, internal_only_compare_func_4_object_id);

    assign_exponential_index_position(get_numerical_const("EXPONENTIAL_n9"), -9);
    assign_exponential_index_position(get_numerical_const("EXPONENTIAL_n8"), -8);
    assign_exponential_index_position(get_numerical_const("EXPONENTIAL_n7"), -7);
    assign_exponential_index_position(get_numerical_const("EXPONENTIAL_n6"), -6);
    assign_exponential_index_position(get_numerical_const("EXPONENTIAL_n5"), -5);
    assign_exponential_index_position(get_numerical_const("EXPONENTIAL_n4"), -4);
    assign_exponential_index_position(get_numerical_const("EXPONENTIAL_n3"), -3);
    assign_exponential_index_position(get_numerical_const("EXPONENTIAL_n2"), -2);
    assign_exponential_index_position(get_numerical_const("EXPONENTIAL_n1"), -1);
    assign_exponential_index_position(get_numerical_const("EXPONENTIAL_0"), 0);
    assign_exponential_index_position(get_numerical_const("EXPONENTIAL_1"), 1);
    assign_exponential_index_position(get_numerical_const("EXPONENTIAL_2"), 2);
    assign_exponential_index_position(get_numerical_const("EXPONENTIAL_3"), 3);
    assign_exponential_index_position(get_numerical_const("EXPONENTIAL_4"), 4);
    assign_exponential_index_position(get_numerical_const("EXPONENTIAL_5"), 5);
    assign_exponential_index_position(get_numerical_const("EXPONENTIAL_6"), 6);
    assign_exponential_index_position(get_numerical_const("EXPONENTIAL_7"), 7);
    assign_exponential_index_position(get_numerical_const("EXPONENTIAL_8"), 8);
    assign_exponential_index_position(get_numerical_const("EXPONENTIAL_9"), 9);
    assign_exponential_index_position(get_numerical_const("EXPONENTIAL_INF"), 1337);
    assign_exponential_index_position(get_numerical_const("EXPONENTIAL_NEGATIVE_INF"), 1338);
    assign_exponential_index_position(get_float_const("INFINITY_COMPLEX"), 1339);
}

static inline void internal_only_protect_against_gc(void) {
    rb_global_variable(& ℤn9);
    rb_global_variable(& ℤn8);
    rb_global_variable(& ℤn7);
    rb_global_variable(& ℤn6);
    rb_global_variable(& ℤn5);
    rb_global_variable(& ℤn4);
    rb_global_variable(& ℤn3);
    rb_global_variable(& ℤn2);
    rb_global_variable(& ℤn1);
    rb_global_variable(& ℤ0);
    rb_global_variable(& ℤ1);
    rb_global_variable(& ℤ2);
    rb_global_variable(& ℤ3);
    rb_global_variable(& ℤ4);
    rb_global_variable(& ℤ5);
    rb_global_variable(& ℤ6);
    rb_global_variable(& ℤ7);
    rb_global_variable(& ℤ8);
    rb_global_variable(& ℤ9);
    rb_global_variable(& cached_rb_intern_is_a);
    rb_global_variable(& cached_rb_intern_raise_to_power);
    rb_global_variable(& cached_rb_intern_ints_bitwise_xor);
    rb_global_variable(& cached_global_sym_many_args);
    rb_global_variable(& cached_module_param_err);
    rb_global_variable(& cached_module_ruuuby);
    rb_global_variable(& cached_rb_intern_is_empty);
    /*rb_global_variable(& cached_class_big_decimal);
    rb_global_variable(& cached_flt_inf_complex);
    rb_global_variable(& cached_flt_negative_inf);
    rb_global_variable(& cached_flt_inf);
    rb_global_variable(& cached_flt_nan);*/
    // TODO: expand investigation
    //size_t rb_obj_memsize_of(VALUE);
    rb_gc_verify_internal_consistency();
}

static inline void internal_only_before_loading_extension(void) {
    // | f18 | load various Ruby internals |
    ensure_loaded_default(bigdecimal)
    ensure_loaded_default(tempfile)
    ensure_loaded_default(singleton)
    // | --------------------------------- |

    cached_class_big_decimal          = r_get_class("BigDecimal");
    cached_class_set                  = r_get_class("Set");
    cached_rb_intern_is_a             = rb_intern("is_a?");
    cached_rb_intern_ints_bitwise_xor = rb_intern("bitwise_xor");
    cached_rb_intern_raise_to_power   = rb_intern("**");
    cached_rb_intern_is_empty         = rb_intern("empty?");
    // | --------------------------------- |

    cached_module_ruuuby               = ext_api_add_global_module("Ruuuby")
    cached_module_attribute            = ext_api_add_module_under(cached_module_ruuuby, "Attribute")
    cached_module_attribute_includable = ext_api_add_module_under(cached_module_ruuuby, "Includable")
    cached_module_attribute_extendable = ext_api_add_module_under(cached_module_ruuuby, "Extendable")
    cached_module_param_err            = ext_api_add_module_under(cached_module_ruuuby, "ParamErr")
    ext_api_add_module_under(cached_module_ruuuby, "VirtualTypes")
    ext_api_add_new_sub_class_under(cached_module_param_err, R_ERR_ARG, "WrongParamType")
}

static inline void internal_only_load_needed_ruuuby_files(void) { // -------------------------------------------- | f18 |
    // 3rd party gem
    ensure_loaded_default(tty-command)

    // ruuuuby

    ensure_loaded_attribute_includable(cardinality)
    ensure_loaded_attribute_includable(notation_set_mathematics)
    ensure_loaded_attribute_includable(subscript_indexing)

    ensure_loaded_class(class)
    ensure_loaded_module(enumerable)
    ensure_loaded_module(module)
    ensure_loaded_module(kernel)
    ensure_loaded_module(math)
    ensure_loaded_class(obj)
    ensure_loaded_class(re)
    ensure_loaded_ruuuby(types)
    ensure_loaded_class(method)
    ensure_loaded_ruuuby(arg_err)
    ensure_loaded_enumerable(ary)
    ensure_loaded_enumerable(hsh) // must be after{ary}
    ensure_loaded_nums(int)
    ensure_loaded_nums(float)
    ensure_loaded_nums(numeric)
    ensure_loaded_nums(big_decimal)
    ensure_loaded_nums(rational)
    ensure_loaded_nums(complex)
    ensure_loaded_class(nil)
    ensure_loaded_enumerable(set)

    ensure_loaded_attribute_includable(syntax_cache)
    ensure_loaded_attribute_extendable(syntax_cache)

    ensure_loaded_class(sym) // must be after{attribute_cardinality}

    ensure_loaded_class(str) // must be after{attribute_syntax_cache, attribute_cardinality}
    ensure_loaded_io(file)    // must be after{attribute_syntax_cache}
    ensure_loaded_io(dir)    // must be after{attribute_syntax_cache}

    ensure_loaded_ruuuby(configs)
    ensure_loaded_ruuuby(version)
    ensure_loaded_ruuuby(ruuuby/routine)
    ensure_loaded_ruuuby(ruuuby/ruuuby_api)
} // | -----------------------------------------------------------------------------------------------------------------

static inline void assign_exponential_index_position(const unsigned long object_id, const int represented_integer) {
    unsigned long * the_index = bsearch_ulong(object_id)
    if (the_index != NULL) {
        exponential_indexes[(int)(((int)the_index - (int)exponential_ids) / 𝔠ULONG)] = represented_integer;
    } else {
        printf("C-Extension-Error! {func{assign_exponential_index_position}->{%lu} could not be found for int{%d}}\n", * the_index, represented_integer);
        rb_raise(rb_eRuntimeError, "Error-code{%d}", CUSTOM_ERROR_CODE);
    }
}

// original source modified from: https://stackoverflow.com/questions/36681906/c-qsort-doesnt-seem-to-work-with-unsigned-long
static int internal_only_compare_func_4_object_id(const void * l, const void * r) {
    const unsigned long ai = *(const unsigned long *)(l);
    const unsigned long bi = *(const unsigned long *)(r);
    if (ai < bi) {return -1;} else if(ai > bi) {return 1;} else {return 0;}
}

/*____________________________________________________________________________________________________________________________________________________________________
  ___            __   __       __   ___  __             __       ___    __        __                      __        ___        ___      ___      ___    __        __
 |__  |  | |\ | /  ` /__` .   |  \ |__  /  ` |     /\  |__)  /\   |  | /  \ |\ | /__`    __|__   |  |\/| |__) |    |__   |\/| |__  |\ |  |   /\   |  | /  \ |\ | /__`
 |    \__/ | \| \__, .__/ .   |__/ |___ \__, |___ /~~\ |  \ /~~\  |  | \__/ | \| .__/      |     |  |  | |    |___ |___  |  | |___ | \|  |  /~~\  |  | \__/ | \| .__/
____________________________________________________________________________________________________________________________________________________________________ */

/*____________________________________________________________________________________________________________________
 __   __        ___  __  ___
/  \ |__)    | |__  /  `  |
\__/ |__) \__/ |___ \__,  |
_____________________________________________________________________________________________________________________ */

// | function{ary?}  |
r_func(m_obj_ary , is_ary(self))

// | function{bool?} |
r_func(m_obj_bool, is_bool(self))

// | function{hash?} |
r_func(m_obj_hash, is_hsh(self))

// | function{int?}  |
r_func(m_obj_int , is_int(self))

// | function{flt?}   |
r_func(m_obj_flt  , is_float(self))

// | function{sym?}  |
r_func(m_obj_sym , is_sym(self))

// | function{str?}  |
r_func(m_obj_str , is_str(self))

// | function{stry?} |
r_func(m_obj_stry, is_str(self) || is_sym(self))

// | function(num?}  |
r_func_raw(m_obj_num,
    switch (TYPE(self)) {
    	case RUBY_T_FIXNUM:
    	case RUBY_T_FLOAT:
    	case RUBY_T_RATIONAL:
    	case RUBY_T_COMPLEX:
    	case RUBY_T_BIGNUM:
    		re_ye
    	default:
            re_me_func_1args(cached_rb_intern_is_a, cached_class_big_decimal)
    }
)

/*___________________________________________________________________________________________________________________
       ___  ___  __   ___  __
| |\ |  |  |__  / _` |__  |__)
| | \|  |  |___ \__> |___ |  \
_____________________________________________________________________________________________________________________ */

// | function{finite?}   |
r_func_raw(m_int_is_finite, re_ye)

// | function{infinite?} |
r_func_raw(m_int_is_not_finite, re_no)

// | function{^}        |
r_func_self_them(m_int_patch_for_exponentials,
    if (is_int(them)) {
        re_me_func_1args(cached_rb_intern_ints_bitwise_xor, them)
    } else {
        const unsigned long id_to_find = NUM2ULONG(rb_obj_id(them));
        unsigned long * the_result    = bsearch_ulong(id_to_find)
        if (the_result != NULL) {

            const int power_to_raise_to = exponential_indexes[(((int)the_result - (int)exponential_ids) / 𝔠ULONG)];

            if (power_to_raise_to < 2) {
                switch(power_to_raise_to) {
                case -9: re_me_func_1args(cached_rb_intern_raise_to_power, ℤn9)
                case -8: re_me_func_1args(cached_rb_intern_raise_to_power, ℤn8)
                case -7: re_me_func_1args(cached_rb_intern_raise_to_power, ℤn7)
                case -6: re_me_func_1args(cached_rb_intern_raise_to_power, ℤn6)
                case -5: re_me_func_1args(cached_rb_intern_raise_to_power, ℤn5)
                case -4: re_me_func_1args(cached_rb_intern_raise_to_power, ℤn4)
                case -3: re_me_func_1args(cached_rb_intern_raise_to_power, ℤn3)
                case -2: re_me_func_1args(cached_rb_intern_raise_to_power, ℤn2)
                case -1: return rb_rational_new(ℤ1, self);
                case 0:  re_1
                default: re_me
                }
            } else if (power_to_raise_to < 10) {
                const int val_self = NUM2INT(self);
                switch(power_to_raise_to) {
                case 2:  return rb_int_positive_pow(val_self, 2UL);
                case 3:  return rb_int_positive_pow(val_self, 3UL);
                case 4:  return rb_int_positive_pow(val_self, 4UL);
                case 5:  return rb_int_positive_pow(val_self, 5UL);
                case 6:  return rb_int_positive_pow(val_self, 6UL);
                case 7:  return rb_int_positive_pow(val_self, 7UL);
                case 8:  return rb_int_positive_pow(val_self, 8UL);
                default: return rb_int_positive_pow(val_self, 9UL);
                }
            } else {
                raise_err_if_power_does_not_match_1337_or_1338_or_1339(ext_api_raise_err_int_bad_power)

                const int val_self = NUM2INT(self);

                if (power_to_raise_to == 1339) {
                    if (val_self == 0) {
                        re_0
                    } else {
                        re_nan
                    }
                }

                if (val_self == 1 || val_self == -1) {
                    re_nan
                } else if (val_self == 0) {
                    if (power_to_raise_to == 1337) {
                        re_0
                    } else {
                        re_inf_complex
                    }
                } else if (power_to_raise_to == 1338) {
                    re_0
                } else if (val_self > 1) {
                    re_inf
                } else {
                    re_negative_inf
                }
            }
        } else { ext_api_raise_err_int_bad_power }
        //} else { re_me_func_1args(cached_rb_intern_ints_bitwise_xor, them) }
    }
)

/*___________________________________________________________________________________________________________________
 ___       __       ___
|__  |    /  \  /\   |
|    |___ \__/ /~~\  |
_____________________________________________________________________________________________________________________ */

// | function{^} |
r_func_self_them(m_flt_patch_for_exponentials,

    // TODO: skip the 'is_sym' check?
    if (is_sym(them)) {
        const unsigned long id_to_find = NUM2ULONG(rb_obj_id(them));
        unsigned long * the_result    = bsearch_ulong(id_to_find);
        if (the_result != NULL) {
            const double val_self = NUM2DBL(self); // RFLOAT_VALUE(self);
            if (isnan(val_self)) {rb_raise(R_ERR_RUNTIME, "| c{Float}-> m{^} self(%"PRIsVALUE") may not be raised to an exponential power |", self);}
            const int power_to_raise_to = exponential_indexes[(((int)the_result - (int)exponential_ids) / 𝔠ULONG)];
            if (val_self == 0.0 && power_to_raise_to < 0) {
                rb_raise(R_ERR_ZERO_DIVISION, "| c{Float}-> m{^} self(%"PRIsVALUE") may not be raised to a negative exponential power |", self);
            }

            if (power_to_raise_to < 10) {
                switch(power_to_raise_to) {
                case -9: re_me_func_1args(cached_rb_intern_raise_to_power, ℤn9)
                case -8: re_me_func_1args(cached_rb_intern_raise_to_power, ℤn8)
                case -7: re_me_func_1args(cached_rb_intern_raise_to_power, ℤn7)
                case -6: re_me_func_1args(cached_rb_intern_raise_to_power, ℤn6)
                case -5: re_me_func_1args(cached_rb_intern_raise_to_power, ℤn5)
                case -4: re_me_func_1args(cached_rb_intern_raise_to_power, ℤn4)
                case -3: re_me_func_1args(cached_rb_intern_raise_to_power, ℤn3)
                case -2: re_me_func_1args(cached_rb_intern_raise_to_power, ℤn2)
                case -1: re_me_func_1args(cached_rb_intern_raise_to_power, ℤn1)
                case 0:  if (isinf(val_self)) {re_nan} else { re_1 }
                case 1:  re_me
                case 2:  re_me_func_1args(cached_rb_intern_raise_to_power, ℤ2)
                case 3:  re_me_func_1args(cached_rb_intern_raise_to_power, ℤ3)
                case 4:  re_me_func_1args(cached_rb_intern_raise_to_power, ℤ4)
                case 5:  re_me_func_1args(cached_rb_intern_raise_to_power, ℤ5)
                case 6:  re_me_func_1args(cached_rb_intern_raise_to_power, ℤ6)
                case 7:  re_me_func_1args(cached_rb_intern_raise_to_power, ℤ7)
                case 8:  re_me_func_1args(cached_rb_intern_raise_to_power, ℤ8)
                case 9:  re_me_func_1args(cached_rb_intern_raise_to_power, ℤ9)
                default: ext_api_raise_err_flt_bad_power
                }
            } else {
                raise_err_if_power_does_not_match_1337_or_1338_or_1339(ext_api_raise_err_flt_bad_power)

                if (val_self == 1.0 || val_self == -1.0) {
                    re_nan
                } else if (power_to_raise_to == 1337) {
                    if (isinf(val_self)) {
                        re_inf_complex
                    } else if (val_self >= 0.0 && val_self < 1.0) {
                        re_0
                    } else if (val_self > 1.0) {
                        re_inf
                    } else if (val_self < 0.0 && val_self > -1.0) {
                        re_0
                    } else {
                        re_negative_inf
                    }
                } else if (power_to_raise_to == 1338) {
                    if (val_self == 0.0) {
                        re_inf_complex
                    } else if (val_self > 0.0 && val_self < 1.0) {
                        re_inf
                    } else if (val_self > 1.0) {
                        re_0
                    } else if (val_self < 0.0 && val_self > -1.0) {
                        re_negative_inf
                    } else {
                        re_0
                    }
                } else {
                    if (val_self == 0.0) {
                        re_0
                    } else {
                        re_nan
                    }
                }
            }
        } else { ext_api_raise_err_flt_bad_power }
    } else { ext_api_raise_err_flt_bad_power }
)

/*___________________________________________________________________________________________________________________

|\ | | |
| \| | |___
_____________________________________________________________________________________________________________________ */

// | function{empty?} |
r_func_raw(m_nil_empty, re_ye)

/*____________________________________________________________________________________________________________________
 __     ___     __                   __
/__`     |     |__)    |    |\ |    / _`
.__/     |     |  \    |    | \|    \__>
_____________________________________________________________________________________________________________________ */

// | function{>>} |
r_func_self_them(m_str_prepend,
    if (is_str(them)) {
        if (is_empty_str(them)) {
            re_me
        } else {
            r_str_pre_modify(self)
            r_str_prepend(self, them)
            re_me
        }
    } else {ext_api_raise_err_string_arg_type(>>, them)}
)

// | function{err_to_num} |
r_func_raw(m_str_err_to_num,
     rb_raise(R_ERR_RUNTIME, "| c{String}-> m{to_num} may not convert self(%"PRIsVALUE") into a valid numeric |", self);
)

/*___________________________________________________________________________________________________________________
         __      __
 /\     |__)    |__)     /\     \ /
/~~\    |  \    |  \    /~~\     |
_____________________________________________________________________________________________________________________ */

// | function{>>} |
r_func_self_them(m_ary_prepend,
    ensure_not_frozen(self)
    r_ary_prepend(self, them)
    re_me
)

// | function{remove_empty!} |
r_func_raw(m_ary_remove_empty,
    ensure_not_frozen(self)
    long len_me = len_ary(self);
    if (len_me == 0){re_me}
    long i;
    VALUE v;
    for (i = 0; i < len_me;) {
        v = RARRAY_PTR(self)[i];
        if (is_nil(v) || is_non_empty_str(v) || is_non_empty_ary(v) || is_non_empty_hsh(v) || is_non_empty_generic(v)) {
            r_ary_del(self, i);
            --len_me;
        } else {++i;}
    }
    re_me
)

// | function{disjunctive_union} |
r_func_self_them(m_ary_disjunctive_union,
    if (is_ary(them)) {
        const long len_me   = len_ary(self);
        const long len_them = len_ary(them);
        if (len_me == 0 && len_them == 0) {
            return rb_ary_new_capa(0L);
        } else if (len_me == 0) {
            return rb_ary_dup(them);
        } else if (len_them == 0) {
            return rb_ary_dup(self);
        } else {
            long  i;
            VALUE n;
            VALUE output = (len_me + len_them) < 𝔠ARY_DEFAULT ? rb_ary_new_capa(len_me + len_them) : rb_ary_new();
            if (len_me >= len_them) {
                for (i = 0L; i < len_them; i++) {
                    n = r_ary_get(them, i) if(!r_ary_has(self, n)){r_ary_add(output, n)}
                    n = r_ary_get(self, i) if(!r_ary_has(them, n)){r_ary_add(output, n)}
                }
                for (; i < len_me; i++) {
                    n = r_ary_get(self, i) if(!r_ary_has(them, n)){r_ary_add(output, n)}
                }
            } else {
                for (i = 0L; i < len_me; i++) {
                    n = r_ary_get(self, i) if(!r_ary_has(them, n)){r_ary_add(output, n)}
                    n = r_ary_get(them, i) if(!r_ary_has(self, n)){r_ary_add(output, n)}
                }
                for (; i < len_them; i++) {
                    n = r_ary_get(them, i) if(!r_ary_has(self, n)){r_ary_add(output, n)}
                }
            }
            return output;
        }
    } else {ext_api_raise_err_array_arg_type(disjunctive_union, them)}
)

// | function(frequency_counts} |
r_func_raw(m_ary_frequency_counts,
    const long len_me = len_ary(self);
    if (len_me == 0) {return Qnil;}
    VALUE hsh = rb_hash_new();
    long i;
    VALUE n;
    for (i = 0; i < len_me; i++) {
        n = RARRAY_AREF(self, i);
        if (r_hsh_has_key(hsh, n)) {r_hsh_increment_keys_val(hsh, n)} else {r_hsh_set_val_to_one(hsh, n)}
    }
    return hsh;
)

// | function(equal_contents?} |
r_func_self_them(m_ary_equal_contents,
    if (is_ary(them)) {
        const long len_me = len_ary(self);
        if ((len_me - len_ary(them)) != 0) {re_no} else if (len_me == 0) {re_ye} else {
            VALUE hsh = rb_hash_new();
            //VALUE hsh = rb_hash_new2((len_me + 1) / 2);
            long i;
            VALUE n;
            for (i = 0; i < len_me; i++) {
                n = RARRAY_AREF(self, i);
                if (r_hsh_has_key(hsh, n)) {r_hsh_increment_keys_val(hsh, n)} else {r_hsh_set_val_to_one(hsh, n)}
            }
            for (i = 0; i < len_me; i++) {
                n = RARRAY_AREF(them, i);
                if (r_hsh_has_key(hsh, n)) {
                    long current_count = NUM2LONG(rb_hash_aref(hsh, n));
                    if (current_count == 1) {
                        rb_hash_delete(hsh, n);
                    } else {
                        rb_hash_aset(hsh, n, LONG2FIX(current_count - 1));
                    }
                // key was not found so the arrays are not equal in contents
                // TODO: compare against 'rb_gc_mark'
                } else {rb_free_generic_ivar(hsh); re_no}
            }
            // all keys were matched
            // TODO: compare against 'rb_gc_mark'
            rb_free_generic_ivar(hsh); re_ye
        }
    } else {ext_api_raise_err_array_arg_type(equal_contents?, them)}
)

/*___________________________________________________________________________________________________________________
      __   __             ___
|\/| /  \ |  \ |  | |    |__
|  | \__/ |__/ \__/ |___ |___
_____________________________________________________________________________________________________________________ */

// | function(⨍_add_aliases} |
r_func_self_a_b(m_module_add_aliases,
    if (is_ary(param_b)) {
        const long len_them = len_ary(param_b);
        if (len_them == 0){re_me}
        long i;
        VALUE v;
        ID old_id = health_check_for_existing_func_name(self, & param_a);
        for (i = 0; i < len_them; i++) {
            v = RARRAY_PTR(param_b)[i];
            if (is_sym(v)) {
                rb_alias(self, rb_to_id(v), old_id);
            } else {
                macro_only_raise_err_bad_arg_type("| m{Module}-> m{f_add_aliases} got element in Array-arg(func_aliases) w/ type{%s}, required-type{Symbol} |", v)
            }
        }
        re_me
    } else {
        macro_only_raise_err_bad_arg_type("| m{Module}-> m{f_add_aliases} got arg(func_aliases) w/ type{%s}, required-type{Array} |", param_b)
    }
)

/*____________________________________________________________________________________________________________________
 __      __   __   __   ___     ___      ___  __
/  `    /  ` /  \ |  \ |__     |__  |\ |  |  |__) \ /
\__,    \__, \__/ |__/ |___    |___ | \|  |  |  \  |
_____________________________________________________________________________________________________________________ */

//static void at_exit (void) {
    //printf("for when needed, this func will run after END {} blocks\n");
//}

static inline void internal_only_add_ruuuby_c_extensions() {
    cached_global_sym_many_args = ID2SYM(rb_intern("*args"));
    rb_define_readonly_variable("$PRM_MANY", &cached_global_sym_many_args);

    ext_api_add_const_under(R_MATH, "RATIO_DEGREES_TO_RADIAN", DBL2NUM(M_PIE / 180.0))
    ext_api_add_const_under(R_MATH, "RATIO_RADIANS_TO_DEGREE", DBL2NUM(180.0 / M_PIE))
    ext_api_add_const_under(R_FLT, "RELATIVE_ERROR", DBL2NUM(M_FLT_RELATIVE_ERROR))
    ext_api_add_const_under(R_FLT, "MIN_NORMAL", DBL2NUM(M_FLT_MIN_NORMAL))
    ext_api_add_const_under(R_FLT, "GOLDEN_RATIO", DBL2NUM(M_FLT_GOLDEN_RATIO))
    ext_api_add_const_under(R_FLT, "EULER_MASCHERONI_CONSTANT", DBL2NUM(M_FLT_EULER_MASCHERONI_CONSTANT))
    ext_api_add_const_under(R_FLT, "SMALLEST_RELATIVE_ERROR", DBL2NUM(M_FLT_RELATIVE_ERROR * M_FLT_MIN_NORMAL));

    ext_api_add_public_method_0args_to_class(R_OBJ, "ary?" , m_obj_ary)
    ext_api_add_public_method_0args_to_class(R_OBJ, "bool?", m_obj_bool)
    ext_api_add_public_method_0args_to_class(R_OBJ, "int?" , m_obj_int)
    ext_api_add_public_method_0args_to_class(R_OBJ, "flt?"  , m_obj_flt)
    ext_api_add_public_method_0args_to_class(R_OBJ, "hsh?" , m_obj_hash)
    ext_api_add_public_method_0args_to_class(R_OBJ, "sym?" , m_obj_sym)
    ext_api_add_public_method_0args_to_class(R_OBJ, "str?" , m_obj_str)
    ext_api_add_public_method_0args_to_class(R_OBJ, "stry?", m_obj_stry)
    ext_api_add_public_method_0args_to_class(R_OBJ, "num?" , m_obj_num)

    ext_api_add_public_method_0args_to_class(R_INT, "finite?"  , m_int_is_finite)
    ext_api_add_public_method_0args_to_class(R_INT, "infinite?", m_int_is_not_finite)

    // | f11 | creates alias of Integer's func{^} which is originally provided for bitwise XOR
    ext_api_add_func_alias(R_INT, "bitwise_xor", "^")
    ext_api_add_public_method_1args_to_class(R_INT, "^"       , m_int_patch_for_exponentials)

    ext_api_add_public_method_1args_to_class(R_FLT, "^"       , m_flt_patch_for_exponentials)

    ext_api_add_public_method_0args_to_class(R_NIL, "empty?", m_nil_empty)

    ext_api_add_public_method_1args_to_class(R_STR, ">>", m_str_prepend)
    ext_api_add_public_method_0args_to_class(R_STR, "err_to_num", m_str_err_to_num)

    ext_api_add_public_method_0args_to_class(R_ARY, "remove_empty!"    , m_ary_remove_empty)
    ext_api_add_public_method_0args_to_class(R_ARY, "frequency_counts" , m_ary_frequency_counts)
    ext_api_add_public_method_1args_to_class(R_ARY, "disjunctive_union", m_ary_disjunctive_union)
    ext_api_add_public_method_1args_to_class(R_ARY, "equal_contents?"  , m_ary_equal_contents)
    ext_api_add_public_method_1args_to_class(R_ARY, ">>"               , m_ary_prepend)

    ext_api_add_public_method_2args_to_class(R_MODULE, "f_add_aliases", m_module_add_aliases)
}

c_func(Init_ruby_class_mods,

    internal_only_before_loading_extension();

    internal_only_add_ruuuby_c_extensions();

    internal_only_load_needed_ruuuby_files();

    internal_only_prepare_f16();

    //ruby_vm_at_exit(& at_exit);

    internal_only_protect_against_gc();
)
