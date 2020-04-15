// encoding: UTF-8

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
//#define ensure_not_frozen(arg_to_check) rb_check_frozen(arg_to_check);

#define r_str_new_frozen_literal(arg) rb_str_new_frozen(rb_str_new_cstr(arg))
#define cstr_to_rstr(arg)             rb_str_new_cstr(arg)

#define r_hsh_increment_keys_val(hsh, key) rb_hash_aset(hsh, key, LONG2FIX(RB_FIX2LONG(rb_hash_aref(hsh, key)) + 1));
#define r_hsh_set_val_to_one(hsh, key) rb_hash_aset(hsh, key, ℤ1);

#define r_hsh_has_key(hsh, key) (rb_hash_has_key(hsh, key) == Qtrue)

#define r_add_global_const(const_name, const_value) rb_define_global_const(const_name, const_value);
#define r_add_global_const_str(const_name, const_value) r_add_global_const("" #const_name, cstr_to_rstr("" #const_value))
#define r_get_class(r_class) rb_const_get(rb_cObject, rb_intern(r_class));

#define bsearch_power(val_to_find)         (long long *) bsearch (&val_to_find, exponential_ids, 𝔠EXPONENTS, 𝔠LONGLONG, internal_only_compare_func_4_object_id);
#define bsearch_power_position(arg_index) ((int)(((int)arg_index - (int)exponential_ids) / 𝔠LONGLONG))

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

static inline VALUE new_ary(const long known_max_size) {
    if (known_max_size == 0) {
        return rb_ary_new_capa(0);
    } else if (known_max_size > 0 && known_max_size <= 𝔠ARY_DEFAULT) {
        return rb_ary_new_capa(known_max_size);
    } else {
        return rb_ary_new();
    }
}

