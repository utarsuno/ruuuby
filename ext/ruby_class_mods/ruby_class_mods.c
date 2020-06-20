// encoding: UTF-8

/*____________________________________________________________________________________________________________________________________________________________________
         __   __        __                  __   __   __  ___  __
 |    | |__) |__)  /\  |__) \ /    |  |\/| |__) /  \ |__)  |  /__`
 |___ | |__) |  \ /~~\ |  \  |     |  |  | |    \__/ |  \  |  .__/
____________________________________________________________________________________________________________________________________________________________________ */

//#include "ruby-2.7.0/x86_64-darwin18/rb_mjit_min_header-2.7.0.h"
//#include "ruby-2.7.0/x86_64-darwin18/rb_mjit_min_header-2.7.1.h"

#include "ruby/config.h"
#include "/Users/utarsuno/.rbenv/versions/2.7.1/include/ruby-2.7.0/x86_64-darwin18/rb_mjit_min_header-2.7.1.h"

#include <sys/resource.h>

//#include "ruby/encoding.h"

//#include <locale.h>
//#include <ruby.h>

/*
#include <ruby/defines.h>
#include <ruby/intern.h>
#include <ruby/debug.h>
#include <ruby/assert.h>
#include <ruby/missing.h>
#include <ruby/re.h>
#include <ruby/regex.h>
#include <ruby/ruby.h>
#include <ruby/st.h>
#include <ruby/subst.h>
#include <ruby/util.h>
#include <ruby/version.h>
#include <ruby/vm.h>*/

#include <stdio.h>
#include <stdlib.h>

#include <inttypes.h>

#include <time.h>
#include <sys/time.h>

#include <float.h>
#include <math.h>
#include <tgmath.h>
#include <complex.h>

#ifndef CRUUUBY_H
#include "ruby_class_mods.h"
#endif

/*            __                                   ___                       __
   __        /\ \__                               /\_ \                     /\ \__
  /\_\    ___\ \ ,_\    __   _ __    ___      __  \//\ \         ____     __\ \ ,_\  __  __  _____
  \/\ \ /' _ `\ \ \/  /'__`\/\`'__\/' _ `\  /'__`\  \ \ \       /',__\  /'__`\ \ \/ /\ \/\ \/\ '__`\
   \ \ \/\ \/\ \ \ \_/\  __/\ \ \/ /\ \/\ \/\ \L\.\_ \_\ \_    /\__, `\/\  __/\ \ \_\ \ \_\ \ \ \L\ \
    \ \_\ \_\ \_\ \__\ \____\\ \_\ \ \_\ \_\ \__/.\_\/\____\   \/\____/\ \____\\ \__\\ \____/\ \ ,__/
     \/_/\/_/\/_/\/__/\/____/ \/_/  \/_/\/_/\/__/\/_/\/____/    \/___/  \/____/ \/__/ \/___/  \ \ \/
                                                                                               \ \_\
                                                                                                \/_/ */
#define bsearch_power(val_to_find)         (unsigned long *) bsearch (&val_to_find, exponential_ids, NUM_EXPONENTS, sizeof(unsigned long), internal_only_compare_func_4_object_id);
#define bsearch_power_position(arg_index) ((int)(((int)arg_index - (int)exponential_ids) / sizeof(unsigned long)))

static inline int is_num(const VALUE arg) {
    switch(TYPE(arg)){
    case RUBY_T_FIXNUM:case RUBY_T_FLOAT:case RUBY_T_RATIONAL:case RUBY_T_COMPLEX:case RUBY_T_BIGNUM:
        re_c_ye
    default:
        re_as_c_bool(rb_obj_is_instance_of(arg, Ⓒbig_decimal))
    }
}

/*static inline int is_simple_num(const VALUE arg) {
    switch(TYPE(arg)){
    case RUBY_T_FIXNUM:case RUBY_T_FLOAT:case RUBY_T_BIGNUM:
        re_c_ye
    default:
        re_no
    }
}*/

static inline int is_non_simple_num(const VALUE arg) {
    switch(TYPE(arg)){
    case RUBY_T_RATIONAL:case RUBY_T_COMPLEX:
        re_c_ye
    default:
        re_as_c_bool(rb_obj_is_instance_of(arg, Ⓒbig_decimal))
    }
}

// rb_ary_new: uses a default size of 16
static inline VALUE 💎new_ary(const long known_max_size) {
    if (known_max_size == 0) {
        return rb_ary_new_capa(0);
    } else if (known_max_size > 0 && known_max_size <= 16L) {
        return rb_ary_new_capa(known_max_size);
    } else {
        return rb_ary_new();
    }
}

static void internal_only_prepare_f16(void) {
    //rb_gc_disable();

    cached_flt_inf          = rb_const_get_at(R_FLT, rb_intern("INFINITY"));
    cached_flt_negative_inf = rb_const_get_at(R_FLT, rb_intern("INFINITY_NEGATIVE"));
    cached_flt_inf_complex  = rb_const_get_at(R_FLT, rb_intern("INFINITY_COMPLEX"));

    VALUE pack_as_utf8     = rb_str_new_cstr("U*");
    VALUE rb_intern_pack   = rb_intern("pack");
    VALUE code_points      = 💎new_ary_size2(INT2FIX(8713), INT2FIX(8709));

    💎PROCEDURE_00(n_no_empty)

    rb_ary_modify(code_points);

    rb_ary_store(code_points, 0l, INT2FIX(8712));
    rb_ary_store(code_points, 1l, INT2FIX(8469));
    💎PROCEDURE_00(n_in_set_natural)

    rb_ary_store(code_points, 1l, INT2FIX(120142));
    💎PROCEDURE_00(n_in_set_whole)

    rb_ary_store(code_points, 1l, INT2FIX(8484));
    💎PROCEDURE_00(n_in_set_integer)

    rb_ary_store(code_points, 1l, INT2FIX(120140));
    💎PROCEDURE_00(n_in_set_universal)

    rb_ary_store(code_points, 1l, INT2FIX(94));
    💎PROCEDURE_00(n_in_set_superscripts)

    rb_ary_store(code_points, 1l, INT2FIX(8469));
    rb_ary_push(code_points, INT2FIX(120138));
    💎PROCEDURE_00(n_in_set_natural_w_str_allowed)

    rb_ary_store(code_points, 1l, INT2FIX(120142));
    💎PROCEDURE_00(n_in_set_whole_w_str_allowed)

    rb_ary_store(code_points, 1l, INT2FIX(8484));
    💎PROCEDURE_00(n_in_set_integer_w_str_allowed)

    rb_ary_store(code_points, 1l, INT2FIX(120140));
    💎PROCEDURE_00(n_in_set_universal_w_str_allowed)

    rb_ary_free(code_points);

    VALUE code_points2 = 💎new_ary_size2(INT2FIX(8315), INT2FIX(8313));

    💎PROCEDURE_01(obj_id_n9, code_points2)

    rb_ary_modify(code_points2);

    rb_ary_store(code_points2, 1l, INT2FIX(8312));
    💎PROCEDURE_01(obj_id_n8, code_points2)

    rb_ary_store(code_points2, 1l, INT2FIX(8311));
    💎PROCEDURE_01(obj_id_n7, code_points2)

    rb_ary_store(code_points2, 1l, INT2FIX(8310));
    💎PROCEDURE_01(obj_id_n6, code_points2)

    rb_ary_store(code_points2, 1l, INT2FIX(8309));
    💎PROCEDURE_01(obj_id_n5, code_points2)

    rb_ary_store(code_points2, 1l, INT2FIX(8308));
    💎PROCEDURE_01(obj_id_n4, code_points2)

    rb_ary_store(code_points2, 1l, INT2FIX(179));
    💎PROCEDURE_01(obj_id_n3, code_points2)

    rb_ary_store(code_points2, 1l, INT2FIX(178));
    💎PROCEDURE_01(obj_id_n2, code_points2)

    rb_ary_store(code_points2, 1l, INT2FIX(185));
    💎PROCEDURE_01(obj_id_n1, code_points2)

    rb_ary_store(code_points2, 0l, INT2FIX(8734));
    rb_ary_store(code_points2, 1l, INT2FIX(8450));
    💎PROCEDURE_01(obj_id_inf_complex, code_points2)

    rb_ary_pop(code_points2);
    rb_ary_store(code_points2, 0l, INT2FIX(8304));
    💎PROCEDURE_01(obj_id_0, code_points2)

    rb_ary_store(code_points2, 0l, INT2FIX(8313));
    💎PROCEDURE_01(obj_id_9, code_points2)

    rb_ary_store(code_points2, 0l, INT2NUM(8312));
    💎PROCEDURE_01(obj_id_8, code_points2)

    rb_ary_store(code_points2, 0l, INT2FIX(8311));
    💎PROCEDURE_01(obj_id_7, code_points2)

    rb_ary_store(code_points2, 0l, INT2FIX(8310));
    💎PROCEDURE_01(obj_id_6, code_points2)

    rb_ary_store(code_points2, 0l, INT2FIX(8309));
    💎PROCEDURE_01(obj_id_5, code_points2)

    rb_ary_store(code_points2, 0l, INT2FIX(8308));
    💎PROCEDURE_01(obj_id_4, code_points2)

    rb_ary_store(code_points2, 0l, INT2FIX(179));
    💎PROCEDURE_01(obj_id_3, code_points2)

    rb_ary_store(code_points2, 0l, INT2FIX(178));
    💎PROCEDURE_01(obj_id_2, code_points2)

    rb_ary_store(code_points2, 0l, INT2FIX(185));
    💎PROCEDURE_01(obj_id_1, code_points2)

    rb_ary_store(code_points2, 0l, INT2FIX(8734));
    💎PROCEDURE_01(obj_id_inf, code_points2)

    rb_ary_free(code_points2);
    rb_str_free(pack_as_utf8);

    unsigned long obj_id_inf_negative = NUM2ULONG(rb_obj_id(rb_const_get_at(R_NUM, rb_intern("EXPONENTIAL_NEGATIVE_INF"))));

    exponential_ids[0]  = obj_id_n9;
    exponential_ids[1]  = obj_id_n8;
    exponential_ids[2]  = obj_id_n7;
    exponential_ids[3]  = obj_id_n6;
    exponential_ids[4]  = obj_id_n5;
    exponential_ids[5]  = obj_id_n4;
    exponential_ids[6]  = obj_id_n3;
    exponential_ids[7]  = obj_id_n2;
    exponential_ids[8]  = obj_id_n1;
    exponential_ids[9]  = obj_id_0;
    exponential_ids[10] = obj_id_1;
    exponential_ids[11] = obj_id_2;
    exponential_ids[12] = obj_id_3;
    exponential_ids[13] = obj_id_4;
    exponential_ids[14] = obj_id_5;
    exponential_ids[15] = obj_id_6;
    exponential_ids[16] = obj_id_7;
    exponential_ids[17] = obj_id_8;
    exponential_ids[18] = obj_id_9;
    exponential_ids[19] = obj_id_inf;
    exponential_ids[20] = obj_id_inf_negative;
    exponential_ids[21] = obj_id_inf_complex;

    qsort(exponential_ids, NUM_EXPONENTS, sizeof(unsigned long), internal_only_compare_func_4_object_id);

    unsigned long * the_index;
    💎PROCEDURE_02(the_index, obj_id_n9, -9);
    💎PROCEDURE_02(the_index, obj_id_n8, -8);
    💎PROCEDURE_02(the_index, obj_id_n7, -7);
    💎PROCEDURE_02(the_index, obj_id_n6, -6);
    💎PROCEDURE_02(the_index, obj_id_n5, -5);
    💎PROCEDURE_02(the_index, obj_id_n4, -4);
    💎PROCEDURE_02(the_index, obj_id_n3, -3);
    💎PROCEDURE_02(the_index, obj_id_n2, -2);
    💎PROCEDURE_02(the_index, obj_id_n1, -1);
    💎PROCEDURE_02(the_index, obj_id_0, 0);
    💎PROCEDURE_02(the_index, obj_id_9, 9);
    💎PROCEDURE_02(the_index, obj_id_8, 8);
    💎PROCEDURE_02(the_index, obj_id_7, 7);
    💎PROCEDURE_02(the_index, obj_id_6, 6);
    💎PROCEDURE_02(the_index, obj_id_5, 5);
    💎PROCEDURE_02(the_index, obj_id_4, 4);
    💎PROCEDURE_02(the_index, obj_id_3, 3);
    💎PROCEDURE_02(the_index, obj_id_2, 2);
    💎PROCEDURE_02(the_index, obj_id_1, 1);
    💎PROCEDURE_02(the_index, obj_id_inf, CACHE_INDEX_INF);
    💎PROCEDURE_02(the_index, obj_id_inf_negative, CACHE_INDEX_INF_NEGATIVE);
    💎PROCEDURE_02(the_index, obj_id_inf_complex, CACHE_INDEX_INF_COMPLEX);

    //rb_gc_enable();
}