static inline void internal_only_prepare_f16(void) {
    cached_flt_nan          = rb_const_get_at(R_FLT, rb_intern("NAN"));
    cached_flt_inf          = rb_const_get_at(R_FLT, rb_intern("INFINITY"));
    cached_flt_negative_inf = rb_const_get_at(R_FLT, rb_intern("INFINITY_NEGATIVE"));
    cached_flt_inf_complex  = rb_const_get_at(R_FLT, rb_intern("INFINITY_COMPLEX"));

    cached_sym_normalizer_no_empty      = rb_const_get_at(cached_module_normalizers, rb_intern("NO_EMPTY"));
    🆔cached_sym_normalizer_no_empty    = rb_obj_id(cached_sym_normalizer_no_empty);
    cached_sym_none                     = rb_const_get_at(cached_module_normalizers, rb_intern("NONE"));
    🆔cached_sym_none                   = rb_obj_id(cached_sym_none);
    cached_sym_set_ℕ                    = rb_const_get_at(cached_module_normalizers, rb_intern("BELONGS_TO_M_NATURAL_NUMBERS"));
    🆔cached_sym_set_ℕ                  = rb_obj_id(cached_sym_set_ℕ);
    cached_sym_normalizer_exponential   = rb_const_get_at(cached_module_normalizers, rb_intern("BELONGS_TO_M_EXPONENTIALS"));
    🆔cached_sym_normalizer_exponential = rb_obj_id(cached_sym_normalizer_exponential);

    long long obj_id_n9           = NUM2LL(rb_obj_id(rb_eval_string("(8315.chr + 8313.chr).to_sym")));
    long long obj_id_n8           = NUM2LL(rb_obj_id(rb_eval_string("(8315.chr + 8312.chr).to_sym")));
    long long obj_id_n7           = NUM2LL(rb_obj_id(rb_eval_string("(8315.chr + 8311.chr).to_sym")));
    long long obj_id_n6           = NUM2LL(rb_obj_id(rb_eval_string("(8315.chr + 8310.chr).to_sym")));
    long long obj_id_n5           = NUM2LL(rb_obj_id(rb_eval_string("(8315.chr + 8309.chr).to_sym")));
    long long obj_id_n4           = NUM2LL(rb_obj_id(rb_eval_string("(8315.chr + 8308.chr).to_sym")));
    long long obj_id_n3           = NUM2LL(rb_obj_id(rb_eval_string("(8315.chr + \"\\xC2\\xB3\".as_utf8).to_sym")));
    long long obj_id_n2           = NUM2LL(rb_obj_id(rb_eval_string("(8315.chr + \"\\xC2\\xB2\".as_utf8).to_sym")));
    long long obj_id_n1           = NUM2LL(rb_obj_id(rb_eval_string("(8315.chr + \"\\xC2\\xB9\".as_utf8).to_sym")));
    long long obj_id_0            = NUM2LL(rb_obj_id(rb_eval_string("8304.chr.to_sym")));
    long long obj_id_9            = NUM2LL(rb_obj_id(rb_eval_string("8313.chr.to_sym")));
    long long obj_id_8            = NUM2LL(rb_obj_id(rb_eval_string("8312.chr.to_sym")));
    long long obj_id_7            = NUM2LL(rb_obj_id(rb_eval_string("8311.chr.to_sym")));
    long long obj_id_6            = NUM2LL(rb_obj_id(rb_eval_string("8310.chr.to_sym")));
    long long obj_id_5            = NUM2LL(rb_obj_id(rb_eval_string("8309.chr.to_sym")));
    long long obj_id_4            = NUM2LL(rb_obj_id(rb_eval_string("8308.chr.to_sym")));
    long long obj_id_3            = NUM2LL(rb_obj_id(rb_eval_string("\"\\xC2\\xB3\".as_utf8.to_sym")));
    long long obj_id_2            = NUM2LL(rb_obj_id(rb_eval_string("\"\\xC2\\xB2\".as_utf8.to_sym")));
    long long obj_id_1            = NUM2LL(rb_obj_id(rb_eval_string("\"\\xC2\\xB9\".as_utf8.to_sym")));
    long long obj_id_inf          = NUM2LL(rb_obj_id(rb_eval_string("8734.chr.to_sym")));
    long long obj_id_inf_negative = NUM2LL(rb_obj_id(rb_const_get_at(rb_cNumeric, rb_intern("EXPONENTIAL_NEGATIVE_INF"))));
    long long obj_id_inf_complex  = NUM2LL(rb_obj_id(rb_eval_string("(8734.chr + 8450.chr).to_sym")));

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

    qsort(exponential_ids, 𝔠EXPONENTS, 𝔠LONGLONG, internal_only_compare_func_4_object_id);

    long long * the_index = bsearch_power(obj_id_n9)
    exponential_indexes[bsearch_power_position(the_index)] = -9;
    the_index             = bsearch_power(obj_id_n8)
    exponential_indexes[bsearch_power_position(the_index)] = -8;
    the_index             = bsearch_power(obj_id_n7)
    exponential_indexes[bsearch_power_position(the_index)] = -7;
    the_index             = bsearch_power(obj_id_n6)
    exponential_indexes[bsearch_power_position(the_index)] = -6;
    the_index             = bsearch_power(obj_id_n5)
    exponential_indexes[bsearch_power_position(the_index)] = -5;
    the_index             = bsearch_power(obj_id_n4)
    exponential_indexes[bsearch_power_position(the_index)] = -4;
    the_index             = bsearch_power(obj_id_n3)
    exponential_indexes[bsearch_power_position(the_index)] = -3;
    the_index             = bsearch_power(obj_id_n2)
    exponential_indexes[bsearch_power_position(the_index)] = -2;
    the_index             = bsearch_power(obj_id_n1)
    exponential_indexes[bsearch_power_position(the_index)] = -1;
    the_index             = bsearch_power(obj_id_0)
    exponential_indexes[bsearch_power_position(the_index)] = 0;
    the_index             = bsearch_power(obj_id_9)
    exponential_indexes[bsearch_power_position(the_index)] = 9;
    the_index             = bsearch_power(obj_id_8)
    exponential_indexes[bsearch_power_position(the_index)] = 8;
    the_index             = bsearch_power(obj_id_7)
    exponential_indexes[bsearch_power_position(the_index)] = 7;
    the_index             = bsearch_power(obj_id_6)
    exponential_indexes[bsearch_power_position(the_index)] = 6;
    the_index             = bsearch_power(obj_id_5)
    exponential_indexes[bsearch_power_position(the_index)] = 5;
    the_index             = bsearch_power(obj_id_4)
    exponential_indexes[bsearch_power_position(the_index)] = 4;
    the_index             = bsearch_power(obj_id_3)
    exponential_indexes[bsearch_power_position(the_index)] = 3;
    the_index             = bsearch_power(obj_id_2)
    exponential_indexes[bsearch_power_position(the_index)] = 2;
    the_index             = bsearch_power(obj_id_1)
    exponential_indexes[bsearch_power_position(the_index)] = 1;
    the_index             = bsearch_power(obj_id_inf)
    exponential_indexes[bsearch_power_position(the_index)] = CACHE_INDEX_INF;
    the_index             = bsearch_power(obj_id_inf_negative)
    exponential_indexes[bsearch_power_position(the_index)] = CACHE_INDEX_INF_NEGATIVE;
    the_index             = bsearch_power(obj_id_inf_complex)
    exponential_indexes[bsearch_power_position(the_index)] = CACHE_INDEX_INF_COMPLEX;
}

static inline void startup_step5_protect_against_gc(void) {
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
    rb_global_variable(& cached_rb_intern_is_empty);
    rb_global_variable(& cached_rb_intern_is_a);
    rb_global_variable(& cached_rb_intern_raise_to_power);
    rb_global_variable(& cached_rb_intern_ints_bitwise_xor);
    rb_global_variable(& cached_class_set);
    rb_global_variable(& cached_class_big_decimal);

    rb_global_variable(& cached_global_sym_many_args);

    rb_global_variable(& cached_module_param_err);
    rb_global_variable(& cached_module_virtual_types);
    rb_global_variable(& cached_module_normalizers);

    rb_global_variable(& cached_module_ruuuby);
    rb_global_variable(& cached_module_ruuuby_metadata);
    rb_global_variable(& cached_module_attribute);
    rb_global_variable(& cached_module_attribute_includable);
    rb_global_variable(& cached_module_attribute_extendable);

    rb_global_variable(& cached_sym_normalizer_exponential);
    rb_global_variable(& 🆔cached_sym_normalizer_exponential);
    rb_global_variable(& cached_sym_set_ℕ);
    rb_global_variable(& 🆔cached_sym_set_ℕ);
    rb_global_variable(& cached_sym_none);
    rb_global_variable(& 🆔cached_sym_none);
    rb_global_variable(& cached_sym_normalizer_no_empty);
    rb_global_variable(& 🆔cached_sym_normalizer_no_empty);

    rb_global_variable(& cached_flt_inf_complex);
    rb_global_variable(& cached_flt_negative_inf);
    rb_global_variable(& cached_flt_inf);
    rb_global_variable(& cached_flt_nan);

    // TODO: expand investigation
    //size_t rb_obj_memsize_of(VALUE);
    rb_gc_verify_internal_consistency();
}

// | f18 | load various Ruby internals |
static inline void startup_step0_load_needed_default_ruby_libs(void) {
    ensure_loaded_default(bigdecimal)
    ensure_loaded_default(tempfile)
    ensure_loaded_default(singleton)
    ensure_loaded_default(logger)
    ensure_loaded_default(time)
}

static inline void startup_step1_before_loading_extension(void) {
    cached_class_big_decimal          = r_get_class("BigDecimal");
    cached_class_set                  = r_get_class("Set");
    cached_rb_intern_is_a             = rb_intern("is_a?");
    cached_rb_intern_ints_bitwise_xor = rb_intern("bitwise_xor");
    cached_rb_intern_raise_to_power   = rb_intern("**");
    cached_rb_intern_is_empty         = rb_intern("empty?");

    cached_module_ruuuby               = ext_api_add_global_module("Ruuuby")
    cached_module_ruuuby_metadata      = ext_api_add_module_under(cached_module_ruuuby, "MetaData")
    cached_module_attribute            = ext_api_add_module_under(cached_module_ruuuby, "Attribute")
    cached_module_attribute_includable = ext_api_add_module_under(cached_module_ruuuby, "Includable")
    cached_module_attribute_extendable = ext_api_add_module_under(cached_module_ruuuby, "Extendable")
    cached_module_param_err            = ext_api_add_module_under(cached_module_ruuuby, "ParamErr")
    cached_module_virtual_types        = ext_api_add_module_under(cached_module_ruuuby, "VirtualTypes")
    cached_module_normalizers          = ext_api_add_module_under(cached_module_virtual_types, "Normalizers")
    ext_api_add_new_sub_class_under(cached_module_param_err, R_ERR_ARG, "WrongParamType")
}