static inline void startup_step5_protect_against_gc(void) {
    rb_gc_register_address(& Ⓒset);
    rb_gc_register_address(& Ⓒtheta_angle);
    rb_gc_register_address(& Ⓒbig_decimal);
    rb_gc_register_address(& cached_global_sym_many_args);
    //rb_global_variable(& cached_global_sym_many_args);
    //rb_global_variable(& cached_module_param_err);
    rb_gc_verify_internal_consistency();
}

static inline void startup_step4_load_needed_ruuuby_files(void) {
    ensure_loaded_ruuuby(virtual/f10)

    ensure_all_loaded_for_attribute_includable()
    ensure_all_loaded_for_module()

    ensure_loaded_class(obj)
    ensure_loaded_class(re)
    ensure_loaded_ruuuby(arg_err)
    ensure_loaded_enumerable(ary)
    ensure_loaded_enumerable(hsh) // must be after{ary}

    ensure_all_loaded_for_nums()

    ensure_loaded_enumerable(set)

    ensure_loaded_attribute_extendable(syntax_cache)

    ensure_all_loaded_for_set_theory()

    ensure_loaded_class(sym) // must be after{attribute_cardinality}

    ensure_loaded_class(str) // must be after{attribute_syntax_cache, attribute_cardinality}
    ensure_loaded_io(file)    // must be after{attribute_syntax_cache}
    ensure_loaded_io(dir)    // must be after{attribute_syntax_cache}

    internal_only_prepare_f16(); // must be after{ruuuby/types, ruuuby/class/str}

    ensure_all_loaded_for_math_space()

    ensure_loaded_math(expr/seq/sequence)
    ensure_loaded_math(expr/seq/recursive)

    ensure_loaded_math(number_theory/number_theory) // must be after{expression/sequence/recursive_sequence}
    ensure_loaded_math(combinatorics/combinatorics)
    ensure_loaded_math(stats/stats)
    ensure_loaded_math(stats/time_series)
    ensure_loaded_math(stats/descriptive_stats)

    ensure_all_loaded_for_geometry()

    // [⚠️] : excluding: alternative files are loading these already:
    //          * ensure_loaded_ruuuby(ruuuby/metadata/ruuuby_metadata_constants)
    //          * ensure_loaded_ruuuby(version)
    // [⚠️] : reminder, do not load "ruuuby/ruuuby_orm" here

    ensure_all_loaded_for_ruuuby()
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

// | func{ary?}  |
ⓡ𝑓_kargs(m_obj_ary,
    if (argc == 0) {
        re_as_bool(is_ary(self))
    } else if (argc == 1) {
        💎parse_optional_arg_as_them()
        if (is_sym(them)) {
            if (them == n_no_empty) {
                if (is_ary(self)) {
                    if (is_empty_ary(self)) {re_no} else {re_ye}
                } else {re_no}
            } else {
                ERR_normalizer_invalid_value("ary?", them)
            }
        } else {🛑expected_sym("ary?", "normalizer", them)}
    } else {🛑expected_kargs("ary?", "0 or 1")}
)

// | func{bool?} |
ⓡ𝑓_def(m_obj_bool, re_as_bool(is_bool(self)))

// | func{hash?} |
ⓡ𝑓_def(m_obj_hash, re_as_bool(is_hsh(self)))

// | func{flt?}   |
ⓡ𝑓_def(m_obj_flt, re_as_bool(is_float(self)))

// | func{sym?}  |
ⓡ𝑓_kargs(m_obj_sym,
    if (argc == 0) {
        re_as_bool(is_sym(self))
    } else if (argc == 1) {
        💎parse_optional_arg_as_them()
        if (is_sym(them)) {
            if (them == n_in_set_superscripts) {
                if (is_sym(self)) {
                    const unsigned long id_to_find  = NUM2ULONG(rb_obj_id(self));
                    unsigned long *     the_result = bsearch_power(id_to_find);
                    if (the_result != NULL) {
                        const int power_to_raise_to = exponential_indexes[bsearch_power_position(the_result)];
                        if (power_to_raise_to < 10) {
                            return INT2NUM(power_to_raise_to);
                        } else if (power_to_raise_to > 1336 && power_to_raise_to < 1400) {
                            if (power_to_raise_to == CACHE_INDEX_INF) {
                                re_inf
                            } else if (power_to_raise_to == CACHE_INDEX_INF_NEGATIVE) {
                                return cached_flt_negative_inf;
                            } else {
                                re_inf_complex
                            }
                        } else {
                            re_no
                        }
                    } else {re_no}
                } else {re_no}
            } else {ERR_normalizer_invalid_value("sym?", them)}
        } else {🛑expected_sym("sym?", "normalizer", them)}
    } else {🛑expected_kargs("sym?", "0 or 1")}
)

// | func{int?}  |
ⓡ𝑓_kargs(m_obj_int,
    if (argc == 0) {
        re_as_bool(is_int(self))
    } else if (argc == 1) {
        💎parse_optional_arg_as_them()
        if (is_sym(them)) {
            if (is_fixnum(self)) {
                r_int_passes_normalizer(self, them, "int?", FIX2INT)
            } else if (is_bignum(self)) {
                r_int_passes_normalizer(self, them, "int?", NUM2INT)
            } else {re_no}
        } else {
            🛑expected_sym("int?", "normalizer", them)
        }
    } else {🛑expected_kargs("int?", "0 or 1")}
)

// | func{chr?} |
ⓡ𝑓_def(m_obj_chr, if (is_str(self)) {re_as_bool(len_str(self) == 1)} else {re_no})

// | func{set?} |
ⓡ𝑓_def(m_obj_set, return rb_obj_is_instance_of(self, Ⓒset);)

// | func{str?}  |
ⓡ𝑓_kargs(m_obj_str,
    if (argc == 0) {
        re_as_bool(is_str(self))
    } else if (argc == 1) {
        💎parse_optional_arg_as_them()
        if (NIL_P(them)) {
            rb_raise(R_ERR_ARG, "| c{%s}-> m{%s} with self{%"PRIsVALUE"} got null for optional arg |", rb_obj_classname(self), "str?", self);
        }
        if (is_sym(them)) {
            if (them == n_no_empty) {
                if (is_str(self)) {
                    if (is_empty_str(self)) {re_no} else {re_ye}
                } else {re_no}
            } else {
                ERR_normalizer_invalid_value("str?", them)
            }
        } else {
            raise_err_arg("| <%"PRIsVALUE">-> m{str?} given 1 arg expects type{Symbol}, not the received type{%s} from arg{%"PRIsVALUE"} |", self, rb_obj_classname(them), them);
        }
    } else {🛑expected_kargs("str?", "0 or 1")}
)

// | func(num?} |
ⓡ𝑓_kargs(m_obj_num,
    if (argc == 0) {
        re_as_bool(is_num(self))
    } else if (argc == 1) {
        💎parse_optional_arg_as_them()
        if (is_sym(them)) {
            if (is_fixnum(self)) {
                r_int_passes_normalizer(self, them, "num?", FIX2INT)
            } else if (is_bignum(self)) {
                r_int_passes_normalizer(self, them, "num?", NUM2INT)
            } else if (is_float(self)) {
                r_flt_passes_normalizer(self, them, "num?")
            } else if (is_non_simple_num(self)) {
                r_non_simple_num_passes_normalizer(self, them, "num?")
            } else if (is_str(self)) {
                r_str_passes_normalizer(self, them, "num?")
            } else {re_no}
        } else {🛑expected_sym("num?", "normalizer", them)}
    } else {🛑expected_kargs("num?", "0 or 1")}
)

/*___________________________________________________________________________________________________________________
       ___  ___  __   ___  __
| |\ |  |  |__  / _` |__  |__)
| | \|  |  |___ \__> |___ |  \
_____________________________________________________________________________________________________________________ */

// | func{finite?}   |
static VALUE m_int_is_finite(const VALUE self){re_ye}

// | func{infinite?} |
static VALUE m_int_is_not_finite(const VALUE self){re_no}

// | func{^}        |
ⓡ𝑓_self_them(m_int_patch_for_exponentials,
    if (is_fixnum(them)) {
        return INT2FIX(FIX2INT(self) ^ FIX2INT(them));
    } else if (is_bignum(them)) {
        return rb_big_xor(self, them);
    } else {
        const unsigned long id_to_find = NUM2ULONG(rb_obj_id(them));
        unsigned long * the_result    = bsearch_power(id_to_find)
        if (the_result != NULL) {
            const int power_to_raise_to = exponential_indexes[bsearch_power_position(the_result)];

            if (power_to_raise_to < 2) {
                switch(power_to_raise_to) {
                case -9: re_me_func_1args(ID_OF_POW, ℤn9)
                case -8: re_me_func_1args(ID_OF_POW, ℤn8)
                case -7: re_me_func_1args(ID_OF_POW, ℤn7)
                case -6: re_me_func_1args(ID_OF_POW, ℤn6)
                case -5: re_me_func_1args(ID_OF_POW, ℤn5)
                case -4: re_me_func_1args(ID_OF_POW, ℤn4)
                case -3: re_me_func_1args(ID_OF_POW, ℤn3)
                case -2: re_me_func_1args(ID_OF_POW, ℤn2)
                case -1: return rb_rational_new(ℤ1, self);
                case 0:  re_1
                default: re_me
                }
            } else if (power_to_raise_to < 10) {
                //const int val_self = NUM2INT(self);
                switch(power_to_raise_to) {
                case 2:  re_me_func_1args(ID_OF_POW, ℤ2)
                case 3:  re_me_func_1args(ID_OF_POW, ℤ3)
                case 4:  re_me_func_1args(ID_OF_POW, ℤ4)
                case 5:  re_me_func_1args(ID_OF_POW, ℤ5)
                case 6:  re_me_func_1args(ID_OF_POW, ℤ6)
                case 7:  re_me_func_1args(ID_OF_POW, ℤ7)
                case 8:  re_me_func_1args(ID_OF_POW, ℤ8)
                default: re_me_func_1args(ID_OF_POW, ℤ9)
                }
            } else {
                const int val_self = NUM2INT(self);

                if (power_to_raise_to == CACHE_INDEX_INF_COMPLEX) {
                    if (val_self == 0) {
                        re_0
                    } else {
                        re_nan
                    }
                }

                if (val_self == 1 || val_self == -1) {
                    re_nan
                } else if (val_self == 0) {
                    if (power_to_raise_to == CACHE_INDEX_INF) {
                        re_0
                    } else {
                        re_inf_complex
                    }
                } else if (power_to_raise_to == CACHE_INDEX_INF_NEGATIVE) {
                    re_0
                } else if (val_self > 1) {
                    re_inf
                } else {
                    re_negative_inf
                }
            }
        } else {
            ERR_c_self_arg_err__print_self_them("| c{Integer}-> m{^} self(%"PRIsVALUE") unable to match exponential(%"PRIsVALUE") |")
        }
    }
)

/*___________________________________________________________________________________________________________________
 ___       __       ___
|__  |    /  \  /\   |
|    |___ \__/ /~~\  |
_____________________________________________________________________________________________________________________ */

// | func{one?} |
ⓡ𝑓_def(m_flt_is_one, re_me_eq_to(ℤd1);)

// | func{has_decimals?} |
ⓡ𝑓_def(m_flt_has_decimals, return r_flt_has_decimals(NUM2DBL(self));)

// | func{smells_like_int?} |
ⓡ𝑓_def(m_flt_smells_like_int, return r_flt_smells_like_int(NUM2DBL(self));)

// original source code referenced from:
// @see https://floating-point-gui.de/errors/NearlyEqualsTest.java
//
// | func{≈≈} |
ⓡ𝑓_self_them(m_flt_basically_equal,
    if (rb_obj_equal(self, them) || self == them) {re_ye}
    else if (!is_int_or_flt(them)) {re_no} else {
        const double val_self = NUM2DBL(self);
        const double val_them = NUM2DBL(them);
        if (val_self == val_them) {re_ye} else {
            const double abs_a  = fabs(val_self);
            const double abs_b  = fabs(val_them);
            const double diff   = fabs(val_self - val_them);
            const double summed = abs_a + abs_b;
            if (val_self == 0.0 || val_them == 0.0 || (summed < M_FLT_EPSILON)) {
                re_as_bool(diff < (M_FLT_RELATIVE_ERROR * M_FLT_EPSILON))
            } else {
                if (summed <= M_FLT_MAX) {
                    re_as_bool((diff / summed) < M_FLT_EPSILON)
                } else {
                    re_as_bool((diff / M_FLT_MAX) < M_FLT_RELATIVE_ERROR)
                }
            }
        }
    }
)

// | func{^} |
ⓡ𝑓_self_them(m_flt_patch_for_exponentials,
    if (is_sym(them)) {
        const unsigned long id_to_find = NUM2ULONG(rb_obj_id(them));
        unsigned long * the_result    = bsearch_power(id_to_find);
        if (the_result != NULL) {
            const double val_self = NUM2DBL(self);
            if (isnan(val_self)) {
                raise_err_runtime("c{Float}-> m{^} self{%"PRIsVALUE"} may not be raised to an exponential power |", self)
            }
            const int power_to_raise_to = exponential_indexes[bsearch_power_position(the_result)];
            if (val_self == 0.0 && power_to_raise_to < 0) {
                raise_err_zero_division("c{Float}-> m{^} self{%"PRIsVALUE"} may not be raised to the negative power{%d} |", self, power_to_raise_to)
            }
            if (power_to_raise_to < 10) {
                switch(power_to_raise_to) {
                case -9: re_me_func_1args(ID_OF_POW, ℤn9)
                case -8: re_me_func_1args(ID_OF_POW, ℤn8)
                case -7: re_me_func_1args(ID_OF_POW, ℤn7)
                case -6: re_me_func_1args(ID_OF_POW, ℤn6)
                case -5: re_me_func_1args(ID_OF_POW, ℤn5)
                case -4: re_me_func_1args(ID_OF_POW, ℤn4)
                case -3: re_me_func_1args(ID_OF_POW, ℤn3)
                case -2: re_me_func_1args(ID_OF_POW, ℤn2)
                case -1: re_me_func_1args(ID_OF_POW, ℤn1)
                case 0:  if (isinf(val_self)) {re_nan} else { re_1 }
                case 1:  re_me
                case 2:  re_me_func_1args(ID_OF_POW, ℤ2)
                case 3:  re_me_func_1args(ID_OF_POW, ℤ3)
                case 4:  re_me_func_1args(ID_OF_POW, ℤ4)
                case 5:  re_me_func_1args(ID_OF_POW, ℤ5)
                case 6:  re_me_func_1args(ID_OF_POW, ℤ6)
                case 7:  re_me_func_1args(ID_OF_POW, ℤ7)
                case 8:  re_me_func_1args(ID_OF_POW, ℤ8)
                case 9:  re_me_func_1args(ID_OF_POW, ℤ9)
                default: raise_err_runtime("| c{Float}-> m{^} self(%"PRIsVALUE") unable to match exponential(%"PRIsVALUE") |", self, them)
                }
            } else {
                if (val_self == 1.0 || val_self == -1.0) {
                    re_nan
                } else if (power_to_raise_to == CACHE_INDEX_INF) {
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
                } else if (power_to_raise_to == CACHE_INDEX_INF_NEGATIVE) {
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
        } else {ERR_c_self_arg_err__print_self_them("| c{Float}-> m{^} self(%"PRIsVALUE") unable to match exponential(%"PRIsVALUE") |")}
    } else {
        ERR_c_self_arg_err__print_self_them("| c{Float}-> m{^} self(%"PRIsVALUE") unable to match exponential(%"PRIsVALUE") |")
    }
)

/*___________________________________________________________________________________________________________________

|\ | | |
| \| | |___
_____________________________________________________________________________________________________________________ */

static VALUE m_nil_empty(const VALUE self) {re_ye}

/*___________________________________________________________________________________________________________________
 __   __   __           __             __   __   ___  __
|__) /  \ /  \ |       /  ` |     /\  /__` /__` |__  /__`
|__) \__/ \__/ |___    \__, |___ /~~\ .__/ .__/ |___ .__/
_____________________________________________________________________________________________________________________ */

ⓡ𝑓(m_bool_to_b, re_me) // func{to_b}

ⓡ𝑓(m_true_to_i, re_1)  // func{to_i}

ⓡ𝑓(m_false_to_i, re_0) // func{to_i}

/*____________________________________________________________________________________________________________________
 __     ___     __                   __
/__`     |     |__)    |    |\ |    / _`
.__/     |     |  \    |    | \|    \__>
_____________________________________________________________________________________________________________________ */

// | function{>>} |
ⓡ𝑓_self_them(m_str_prepend,
    if (is_str(them)) {
        if (is_empty_str(them)) {
            re_me
        } else {
            r_str_pre_modify(self)
            r_str_prepend(self, them)
            re_me
        }
    } else {
        ERR_c_self_got_non_str_param(">>", them)
    }
)

/*___________________________________________________________________________________________________________________
         __      __
 /\     |__)    |__)     /\     \ /
/~~\    |  \    |  \    /~~\     |
_____________________________________________________________________________________________________________________ */

// | function{>>} |
ⓡ𝑓_self_them(m_ary_prepend,
    r_ary_pre_modify(self)
    r_ary_prepend(self, them)
    re_me
)

// | function{remove_empty!} |
ⓡ𝑓_def(m_ary_remove_empty,
    r_ary_pre_modify(self)
    long len_me = len_ary(self);
    if (len_me == 0){re_me}
    long i;
    int delete_node = 0;
    VALUE v;
    for (i = 0; i < len_me;) {
        v = r_ary_get(self, i)
        if (is_nil(v)) {
            r_ary_del(self, i);
            --len_me;
        } else {
            delete_node = 0;
            switch(TYPE(v)) {
                case RUBY_T_NIL:
                    delete_node = 1; break;
                case RUBY_T_STRING:
                    if (is_empty_str(v)) {delete_node = 1;} ; break;
                case RUBY_T_ARRAY:
                    if (is_empty_ary(v)) {delete_node = 1;} ; break;
                case RUBY_T_HASH:
                    if (is_empty_hsh(v)) {delete_node = 1;} ; break;
                default:
                    if (is_empty_generic(v)) {
                        delete_node = 1;
                    }
                    break;
            }
            if (delete_node) {
                r_ary_del(self, i);
                --len_me;
            } else {
                ++i;
            }
        }
    }
    re_me
)

// | func{disjunctive_union} |
ⓡ𝑓_self_them(m_ary_disjunctive_union,
    if (is_ary(them)) {
        const long len_me   = len_ary(self);
        const long len_them = len_ary(them);
        if ((len_me == 0 && len_them == 0) || len_them == 0) {
            re_me
        } else if (len_me == 0) {
            return them;
        } else {
            long  i = 0L;
            VALUE n;
            VALUE output = 💎new_ary(len_me + len_them);
            if (len_me >= len_them) {
                for (; i < len_them; i++) {
                    n = r_ary_get(them, i) if(!r_ary_has(self, n)){r_ary_add(output, n)}
                    n = r_ary_get(self, i) if(!r_ary_has(them, n)){r_ary_add(output, n)}
                }
                for (; i < len_me; i++) {
                    n = r_ary_get(self, i) if(!r_ary_has(them, n)){r_ary_add(output, n)}
                }
            } else {
                for (; i < len_me; i++) {
                    n = r_ary_get(self, i) if(!r_ary_has(them, n)){r_ary_add(output, n)}
                    n = r_ary_get(them, i) if(!r_ary_has(self, n)){r_ary_add(output, n)}
                }
                for (; i < len_them; i++) {
                    n = r_ary_get(them, i) if(!r_ary_has(self, n)){r_ary_add(output, n)}
                }
            }
            return output;
        }
    } else {ERR_c_self_got_non_ary_param("disjunctive_union", them)}
)

/*___________________________________________________________________________________________________________________
      __   __             ___
|\/| /  \ |  \ |  | |    |__
|  | \__/ |__/ \__/ |___ |___
_____________________________________________________________________________________________________________________ */

// | function(⨍_add_aliases} |
ⓡ𝑓_self_a_b(m_module_add_aliases,
    if (is_ary(param_b)) {
        const long len_them = len_ary(param_b);
        if (len_them == 0) {raise_err_arg("| module-function{f_add_aliases} for self{%"PRIsVALUE"} of type{%s} received an empty array |", self, rb_obj_classname(self))}
        long i;
        VALUE v;
        ID old_id = rb_check_id(& param_a);
        for (i = 0; i < len_them; i++) {
            v = r_ary_get(param_b, i)
            if (is_sym(v)) {
                rb_alias(self, rb_to_id(v), old_id);
            } else {
                raise_err_arg("| module-function{f_add_aliases} for self{%"PRIsVALUE"} of type{%s} received a non-symbol{%s} as one of the array-arg's elements |", self, rb_obj_classname(self), rb_obj_classname(v))
            }
        }
        //rb_gc_force_recycle(param_b);
        rb_ary_free(param_b);
        re_me
    } else {ERR_m_param_type("Module", "f_add_aliases", "func_aliases", param_b, "Array")}
)

/*____________________________________________________________________________________________________________________
___       ___ ___                    __        ___
 |  |__| |__   |   /\      /\  |\ | / _` |    |__
 |  |  | |___  |  /~~\    /~~\ | \| \__> |___ |___
_____________________________________________________________________________________________________________________ */

static VALUE θ_m_get_size(const VALUE self) {
    //ptrθ data; 💎parse_ptrθ(self, data);
    return UINT2NUM((unsigned int) rb_obj_memsize_of(self));
}

static void θ_set_value(const ptrθ data, const double value) {
    if (!(ptrθ_flag_is_constant(data))) { //&& data->angle_value != value
        data->angle_value = value;
        ptrθ_flag_clr_cache_synced(data);
        if (value == 0.0) {
            ptrθ_flag_set_is_zero(data);
            ptrθ_flag_set_is_positive(data);
            ptrθ_flag_set_is_normal(data);
            ptrθ_flag_clr_perigon(data);
        } else if (value > 0.0) {
            ptrθ_flag_set_is_positive(data);
            ptrθ_flag_clr_is_zero(data);
            const double max_value = vocab_value_perigon(data->angle_mode);
            if (value == max_value) {
                ptrθ_flag_set_is_normal(data);
            } else if (value < max_value) {
                ptrθ_flag_set_is_normal(data);
                ptrθ_flag_set_perigon(data);
            } else {
                ptrθ_flag_clr_is_normal(data);
            }
        } else {
            ptrθ_flag_clr_is_positive(data);
            ptrθ_flag_clr_is_zero(data);
            const double max_value = vocab_value_perigon(data->angle_mode);
            if (value == max_value) {
                ptrθ_flag_set_is_normal(data);
            } else if (value > max_value) {
                ptrθ_flag_set_is_normal(data);
                ptrθ_flag_set_perigon(data);
            } else {
                ptrθ_flag_clr_is_normal(data);
            }
        }
    } else {
        rb_raise(R_ERR_RUNTIME, "| c{ThetaAngle}-> internal m{set_value} can\'t be called on a constant ThetaAngle |");
    }
}

static inline long double θ_get_val_precise_as_mode(const unsigned char angle_mode, const ptrθ them) {
    if (angle_mode == them->angle_mode) {
        return (long double) them->angle_value;
    } else if (them->angle_mode == THETA_MODE_ID_DGR) {
        if (angle_mode == THETA_MODE_ID_RAD) {
            return θDGRL2LRAD((long double) them->angle_value);
        } else if (angle_mode == THETA_MODE_ID_TRN) {
            return θDGRL2LTRN((long double) them->angle_value);
        } else {
            return θDGRL2LGON((long double) them->angle_value);
        }
    } else if (them->angle_mode == THETA_MODE_ID_RAD) {
        if (angle_mode == THETA_MODE_ID_DGR) {
            return θRADL2LDGR((long double) them->angle_value);
        } else if (angle_mode == THETA_MODE_ID_TRN) {
            return θRADL2LTRN((long double) them->angle_value);
        } else {
            return θRADL2LGON((long double) them->angle_value);
        }
    } else if (them->angle_mode == THETA_MODE_ID_TRN) {
        if (angle_mode == THETA_MODE_ID_DGR) {
            return θTRNL2LDGR((long double) them->angle_value);
        } else if (angle_mode == THETA_MODE_ID_RAD) {
            return θTRNL2LRAD((long double) them->angle_value);
        } else {
            return θTRNL2LGON((long double) them->angle_value);
        }
    } else {
        if (angle_mode == THETA_MODE_ID_DGR) {
            return θGONL2LDGR((long double) them->angle_value);
        } else if (angle_mode == THETA_MODE_ID_RAD) {
            return θGONL2LRAD((long double) them->angle_value);
        } else if (angle_mode == THETA_MODE_ID_TRN) {
            return θGONL2LTRN((long double) them->angle_value);
        } else {
            return θGONL2LRAD((long double) them->angle_value);
        }
    }
}

static inline double θ_get_val_as_mode(const unsigned char angle_mode, const ptrθ them) {
    if (angle_mode == them->angle_mode) {
        return them->angle_value;
    } else if (them->angle_mode == THETA_MODE_ID_DGR) {
        if (angle_mode == THETA_MODE_ID_RAD) {
            return θDGR2RAD(them->angle_value);
        } else if (angle_mode == THETA_MODE_ID_TRN) {
            return θDGR2TRN(them->angle_value);
        } else {
            return θDGR2GON(them->angle_value);
        }
    } else if (them->angle_mode == THETA_MODE_ID_RAD) {
        if (angle_mode == THETA_MODE_ID_DGR) {
            return θRAD2DGR(them->angle_value);
        } else if (angle_mode == THETA_MODE_ID_TRN) {
            return θRAD2TRN(them->angle_value);
        } else {
            return θRAD2GON(them->angle_value);
        }
    } else if (them->angle_mode == THETA_MODE_ID_TRN) {
        if (angle_mode == THETA_MODE_ID_DGR) {
            return θTRN2DGR(them->angle_value);
        } else if (angle_mode == THETA_MODE_ID_RAD) {
            return θTRN2RAD(them->angle_value);
        } else {
            return θTRN2GON(them->angle_value);
        }
    } else {
        if (angle_mode == THETA_MODE_ID_DGR) {
            return θGON2DGR(them->angle_value);
        } else if (angle_mode == THETA_MODE_ID_RAD) {
            return θGON2RAD(them->angle_value);
        } else if (angle_mode == THETA_MODE_ID_TRN) {
            return θGON2TRN(them->angle_value);
        } else {
            return θGON2RAD(them->angle_value);
        }
    }
}

static inline double ptrθ_get_val_from_θ(const ptrθ self, const ptrθ them) {
    return θ_get_val_as_mode(self->angle_mode, them);
}

static VALUE θ_equals_θ(const ptrθ a, const ptrθ b) {
    re_as_bool(a->angle_value == ptrθ_get_val_from_θ(a, b))
}

static VALUE θVAL_equals_θVAL(const VALUE a, const VALUE b) {
    ptrθ data_a; 💎parse_ptrθ(a, data_a);
    ptrθ data_b; 💎parse_ptrθ(b, data_b);
   return θ_equals_θ(data_a, data_b);
}

static inline double ptrθ_get_val_from_VALUE(const ptrθ self, const VALUE value) {
    if (is_int(value) || is_float(value)) {
        return NUM2DBL(value);
    } else if (is_theta_angle(value)) {
        ptrθ data_them; 💎parse_ptrθ(value, data_them);
        return ptrθ_get_val_from_θ(self, data_them);
    } else {
        rb_raise(R_ERR_RUNTIME, "| c{ThetaAngle}-> got arg{%"PRIsVALUE"} that should be an int, float, or ThetaAngle |", value);
    }
}

static inline double ptrθ_get_const_quadrant(const ptrθ data) {
    switch(data->angle_mode) {
    case THETA_MODE_ID_RAD: return THETA_RAD_QUADRANT;
    case THETA_MODE_ID_DGR: return THETA_DGR_QUADRANT;
    case THETA_MODE_ID_TRN: return THETA_TRN_QUADRANT;
    default:                return THETA_GON_QUADRANT;
    }
}

static inline double ptrθ_get_const_straight(const ptrθ data) {
    switch(data->angle_mode) {
    case THETA_MODE_ID_RAD: return THETA_RAD_STRAIGHT;
    case THETA_MODE_ID_DGR: return THETA_DGR_STRAIGHT;
    case THETA_MODE_ID_TRN: return THETA_TRN_STRAIGHT;
    default:                return THETA_GON_STRAIGHT;
    }
}

static inline double ptrθ_get_const_perigon(const ptrθ data) {
    switch(data->angle_mode) {
    case THETA_MODE_ID_RAD: return THETA_RAD_PERIGON;
    case THETA_MODE_ID_DGR: return THETA_DGR_PERIGON;
    case THETA_MODE_ID_TRN: return THETA_TRN_PERIGON;
    default:                return THETA_GON_PERIGON;
    }
}

static inline double ptrθ_get_const_perigon_minus_quadrant(const ptrθ data) {
    switch(data->angle_mode) {
    case THETA_MODE_ID_RAD: return THETA_RAD_PERIGON_MINUS_QUADRANT;
    case THETA_MODE_ID_DGR: return THETA_DGR_PERIGON_MINUS_QUADRANT;
    case THETA_MODE_ID_TRN: return THETA_TRN_PERIGON_MINUS_QUADRANT;
    default:                return THETA_GON_PERIGON_MINUS_QUADRANT;
    }
}

static inline void ptrθ_addition_w_double       (const ptrθ data, const double value) {θ_set_value(data, data->angle_value + value);}
static inline void ptrθ_subtraction_w_double    (const ptrθ data, const double value) {θ_set_value(data, data->angle_value - value);}
static inline void ptrθ_multiplication_w_double (const ptrθ data, const double value) {θ_set_value(data, data->angle_value * value);}
static inline void ptrθ_division_w_double       (const ptrθ data, const double value) {θ_set_value(data, data->angle_value / value);}

static VALUE θ_m_modulo(const VALUE self, const VALUE value) {
    💎self_to_ptrθ_data
    if (is_int(value) || is_float(value)) {
        const long double val_them = (long double) ptrθ_get_val_from_VALUE(data, value);
        const long double val_self = (long double) data->angle_value;
        return θ_new(fmodl(val_self, val_them), cθ_get_repr(data->angle_mode));
    } else if (is_theta_angle(value)) {
        const long double val_them = (long double) ptrθ_get_val_from_VALUE(data, value);
        const long double val_self = (long double) data->angle_value;
        if (ptrθ_flag_is_coerce(data)) {
            ptrθ_flag_clr_coerce(data);
            return θ_new(fmodl(val_self, val_them), cθ_get_repr(data->angle_mode));
        } else {
            return DBL2NUM(fmodl(val_self, val_them));
        }
    } else {
        rb_raise(R_ERR_RUNTIME, "| c{ThetaAngle}-> m{modulo} requires are of type Numeric or ThetaAngle |");
    }
}

static VALUE θ_m_modulo_eq(const VALUE self, const VALUE value) {
    💎self_to_ptrθ_data
    if (RB_OBJ_FROZEN(self) || ptrθ_flag_is_constant(data)) {
        rb_raise(R_ERR_RUNTIME, "| c{ThetaAngle}-> m{modulo=} may not be called on a frozen and/or constant ThetaAngle |");
    }
    const long double val_them = (long double) ptrθ_get_val_from_VALUE(data, value);
    const long double val_self = (long double) data->angle_value;
    θ_set_value(data, fmodl(val_self, val_them));
    re_me
}

static VALUE θ_m_coerce(const VALUE self, const VALUE them) {
    if (is_num(them)) {
        💎self_to_ptrθ_data
        VALUE theta = θ_new(NUM2DBL(them), cθ_get_repr(data->angle_mode));
        ptrθ the_new_theta; 💎parse_ptrθ(theta, the_new_theta);
        ptrθ_flag_set_coerce(the_new_theta);
        ptrθ_flag_clr_constant(the_new_theta);
        return 💎new_ary_size2(theta, self);
    } else {
        return Qnil;
    }
}

static VALUE θ_m_multiplication_eq(const VALUE self, const VALUE value) {
    💎self_to_ptrθ_data
    if (RB_OBJ_FROZEN(self) || ptrθ_flag_is_constant(data)) {
        rb_raise(R_ERR_RUNTIME, "| c{ThetaAngle}-> m{*} may not be called on a frozen and/or constant ThetaAngle |");
    }
    ptrθ_multiplication_w_double(data, ptrθ_get_val_from_VALUE(data, value));
    re_me
}

static VALUE θ_m_division(const VALUE self, const VALUE them) {
    💎self_to_ptrθ_data
    if (is_int(them)) {
        return θ_new(data->angle_value / ptrθ_get_val_from_VALUE(data, them), cθ_get_repr(data->angle_mode));
    } else if (is_float(them)) {
        return θ_new(data->angle_value / ptrθ_get_val_from_VALUE(data, them), cθ_get_repr(data->angle_mode));
    } else if (is_theta_angle(them)) {
        if (ptrθ_flag_is_coerce(data)) {
            ptrθ_flag_clr_coerce(data);
            return θ_new(data->angle_value / ptrθ_get_val_from_VALUE(data, them), cθ_get_repr(data->angle_mode));
        } else {
            return DBL2NUM(data->angle_value / ptrθ_get_val_from_VALUE(data, them));
        }
    } else {
        rb_raise(R_ERR_ARG, "| c{ThetaAngle}-> m{/} requires arg of type{Numeric} or {ThetaAngle}, not{%"PRIsVALUE"} |", them);
    }
}

static VALUE θ_m_division_eq(const VALUE self, const VALUE value) {
    💎self_to_ptrθ_data
    if (RB_OBJ_FROZEN(self) || ptrθ_flag_is_constant(data)) {
        rb_raise(R_ERR_RUNTIME, "| c{ThetaAngle}-> m{/} may not be called on a frozen and/or constant ThetaAngle |");
    }
    ptrθ_division_w_double(data, ptrθ_get_val_from_VALUE(data, value));
    re_me
}

static VALUE θ_m_addition_eq(const VALUE self, const VALUE value) {
    💎self_to_ptrθ_data
    if (RB_OBJ_FROZEN(self) || ptrθ_flag_is_constant(data)) {
        rb_raise(R_ERR_RUNTIME, "| c{ThetaAngle}-> m{+} may not be called on a frozen and/or constant ThetaAngle |");
    }
    ptrθ_addition_w_double(data, ptrθ_get_val_from_VALUE(data, value));
    re_me
}

static VALUE θ_m_subtraction_eq(const VALUE self, const VALUE value) {
    💎self_to_ptrθ_data
    if (RB_OBJ_FROZEN(self) || ptrθ_flag_is_constant(data)) {
        rb_raise(R_ERR_RUNTIME, "| c{ThetaAngle}-> m{-} may not be called on a frozen and/or constant ThetaAngle |");
    }
    ptrθ_subtraction_w_double(data, ptrθ_get_val_from_VALUE(data, value));
    re_me
}

static VALUE θ_m_subtraction(const VALUE self, const VALUE value) {
    💎self_to_ptrθ_data
    return θ_new(data->angle_value - ptrθ_get_val_from_VALUE(data, value), cθ_get_repr(data->angle_mode));
}

static VALUE θ_m_unary_not(const VALUE self) {
    💎self_to_ptrθ_data
    ptrθ_multiplication_w_double(data, -1.0);
    re_me
}

static VALUE θ_m_unary_complement(const VALUE self) {
    💎self_to_ptrθ_data
    const long double val = (long double) data->angle_value;
    if (val == 0.0L) {re_me}
    switch(data->angle_mode) {
    case THETA_MODE_ID_RAD:
        θ_set_value(data, (double) fmodl(val + πL, 2.0L * πL));
        break;
    case THETA_MODE_ID_DGR:
        θ_set_value(data, (double) fmodl(val + 180.0L, 360.0L));
        break;
    case THETA_MODE_ID_TRN:
        θ_set_value(data, (double) fmodl(val + 0.5L, 1.0L));
        break;
    default:
        θ_set_value(data, (double) fmodl(val + 200.0L, 400.0L));
        break;
    }
    re_me
}

static VALUE θ_m_unary_subtraction(const VALUE self) {
    💎self_to_ptrθ_data
    if (ptrθ_flag_is_zero(data)) {
        re_me
    } else if (ptrθ_flag_is_positive(data)) {
        const double val_self = ptrθ_normalize_and_get_val(data);
        switch(data->angle_mode) {
        case THETA_MODE_ID_RAD:
            θ_set_value(data, val_self - 𝞽);
            break;
        case THETA_MODE_ID_DGR:
            θ_set_value(data, val_self - 360.0);
            break;
        case THETA_MODE_ID_TRN:
            θ_set_value(data, val_self - 1.0);
            break;
        default:
            θ_set_value(data, val_self - 400.0);
            break;
        }
    } else {
        const double val_self = ptrθ_normalize_and_get_val(data);
        switch(data->angle_mode) {
        case THETA_MODE_ID_RAD:
            θ_set_value(data, 𝞽 + val_self);
            break;
        case THETA_MODE_ID_DGR:
            θ_set_value(data, 360.0 + val_self);
            break;
        case THETA_MODE_ID_TRN:
            θ_set_value(data, 1.0 + val_self);
            break;
        default:
            θ_set_value(data, 400.0 + val_self);
            break;
        }
    }
    re_me
}

static VALUE θ_m_unary_addition(const VALUE self) {re_me}

ptrθ_func_1arg(θ_m_addition,       return θ_new(data->angle_value + ptrθ_get_val_from_VALUE(data, them), cθ_get_repr(data->angle_mode));)
ptrθ_func_1arg(θ_m_multiplication, return θ_new(data->angle_value * ptrθ_get_val_from_VALUE(data, them), cθ_get_repr(data->angle_mode));)

ptrθ_func(θ_m_normalize,
    VALUE normalized_angle = θ_new(θ_get_normalized_value(data->angle_value, data->angle_mode), cθ_get_repr(data->angle_mode));
    ptrθ normalized_data; 💎parse_ptrθ(normalized_angle, normalized_data);
    θ_set_value(normalized_data, normalized_data->angle_value);
    return normalized_angle;
)

ptrθ_func(θ_m_is_positive,  re_as_bool(data->angle_value > 0.0))
ptrθ_func(θ_m_is_negative,  re_as_bool(data->angle_value < 0.0))
ptrθ_func(θ_m_is_zero,      re_as_bool(data->angle_value == 0.0))
ptrθ_func(θ_get_is_radians, re_as_bool(data->angle_mode == THETA_MODE_ID_RAD))
ptrθ_func(θ_get_is_degrees, re_as_bool(data->angle_mode == THETA_MODE_ID_DGR))
ptrθ_func(θ_get_is_gons,    re_as_bool(data->angle_mode == THETA_MODE_ID_GON))
ptrθ_func(θ_get_is_turns,   re_as_bool(data->angle_mode == THETA_MODE_ID_TRN))
ptrθ_func(θ_m_get_windings, return INT2NUM((int) (θ_get_val_as_mode(THETA_MODE_ID_RAD, data) / 𝞽));)
ptrθ_func(θ_m_get_repr,     return cθ_get_repr(data->angle_mode);)
ptrθ_func(θ_m_is_normal,    re_as_bool(ptrθ_flag_is_normal(data)))

static VALUE θ_m_abs(const VALUE self) {
    💎self_to_ptrθ_data
    if (NO_MATCH_FOR_θ(data, FLAGS_ZERO_AND_POSITIVE)) {
        return θ_new(-1.0 * data->angle_value, cθ_get_repr(data->angle_mode));
    }
    return θ_new(data->angle_value, cθ_get_repr(data->angle_mode));
}

static VALUE θ_m_abs_self(VALUE self) {
    💎self_to_ptrθ_data
    if (NO_MATCH_FOR_θ(data, FLAGS_ZERO_AND_POSITIVE)) {
        ptrθ_multiplication_w_double(data, -1.0);
    }
    re_me
}

static VALUE θ_m_comparable(const VALUE self, const VALUE them) {
    if (is_theta_angle(them)) {
        💎self_to_ptrθ_data
        const double val_them = ptrθ_get_val_from_VALUE(data, them);
        if (data->angle_value > val_them) {
            re_1
        } else if (data->angle_value == val_them) {
            re_0
        } else {
            re_n1
        }
    } else {re_nil}
}

static VALUE θ_m_get_flags(const VALUE self) {
    💎self_to_ptrθ_data
    return INT2NUM((int) data->flags_meta_data.generic_byte);
}

static VALUE θ_m_init_as_dgr(VALUE self, const VALUE angle) {💎θ_INIT_AS(angle, THETA_MODE_ID_DGR, THETA_MODE_DGR, "angle_val_as_degree")}
static VALUE θ_m_init_as_rad(VALUE self, const VALUE angle) {💎θ_INIT_AS(angle, THETA_MODE_ID_RAD, THETA_MODE_RAD, "angle_val_as_radian")}
static VALUE θ_m_init_as_gon(VALUE self, const VALUE angle) {💎θ_INIT_AS(angle, THETA_MODE_ID_GON, THETA_MODE_GON, "angle_val_as_gon")}
static VALUE θ_m_init_as_trn(VALUE self, const VALUE angle) {💎θ_INIT_AS(angle, THETA_MODE_ID_TRN, THETA_MODE_TRN, "angle_val_as_turn")}

static VALUE θ_m_initialize(VALUE self, const VALUE angle, const VALUE angle_mode) {
    ERR_is_num("ThetaAngle", "new", "angle_value", angle)
    💎self_to_ptrθ_data
    if (is_fixnum(angle_mode)) {
        const unsigned char as_fixnum = (unsigned char) RB_FIX2INT(angle_mode);
        if (as_fixnum == THETA_MODE_ID_RAD) {
            data->angle_mode = THETA_MODE_ID_RAD;
        } else if (as_fixnum == THETA_MODE_ID_DGR) {
            data->angle_mode = THETA_MODE_ID_DGR;
        } else if (as_fixnum == THETA_MODE_ID_TRN) {
            data->angle_mode = THETA_MODE_ID_TRN;
        } else if (as_fixnum == THETA_MODE_ID_GON) {
            data->angle_mode = THETA_MODE_ID_GON;
        } else {
            rb_raise(R_ERR_ARG, "| c{ThetaAngle}-> m{new} unable to parse the 2nd arg(angle_mode){%"PRIsVALUE"} w/ type{%s} |", angle_mode, rb_obj_classname(angle_mode));
        }
    } else {
        rb_raise(R_ERR_ARG, "| c{ThetaAngle}-> m{new} unable to parse 2nd arg(angle_mode){%"PRIsVALUE"} w/ type{%s} |", angle_mode, rb_obj_classname(angle_mode));
    }
    const double the_value = NUM2DBL(angle);
    data->angle_value = the_value;
    if (the_value == 0.0) {
        SET_FLAGS(data, FLAGS_NON_CONST_ZERO)
    } else if (the_value > 0.0) {
        const double max_normal = vocab_value_perigon(data->angle_mode);
        if (the_value <= max_normal) {
            SET_FLAGS(data, FLAGS_NON_CONST_POSITIVE_NORMAL)
        } else {
            SET_FLAGS(data, FLAGS_NON_CONST_POSITIVE_NOT_NORMAL)
        }
    } else {
        const double max_normal = vocab_value_perigon_negative(data->angle_mode);
        if (the_value >= max_normal) {
            SET_FLAGS(data, FLAGS_NON_CONST_NEGATIVE_NORMAL)
        } else {
            SET_FLAGS(data, FLAGS_NON_CONST_NEGATIVE_NOT_NORMAL)
        }
    }
    return self;
}

static inline VALUE cθ_get_repr(const unsigned char angle_mode) {θ_ID2MODE(angle_mode);}

static VALUE θ_m_equals(const VALUE self, const VALUE them) {
    if (is_theta_angle(them)) {
        return θVAL_equals_θVAL(self, them);
    } else if (is_num(them)) {
        return θVAL_equals_NUM(self, them);
    } else {
        re_no
    }
}

static double θ_get_abs_normalized_value(ptrθ data) {
    double value = θ_get_normalized_value(data->angle_value, data->angle_mode);
    if (value < 0.0) {
        return value * -1.0;
    }
    return value;
}

static double θ_get_normalized_value(const double value, const unsigned char angle_mode) {
    if (value == 0.0) {
        return value;
    } else if (value > 0.0) {
        const double max_normal = vocab_value_perigon(angle_mode);
        if (value <= max_normal) {
            return value;
        } else {
            return fmod(value, max_normal);
        }
    } else {
        const double max_normal = vocab_value_perigon_negative(angle_mode);
        if (value >= max_normal) {
            return value;
        } else {
            return fmod(value, max_normal);
        }
    }
}

static double ptrθ_normalize_and_get_val(ptrθ data) {
    if (NO_MATCH_FOR_θ(data, FLAGS_NORMAL)) {
        const double new_value = θ_get_normalized_value(data->angle_value, data->angle_mode);
        θ_set_value(data, new_value);
        return new_value;
    }
    return data->angle_value;
}

static VALUE θ_m_normalize_self(VALUE self) {
    💎self_to_ptrθ_data
    ptrθ_normalize_and_get_val(data);
    re_me
}

ptrθ_func(θ_get_as_radian,
    switch(data->angle_mode) {
    case THETA_MODE_ID_TRN:
        return DBL2NUM(θTRN2RAD(data->angle_value));
    case THETA_MODE_ID_DGR:
        return DBL2NUM(θDGR2RAD(data->angle_value));
    case THETA_MODE_ID_RAD:
        return DBL2NUM(data->angle_value);
    default:
        return DBL2NUM(θGON2RAD(data->angle_value));
    }
)

ptrθ_func(θ_get_as_degree,
    switch(data->angle_mode) {
    case THETA_MODE_ID_TRN:
        return DBL2NUM(θTRN2DGR(data->angle_value));
    case THETA_MODE_ID_DGR:
        return DBL2NUM(data->angle_value);
    case THETA_MODE_ID_RAD:
        return DBL2NUM(θRAD2DGR(data->angle_value));
    default:
        return DBL2NUM(θGON2DGR(data->angle_value));
    }
)

ptrθ_func(θ_get_as_gon,
    switch(data->angle_mode) {
    case THETA_MODE_ID_TRN:
        return DBL2NUM(θTRN2GON(data->angle_value));
    case THETA_MODE_ID_DGR:
        return DBL2NUM(θDGR2GON(data->angle_value));
    case THETA_MODE_ID_RAD:
        return DBL2NUM(θRAD2GON(data->angle_value));
    default:
        return DBL2NUM(data->angle_value);
    }
)

ptrθ_func(θ_get_as_turn,
    switch(data->angle_mode) {
    case THETA_MODE_ID_TRN:
        return DBL2NUM(θTRN2GON(data->angle_value));
    case THETA_MODE_ID_DGR:
        return DBL2NUM(θDGR2GON(data->angle_value));
    case THETA_MODE_ID_RAD:
        return DBL2NUM(θRAD2GON(data->angle_value));
    default:
        return DBL2NUM(data->angle_value);
    }
)

static VALUE θ_m_set_real(VALUE self, VALUE num) {
    ERR_is_num("ThetaAngle", "real=", "num", num)
    💎self_to_ptrθ_data
    θ_set_value(data, NUM2DBL(num));
    ptrθ_flag_set_cache_synced(data);
    re_me
}

static VALUE θ_m_get_real(const VALUE self) {
    💎self_to_ptrθ_data
    if (!(ptrθ_flag_is_cache_synced(data))) {
        ptrθ_flag_set_cache_synced(data);
        VALUE the_val = DBL2NUM(data->angle_value);
        💎set_field("@real", the_val)
        return the_val;
    }
    return 💎get_field("@real")
}

ptrθ_func(θ_m_is_right,
    if (NO_MATCH_FOR_θ(data, FLAGS_NORMAL)) {
        re_as_bool(θ_get_abs_normalized_value(data) == vocab_value_quadrant(data->angle_mode))
    } else if (NO_MATCH_FOR_θ(data, FLAGS_ZERO_AND_POSITIVE)) {
        re_as_bool(fabs(data->angle_value) == vocab_value_quadrant(data->angle_mode))
    } else {
        re_as_bool(data->angle_value == vocab_value_quadrant(data->angle_mode))
    }
)

ptrθ_func(θ_m_is_obtuse,
    if (ANY_MATCH_FOR_FLAGS(data, FLAGS_ZERO_OR_PERIGON)) {
        re_no
    } else {
        const double norm_val = θ_get_abs_normalized_value(data);
        re_as_bool(norm_val > vocab_value_quadrant(data->angle_mode) && norm_val < vocab_value_straight(data->angle_mode))
    }
)

ptrθ_func(θ_m_is_acute,
    if (NO_MATCH_FOR_θ(data, FLAGS_NORMAL)) {
        const double normalized_value = θ_get_normalized_value(data->angle_value, data->angle_mode);
        re_as_bool(normalized_value >= 0.0 && normalized_value < vocab_value_quadrant(data->angle_mode))
    } else {
        re_as_bool(data->angle_value >= 0.0 && data->angle_value < vocab_value_quadrant(data->angle_mode))
    }
)

ptrθ_func(θ_m_is_straight,
    if (ANY_MATCH_FOR_FLAGS(data, FLAGS_ZERO_OR_PERIGON)) {re_no}
    if (NO_MATCH_FOR_θ(data, FLAGS_NORMAL)) {
        re_as_bool(θ_get_normalized_value(data->angle_value, data->angle_mode) == vocab_value_straight(data->angle_mode))
    } else {
        re_as_bool(data->angle_value == vocab_value_straight(data->angle_mode))
    }
)

ptrθ_func(θ_m_is_perigon,
    if (NO_MATCH_FOR_θ(data, FLAGS_NORMAL)) {
        re_as_bool(θ_get_normalized_value(data->angle_value, data->angle_mode) == 0.0)
    } else {
        re_as_bool(data->angle_value == vocab_value_perigon(data->angle_mode))
    }
)

ptrθ_func(θ_m_is_octant, re_as_bool(data->angle_value == vocab_value_octant(data->angle_mode)))

ptrθ_func(θ_m_is_sextant, re_as_bool(data->angle_value == vocab_value_sextant(data->angle_mode)))

ptrθ_func(θ_m_is_oblique, re_as_bool(fmod(data->angle_value, vocab_value_quadrant(data->angle_mode)) != 0.0))

ptrθ_func(θ_m_is_reflex,
    if (NO_MATCH_FOR_θ(data, FLAGS_NORMAL)) {
        const double normalized_value = θ_get_normalized_value(data->angle_value, data->angle_mode);
        re_as_bool(normalized_value > vocab_value_straight(data->angle_mode) && normalized_value < vocab_value_perigon(data->angle_mode))
    } else {
        re_as_bool(data->angle_value > vocab_value_straight(data->angle_mode) && data->angle_value < vocab_value_perigon(data->angle_mode))
    }
)

/* __                                                                   __
  /\ \__         __                                                    /\ \__
  \ \ ,_\  _ __ /\_\     __     ___     ___     ___     ___ ___      __\ \ ,_\  _ __   __  __
   \ \ \/ /\`'__\/\ \  /'_ `\  / __`\ /' _ `\  / __`\ /' __` __`\  /'__`\ \ \/ /\`'__\/\ \/\ \
    \ \ \_\ \ \/ \ \ \/\ \L\ \/\ \L\ \/\ \/\ \/\ \L\ \/\ \/\ \/\ \/\  __/\ \ \_\ \ \/ \ \ \_\ \
     \ \__\\ \_\  \ \_\ \____ \ \____/\ \_\ \_\ \____/\ \_\ \_\ \_\ \____\\ \__\\ \_\  \/`____ \
      \/__/ \/_/   \/_/\/___L\ \/___/  \/_/\/_/\/___/  \/_/\/_/\/_/\/____/ \/__/ \/_/   `/___/> \
                         /\____/                                                           /\___/
                         \_/__/                                                            \/__/ */
static VALUE m_cos(const VALUE self, const VALUE val) {
    if (is_theta_angle(val)) {
        ptrθ data; 💎parse_ptrθ(val, data);
        const long double val_ldbl = θ_get_val_precise_as_mode(THETA_MODE_ID_RAD, data);
        const double perigon_minus_quadrant = ptrθ_get_const_perigon_minus_quadrant(data);
        const double quadrant      = ptrθ_get_const_quadrant(data);
        const long double result   = cosl(val_ldbl);
        if (LDBL_IS_ZERO(result) || data->angle_value == quadrant || data->angle_value == perigon_minus_quadrant) {
            return ℤ0;
        } else {
            return DBL2NUM(result);
        }
    } else {
        rb_raise(R_ERR_ARG, "| m{Math}-> sf{coss} may not convert the arg{%"PRIsVALUE"} into a theta_angle |", val);
    }
}

static VALUE m_sin(const VALUE self, const VALUE val) {
    if (is_theta_angle(val)) {
        ptrθ data; 💎parse_ptrθ(val, data);
        const long double val_ldbl = θ_get_val_precise_as_mode(THETA_MODE_ID_RAD, data);
        const double straight      = ptrθ_get_const_straight(data);
        const double full          = ptrθ_get_const_perigon(data);
        const long double result   = sinl(val_ldbl);
        if (data->angle_value == straight || data->angle_value == full || LDBL_IS_ZERO(result)) {
            return ℤ0;
        } else {
            return DBL2NUM(result);
        }
    } else {
        rb_raise(R_ERR_ARG, "| m{Math}-> sf{sin} may not convert the arg{%"PRIsVALUE"} into a theta_angle |", val);
    }
}

static VALUE m_tan(const VALUE self, const VALUE val) {
    if (is_theta_angle(val)) {
        ptrθ data; 💎parse_ptrθ(val, data);
        const double full = ptrθ_get_const_perigon(data);
        if (full == data->angle_value) {
            re_0
        } else {
            const long double val_ldbl = θ_get_val_precise_as_mode(THETA_MODE_ID_RAD, data);
            return DBL2NUM((double) tanl(val_ldbl));
        }
    } else {
        rb_raise(R_ERR_ARG, "| m{Math}-> sf{tan} may not convert the arg{%"PRIsVALUE"} into a theta_angle |", val);
    }
}

static VALUE m_tan2(const VALUE self, const VALUE val) {
    if (is_theta_angle(val)) {
        ptrθ data; 💎parse_ptrθ(val, data);
        return DBL2NUM(LDBL_POW2(tanl(θ_get_val_precise_as_mode(THETA_MODE_ID_RAD, data))));
    } else {
        rb_raise(R_ERR_ARG, "| m{Math}-> sf{tan^2} may not convert the arg{%"PRIsVALUE"} into a theta_angle |", val);
    }
}

static VALUE m_sec2(const VALUE self, const VALUE val) {
    if (is_theta_angle(val)) {
        ptrθ data; 💎parse_ptrθ(val, data);
        return DBL2NUM(LDBL_POW2(1.0L / cosl(θ_get_val_precise_as_mode(THETA_MODE_ID_RAD, data))));
    } else {
        rb_raise(R_ERR_ARG, "| m{Math}-> sf{sec^2} may not convert the arg{%"PRIsVALUE"} into a theta_angle |", val);
    }
}

static VALUE m_cot(const VALUE self, const VALUE val) {
    if (is_theta_angle(val)) {
        ptrθ data; 💎parse_ptrθ(val, data);
        const long double self_angle_as_rad = θ_get_val_precise_as_mode(THETA_MODE_ID_RAD, data);
        return DBL2NUM(cosl(self_angle_as_rad) / sinl(self_angle_as_rad));
    } else {
        rb_raise(R_ERR_ARG, "| m{Math}-> sf{cot} may not convert the arg{%"PRIsVALUE"} into a theta_angle |", val);
    }
}

static VALUE m_cot2(const VALUE self, const VALUE val) {
    if (is_theta_angle(val)) {
        ptrθ data; 💎parse_ptrθ(val, data);
        const long double val_self = θ_get_val_precise_as_mode(THETA_MODE_ID_RAD, data);
        return DBL2NUM(LDBL_POW2(cosl(val_self) / sinl(val_self)));
    } else {
        rb_raise(R_ERR_ARG, "| m{Math}-> sf{cos^2} may not convert the arg{%"PRIsVALUE"} into a theta_angle |", val);
    }
}

static VALUE m_csc(const VALUE self, const VALUE val) {
    if (is_theta_angle(val)) {
        ptrθ data; 💎parse_ptrθ(val, data);
        return DBL2NUM(1.0L / sinl(θ_get_val_precise_as_mode(THETA_MODE_ID_RAD, data)));
    } else {
        rb_raise(R_ERR_ARG, "| m{Math}-> sf{csc} may not convert the arg{%"PRIsVALUE"} into a theta_angle |", val);
    }
}

static VALUE m_sec(const VALUE self, const VALUE val) {
    if (is_theta_angle(val)) {
        ptrθ data; 💎parse_ptrθ(val, data);
        return DBL2NUM(1.0L / cosl(θ_get_val_precise_as_mode(THETA_MODE_ID_RAD, data)));
    } else {
        rb_raise(R_ERR_ARG, "| m{Math}-> sf{sec} may not convert the arg{%"PRIsVALUE"} into a theta_angle |", val);
    }
}

static VALUE m_csc2(const VALUE self, const VALUE val) {
    if (is_theta_angle(val)) {
        ptrθ data; 💎parse_ptrθ(val, data);
        return DBL2NUM(LDBL_POW2(1.0L / sinl(θ_get_val_precise_as_mode(THETA_MODE_ID_RAD, data))));
    } else {
        rb_raise(R_ERR_ARG, "| m{Math}-> sf{csc^2} may not convert the arg{%"PRIsVALUE"} into a theta_angle |", val);
    }
}

static VALUE m_sin2(const VALUE self, const VALUE val) {
    if (is_theta_angle(val)) {
        ptrθ data; 💎parse_ptrθ(val, data);
        return DBL2NUM(LDBL_POW2(sinl(θ_get_val_precise_as_mode(THETA_MODE_ID_RAD, data))));
    } else {
        rb_raise(R_ERR_ARG, "| m{Math}-> sf{sin^2} may not convert the arg{%"PRIsVALUE"} into a theta_angle |", val);
    }
}

static VALUE m_cos2(const VALUE self, const VALUE val) {
    if (is_theta_angle(val)) {
        ptrθ data; 💎parse_ptrθ(val, data);
        return DBL2NUM(LDBL_POW2(cosl(θ_get_val_precise_as_mode(THETA_MODE_ID_RAD, data))));
    } else {
        rb_raise(R_ERR_ARG, "| m{Math}-> sf{cos^2} may not convert the arg{%"PRIsVALUE"} into a theta_angle |", val);
    }
}

static VALUE m_acos(const VALUE self, const VALUE val) {
    if (is_float(val)) {
        return DBL2NUM(acos(NUM2DBL(val)));
    } else if (is_theta_angle(val)) {
        ptrθ data; 💎parse_ptrθ(val, data);
        return DBL2NUM((double) acosl(θ_get_val_precise_as_mode(THETA_MODE_ID_TRN, data)));
    } else {
        rb_raise(R_ERR_ARG, "| m{Math}-> sf{acos} may not convert the arg{%"PRIsVALUE"} into a theta_angle |", val);
    }
}

static VALUE m_log_e(const VALUE self, const VALUE val) {
    if (is_float(val)) {
        return DBL2NUM((double) logl((long double) NUM2DBL(val)));
    } else {
        rb_raise(R_ERR_ARG, "| m{Math}-> sf{log_e} may not convert the arg{%"PRIsVALUE"} into a Float |", val);
    }
}

static VALUE m_cubic_root(const VALUE self, const VALUE val) {
    if (is_float(val)) {
        return DBL2NUM(LDBL_CBRT((long double) NUM2DBL(val)));
    } else {
        rb_raise(R_ERR_ARG, "| m{Math}-> sf{cubic_root} may not convert the arg{%"PRIsVALUE"} into a Float |", val);
    }
}

static VALUE m_square_root(const VALUE self, const VALUE val) {
    if (is_float(val)) {
        return DBL2NUM(LDBL_SQRT((long double) NUM2DBL(val)));
    } else {
        rb_raise(R_ERR_ARG, "| m{Math}-> sf{square_root} may not convert the arg{%"PRIsVALUE"} into a Float |", val);
    }
}
/*                          __                         __    __
                           /\ \                       /\ \__/\ \
    ___   __  __    ___ ___\ \ \____     __   _ __    \ \ ,_\ \ \___      __    ___   _ __   __  __
  /' _ `\/\ \/\ \ /' __` __`\ \ '__`\  /'__`\/\`'__\   \ \ \/\ \  _ `\  /'__`\ / __`\/\`'__\/\ \/\ \
  /\ \/\ \ \ \_\ \/\ \/\ \/\ \ \ \L\ \/\  __/\ \ \/     \ \ \_\ \ \ \ \/\  __//\ \L\ \ \ \/ \ \ \_\ \
  \ \_\ \_\ \____/\ \_\ \_\ \_\ \_,__/\ \____\\ \_\      \ \__\\ \_\ \_\ \____\ \____/\ \_\  \/`____ \
   \/_/\/_/\/___/  \/_/\/_/\/_/\/___/  \/____/ \/_/       \/__/ \/_/\/_/\/____/\/___/  \/_/   `/___/> \
                                                                                                 /\___/
                                                                                                 \/__/ */
// source solution credit: https://www.geeksforgeeks.org/eulers-totient-function/
ⓡ𝑓_self_them(m_number_theory_eulers_totient_func,
    if (is_int(them)) {
        unsigned long n = NUM2ULONG(them);
        if (n == 0ul) {re_0}
        unsigned long result = n;
        for (unsigned long p = 2ul; p * p <= n; ++p) {
            if (n % p == 0ul) {
                while (n % p == 0ul) {
                    n /= p;
                }
                result -= result / p;
            }
        }
        if (n > 1ul) {
            result -= result / n;
        }
        return ULONG2NUM(result);
    } else {rb_raise(R_ERR_ARG, "");}
)

// source solution credit: https://www.geeksforgeeks.org/check-whether-number-semiprime-not/
ⓡ𝑓_self_them(m_number_theory_is_semiprime,
    if (is_int(them)) {
        int num                    = NUM2INT(them);
        int num_primes_encountered = 0;
        for (int i = 2; num_primes_encountered < 2 && i * i <= num; ++i) {
            while (num % i == 0) {
                num /= i;
                ++num_primes_encountered;
            }
        }
        // a remaining value of > 1 will be a prime number
        if (num > 1) {++num_primes_encountered;}
        re_as_bool(num_primes_encountered == 2)
    } else {
        rb_raise(R_ERR_ARG, "| m{NumberTheory}-> sf{semiprime?} did not receive type{Integer} for either arg(n){%"PRIsVALUE"} but type{%s} |", them, rb_obj_classname(them));
    }
)

/*                         __                            __
                          /\ \      __                  /\ \__                __
    ___    ___     ___ ___\ \ \____/\_\    ___      __  \ \ ,_\   ___   _ __ /\_\    ___    ____
   /'___\ / __`\ /' __` __`\ \ '__`\/\ \ /' _ `\  /'__`\ \ \ \/  / __`\/\`'__\/\ \  /'___\ /',__\
  /\ \__//\ \L\ \/\ \/\ \/\ \ \ \L\ \ \ \/\ \/\ \/\ \L\.\_\ \ \_/\ \L\ \ \ \/ \ \ \/\ \__//\__, `\
  \ \____\ \____/\ \_\ \_\ \_\ \_,__/\ \_\ \_\ \_\ \__/.\_\\ \__\ \____/\ \_\  \ \_\ \____\/\____/
   \/____/\/___/  \/_/\/_/\/_/\/___/  \/_/\/_/\/_/\/__/\/_/ \/__/\/___/  \/_/   \/_/\/____/\/___/ */

// source solution credit: https://blog.plover.com/math/choose.html
ⓡ𝑓_self_a_b(m_combinatorics_n_choose_k,
    if (is_int(param_a) && is_int(param_b)) {
         unsigned int n = RB_FIX2UINT(param_a);
         unsigned int k = RB_FIX2UINT(param_b);
         if (k == 0 || n == k) {
            re_1
         } else if (k > n) {
            rb_raise(R_ERR_ARG, "| m{Combinatorics}-> sf{n_choose_k} got arg(n){%"PRIsVALUE"} w/ value smaller than arg(k){%"PRIsVALUE"} |", param_a, param_b);
         } else if (((k - 1) * 2) < n) {
            k = n - k;
         }
         unsigned long r = 1;
         unsigned int d;
         for (d = 1; d <= k; d++) {
            r *= n--;
            r /= d;
         }
         return ULONG2NUM(r);
    } else {
        rb_raise(R_ERR_ARG, "| m{Combinatorics}-> sf{n_choose_k} did not receive type{Integer} for either arg(n){%"PRIsVALUE"} or arg(k){%"PRIsVALUE"} |", param_a, param_b);
    }
)

ⓡ𝑓_self_a_b(m_combinatorics_permutations,
    if (is_int(param_a) && is_int(param_b)) {
         int n = RB_FIX2INT(param_a);
         int k = RB_FIX2INT(param_b);
         if (n < 0 || k < 0) {
            rb_raise(R_ERR_ARG, "| m{Combinatorics}-> sf{permutations} received a negative Integer for either arg(n){%"PRIsVALUE"} or arg(k){%"PRIsVALUE"} |", param_a, param_b);
         } if (k > n) {
            rb_raise(R_ERR_ARG, "| m{Combinatorics}-> sf{permutations} received arg(n){%"PRIsVALUE"} w/ a smaller value than arg(k){%"PRIsVALUE"} |", param_a, param_b);
         }
         unsigned long p = 1;
         for (int i = 0; i < k; i++) {
            p *= (n - i);
         }
         return ULONG2NUM(p);
    } else {
        rb_raise(R_ERR_ARG, "| m{Combinatorics}-> sf{permutations} did not receive type{Integer} for either arg(n){%"PRIsVALUE"} or arg(k){%"PRIsVALUE"} |", param_a, param_b);
    }
)

/*                              __
                               /\ \__                        __                                            __
    ___              __   __  _\ \ ,_\    __    ___     ____/\_\    ___     ___         ___ ___      __   /\_\    ___
   /'___\ _______  /'__`\/\ \/'\\ \ \/  /'__`\/' _ `\  /',__\/\ \  / __`\ /' _ `\     /' __` __`\  /'__`\ \/\ \ /' _ `\
  /\ \__//\______\/\  __/\/>  </ \ \ \_/\  __//\ \/\ \/\__, `\ \ \/\ \L\ \/\ \/\ \    /\ \/\ \/\ \/\ \L\.\_\ \ \/\ \/\ \
  \ \____\/______/\ \____\/\_/\_\ \ \__\ \____\ \_\ \_\/\____/\ \_\ \____/\ \_\ \_\   \ \_\ \_\ \_\ \__/.\_\\ \_\ \_\ \_\
   \/____/         \/____/\//\/_/  \/__/\/____/\/_/\/_/\/___/  \/_/\/___/  \/_/\/_/    \/_/\/_/\/_/\/__/\/_/ \/_/\/_/\/_/*/

static inline void startup_step1_before_loading_extension(void) {
    Ⓒbig_decimal = rb_const_get(rb_cObject, rb_intern("BigDecimal"));
    Ⓒset         = rb_const_get(rb_cObject, rb_intern("Set"));

    cached_rb_intern_smells_like_int = rb_intern("smells_like_int?");
    cached_rb_intern_is_finite        = rb_intern("finite?");
    cached_rb_intern_is_empty        = rb_intern("empty?");

    ⓜruuuby          = 💎add_global_module("Ruuuby")
    ⓜruuuby_metadata = 💎add_module_under(ⓜruuuby, "MetaData")
    ⓜruuuby_engine   = 💎add_class_under(ⓜruuuby_metadata, rb_cObject, "RuuubyEngine")

    💎add_singleton_func_0args_to(ⓜruuuby_engine, "memory_peak_this_runtime", m_memory_peak_this_runtime)

    💎add_module_under(ⓜruuuby, "Attribute")
    💎add_module_under(ⓜruuuby, "Includable")
    💎add_module_under(ⓜruuuby, "Extendable")
    cached_module_param_err = 💎add_module_under(ⓜruuuby, "ParamErr")

    ⓜcombinatorics = 💎add_module_under(R_MATH, "Combinatorics")
    ⓜtrigonometry  = 💎add_module_under(R_MATH, "Trig")
    ⓜnumber_theory = 💎add_module_under(R_MATH, "NumberTheory")
    💎add_singleton_func_1args_to(ⓜnumber_theory, "nth_euler_totient", m_number_theory_eulers_totient_func)
    💎add_singleton_func_1args_to(ⓜnumber_theory, "semiprime?", m_number_theory_is_semiprime)

    💎add_class_under(cached_module_param_err, R_ERR_ARG, "WrongParamType")

    ℤd1 = DBL2NUM(1.0);
    rb_gc_register_address(& ℤd1);

    cached_flt_nan = DBL2NUM(NAN);
    rb_gc_register_address(& cached_flt_nan);
}

static void startup_step2_add_ruuuby_c_extensions(void) {
    cached_global_sym_many_args = ID2SYM(rb_intern("*args"));
    rb_define_readonly_variable("$PRM_MANY", &cached_global_sym_many_args);

    init_f06()

    💎add_public_func_0args_to(R_INT, "finite?"  , m_int_is_finite)
    💎add_public_func_0args_to(R_INT, "infinite?", m_int_is_not_finite)

    // | f11 | creates alias of Integer's func{^} which is originally provided for bitwise XOR
    💎add_func_alias(R_INT, "bitwise_xor", "^")
    💎add_public_func_1args_to(R_INT, "^", m_int_patch_for_exponentials)

    💎add_public_func_0args_to(R_FLT, "one?", m_flt_is_one)
    💎add_public_func_0args_to(R_FLT, "has_decimals?", m_flt_has_decimals)
    💎add_public_func_0args_to(R_FLT, "smells_like_int?", m_flt_smells_like_int)
    💎add_public_func_1args_to(R_FLT, "basically_equal?", m_flt_basically_equal)
    💎add_public_func_1args_to(R_FLT, "^", m_flt_patch_for_exponentials)

    💎add_public_func_0args_to(R_NIL, "empty?", m_nil_empty)

    💎add_public_func_0args_to(R_FALSE, "to_b?", m_bool_to_b)
    💎add_public_func_0args_to(R_FALSE, "to_i", m_false_to_i)

    💎add_public_func_0args_to(R_TRUE, "to_b?",  m_bool_to_b)
    💎add_public_func_0args_to(R_TRUE, "to_i", m_true_to_i)

    init_f05()

    💎add_public_func_0args_to(R_ARY, "remove_empty!"    , m_ary_remove_empty)
    💎add_public_func_1args_to(R_ARY, "disjunctive_union", m_ary_disjunctive_union)

    💎add_public_func_2args_to(R_MODULE, "f_add_aliases", m_module_add_aliases)

    init_f27()

    rb_gc_adjust_memory_usage((size_t) (56 * 4));
    💎add_const_theta_angle("ANGLE_GOLDEN",      Ⴔ_RAD, THETA_MODE_RAD, cached_const_angle_golden)
    💎add_const_theta_angle("ANGLE_TAU",         𝞽, THETA_MODE_RAD, cached_const_angle_tau)
    💎add_const_theta_angle("ANGLE_RIGHT",       (π / 2.0), THETA_MODE_RAD, cached_const_angle_right)
    💎add_const_theta_angle("ANGLE_STRAIGHT",    (π), THETA_MODE_RAD, cached_const_angle_straight)

    💎add_const_flt("CONST_EULER_MASCHERONI",     γ)
    💎add_const_flt("CONST_PYTHAGORAS",           sqrt(2.0))
    💎add_const_flt("RATIO_GOLDEN",               𝚽)
    💎add_const_flt("RATIO_GOLDEN_PERPENDICULAR", φ)
    💎add_const_flt("RATIO_GOLDEN_SUPER",         Ψ)
    💎add_const_flt("RATIO_PLASTIC",              ρ)
    💎add_const_flt("RATIO_SILVER",               δ)

    VALUE ref;
    💎add_const_flt_wo_ref("ONE_HALF"      , 0.50, & ref);
    💎add_const_flt_wo_ref("ONE_THIRD"     , (1.0/3.0), & ref);
    💎add_const_flt_wo_ref("TWO_THIRDS"    , (2.0/3.0), & ref);
    💎add_const_flt_wo_ref("ONE_FOURTH"    , 0.25, & ref);
    💎add_const_flt_wo_ref("THREE_FOURTHS" , 0.75, & ref);
    💎add_const_flt_wo_ref("ONE_FIFTH"     , 0.20, & ref);
    💎add_const_flt_wo_ref("TWO_FIFTHS"    , 0.40, & ref);
    💎add_const_flt_wo_ref("THREE_FIFTHS"  , 0.60, & ref);
    💎add_const_flt_wo_ref("FOUR_FIFTHS"   , 0.80, & ref);
    💎add_const_flt_wo_ref("ONE_SIXTH"     , (1.0/6.0), & ref);
    💎add_const_flt_wo_ref("FIVE_SIXTH"    , (5.0/6.0), & ref);
    💎add_const_flt_wo_ref("ONE_SEVENTH"   , (1.0/7.0), & ref);
    💎add_const_flt_wo_ref("ONE_EIGHTH"    , 0.125, & ref);
    💎add_const_flt_wo_ref("THREE_EIGHTHS" , 0.375, & ref);
    💎add_const_flt_wo_ref("FIVE_EIGHTHS"  , 0.625, & ref);
    💎add_const_flt_wo_ref("SEVEN_EIGHTHS" , 0.875, & ref);
    💎add_const_flt_wo_ref("ONE_NINTH"     , (1.0/9.0), & ref);
    💎add_const_flt_wo_ref("ONE_TENTH"     , 0.10, & ref);

    💎add_singleton_func_1args_to(Ⓒtheta_angle, "new_radian", θ_m_init_as_rad)
    💎add_singleton_func_1args_to(Ⓒtheta_angle, "new_degree", θ_m_init_as_dgr)
    💎add_singleton_func_1args_to(Ⓒtheta_angle, "new_gon", θ_m_init_as_gon)
    💎add_singleton_func_1args_to(Ⓒtheta_angle, "new_turn", θ_m_init_as_trn)

    💎add_singleton_func_2args_to(ⓜcombinatorics, "permutations", m_combinatorics_permutations)
    💎add_singleton_func_2args_to(ⓜcombinatorics, "n_choose_k", m_combinatorics_n_choose_k)

    💎add_singleton_func_1args_to(R_MATH, "cubic_root", m_cubic_root)
    💎add_singleton_func_1args_to(R_MATH, "square_root", m_square_root)
    💎add_singleton_func_1args_to(R_MATH, "log_e", m_log_e)

    💎add_public_func_1args_to(ⓜtrigonometry, "cot", m_cot)
    💎add_public_func_1args_to(ⓜtrigonometry, "cot2", m_cot2)

    💎add_public_func_1args_to(ⓜtrigonometry, "cos", m_cos)
    💎add_public_func_1args_to(ⓜtrigonometry, "cos2", m_cos2)
    💎add_public_func_1args_to(ⓜtrigonometry, "acos", m_acos)

    💎add_public_func_1args_to(ⓜtrigonometry, "sin", m_sin)
    💎add_public_func_1args_to(ⓜtrigonometry, "sin2", m_sin2)

    💎add_public_func_1args_to(ⓜtrigonometry, "tan", m_tan)
    💎add_public_func_1args_to(ⓜtrigonometry, "tan2", m_tan2)

    💎add_public_func_1args_to(ⓜtrigonometry, "csc", m_csc)
    💎add_public_func_1args_to(ⓜtrigonometry, "csc2", m_csc2)

    💎add_public_func_1args_to(ⓜtrigonometry, "sec", m_sec)
    💎add_public_func_1args_to(ⓜtrigonometry, "sec2", m_sec2)
}

void Init_ruby_class_mods(void) {
    SimpleTimer simple_timer;
    simple_timer_start(& simple_timer);

    const double memory_at_start = memory_peak_this_runtime();
    //print_flt_as_mem(memory_at_start);

    startup_step0_load_f98()

    startup_step1_before_loading_extension();
    startup_step2_add_ruuuby_c_extensions();
    startup_step4_load_needed_ruuuby_files();

    startup_step5_protect_against_gc();

    simple_timer_end(& simple_timer);
    simple_timer_print_delta(& simple_timer, "Ruuuby-Extensions loaded in");

    const char * s = getenv("RUUUBY_FULL_DEBUG");
    if (s != NULL && (*s) == 't') {
        rb_funcall(ⓜruuuby_engine, rb_intern("get_mem_stats"), 2, DBL2NUM(memory_at_start), DBL2NUM(memory_peak_this_runtime()));
    }
}