//

static inline void startup_step3_load_3rd_party_gems(void) { // ------------------------------------------------ | f18 |
    ensure_loaded_default(tty-command)
}

static inline void startup_step4_load_needed_ruuuby_files(void) { // -------------------------------------------- | f18 |
    ensure_loaded_attribute_includable(cardinality)
    ensure_loaded_attribute_includable(notation_set_mathematics)
    ensure_loaded_attribute_includable(subscript_indexing)
    ensure_loaded_attribute_includable(syntax_cache)

    ensure_loaded_class(proc)

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

    ensure_loaded_attribute_extendable(syntax_cache)

    ensure_loaded_attribute_extendable(singleton)
    ensure_loaded_attribute_includable(singleton)

    ensure_loaded_class(sym) // must be after{attribute_cardinality}

    ensure_loaded_class(str) // must be after{attribute_syntax_cache, attribute_cardinality}
    ensure_loaded_io(file)    // must be after{attribute_syntax_cache}
    ensure_loaded_io(dir)    // must be after{attribute_syntax_cache}

    ensure_loaded_ruuuby(global_funcs)

    internal_only_prepare_f16(); // must be after{ruuuby/types, ruuuby/class/str}

    ensure_loaded_ruuuby(ruuuby/metadata/ruuuby_metadata)

    // [⚠️] : excluding, alternative files are loading [ruuuby/ruuuby/metadata/ruuuby_metadata_constants, ruuuby/version]
    //          * ensure_loaded_ruuuby(ruuuby/metadata/ruuuby_metadata_constants)
    //          * ensure_loaded_ruuuby(version)
    // [⚠️] : reminder, do not load "ruuuby/ruuuby_orm" here

    ensure_loaded_ruuuby(virtual/env)

    ensure_loaded_ruuuby(ruuuby/routine_cli)
    ensure_loaded_ruuuby(ruuuby/ruuuby_api)

    ensure_loaded_ruuuby(ruuuby/engine/ruuuby_logging)
    ensure_loaded_ruuuby(ruuuby/engine/ruuuby_engine)

    ensure_loaded_ruuuby(configs)
} // | -----------------------------------------------------------------------------------------------------------------

// original source modified from: https://stackoverflow.com/questions/36681906/c-qsort-doesnt-seem-to-work-with-unsigned-long
static int internal_only_compare_func_4_object_id(const void * l, const void * r) {
    const long long ai = *(const long long *)(l);
    const long long bi = *(const long long *)(r);
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
r_func_raw(m_obj_ary, re_as_bool(is_ary(self)))

// | function{bool?} |
r_func_raw(m_obj_bool, re_as_bool(is_bool(self)))

// | function{hash?} |
r_func_raw(m_obj_hash, re_as_bool(is_hsh(self)))

// | function{flt?}   |
r_func_raw(m_obj_flt, re_as_bool(is_float(self)))

// | function{sym?}  |
r_func_k_args(m_obj_sym,
    if (argc == 0) {
        re_as_bool(is_sym(self))
    } else {
        if (is_sym(self)) {
            VALUE them;
            rb_scan_args(argc, argv, ARG_OPTS_ONE_OPTIONAL, & them);
            if (NIL_P(them)) {
                🛑c_param_type("Object", "sym?", "normalizer", them, "Symbol")
            } else {
                if (is_sym(them)) {
                    ID them_id = rb_obj_id(them);

                    if (them_id == 🆔cached_sym_none) {
                        re_as_bool(is_sym(self))
                    } else if (them_id == 🆔cached_sym_normalizer_exponential) {
                        const long long id_to_find = NUM2LL(rb_obj_id(self));
                        long long * the_result    = bsearch_power(id_to_find)
                        if (the_result != NULL) {
                            const int power_to_raise_to = exponential_indexes[bsearch_power_position(the_result)];
                            if (power_to_raise_to < 10) {
                                return INT2NUM(power_to_raise_to);
                            } else if (power_to_raise_to > 1336 && power_to_raise_to < 1400) {
                                if (power_to_raise_to == CACHE_INDEX_INF) {
                                    return cached_flt_inf;
                                } else if (power_to_raise_to == CACHE_INDEX_INF_NEGATIVE) {
                                    return cached_flt_negative_inf;
                                } else {
                                    return cached_flt_inf_complex;
                                }
                            } else {
                                re_no
                            }
                        } else {re_no}
                    } else {
                        🛑c_param_type("Object", "sym?(w/ normalizer)", "normalizer", them, "Symbol")
                    }
                } else {
                    🛑c_param_type("Object", "sym?", "normalizer", them, "Symbol")
                }
            }
        } else {re_no}
    }
)

// | function{int?}  |
r_func_k_args(m_obj_int,
    if (argc == 0) {
        re_as_bool(is_int(self))
    } else {
        if (is_int(self)) {
            VALUE them;
            rb_scan_args(argc, argv, ARG_OPTS_ONE_OPTIONAL, & them);
            if (NIL_P(them)) {
                rb_raise(R_ERR_ARG, "| c{Object}-> m{int?} with self{%"PRIsVALUE"} got in-valid normalizer{%"PRIsVALUE"} |", self, them);
            } else {
                if (is_sym(them)) {
                    ID them_id = rb_obj_id(them);
                    if (them_id == 🆔cached_sym_none) {
                        re_as_bool(is_int(self))
                    } else if (them_id == 🆔cached_sym_set_ℕ) {
                        re_as_bool(NUM2INT(self) >= 0)
                    } else {
                        rb_raise(R_ERR_ARG, "| c{Object}-> m{int?} with self{%"PRIsVALUE"} got in-valid normalizer{%"PRIsVALUE"} |", self, them);
                    }
                } else {
                    rb_raise(R_ERR_ARG, "| c{Object}-> m{int?} with self{%"PRIsVALUE"} got in-valid normalizer{%"PRIsVALUE"} |", self, them);
                }
            }
        } else {re_no}
    }
)

// | function{char?} |
r_func_raw(m_obj_char,
    if (is_str(self)) {
        re_as_bool(len_str(self) == 1)
    } else {
        re_no
    }
)

// | function{str?}  |
r_func_k_args(m_obj_str,
    if (argc == 0) {
        re_as_bool(is_str(self))
    } else {
        if (is_str(self)) {
            VALUE them;
            rb_scan_args(argc, argv, ARG_OPTS_ONE_OPTIONAL, & them);
            if (NIL_P(them)) {
                rb_raise(R_ERR_ARG, "| c{Object}-> m{str?} with self{%"PRIsVALUE"} got in-valid normalizer{%"PRIsVALUE"} |", self, them);
            } else {
                if (is_sym(them)) {
                    ID them_id = rb_obj_id(them);

                    if (them_id == 🆔cached_sym_none) {
                        re_as_bool(is_str(self))
                    } else if (them_id == 🆔cached_sym_normalizer_no_empty) {
                        if (is_empty_str(self)) {re_no} else {re_ye}
                        //if (is_str(self)) {if (is_empty_str(self)) {re_no} else {re_ye}} else {re_no}
                    } else {
                        rb_raise(R_ERR_ARG, "| c{Object}-> m{str?} with self{%"PRIsVALUE"} got in-valid normalizer{%"PRIsVALUE"} |", self, them);
                    }
                } else if (is_str(them)) {
                    re_as_bool(rb_str_cmp(self, them) == 0)
                } else {
                    rb_raise(R_ERR_ARG, "| c{Object}-> m{str?} with self{%"PRIsVALUE"} got in-valid normalizer{%"PRIsVALUE"} |", self, them);
                }
            }
        } else {
            re_no
        }
    }
)

// | function{stry?} |
r_func_raw(m_obj_stry, re_as_bool(is_str(self) || is_sym(self)))

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

// | function{class?} |
r_func_raw(m_obj_class, re_as_bool(is_class(self)))

// | function{module?} |
r_func_raw(m_obj_module, re_as_bool(is_module(self)))

// | function{m_obj_nucleotide} |
r_func_raw(m_obj_nucleotide, re_as_bool(is_nucleotide(self)))

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
        const long long id_to_find = NUM2LL(rb_obj_id(them));
        long long * the_result    = bsearch_power(id_to_find)
        if (the_result != NULL) {
            const int power_to_raise_to = exponential_indexes[bsearch_power_position(the_result)];

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
            ext_api_raise_err_int_bad_power
        }
    }
)

/*___________________________________________________________________________________________________________________
 ___       __       ___
|__  |    /  \  /\   |
|    |___ \__/ /~~\  |
_____________________________________________________________________________________________________________________ */

// | function{^} |
r_func_self_them(m_flt_patch_for_exponentials,

    if (is_sym(them)) {
        const long long id_to_find = NUM2LL(rb_obj_id(them));
        long long * the_result    = bsearch_power(id_to_find);
        if (the_result != NULL) {

            const double val_self = NUM2DBL(self); // RFLOAT_VALUE(self); // rb_float_value
            if (isnan(val_self)) {
                🛑runtime_flt_self("^", "may not be raised to an exponential power");
            }
            const int power_to_raise_to = exponential_indexes[bsearch_power_position(the_result)];
            if (val_self == 0.0 && power_to_raise_to < 0) {
                🛑divide0_flt_self("^", "may not be raised to a negative power")
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
        } else { ext_api_raise_err_flt_bad_power }
    } else {
        ext_api_raise_err_flt_bad_power
    }
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
    r_ary_pre_modify(self)
    r_ary_prepend(self, them)
    re_me
)

// | function{remove_empty!} |
r_func_raw(m_ary_remove_empty,
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

// | function{disjunctive_union} |
r_func_self_them(m_ary_disjunctive_union,
    if (is_ary(them)) {
        const long len_me   = len_ary(self);
        const long len_them = len_ary(them);
        if (len_me == 0 && len_them == 0) {
            return cached_ref_empty_ary;
        } else if (len_me == 0) {
            return rb_ary_dup(them);
        } else if (len_them == 0) {
            return rb_ary_dup(self);
        } else {
            long  i = 0L;
            VALUE n;
            VALUE output = new_ary(len_me + len_them);
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
    } else {🛑ary_param_not_type_ary("disjunctive_union", "them", them)}
)

// | function(frequency_counts} |
r_func_raw(m_ary_frequency_counts,
    const long len_me = len_ary(self);
    if (len_me == 0) { return cached_ref_empty_ary; }
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
                } else {
                    rb_gc_force_recycle(hsh);
                    re_no
                }
            }
            // all keys were matched
            rb_gc_force_recycle(hsh);
            re_ye
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
        if (len_them == 0) {🛑m_param_array_is_empty("Module", "f_add_aliases", "func_aliases")}
        long i;
        VALUE v;
        ID old_id = health_check_for_existing_func_name(self, & param_a);
        for (i = 0; i < len_them; i++) {
            v = r_ary_get(param_b, i)
            if (is_sym(v)) {
                rb_alias(self, rb_to_id(v), old_id);
            } else {🛑m_param_array_node_type("Module", "f_add_aliases", "func_aliases", param_b, "Symbol")}
        }
        re_me
    } else {🛑m_param_type("Module", "f_add_aliases", "func_aliases", param_b, "Array")}
)

/*____________________________________________________________________________________________________________________
 __      __   __   __   ___     ___      ___  __
/  `    /  ` /  \ |  \ |__     |__  |\ |  |  |__) \ /
\__,    \__, \__/ |__/ |___    |___ | \|  |  |  \  |
_____________________________________________________________________________________________________________________ */

//static void at_exit (void) {
    //printf("for when needed, this func will run after END {} blocks\n");
//}

static inline void internal_only_add_frozen_const_to(VALUE kclass, VALUE * internal_global, const char * const_name, VALUE val_to_freeze) {
    RB_OBJ_FREEZE(val_to_freeze);
    *internal_global = val_to_freeze;
    rb_define_const(kclass, const_name, val_to_freeze);
    rb_global_variable(internal_global);
}

static inline void startup_step2_add_ruuuby_c_extensions(void) {
    cached_global_sym_many_args = ID2SYM(rb_intern("*args"));
    rb_define_readonly_variable("$PRM_MANY", &cached_global_sym_many_args);

    ext_api_add_const_under(R_MATH, "RATIO_DEGREES_TO_RADIAN", DBL2NUM(M_PIE / 180.0))
    ext_api_add_const_under(R_MATH, "RATIO_RADIANS_TO_DEGREE", DBL2NUM(180.0 / M_PIE))
    ext_api_add_const_under(R_FLT, "RELATIVE_ERROR", DBL2NUM(M_FLT_RELATIVE_ERROR))
    ext_api_add_const_under(R_FLT, "MIN_NORMAL", DBL2NUM(M_FLT_MIN_NORMAL))
    ext_api_add_const_under(R_FLT, "EULER_MASCHERONI_CONSTANT", DBL2NUM(M_FLT_EULER_MASCHERONI_CONSTANT))
    ext_api_add_const_under(R_FLT, "SMALLEST_RELATIVE_ERROR", DBL2NUM(M_FLT_RELATIVE_ERROR * M_FLT_MIN_NORMAL));
    ext_api_add_const_under(R_FLT, "GOLDEN_RATIO", DBL2NUM(M_FLT_GOLDEN_RATIO))
    ext_api_add_const_under(R_FLT, "GOLDEN_ANGLE", DBL2NUM(M_FLT_GOLDEN_ANGLE_AS_DEGREES))
    ext_api_add_const_under(R_FLT, "GOLDEN_ANGLE_AS_RADIANS", DBL2NUM(M_FLT_GOLDEN_ANGLE_AS_RADIANS))

    //ext_api_add_const_under(R_FLT, "INFINITY_COMPLEX", DBL2NUM(M_FLT_INF_COMPLEX))

    internal_only_add_frozen_const_to(R_ARY, & cached_ref_empty_ary   , "EMPTY_INSTANCE", rb_ary_new_capa(0L));
    internal_only_add_frozen_const_to(R_FLT, & cached_flt_one_fourth   , "ONE_FOURTH"    , DBL2NUM(M_FLT_ONE_FOURTH));
    internal_only_add_frozen_const_to(R_FLT, & cached_flt_one_half     , "ONE_HALF"      , DBL2NUM(M_FLT_ONE_HALF));
    internal_only_add_frozen_const_to(R_FLT, & cached_flt_three_fourths, "THREE_FOURTHS" , DBL2NUM(M_FLT_THREE_FOURTHS));

    ext_api_add_public_method_0args_to_class(R_OBJ, "ary?"       , m_obj_ary)
    ext_api_add_public_method_0args_to_class(R_OBJ, "bool?"      , m_obj_bool)
    ext_api_add_public_method_kargs_to_class(R_OBJ, "int?"       , m_obj_int)
    ext_api_add_public_method_0args_to_class(R_OBJ, "flt?"        , m_obj_flt)
    ext_api_add_public_method_0args_to_class(R_OBJ, "hsh?"       , m_obj_hash)
    ext_api_add_public_method_kargs_to_class(R_OBJ, "sym?"       , m_obj_sym)
    ext_api_add_public_method_kargs_to_class(R_OBJ, "str?"       , m_obj_str)
    ext_api_add_public_method_0args_to_class(R_OBJ, "char?"      , m_obj_char)
    ext_api_add_public_method_0args_to_class(R_OBJ, "stry?"      , m_obj_stry)
    ext_api_add_public_method_0args_to_class(R_OBJ, "num?"       , m_obj_num)
    ext_api_add_public_method_0args_to_class(R_OBJ, "class?"     , m_obj_class)
    ext_api_add_public_method_0args_to_class(R_OBJ, "module?"    , m_obj_module)
    ext_api_add_public_method_0args_to_class(R_OBJ, "nucleotide?", m_obj_nucleotide)

    ext_api_add_public_method_0args_to_class(R_INT, "finite?"  , m_int_is_finite)
    ext_api_add_public_method_0args_to_class(R_INT, "infinite?", m_int_is_not_finite)

    // | f11 | creates alias of Integer's func{^} which is originally provided for bitwise XOR
    ext_api_add_func_alias(R_INT, "bitwise_xor", "^")
    ext_api_add_public_method_1args_to_class(R_INT, "^", m_int_patch_for_exponentials)

    ext_api_add_public_method_1args_to_class(R_FLT, "^", m_flt_patch_for_exponentials)

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
    startup_step0_load_needed_default_ruby_libs();
    startup_step1_before_loading_extension();
    startup_step2_add_ruuuby_c_extensions();
    startup_step3_load_3rd_party_gems();
    startup_step4_load_needed_ruuuby_files();

    //ruby_vm_at_exit(& at_exit);

    startup_step5_protect_against_gc();
)
