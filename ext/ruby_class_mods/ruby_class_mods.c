// encoding: UTF-8

/*____________________________________________________________________________________________________________________________________________________________________
         __   __        __                  __   __   __  ___  __
 |    | |__) |__)  /\  |__) \ /    |  |\/| |__) /  \ |__)  |  /__`
 |___ | |__) |  \ /~~\ |  \  |     |  |  | |    \__/ |  \  |  .__/
____________________________________________________________________________________________________________________________________________________________________ */

//#include "ruby/encoding.h"
#include "ruby-2.7.0/x86_64-darwin18/rb_mjit_min_header-2.7.0.h"

#include <ruby.h>
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
#include <ruby/vm.h>

#include <stdio.h>
#include <stdlib.h>

#include <inttypes.h>

#include <float.h>
#include <math.h>
#include <tgmath.h>
#include <complex.h>

#ifndef CRUUUBY_H
#include "ruby_class_mods.h"
#endif

/*____________________________________________________________________________________________________________________________________________________________________
            __   __   __   __       __   __   ___     __   __   __   __   ___  __   __          __
 |\/|  /\  /  ` |__) /  \ /__` .   |__) |__) |__  __ |__) |__) /  \ /  ` |__  /__` /__` | |\ | / _`
 |  | /~~\ \__, |  \ \__/ .__/ .   |    |  \ |___    |    |  \ \__/ \__, |___ .__/ .__/ | | \| \__>
____________________________________________________________________________________________________________________________________________________________________ */
#define r_str_new_frozen_literal(arg) rb_str_new_frozen(rb_str_new_cstr(arg))
#define cstr_to_rstr(arg)             rb_str_new_cstr(arg)

#define bsearch_power(val_to_find)         (unsigned long *) bsearch (&val_to_find, exponential_ids, 𝔠EXPONENTS, 𝔠ULONG, internal_only_compare_func_4_object_id);
#define bsearch_power_position(arg_index) ((int)(((int)arg_index - (int)exponential_ids) / 𝔠ULONG))

/*____________________________________________________________________________________________________________________
   __            ___  ___  __                          ___       __   ___  __   __
  /  `    | |\ |  |  |__  |__) |\ |  /\  |       |__| |__  |    |__) |__  |__) /__`
  \__,    | | \|  |  |___ |  \ | \| /~~\ |___    |  | |___ |___ |    |___ |  \ .__/
_____________________________________________________________________________________________________________________ */

static inline int is_theta_angle(const VALUE arg) {
    if (rb_obj_is_instance_of(arg, cached_class_theta_angle)) {
        re_ye
    } else {
        re_no
    }
}

static inline VALUE θ_is_normal(const unsigned char angle_mode, const double angle_value) {
    if (angle_value == 0.0) {
        re_ye
    } else if (angle_value < 0.0) {
        switch(angle_mode) {
        case θ_MODE_ID_TRN:
            re_as_bool(angle_value >= θ_TRN_PERIGON_NEGATIVE)
        case θ_MODE_ID_DGR:
            re_as_bool(angle_value >= θ_DGR_PERIGON_NEGATIVE)
        case θ_MODE_ID_RAD:
            re_as_bool(angle_value >= θ_RAD_PERIGON_NEGATIVE)
        default:
            re_as_bool(angle_value >= θ_GON_PERIGON_NEGATIVE)
        }
    } else {
        switch(angle_mode) {
        case θ_MODE_ID_TRN:
            re_as_bool(angle_value <= θ_TRN_PERIGON)
        case θ_MODE_ID_DGR:
            re_as_bool(angle_value <= θ_DGR_PERIGON)
        case θ_MODE_ID_RAD:
            re_as_bool(angle_value <= θ_RAD_PERIGON)
        default:
            re_as_bool(angle_value <= θ_GON_PERIGON)
        }
    }
}

static inline VALUE 👉θ_is_normal(const 👉θ data) {
    return θ_is_normal(data->angle_mode, data->angle_value);
}

static inline int is_num(VALUE arg) {
    switch(TYPE(arg)){
    case RUBY_T_FIXNUM:case RUBY_T_FLOAT:case RUBY_T_RATIONAL:case RUBY_T_COMPLEX:case RUBY_T_BIGNUM:
        re_c_ye
    default:
        if(rb_obj_is_instance_of(arg, cached_class_big_decimal)) {
            re_ye
        } else {
            re_no
        }
    }
}

// in case of any errors lol, previous code to use
//ID old_id = rb_check_id(& param_a);
//if (!old_id) {rb_print_undef_str(self, param_a);}
static inline ID health_check_for_existing_func_name(VALUE context_self, VALUE * func_name_as_str) {
    ID func_id = rb_check_id(func_name_as_str);
    if (!func_id) {rb_print_undef_str(context_self, * func_name_as_str);}
    return func_id;
}

static inline VALUE 💎new_ary(const long known_max_size) {
    if (known_max_size == 0) {
        return rb_ary_new_capa(0);
    } else if (known_max_size > 0 && known_max_size <= 𝔠ARY_DEFAULT) {
        return rb_ary_new_capa(known_max_size);
    } else {
        return rb_ary_new();
    }
}

static void internal_only_prepare_f16(void) {
    cached_flt_nan          = rb_const_get_at(R_FLT, rb_intern("NAN"));
    cached_flt_inf          = rb_const_get_at(R_FLT, rb_intern("INFINITY"));
    cached_flt_e            = rb_const_get_at(R_MATH, rb_intern("E"));
    cached_flt_negative_inf = rb_const_get_at(R_FLT, rb_intern("INFINITY_NEGATIVE"));
    cached_flt_inf_complex  = rb_const_get_at(R_FLT, rb_intern("INFINITY_COMPLEX"));

    VALUE pack_as_utf8     = rb_str_new_cstr("U*");
    VALUE rb_intern_pack   = rb_intern("pack");
    VALUE code_points      = 💎new_ary_size2(INT2FIX(33), INT2FIX(8709));

    💎PROCEDURE_00(🆔n_no_empty)

    rb_ary_modify(code_points);

    rb_ary_store(code_points, 0l, INT2FIX(8712));
    rb_ary_store(code_points, 1l, INT2FIX(8469));
    💎PROCEDURE_00(🆔n_in_set_naturals)

    rb_ary_store(code_points, 1l, INT2FIX(120142));
    💎PROCEDURE_00(🆔n_in_set_wholes)

    rb_ary_store(code_points, 1l, INT2FIX(8484));
    💎PROCEDURE_00(🆔n_in_set_integers)

    rb_ary_store(code_points, 1l, INT2FIX(120140));
    💎PROCEDURE_00(🆔n_in_set_universal)

    rb_ary_store(code_points, 1l, INT2FIX(94));
    💎PROCEDURE_00(🆔n_in_set_superscripts)

    rb_ary_store(code_points, 1l, INT2FIX(8469));
    rb_ary_push(code_points, INT2FIX(120138));
    💎PROCEDURE_00(🆔n_in_set_naturals_w_str_allowed)

    rb_ary_store(code_points, 1l, INT2FIX(120142));
    💎PROCEDURE_00(🆔n_in_set_wholes_w_str_allowed)

    rb_ary_store(code_points, 1l, INT2FIX(8484));
    💎PROCEDURE_00(🆔n_in_set_integers_w_str_allowed)

    rb_ary_store(code_points, 1l, INT2FIX(120140));
    💎PROCEDURE_00(🆔n_in_set_universal_w_str_allowed)

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

    qsort(exponential_ids, 𝔠EXPONENTS, 𝔠ULONG, internal_only_compare_func_4_object_id);

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
}

static inline void startup_step5_protect_against_gc(void) {
    rb_global_variable(& cached_rb_intern_as_degree);
    rb_global_variable(& cached_rb_intern_as_radian);
    rb_global_variable(& cached_rb_intern_as_gon);
    rb_global_variable(& cached_rb_intern_as_turn);

    rb_global_variable(& cached_class_set);
    rb_global_variable(& cached_class_big_decimal);

    rb_global_variable(& cached_global_sym_many_args);

    rb_global_variable(& cached_module_param_err);

    // TODO: expand investigation
    //size_t rb_obj_memsize_of(VALUE);

    rb_gc_verify_internal_consistency();
}

static void startup_step0_load_f98_b02(void) {
    // Ruby libraries
    ensure_loaded_default(bigdecimal)
    ensure_loaded_default(tempfile)
    ensure_loaded_default(singleton)
    ensure_loaded_default(logger)
    ensure_loaded_default(time)
    ensure_loaded_default(prime)
    // 3rd party gem libraries
    ensure_loaded_default(tty-command)
    ensure_loaded_default(rugged)
}

static inline void startup_step1_before_loading_extension(void) {
    cached_class_big_decimal          = rb_const_get(rb_cObject, rb_intern("BigDecimal"));
    cached_class_set                  = rb_const_get(rb_cObject, rb_intern("Set"));

    cached_rb_intern_zero_angle       = rb_intern("zero");
    cached_rb_intern_acute_angle      = rb_intern("acute");
    cached_rb_intern_sextant_angle    = rb_intern("sextant");
    cached_rb_intern_right_angle      = rb_intern("right");
    cached_rb_intern_obtuse_angle     = rb_intern("obtuse");
    cached_rb_intern_straight_angle   = rb_intern("straight");
    cached_rb_intern_reflex_angle      = rb_intern("reflex");
    cached_rb_intern_perigon_angle    = rb_intern("perigon");
    cached_rb_intern_oblique_angle    = rb_intern("oblique");

    cached_rb_intern_as_degree        = rb_intern("as_degree");
    cached_rb_intern_as_radian        = rb_intern("as_radian");
    cached_rb_intern_as_gon           = rb_intern("as_gon");
    cached_rb_intern_as_turn          = rb_intern("as_turn");
    cached_sym_as_radian              = ID2SYM(cached_rb_intern_as_radian);
    cached_sym_as_degree              = ID2SYM(cached_rb_intern_as_degree);
    cached_sym_as_turn                = ID2SYM(cached_rb_intern_as_turn);
    cached_sym_as_gon                 = ID2SYM(cached_rb_intern_as_gon);

    cached_rb_intern_smells_like_int  = rb_intern("smells_like_int?");
    cached_rb_intern_is_finite         = rb_intern("finite?");
    cached_rb_intern_ints_bitwise_xor = rb_intern("bitwise_xor");
    cached_rb_intern_raise_to_power   = rb_intern("**");
    cached_rb_intern_is_empty         = rb_intern("empty?");

    cached_module_ruuuby               = 💎add_global_module("Ruuuby")
    cached_module_ruuuby_metadata      = 💎add_module_under(cached_module_ruuuby, "MetaData")
    cached_module_attribute            = 💎add_module_under(cached_module_ruuuby, "Attribute")
    cached_module_attribute_includable = 💎add_module_under(cached_module_ruuuby, "Includable")
    cached_module_attribute_extendable = 💎add_module_under(cached_module_ruuuby, "Extendable")
    cached_module_param_err            = 💎add_module_under(cached_module_ruuuby, "ParamErr")

    💎add_new_sub_class_under(cached_module_param_err, R_ERR_ARG, "WrongParamType")
}

static inline void startup_step4_load_needed_ruuuby_files(void) {
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
    ensure_loaded_class(method)
    // ensure_loaded_class(method/math_function)
    ensure_loaded_ruuuby(arg_err)
    ensure_loaded_enumerable(ary)
    ensure_loaded_enumerable(hsh) // must be after{ary}
    ensure_loaded_nums(int)
    ensure_loaded_nums(float)
    ensure_loaded_nums(numeric)
    ensure_loaded_nums(big_decimal)
    ensure_loaded_nums(rational)
    ensure_loaded_nums(complex)
    ensure_loaded_nums(theta_angle)

    ensure_loaded_class(nil)
    ensure_loaded_enumerable(set)

    ensure_loaded_attribute_extendable(syntax_cache)

    ensure_loaded_attribute_extendable(singleton)
    ensure_loaded_attribute_includable(singleton)

    ensure_loaded_set_theory(closure)
    ensure_loaded_set_theory(number_set)

    ensure_loaded_set_theory(discrete/algebraic_numbers)
    ensure_loaded_set_theory(discrete/boolean_numbers)
    ensure_loaded_set_theory(discrete/complex_numbers)
    ensure_loaded_set_theory(discrete/empty_set)
    ensure_loaded_set_theory(discrete/imaginary_numbers)
    ensure_loaded_set_theory(discrete/integer_numbers)
    ensure_loaded_set_theory(discrete/irrational_numbers)
    ensure_loaded_set_theory(discrete/natural_numbers)
    ensure_loaded_set_theory(discrete/null_set)
    ensure_loaded_set_theory(discrete/rational_numbers)
    ensure_loaded_set_theory(discrete/real_algebraic_numbers)
    ensure_loaded_set_theory(discrete/real_numbers)
    ensure_loaded_set_theory(discrete/universal_set)
    ensure_loaded_set_theory(discrete/whole_numbers)

    ensure_loaded_group_theory(circle_group)

    ensure_loaded_class(sym) // must be after{attribute_cardinality}

    ensure_loaded_class(str) // must be after{attribute_syntax_cache, attribute_cardinality}
    ensure_loaded_io(file)    // must be after{attribute_syntax_cache}
    ensure_loaded_io(dir)    // must be after{attribute_syntax_cache}

    ensure_loaded_ruuuby(global_funcs)

    internal_only_prepare_f16(); // must be after{ruuuby/types, ruuuby/class/str}

    ensure_loaded_ruuuby(ruuuby/metadata/ruuuby_metadata)

    ensure_loaded_math(space/space)
    ensure_loaded_math(space/types_space)
    ensure_loaded_math(space/discrete/boolean_space)
    ensure_loaded_math(space/discrete/nucleotide_space)
    ensure_loaded_math(space/discrete/number_space)
    ensure_loaded_math(space/discrete/symbolic_numbers_space)

    ensure_loaded_math(number_theory/number_theory)

    // [⚠️] : excluding: alternative files are loading these already:
    //          * ensure_loaded_ruuuby(ruuuby/metadata/ruuuby_metadata_constants)
    //          * ensure_loaded_ruuuby(version)
    // [⚠️] : reminder, do not load "ruuuby/ruuuby_orm" here

    ensure_loaded_ruuuby(virtual/env)
    ensure_loaded_ruuuby(virtual/f06)
    ensure_loaded_ruuuby(virtual/f28)

    ensure_loaded_ruuuby(ruuuby/routine_cli)
    ensure_loaded_ruuuby(ruuuby/ruuuby_api)
    ensure_loaded_ruuuby(ruuuby/git_api)

    ensure_loaded_ruuuby(ruuuby/engine/ruuuby_logging)
    ensure_loaded_ruuuby(ruuuby/engine/ruuuby_engine)

    ensure_loaded_ruuuby(configs)
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
ⓡ𝑓_def(m_obj_ary, re_as_bool(is_ary(self)))

// | function{bool?} |
ⓡ𝑓_def(m_obj_bool, re_as_bool(is_bool(self)))

// | function{hash?} |
ⓡ𝑓_def(m_obj_hash, re_as_bool(is_hsh(self)))

// | function{flt?}   |
ⓡ𝑓_def(m_obj_flt, re_as_bool(is_float(self)))

// | function{sym?}  |
ⓡ𝑓_kargs(m_obj_sym,
    if (argc == 0) {
        re_as_bool(is_sym(self))
    } else if (argc == 1) {
        VALUE them;
        rb_scan_args(argc, argv, ARG_OPTS_ONE_OPTIONAL, & them);
        if (is_sym(them)) {
            if (them == 🆔n_in_set_superscripts) {
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
                                return cached_flt_inf_complex;
                            }
                        } else {
                            re_no
                        }
                    } else {re_no}
                } else {re_no}
            } else {🛑normalizer_invalid_value("sym?", them)}
        } else {
            raise_err_arg("| <%"PRIsVALUE">-> m{sym?} given 1 arg expects type{Symbol}, not the received type{%s} from arg{%"PRIsVALUE"} |", self, rb_obj_classname(them), them);
        }
    } else {
        raise_err_arg("| <%"PRIsVALUE">-> m{sym?} expects 0 or 1 args, not the received{%d} |", self, argc);
    }
)

// | function{int?}  |
ⓡ𝑓_kargs(m_obj_int,
    if (argc == 0) {
        re_as_bool(is_int(self))
    } else if (argc == 1) {
        VALUE them;
        rb_scan_args(argc, argv, ARG_OPTS_ONE_OPTIONAL, & them);

        if (is_sym(them)) {
            //printf("\n\nCOVERAGE INT?\n\n");
            //re_ye

            if (is_int(self)) {
                if (them == 🆔n_in_set_universal || them == 🆔n_in_set_universal_w_str_allowed || them == 🆔n_in_set_integers || them == 🆔n_in_set_integers_w_str_allowed) {
                    re_ye
                } else if (them == 🆔n_in_set_naturals || them == 🆔n_in_set_naturals_w_str_allowed) {
                    re_as_bool(NUM2INT(self) > 0)
                } else if (them == 🆔n_in_set_wholes || them == 🆔n_in_set_wholes_w_str_allowed) {
                    re_as_bool(NUM2INT(self) >= 0)
                } else {
                    //re_no
                    raise_err_arg("| <%"PRIsVALUE">-> m{num?} does not support the received normalizer{%"PRIsVALUE"}; either it is invalid or the current type of{%s} is not valid w/ the valid normalizer |", self, them, rb_obj_classname(self));
                }
            } else if (is_str(self)) {
                if (them == 🆔n_in_set_universal_w_str_allowed || them == 🆔n_in_set_integers_w_str_allowed || them == 🆔n_in_set_naturals_w_str_allowed || them == 🆔n_in_set_wholes_w_str_allowed) {
                    VALUE looks_like_num = rb_funcall(self, rb_intern("to_num?"), 0);
                    if (looks_like_num) {
                        VALUE as_num = rb_funcall(self, rb_intern("to_num"), 0);
                        if (them == 🆔n_in_set_universal_w_str_allowed) {
                            re_as_bool(is_finite_num(as_num))
                        } else if (them == 🆔n_in_set_naturals_w_str_allowed) {
                            if (is_finite_num(as_num)) {
                                if (has_smell_of_int(as_num)) {
                                    re_as_bool(NUM2INT(as_num) > 0)
                                } else {re_no}
                            } else {re_no}
                        } else if (them == 🆔n_in_set_wholes_w_str_allowed) {
                            if (is_finite_num(as_num)) {
                                if (has_smell_of_int(as_num)) {
                                    re_as_bool(NUM2INT(as_num) >= 0)
                                } else {re_no}
                            } else {re_no}
                        } else if (them == 🆔n_in_set_integers_w_str_allowed) {
                            if (is_finite_num(as_num)) {
                                if (has_smell_of_int(as_num)) {
                                    re_ye
                                } else {re_no}
                            } else {re_no}
                        } else {
                            printf("\nw8, error case scenario?\n");
                            re_no
                        }
                    } else {
                        re_no
                    }
                } else {
                    raise_err_arg("| <%"PRIsVALUE">-> m{num?} does not support the received normalizer{%"PRIsVALUE"}; either it is invalid or the current type of{%s} is not valid w/ the valid normalizer |", self, them, rb_obj_classname(self));
                }
            } else {re_no}
        } else {
            raise_err_arg("| <%"PRIsVALUE">-> m{int?} given 1 arg expects type{Symbol}, not the received type{%s} from arg{%"PRIsVALUE"} |", self, rb_obj_classname(them), them);
        }
    } else {
         raise_err_arg("| <%"PRIsVALUE">-> m{int?} expects 0 or 1 args, not the received{%d} |", self, argc);
    }
)

// | function{chr?} |
ⓡ𝑓_def(m_obj_chr,
    if (is_str(self)) {
        re_as_bool(len_str(self) == 1)
    } else {
        re_no
    }
)

// | function{set?} |
ⓡ𝑓_def(m_obj_set, return rb_obj_is_instance_of(self, cached_class_set);)

// | function{str?}  |
ⓡ𝑓_kargs(m_obj_str,
    if (argc == 0) {
        re_as_bool(is_str(self))
    } else if (argc == 1) {
        VALUE them;
        rb_scan_args(argc, argv, ARG_OPTS_ONE_OPTIONAL, & them);
        if (NIL_P(them)) {
            rb_raise(R_ERR_ARG, "| c{%s}-> m{%s} with self{%"PRIsVALUE"} got null for optional arg |", rb_obj_classname(self), "str?", self);
        }

        if (is_sym(them)) {

            if (them == 🆔n_no_empty) {
                if (is_str(self)) {
                    if (is_empty_str(self)) {re_no} else {re_ye}
                } else {re_no}
            } else {
                //raise_err_arg("| <%"PRIsVALUE">-> m{str?} does not support the received normalizer{%"PRIsVALUE"} |", self, them);
                🛑normalizer_invalid_value("str?", them)
            }
        } else {
            raise_err_arg("| <%"PRIsVALUE">-> m{str?} given 1 arg expects type{Symbol}, not the received type{%s} from arg{%"PRIsVALUE"} |", self, rb_obj_classname(them), them);
        }
    } else {
        raise_err_arg("| <%"PRIsVALUE">-> m{str?} expects 0 or 1 args, not the received{%d} |", self, argc);
    }
)

// | function(num?} |
ⓡ𝑓_kargs(m_obj_num,
    if (argc == 0) {
        re_as_bool(is_num(self))
    } else if (argc == 1) {
        VALUE them;
        rb_scan_args(argc, argv, ARG_OPTS_ONE_OPTIONAL, & them);
        if (is_sym(them)) {

            if (is_num(self)) {
                if (them == 🆔n_in_set_universal || them == 🆔n_in_set_universal_w_str_allowed) {
                    re_as_bool(is_finite_num(self))
                } else if (them == 🆔n_in_set_naturals || them == 🆔n_in_set_naturals_w_str_allowed) {
                    if (is_finite_num(self)) {
                        if (has_smell_of_int(self)) {
                            re_as_bool(NUM2INT(self) > 0)
                        } else {re_no}
                    } else {re_no}
                } else if (them == 🆔n_in_set_wholes || them == 🆔n_in_set_wholes_w_str_allowed) {
                    if (is_finite_num(self)) {
                        if (has_smell_of_int(self)) {
                            re_as_bool(NUM2INT(self) >= 0)
                        } else {re_no}
                    } else {re_no}
                } else if (them == 🆔n_in_set_integers || them == 🆔n_in_set_integers_w_str_allowed) {
                    if (is_finite_num(self)) {
                        if (has_smell_of_int(self)) {
                            re_ye
                        } else {re_no}
                    } else {re_no}
                } else {
                    raise_err_arg("| <%"PRIsVALUE">-> m{num?} does not support the received normalizer{%"PRIsVALUE"}; either it is invalid or the current type of{%s} is not valid w/ the valid normalizer |", self, them, rb_obj_classname(self));
                }
            } else if (is_str(self)) {
                VALUE looks_like_num = rb_funcall(self, rb_intern("to_num?"), 0);
                if (looks_like_num) {
                    VALUE as_num = rb_funcall(self, rb_intern("to_num"), 0);
                    if (them == 🆔n_in_set_universal_w_str_allowed) {
                        re_as_bool(is_finite_num(as_num))
                    } else if (them == 🆔n_in_set_naturals_w_str_allowed) {
                        if (is_finite_num(as_num)) {
                            if (has_smell_of_int(as_num)) {
                                re_as_bool(NUM2INT(as_num) > 0)
                            } else {re_no}
                        } else {re_no}
                    } else if (them == 🆔n_in_set_wholes_w_str_allowed) {
                        if (is_finite_num(as_num)) {
                            if (has_smell_of_int(as_num)) {
                                re_as_bool(NUM2INT(as_num) >= 0)
                            } else {re_no}
                        } else {re_no}
                    } else if (them == 🆔n_in_set_integers_w_str_allowed) {
                        if (is_finite_num(as_num)) {
                            if (has_smell_of_int(as_num)) {
                                re_ye
                            } else {re_no}
                        } else {re_no}
                    } else {
                        if (them == 🆔n_in_set_universal_w_str_allowed) {
                            printf("\nBUT IT DOES!\n");
                        }
                        raise_err_arg("| <%"PRIsVALUE">-> m{num?} does not support the received normalizer{%"PRIsVALUE"}; either it is invalid or the current type of{String} is not valid w/ the valid normalizer |", self, them);
                    }
                } else {re_no}
            } else {
                raise_err_arg("| self{%"PRIsVALUE"}-> m{num?} will always return false for self-type{%s} |", self, rb_obj_classname(self));
            }
        } else {
            raise_err_arg("| <%"PRIsVALUE">-> m{num?} given 1 arg expects type{Symbol}, not the received type{%s} from arg{%"PRIsVALUE"} |", self, rb_obj_classname(them), them);
        }
    } else {
        raise_err_arg("| <%"PRIsVALUE">-> m{num?} expects 0 or 1 args, not the received{%d} |", self, argc);
    }
)

// | function{class?} |
//ⓡ𝑓_def(m_obj_class, re_as_bool(is_class(self)))

// | function{module?} |
//ⓡ𝑓_def(m_obj_module, re_as_bool(is_module(self)))

// | function{m_obj_nucleotide} |
//ⓡ𝑓_def(m_obj_nucleotide, re_as_bool(is_nucleotide(self)))

/*___________________________________________________________________________________________________________________
       ___  ___  __   ___  __
| |\ |  |  |__  / _` |__  |__)
| | \|  |  |___ \__> |___ |  \
_____________________________________________________________________________________________________________________ */

// | function{finite?}   |
ⓡ𝑓_def(m_int_is_finite, re_ye)

// | function{infinite?} |
ⓡ𝑓_def(m_int_is_not_finite, re_no)

// | function{^}        |
ⓡ𝑓_self_them(m_int_patch_for_exponentials,
    if (is_int(them)) {
        re_me_func_1args(cached_rb_intern_ints_bitwise_xor, them)
    } else {
        const unsigned long id_to_find = NUM2ULONG(rb_obj_id(them));
        unsigned long * the_result    = bsearch_power(id_to_find)
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
            🛑c_self_arg_err__print_self_them("| c{Integer}-> m{^} self(%"PRIsVALUE") unable to match exponential(%"PRIsVALUE") |")
        }
    }
)

/*___________________________________________________________________________________________________________________
 ___       __       ___
|__  |    /  \  /\   |
|    |___ \__/ /~~\  |
_____________________________________________________________________________________________________________________ */

// | function{has_decimals?} |
ⓡ𝑓_def(m_flt_has_decimals,
    double val_self = NUM2DBL(self);
    if (isnan(val_self)) {
        re_no
    } else if (isfinite(val_self)) {
        if (val_self == trunc(val_self)) {re_no} else {re_ye}
    } else {re_nil}
);

// original source code referenced from:
// @see https://floating-point-gui.de/errors/NearlyEqualsTest.java
//
// | function{≈≈} |
ⓡ𝑓_self_them(m_flt_basically_equal,
    const double val_self = NUM2DBL(self);
    if (isnan(val_self) || ((!(is_float(them))) && (!(is_int(them))))) {
        re_no
    } else if (rb_obj_equal(self, them)) {
        re_ye
    }
    double val_them = NUM2DBL(them);
    if (val_self == val_them) {
        re_ye
    } else {
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
)

// | function{^} |
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
        } else {🛑c_self_arg_err__print_self_them("| c{Float}-> m{^} self(%"PRIsVALUE") unable to match exponential(%"PRIsVALUE") |")}
    } else {
        if (is_float(them)) {
            const double val_self = NUM2DBL(self);
            const double val_them = NUM2DBL(them);
            if (val_self == NUM2DBL(cached_flt_e)) {
                if (val_them == Ω) {
                    return DBL2NUM((double) (expl(ΩL)));
                } else {
                    return DBL2NUM((double) (expl((long double) NUM2DBL(them))));
                }
            } else {🛑c_self_arg_err__print_self_them("| c{Float}-> m{^} self(%"PRIsVALUE") unable to match exponential(%"PRIsVALUE") |")}
        } else {🛑c_self_arg_err__print_self_them("| c{Float}-> m{^} self(%"PRIsVALUE") unable to match exponential(%"PRIsVALUE") |")}
    }
)

/*___________________________________________________________________________________________________________________

|\ | | |
| \| | |___
_____________________________________________________________________________________________________________________ */

ⓡ𝑓_def(m_nil_empty, re_ye) // func{empty?}

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
        🛑c_self_got_non_str_param(">>", them)
    }
)

// | function{err_to_num} |
ⓡ𝑓_def(m_str_err_to_num,
     rb_raise(R_ERR_RUNTIME, "| c{String}-> m{to_num} may not convert self(%"PRIsVALUE") into a valid numeric |", self);
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

// | function{disjunctive_union} |
ⓡ𝑓_self_them(m_ary_disjunctive_union,
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
    } else {🛑c_self_got_non_ary_param("disjunctive_union", them)}
)

// | function(frequency_counts} |
ⓡ𝑓_def(m_ary_frequency_counts,
    const long len_me = len_ary(self);
    if (len_me == 0) { return cached_ref_empty_ary; }
    //rb_hash_default_value
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
ⓡ𝑓_self_them(m_ary_equal_contents,
    if (is_ary(them)) {
        const long len_me = len_ary(self);
        if ((len_me - len_ary(them)) != 0) {re_no} else if (len_me == 0) {re_ye} else {
            VALUE hsh = rb_hash_new();
            long i;
            VALUE n;
            for (i = 0; i < len_me; i++) {
                n = RARRAY_AREF(self, i);
                if (r_hsh_has_key(hsh, n)) {r_hsh_increment_keys_val(hsh, n)} else {r_hsh_set_val_to_one(hsh, n)}
            }
            for (i = 0; i < len_me; i++) {
                n = RARRAY_AREF(them, i);
                if (r_hsh_has_key(hsh, n)) {
                    const long current_count = NUM2LONG(rb_hash_aref(hsh, n));
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
    } else {🛑c_self_got_non_ary_param("equal_contents?", them)}
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
        ID old_id = health_check_for_existing_func_name(self, & param_a);
        for (i = 0; i < len_them; i++) {
            v = r_ary_get(param_b, i)
            if (is_sym(v)) {
                rb_alias(self, rb_to_id(v), old_id);
            } else {
                raise_err_arg("| module-function{f_add_aliases} for self{%"PRIsVALUE"} of type{%s} received a non-symbol{%s} as one of the array-arg's elements |", self, rb_obj_classname(self), rb_obj_classname(v))
            }
        }
        re_me
    } else {🛑m_param_type("Module", "f_add_aliases", "func_aliases", param_b, "Array")}
)

/*____________________________________________________________________________________________________________________
___       ___ ___                    __        ___
 |  |__| |__   |   /\      /\  |\ | / _` |    |__
 |  |  | |___  |  /~~\    /~~\ | \| \__> |___ |___
_____________________________________________________________________________________________________________________ */

static inline void 👉θ_flag_set_constant(const 👉θ data){data->flags_meta_data.b.b3 = FLAG_TRUE;}
static inline void 👉θ_flag_clr_constant(const 👉θ data){data->flags_meta_data.b.b3 = FLAG_FALSE;}
static inline int 👉θ_flag_is_constant(const 👉θ data){return data->flags_meta_data.b.b3;}

static inline void 👉θ_flag_set_coerce(const 👉θ data){data->flags_meta_data.b.b4 = FLAG_TRUE;}
static inline void 👉θ_flag_clr_coerce(const 👉θ data){data->flags_meta_data.b.b4 = FLAG_FALSE;}
static inline int 👉θ_flag_is_coerce(const 👉θ data){return data->flags_meta_data.b.b4;}

static inline void 👉θ_flag_set_cache_synced(const 👉θ data){data->flags_meta_data.b.b5 = FLAG_TRUE;}
static inline void 👉θ_flag_clr_cache_synced(const 👉θ data){data->flags_meta_data.b.b5 = FLAG_FALSE;}
static inline int 👉θ_flag_is_cache_synced(const 👉θ data){return data->flags_meta_data.b.b5;}

static const rb_data_type_t θ_type = {
    .wrap_struct_name = "theta_angle",
    .function = {
        .dmark = NULL, // NULL as the struct contains no references to the c-data-type{VALUE}
        .dfree = θ_free,
        .dsize = θ_size,
    },
    .data = NULL,
    .flags = RUBY_TYPED_FREE_IMMEDIATELY,
};

static void θ_free(void * data) {free(data);}

static size_t θ_size(const void * data) {return 𝔠THETA_ANGLE;}

static VALUE θ_alloc(VALUE self) {
    👉θ data;
    💎set_field("@real", ℤ0)
    return TypedData_Make_Struct(self, ThetaAngle, & θ_type, data);
}

static VALUE θ_new(const double angle, const VALUE sym_mode) {
    👉θ data;
    VALUE argv[2] = {DBL2NUM(angle), sym_mode};
    VALUE obj     = TypedData_Make_Struct(cached_class_theta_angle, ThetaAngle, & θ_type, data);
    rb_obj_call_init(obj, 2, argv);
    return obj;
}

static VALUE θ_new_constant(const double angle, const VALUE sym_mode) {
    VALUE obj = θ_new(angle, sym_mode);
    👉θ data; TypedData_Get_Struct(obj, ThetaAngle, & θ_type, data);
    👉θ_flag_set_constant(data);
    RB_OBJ_FREEZE(obj);
    return obj;
}

static inline void θ_set_value(const 👉θ data, const double value) {
    if (!(👉θ_flag_is_constant(data))) {
        data->angle_value = value;
        👉θ_flag_clr_cache_synced(data);
    } else {
        rb_raise(R_ERR_RUNTIME, "| c{ThetaAngle}-> internal m{set_value} can\'t be called on a constant ThetaAngle |");
    }
}

static inline long double θ_get_compatible_long_double_val(const unsigned char angle_mode, const 👉θ them) {
    if (angle_mode == them->angle_mode) {
        return (long double) them->angle_value;
    } else if (them->angle_mode == θ_MODE_ID_DGR) {
        if (angle_mode == θ_MODE_ID_RAD) {
            return θDGRL2LRAD((long double) them->angle_value);
        } else if (angle_mode == θ_MODE_ID_TRN) {
            return θDGRL2LTRN((long double) them->angle_value);
        } else {
            return θDGRL2LGON((long double) them->angle_value);
        }
    } else if (them->angle_mode == θ_MODE_ID_RAD) {
        if (angle_mode == θ_MODE_ID_DGR) {
            return θRADL2LDGR((long double) them->angle_value);
        } else if (angle_mode == θ_MODE_ID_TRN) {
            return θRADL2LTRN((long double) them->angle_value);
        } else {
            return θRADL2LGON((long double) them->angle_value);
        }
    } else if (them->angle_mode == θ_MODE_ID_TRN) {
        if (angle_mode == θ_MODE_ID_DGR) {
            return θTRNL2LDGR((long double) them->angle_value);
        } else if (angle_mode == θ_MODE_ID_RAD) {
            return θTRNL2LRAD((long double) them->angle_value);
        } else {
            return θTRNL2LGON((long double) them->angle_value);
        }
    } else {
        if (angle_mode == θ_MODE_ID_DGR) {
            return θGONL2LDGR((long double) them->angle_value);
        } else if (angle_mode == θ_MODE_ID_RAD) {
            return θGONL2LRAD((long double) them->angle_value);
        } else if (angle_mode == θ_MODE_ID_TRN) {
            return θGONL2LTRN((long double) them->angle_value);
        } else {
            return θGONL2LRAD((long double) them->angle_value);
        }
    }
}

static inline double θ_get_compatible_value_from_θ_with_mode(const unsigned char angle_mode, const 👉θ them) {
    if (angle_mode == them->angle_mode) {
        return them->angle_value;
    } else if (them->angle_mode == θ_MODE_ID_DGR) {
        if (angle_mode == θ_MODE_ID_RAD) {
            return θDGR2RAD(them->angle_value);
        } else if (angle_mode == θ_MODE_ID_TRN) {
            return θDGR2TRN(them->angle_value);
        } else {
            return θDGR2GON(them->angle_value);
        }
    } else if (them->angle_mode == θ_MODE_ID_RAD) {
        if (angle_mode == θ_MODE_ID_DGR) {
            return θRAD2DGR(them->angle_value);
        } else if (angle_mode == θ_MODE_ID_TRN) {
            return θRAD2TRN(them->angle_value);
        } else {
            return θRAD2GON(them->angle_value);
        }
    } else if (them->angle_mode == θ_MODE_ID_TRN) {
        if (angle_mode == θ_MODE_ID_DGR) {
            return θTRN2DGR(them->angle_value);
        } else if (angle_mode == θ_MODE_ID_RAD) {
            return θTRN2RAD(them->angle_value);
        } else {
            return θTRN2GON(them->angle_value);
        }
    } else {
        if (angle_mode == θ_MODE_ID_DGR) {
            return θGON2DGR(them->angle_value);
        } else if (angle_mode == θ_MODE_ID_RAD) {
            return θGON2RAD(them->angle_value);
        } else if (angle_mode == θ_MODE_ID_TRN) {
            return θGON2TRN(them->angle_value);
        } else {
            return θGON2RAD(them->angle_value);
        }
    }
}

static inline double 👉θ_get_compatible_value_from_θ(const 👉θ self, const 👉θ them) {
    return θ_get_compatible_value_from_θ_with_mode(self->angle_mode, them);
}

static inline double 👉θ_get_compatible_value_from_value(const 👉θ self, const VALUE value) {
    if (is_int(value) || is_float(value)) {
        return NUM2DBL(value);
    } else if (is_theta_angle(value)) {
        👉θ data_them; TypedData_Get_Struct(value, ThetaAngle, & θ_type, data_them);
        return 👉θ_get_compatible_value_from_θ(self, data_them);
    } else {
        rb_raise(R_ERR_RUNTIME, "| c{ThetaAngle}-> got arg{%"PRIsVALUE"} that should be an int, float, or ThetaAngle |", value);
    }
}

static inline VALUE 👉θ_get_representation_as_sym(const 👉θ data) {
    switch(data->angle_mode) {
    case θ_MODE_ID_RAD:
        return ID2SYM(cached_rb_intern_as_radian);
    case θ_MODE_ID_DGR:
        return ID2SYM(cached_rb_intern_as_degree);
    case θ_MODE_ID_TRN:
        return ID2SYM(cached_rb_intern_as_turn);
    default:
        return ID2SYM(cached_rb_intern_as_gon);
    }
}

static inline double 👉θ_get_const_quadrant(const 👉θ data) {
    switch(data->angle_mode) {
    case θ_MODE_ID_RAD: return θ_RAD_QUADRANT;
    case θ_MODE_ID_DGR: return θ_DGR_QUADRANT;
    case θ_MODE_ID_TRN: return θ_TRN_QUADRANT;
    default:            return θ_GON_QUADRANT;
    }
}

static inline double 👉θ_get_const_straight(const 👉θ data) {
    switch(data->angle_mode) {
    case θ_MODE_ID_RAD: return θ_RAD_STRAIGHT;
    case θ_MODE_ID_DGR: return θ_DGR_STRAIGHT;
    case θ_MODE_ID_TRN: return θ_TRN_STRAIGHT;
    default:            return θ_GON_STRAIGHT;
    }
}

static inline double 👉θ_get_const_perigon(const 👉θ data) {
    switch(data->angle_mode) {
    case θ_MODE_ID_RAD: return θ_RAD_PERIGON;
    case θ_MODE_ID_DGR: return θ_DGR_PERIGON;
    case θ_MODE_ID_TRN: return θ_TRN_PERIGON;
    default:            return θ_GON_PERIGON;
    }
}

static inline double 👉θ_get_const_perigon_minus_quadrant(const 👉θ data) {
    switch(data->angle_mode) {
    case θ_MODE_ID_RAD: return θ_RAD_PERIGON_MINUS_QUADRANT;
    case θ_MODE_ID_DGR: return θ_DGR_PERIGON_MINUS_QUADRANT;
    case θ_MODE_ID_TRN: return θ_TRN_PERIGON_MINUS_QUADRANT;
    default:            return θ_GON_PERIGON_MINUS_QUADRANT;
    }
}

static inline void 👉θ_addition_w_double       (const 👉θ data, const double value) {θ_set_value(data, data->angle_value + value);}
static inline void 👉θ_subtraction_w_double    (const 👉θ data, const double value) {θ_set_value(data, data->angle_value - value);}
static inline void 👉θ_multiplication_w_double (const 👉θ data, const double value) {θ_set_value(data, data->angle_value * value);}
static inline void 👉θ_division_w_double       (const 👉θ data, const double value) {θ_set_value(data, data->angle_value / value);}

static VALUE θ_m_modulo(const VALUE self, const VALUE value) {
    💎self_to_👉θ_data
    if (is_int(value) || is_float(value)) {
        const long double val_them = (long double) 👉θ_get_compatible_value_from_value(data, value);
        const long double val_self = (long double) data->angle_value;
        return θ_new(fmodl(val_self, val_them), cθ_get_representation(data->angle_mode));
    } else if (is_theta_angle(value)) {
        const long double val_them = (long double) 👉θ_get_compatible_value_from_value(data, value);
        const long double val_self = (long double) data->angle_value;
        if (👉θ_flag_is_coerce(data)) {
            👉θ_flag_clr_coerce(data);
            return θ_new(fmodl(val_self, val_them), cθ_get_representation(data->angle_mode));
        } else {
            return DBL2NUM(fmodl(val_self, val_them));
        }
    } else {
        rb_raise(R_ERR_RUNTIME, "| c{ThetaAngle}-> m{modulo} requires are of type Numeric or ThetaAngle |");
    }
}

static VALUE θ_m_modulo_eq(const VALUE self, const VALUE value) {
    💎self_to_👉θ_data
    if (RB_OBJ_FROZEN(self)) {
        rb_raise(R_ERR_RUNTIME, "| c{ThetaAngle}-> m{modulo=} may not be called on a frozen ThetaAngle |");
    } else if (👉θ_flag_is_constant(data)) {
        rb_raise(R_ERR_RUNTIME, "| c{ThetaAngle}-> m{modulo=} may not be called on a constant ThetaAngle |");
    }
    //if (is_int(value) || is_float(value)) {
    //}
    const long double val_them = (long double) 👉θ_get_compatible_value_from_value(data, value);
    const long double val_self = (long double) data->angle_value;
    θ_set_value(data, fmodl(val_self, val_them));
    re_me
}

static VALUE θ_m_coerce(const VALUE self, const VALUE them) {
    if (is_num(them)) {
        💎self_to_👉θ_data
        VALUE ary   = 💎new_ary(2);
        VALUE theta = θ_new(NUM2DBL(them), 👉θ_get_representation_as_sym(data));
        👉θ the_new_theta; TypedData_Get_Struct(theta, ThetaAngle, & θ_type, the_new_theta);

        👉θ_flag_set_coerce(the_new_theta);
        👉θ_flag_clr_constant(the_new_theta);

        r_ary_add(ary, theta);
        r_ary_add(ary, self);
        return ary;
    } else {
        return Qnil;
    }
}

static VALUE θ_m_multiplication(const VALUE self, const VALUE value) {
    💎self_to_👉θ_data
    return θ_new(data->angle_value * 👉θ_get_compatible_value_from_value(data, value), cθ_get_representation(data->angle_mode));
}

static VALUE θ_m_multiplication_eq(const VALUE self, const VALUE value) {
    💎self_to_👉θ_data
    if (RB_OBJ_FROZEN(self)) {
        rb_raise(R_ERR_RUNTIME, "| c{ThetaAngle}-> m{*} may not be called on a frozen ThetaAngle |");
    } else if (👉θ_flag_is_constant(data)) {
        rb_raise(R_ERR_RUNTIME, "| c{ThetaAngle}-> m{*} may not be called on a constant ThetaAngle |");
    }
    👉θ_multiplication_w_double(data, 👉θ_get_compatible_value_from_value(data, value));
    re_me
}

static VALUE θ_m_division(const VALUE self, const VALUE them) {
    💎self_to_👉θ_data
    if (is_int(them)) {
        return θ_new(data->angle_value / 👉θ_get_compatible_value_from_value(data, them), cθ_get_representation(data->angle_mode));
    } else if (is_float(them)) {
        return θ_new(data->angle_value / 👉θ_get_compatible_value_from_value(data, them), cθ_get_representation(data->angle_mode));
    } else if (is_theta_angle(them)) {
        if (👉θ_flag_is_coerce(data)) {
            👉θ_flag_clr_coerce(data);
            return θ_new(data->angle_value / 👉θ_get_compatible_value_from_value(data, them), cθ_get_representation(data->angle_mode));
        } else {
            return DBL2NUM(data->angle_value / 👉θ_get_compatible_value_from_value(data, them));
        }
    } else {
        rb_raise(R_ERR_ARG, "| c{ThetaAngle}-> m{/} requires arg of type{Numeric} or {ThetaAngle}, not{%"PRIsVALUE"} |", them);
    }
}

static VALUE θ_m_division_eq(const VALUE self, const VALUE value) {
    💎self_to_👉θ_data
    if (RB_OBJ_FROZEN(self)) {
        rb_raise(R_ERR_RUNTIME, "| c{ThetaAngle}-> m{/} may not be called on a frozen ThetaAngle |");
    } else if (👉θ_flag_is_constant(data)) {
        rb_raise(R_ERR_RUNTIME, "| c{ThetaAngle}-> m{/} may not be called on a constant ThetaAngle |");
    }
    👉θ_division_w_double(data, 👉θ_get_compatible_value_from_value(data, value));
    re_me
}

static VALUE θ_m_addition_eq(const VALUE self, const VALUE value) {
    💎self_to_👉θ_data
    if (RB_OBJ_FROZEN(self)) {
        rb_raise(R_ERR_RUNTIME, "| c{ThetaAngle}-> m{+} may not be called on a frozen ThetaAngle |");
    } else if (👉θ_flag_is_constant(data)) {
        rb_raise(R_ERR_RUNTIME, "| c{ThetaAngle}-> m{+} may not be called on a constant ThetaAngle |");
    }
    👉θ_addition_w_double(data, 👉θ_get_compatible_value_from_value(data, value));
    re_me
}

static VALUE θ_m_addition(const VALUE self, const VALUE value) {
    💎self_to_👉θ_data
    return θ_new(data->angle_value + 👉θ_get_compatible_value_from_value(data, value), cθ_get_representation(data->angle_mode));
}

static VALUE θ_m_subtraction_eq(const VALUE self, const VALUE value) {
    💎self_to_👉θ_data
    if (RB_OBJ_FROZEN(self)) {
        rb_raise(R_ERR_RUNTIME, "| c{ThetaAngle}-> m{-} may not be called on a frozen ThetaAngle |");
    } else if (👉θ_flag_is_constant(data)) {
        rb_raise(R_ERR_RUNTIME, "| c{ThetaAngle}-> m{-} may not be called on a constant ThetaAngle |");
    }
    👉θ_subtraction_w_double(data, 👉θ_get_compatible_value_from_value(data, value));
    re_me
}

static VALUE θ_m_subtraction(const VALUE self, const VALUE value) {
    💎self_to_👉θ_data
    return θ_new(data->angle_value - 👉θ_get_compatible_value_from_value(data, value), cθ_get_representation(data->angle_mode));
}

static VALUE θ_m_unary_not(const VALUE self) {
    💎self_to_👉θ_data
    👉θ_multiplication_w_double(data, -1.0);
    re_me
}

static VALUE θ_m_unary_complement(const VALUE self) {
    💎self_to_👉θ_data
    const double val           = data->angle_value;
    long double opposite_angle = (long double) val;
    if (val == 0.0) {re_me}
    switch(data->angle_mode) {
    case θ_MODE_ID_RAD:
        opposite_angle += πL;
        θ_set_value(data, fmodl(opposite_angle, τL));
        break;
    case θ_MODE_ID_DGR:
        opposite_angle += 180.0L;
        θ_set_value(data, fmodl(opposite_angle, 360.0L));
        break;
    case θ_MODE_ID_TRN:
        opposite_angle += 0.5L;
        θ_set_value(data, (opposite_angle - ((int) opposite_angle)));
        break;
    default:
        opposite_angle += 200.0L;
        θ_set_value(data, fmodl(opposite_angle, 400.0L));
        break;
    }
    re_me
}

static VALUE θ_m_unary_subtraction(const VALUE self) {
    💎self_to_👉θ_data
    double val_self = θ_get_normalized_value(data->angle_value, data->angle_mode);
    if (val_self == 0.0) {re_me}
    switch(data->angle_mode) {
    case θ_MODE_ID_RAD:
        if (val_self > 0.0) {
            θ_set_value(data, val_self - τ);
        } else {
            θ_set_value(data, τ + val_self);
        }
        break;
    case θ_MODE_ID_DGR:
        if (val_self > 0.0) {
            θ_set_value(data, val_self - 360.0);
        } else {
            θ_set_value(data, 360.0 + val_self);
        }
        break;
    case θ_MODE_ID_TRN:
        if (val_self > 0.0) {
            θ_set_value(data, val_self - 1.0);
        } else {
            θ_set_value(data, 1.0 + val_self);
        }
        break;
    default:
        if (val_self > 0.0) {
            θ_set_value(data, val_self - 400.0);
        } else {
            θ_set_value(data, 400.0 + val_self);
        }
        break;
    }
    re_me
}

static VALUE θ_m_to_array(const VALUE self) {
    💎self_to_👉θ_data
    VALUE ary = 💎new_ary(2);
    r_ary_add(ary, DBL2NUM(data->angle_value));
    r_ary_add(ary, cθ_get_representation(data->angle_mode));
    return ary;
}

static VALUE θ_m_unary_addition(const VALUE self) {re_me}

👉θ_func(θ_m_is_positive, re_as_bool(data->angle_value > 0.0))
👉θ_func(θ_m_is_negative, re_as_bool(data->angle_value < 0.0))
👉θ_func(θ_m_is_zero,     re_as_bool(data->angle_value == 0.0))

static VALUE θ_m_abs(const VALUE self) {
    💎self_to_👉θ_data
    if (data->angle_value < 0.0) {
        return θ_new(-1.0 * data->angle_value, cθ_get_representation(data->angle_mode));
    } else {
        return θ_new(data->angle_value, cθ_get_representation(data->angle_mode));
    }
}

static VALUE θ_m_abs_self(const VALUE self) {
    💎self_to_👉θ_data
    if (data->angle_value < 0.0) {
        👉θ_multiplication_w_double(data, -1.0);
    }
    re_me
}

static VALUE θ_m_comparable(const VALUE self, const VALUE them) {
    if (is_theta_angle(them)) {
        💎self_to_👉θ_data
        double val_them = 👉θ_get_compatible_value_from_value(data, them);
        if (data->angle_value > val_them) {
            re_1
        } else if (data->angle_value == val_them) {
            re_0
        } else {
            re_n1
        }
    } else {re_nil}
}

static VALUE θ_m_is_complementary_with(const VALUE self, const VALUE them) {
    💎self_to_👉θ_data
    if (is_theta_angle(them)) {
        👉θ data_them; TypedData_Get_Struct(them, ThetaAngle, & θ_type, data_them);
        re_as_bool((data->angle_value + 👉θ_get_compatible_value_from_θ(data, data_them)) == 👉θ_get_const_quadrant(data))
    } else {
        rb_raise(R_ERR_ARG, "| c{ThetaAngle}-> m{complementary_with?} requires arg(angle_mode){%"PRIsVALUE"} of type theta_angle |", them);
    }
}

static VALUE θ_m_is_golden_with(const VALUE self, const VALUE them) {
    💎self_to_👉θ_data
    if (is_theta_angle(them)) {
        👉θ data_them; TypedData_Get_Struct(them, ThetaAngle, & θ_type, data_them);
        const double val_them = 👉θ_get_compatible_value_from_θ(data, data_them);
        const double val_self = data->angle_value;
        if (val_self > val_them) {
            re_as_bool(((val_self + val_them) / val_self) == 𝚽)
        } else {
            re_as_bool(((val_self + val_them) / val_them) == 𝚽)
        }
    } else {
        rb_raise(R_ERR_ARG, "| c{ThetaAngle}-> m{golden_with?} requires arg(angle_mode){%"PRIsVALUE"} of type theta_angle |", them);
    }
}

static VALUE θ_m_is_supplementary_with(const VALUE self, const VALUE them) {
    💎self_to_👉θ_data
    if (is_theta_angle(them)) {
        👉θ data_them; TypedData_Get_Struct(them, ThetaAngle, & θ_type, data_them);
        re_as_bool((data->angle_value + 👉θ_get_compatible_value_from_θ(data, data_them)) == 👉θ_get_const_straight(data))
    } else {
        rb_raise(R_ERR_ARG, "| c{ThetaAngle}-> m{supplementary_with?} requires arg(angle_mode){%"PRIsVALUE"} of type theta_angle |", them);
    }
}

static VALUE θ_m_is_explementary_with(const VALUE self, const VALUE them) {
    💎self_to_👉θ_data
    if (is_theta_angle(them)) {
        👉θ data_them; TypedData_Get_Struct(them, ThetaAngle, & θ_type, data_them);
        re_as_bool((data->angle_value + 👉θ_get_compatible_value_from_θ(data, data_them)) == 👉θ_get_const_perigon(data))
    } else {
        rb_raise(R_ERR_ARG, "| c{ThetaAngle}-> m{explementary_with?} requires arg(angle_mode){%"PRIsVALUE"} of type theta_angle |", them);
    }
}

static unsigned char θSYM2MODE(const VALUE mode_as_sym) {
    const ID obj_id = SYM2ID(mode_as_sym);
    if (obj_id == cached_rb_intern_as_radian) {
        return θ_MODE_ID_RAD;
    } else if (obj_id == cached_rb_intern_as_turn) {
        return θ_MODE_ID_TRN;
    } else if (obj_id == cached_rb_intern_as_degree) {
        return θ_MODE_ID_DGR;
    } else if (obj_id == cached_rb_intern_as_gon) {
        return θ_MODE_ID_GON;
    } else {
        rb_raise(R_ERR_ARG, "| c{ThetaAngle}-> m{new} may not convert the 2nd arg(angle_mode){%"PRIsVALUE"} into a valid theta_angle mode |", mode_as_sym);
    }
}

static VALUE θ_m_initialize_as_radian(VALUE self, const VALUE angle) {
    🛑is_num("ThetaAngle", "new", "angle_val_as_radian", angle)
    return θ_new(NUM2DBL(angle), cθ_get_representation(θ_MODE_ID_RAD));
}

static VALUE θ_m_initialize_as_degree(VALUE self, const VALUE angle) {
    🛑is_num("ThetaAngle", "new", "angle_val_as_degree", angle)
    return θ_new(NUM2DBL(angle), cθ_get_representation(θ_MODE_ID_DGR));
}

static VALUE θ_m_initialize_as_gon(VALUE self, const VALUE angle) {
    🛑is_num("ThetaAngle", "new", "angle_val_as_gon", angle)
    return θ_new(NUM2DBL(angle), cθ_get_representation(θ_MODE_ID_GON));
}

static VALUE θ_m_initialize_as_turn(VALUE self, const VALUE angle) {
    🛑is_num("ThetaAngle", "new", "angle_val_as_turn", angle)
    return θ_new(NUM2DBL(angle), cθ_get_representation(θ_MODE_ID_TRN));
}

static VALUE θ_m_initialize(VALUE self, const VALUE angle, const VALUE angle_mode) {
    🛑is_num("ThetaAngle", "new", "angle_value", angle)
    🛑is_sym("ThetaAngle", "new", "angle_mode", angle_mode)
    💎self_to_👉θ_data
    data->angle_mode  = θSYM2MODE(angle_mode);
    data->angle_value = NUM2DBL(angle);
    👉θ_flag_set_cache_synced(data);
    💎set_field("@real", DBL2NUM(data->angle_value))
    return self;
}

static inline VALUE cθ_get_representation(const unsigned char angle_mode) {
    switch(angle_mode) {
    case θ_MODE_ID_RAD:
        return cached_sym_as_radian;
    case θ_MODE_ID_DGR:
        return cached_sym_as_degree;
    case θ_MODE_ID_TRN:
        return cached_sym_as_turn;
    default:
        return cached_sym_as_gon;
    }
}

static VALUE θ_m_equals(const VALUE self, const VALUE them) {
    👉θ data_self; TypedData_Get_Struct(self, ThetaAngle, & θ_type, data_self);
    if (is_theta_angle(them)) {
        👉θ data_them; TypedData_Get_Struct(them, ThetaAngle, & θ_type, data_them);
        re_as_bool(data_self->angle_value == 👉θ_get_compatible_value_from_θ(data_self, data_them));
    } else if (is_num(them)) {
        re_as_bool(data_self->angle_value == NUM2DBL(them))
    } else {
        re_no
    }
}

👉θ_func(θ_m_is_normal, return 👉θ_is_normal(data);)

static double θ_get_normalized_value(const double value, const unsigned char angle_mode) {
    // TODO: the normal check here can be done on the meta_data_flags and thus add in "is-zero" check
    if (!(θ_is_normal(angle_mode, value))) {
        if (value > 0) {
            if (angle_mode == θ_MODE_ID_RAD) {
                return fmod(value, θ_RAD_PERIGON);
            } else if (angle_mode == θ_MODE_ID_DGR) {
                return fmod(value, θ_DGR_PERIGON);
            } else if (angle_mode == θ_MODE_ID_TRN) {
                return fmod(value, θ_TRN_PERIGON);
            } else {
                return fmod(value, θ_GON_PERIGON);
            }
        } else {
            if (angle_mode == θ_MODE_ID_RAD) {
                return fmod(value, θ_RAD_PERIGON_NEGATIVE);
            } else if (angle_mode == θ_MODE_ID_DGR) {
                return fmod(value, θ_DGR_PERIGON_NEGATIVE);
            } else if (angle_mode == θ_MODE_ID_TRN) {
                return fmod(value, θ_TRN_PERIGON_NEGATIVE);
            } else {
                return fmod(value, θ_GON_PERIGON_NEGATIVE);
            }
        }
    } else {
        return value;
    }
}

static void 👉θ_normalize(👉θ data) {
    const double value = data->angle_value;
    const double new_value = θ_get_normalized_value(value, data->angle_mode);
    if (new_value != value) {
        θ_set_value(data, new_value);
    }
}

static VALUE θ_m_normalize(const VALUE self) {
    💎self_to_👉θ_data
    return θ_new(θ_get_normalized_value(data->angle_value, data->angle_mode), cθ_get_representation(data->angle_mode));
}

static VALUE θ_m_normalize_self(const VALUE self) {
    💎self_to_👉θ_data
    👉θ_normalize(data);
    re_me
}

👉θ_func(θ_get_as_radian,
    switch(data->angle_mode) {
    case θ_MODE_ID_TRN:
        return DBL2NUM(θTRN2RAD(data->angle_value));
    case θ_MODE_ID_DGR:
        return DBL2NUM(θDGR2RAD(data->angle_value));
    case θ_MODE_ID_RAD:
        return DBL2NUM(data->angle_value);
    default:
        return DBL2NUM(θGON2RAD(data->angle_value));
    }
)

👉θ_func(θ_get_as_degree,
    switch(data->angle_mode) {
    case θ_MODE_ID_TRN:
        return DBL2NUM(θTRN2DGR(data->angle_value));
    case θ_MODE_ID_DGR:
        return DBL2NUM(data->angle_value);
    case θ_MODE_ID_RAD:
        return DBL2NUM(θRAD2DGR(data->angle_value));
    default:
        return DBL2NUM(θGON2DGR(data->angle_value));
    }
)

👉θ_func(θ_get_as_gon,
    switch(data->angle_mode) {
    case θ_MODE_ID_TRN:
        return DBL2NUM(θTRN2GON(data->angle_value));
    case θ_MODE_ID_DGR:
        return DBL2NUM(θDGR2GON(data->angle_value));
    case θ_MODE_ID_RAD:
        return DBL2NUM(θRAD2GON(data->angle_value));
    default:
        return DBL2NUM(data->angle_value);
    }
)

👉θ_func(θ_get_as_turn,
    switch(data->angle_mode) {
    case θ_MODE_ID_TRN:
        return DBL2NUM(θTRN2GON(data->angle_value));
    case θ_MODE_ID_DGR:
        return DBL2NUM(θDGR2GON(data->angle_value));
    case θ_MODE_ID_RAD:
        return DBL2NUM(θRAD2GON(data->angle_value));
    default:
        return DBL2NUM(data->angle_value);
    }
)

👉θ_func(θ_get_is_radians, re_as_bool(data->angle_mode == θ_MODE_ID_RAD))
👉θ_func(θ_get_is_degrees, re_as_bool(data->angle_mode == θ_MODE_ID_DGR))
👉θ_func(θ_get_is_gons,    re_as_bool(data->angle_mode == θ_MODE_ID_GON))
👉θ_func(θ_get_is_turns,   re_as_bool(data->angle_mode == θ_MODE_ID_TRN))
👉θ_func(θ_m_get_repr,     return cθ_get_representation(data->angle_mode);)
👉θ_func(θ_m_get_windings, return INT2NUM((int) (θ_get_compatible_value_from_θ_with_mode(θ_MODE_ID_RAD, data) / τ));)

static VALUE θ_m_set_real(VALUE self, VALUE num) {
    🛑is_num("ThetaAngle", "real=", "num", num)
    💎self_to_👉θ_data
    θ_set_value(data, NUM2DBL(num));
    👉θ_flag_set_cache_synced(data);
    re_me
}

static VALUE θ_m_get_real(const VALUE self) {
    💎self_to_👉θ_data
    if (!(👉θ_flag_is_cache_synced(data))) {
        👉θ_flag_set_cache_synced(data);
        💎set_field("@real", DBL2NUM(data->angle_value))
    }
    return 💎get_field("@real")
}

static VALUE θ_m_matches_vocab_term(VALUE self, VALUE angle_type) {
    🛑is_sym("ThetaAngle", "angle?", "0", angle_type)
    💎self_to_👉θ_data

    const ID them_id = SYM2ID(angle_type);

    const double self_angle_as_degree = θ_get_compatible_value_from_θ_with_mode(θ_MODE_ID_DGR, data);
    if (them_id == cached_rb_intern_zero_angle) {
        re_as_bool(data->angle_value == 0.0)
    } else if (them_id == cached_rb_intern_acute_angle) {
        re_as_bool(self_angle_as_degree >= 0.0 && self_angle_as_degree < θ_DGR_QUADRANT)
    } else if (them_id == cached_rb_intern_right_angle) {
        re_as_bool(θ_get_compatible_value_from_θ_with_mode(θ_MODE_ID_DGR, data) == θ_DGR_QUADRANT)
    } else if (them_id == cached_rb_intern_obtuse_angle) {
        re_as_bool(self_angle_as_degree > θ_DGR_QUADRANT && self_angle_as_degree < θ_DGR_STRAIGHT)
    } else if (them_id == cached_rb_intern_straight_angle) {
        re_as_bool(θ_get_compatible_value_from_θ_with_mode(θ_MODE_ID_DGR, data) == θ_DGR_STRAIGHT)
    } else if (them_id == cached_rb_intern_sextant_angle) {
         re_as_bool(θ_get_compatible_value_from_θ_with_mode(θ_MODE_ID_DGR, data) == θ_DGR_SEXTANT)
    } else if (them_id == cached_rb_intern_reflex_angle) {
        re_as_bool(self_angle_as_degree > θ_DGR_STRAIGHT && self_angle_as_degree < θ_DGR_PERIGON)
    } else if (them_id == cached_rb_intern_perigon_angle) {
        re_as_bool(θ_get_compatible_value_from_θ_with_mode(θ_MODE_ID_DGR, data) == θ_DGR_PERIGON)
    } else if (them_id == cached_rb_intern_oblique_angle) {
        re_as_bool(fmodl((long double) θ_get_compatible_value_from_θ_with_mode(θ_MODE_ID_DGR, data), 90.0L) != 0.0L)
    } else {
        🛑is_sym("ThetaAngle", "angle?", "angle_type_sym_val", angle_type)
        re_no
    }
}

/*____________________________________________________________________________________________________________________
 __      __   __   __   ___     ___      ___  __
/  `    /  ` /  \ |  \ |__     |__  |\ |  |  |__) \ /
\__,    \__, \__/ |__/ |___    |___ | \|  |  |  \  |
_____________________________________________________________________________________________________________________ */

//static void at_exit (void) {
    //printf("for when needed, this func will run after END {} blocks\n");
//}

static VALUE m_cos(const VALUE self, const VALUE val) {
    if (is_theta_angle(val)) {
        👉θ data; TypedData_Get_Struct(val, ThetaAngle, & θ_type, data);
        const long double val_ldbl = θ_get_compatible_long_double_val(θ_MODE_ID_RAD, data);
        //const double straight      = 👉θ_get_const_straight(data);
        //const double full          = 👉θ_get_const_perigon(data);
        const double perigon_minus_quadrant = 👉θ_get_const_perigon_minus_quadrant(data);
        const double quadrant      = 👉θ_get_const_quadrant(data);
        const long double result   = cosl(val_ldbl);

        if (LDBL_IS_ZERO(result) || data->angle_value == quadrant || data->angle_value == perigon_minus_quadrant) {
            return ℤ0;
        } else {
            return DBL2NUM(result);
        }

        /*if (data->angle_value == full || LDBL_IS_ZERO(result)) {
            return ℤ1;
        } else if (data->angle_value == 0.0 || data->angle_value == quadrant) {
            return ℤ0;
        } else if (data->angle_value == straight) {
            return ℤn1;
        } else {
            return DBL2NUM(result);
        }*/
    } else {
        rb_raise(R_ERR_ARG, "| m{Math}-> sf{coss} may not convert the arg{%"PRIsVALUE"} into a theta_angle |", val);
    }
}

static VALUE m_sin(const VALUE self, const VALUE val) {
    if (is_theta_angle(val)) {
        👉θ data; TypedData_Get_Struct(val, ThetaAngle, & θ_type, data);
        const long double val_ldbl = θ_get_compatible_long_double_val(θ_MODE_ID_RAD, data);
        const double straight      = 👉θ_get_const_straight(data);
        const double full          = 👉θ_get_const_perigon(data);
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
        👉θ data; TypedData_Get_Struct(val, ThetaAngle, & θ_type, data);
        return DBL2NUM(tanl(θ_get_compatible_long_double_val(θ_MODE_ID_RAD, data)));
    } else {
        rb_raise(R_ERR_ARG, "| m{Math}-> sf{tan} may not convert the arg{%"PRIsVALUE"} into a theta_angle |", val);
    }
}

static VALUE m_tan2(const VALUE self, const VALUE val) {
    if (is_theta_angle(val)) {
        👉θ data; TypedData_Get_Struct(val, ThetaAngle, & θ_type, data);
        return DBL2NUM(LDBL_POW2(tanl(θ_get_compatible_long_double_val(θ_MODE_ID_RAD, data))));
    } else {
        rb_raise(R_ERR_ARG, "| m{Math}-> sf{tan^2} may not convert the arg{%"PRIsVALUE"} into a theta_angle |", val);
    }
}

static VALUE m_sec2(const VALUE self, const VALUE val) {
    if (is_theta_angle(val)) {
        👉θ data; TypedData_Get_Struct(val, ThetaAngle, & θ_type, data);
        return DBL2NUM(LDBL_POW2(1.0L / cosl(θ_get_compatible_long_double_val(θ_MODE_ID_RAD, data))));
    } else {
        rb_raise(R_ERR_ARG, "| m{Math}-> sf{sec^2} may not convert the arg{%"PRIsVALUE"} into a theta_angle |", val);
    }
}

static VALUE m_cot(const VALUE self, const VALUE val) {
    if (is_theta_angle(val)) {
        👉θ data; TypedData_Get_Struct(val, ThetaAngle, & θ_type, data);
        const long double self_angle_as_rad = θ_get_compatible_long_double_val(θ_MODE_ID_RAD, data);
        return DBL2NUM(cosl(self_angle_as_rad) / sinl(self_angle_as_rad));
    } else {
        rb_raise(R_ERR_ARG, "| m{Math}-> sf{cot} may not convert the arg{%"PRIsVALUE"} into a theta_angle |", val);
    }
}

static VALUE m_csc(const VALUE self, const VALUE val) {
    if (is_theta_angle(val)) {
        👉θ data; TypedData_Get_Struct(val, ThetaAngle, & θ_type, data);
        return DBL2NUM(1.0L / sinl(θ_get_compatible_long_double_val(θ_MODE_ID_RAD, data)));
    } else {
        rb_raise(R_ERR_ARG, "| m{Math}-> sf{csc} may not convert the arg{%"PRIsVALUE"} into a theta_angle |", val);
    }
}

static VALUE m_sec(const VALUE self, const VALUE val) {
    if (is_theta_angle(val)) {
        👉θ data; TypedData_Get_Struct(val, ThetaAngle, & θ_type, data);
        return DBL2NUM(1.0L / cosl(θ_get_compatible_long_double_val(θ_MODE_ID_RAD, data)));
    } else {
        rb_raise(R_ERR_ARG, "| m{Math}-> sf{sec} may not convert the arg{%"PRIsVALUE"} into a theta_angle |", val);
    }
}

static VALUE m_csc2(const VALUE self, const VALUE val) {
    if (is_theta_angle(val)) {
        👉θ data; TypedData_Get_Struct(val, ThetaAngle, & θ_type, data);
        return DBL2NUM(LDBL_POW2(1.0L / sinl(θ_get_compatible_long_double_val(θ_MODE_ID_RAD, data))));
    } else {
        rb_raise(R_ERR_ARG, "| m{Math}-> sf{csc^2} may not convert the arg{%"PRIsVALUE"} into a theta_angle |", val);
    }
}

static VALUE m_sin2(const VALUE self, const VALUE val) {
    if (is_theta_angle(val)) {
        👉θ data; TypedData_Get_Struct(val, ThetaAngle, & θ_type, data);
        return DBL2NUM(LDBL_POW2(sinl(θ_get_compatible_long_double_val(θ_MODE_ID_RAD, data))));
    } else {
        rb_raise(R_ERR_ARG, "| m{Math}-> sf{sin^2} may not convert the arg{%"PRIsVALUE"} into a theta_angle |", val);
    }
}

static VALUE m_cos2(const VALUE self, const VALUE val) {
    if (is_theta_angle(val)) {
        👉θ data; TypedData_Get_Struct(val, ThetaAngle, & θ_type, data);
        return DBL2NUM(LDBL_POW2(cosl(θ_get_compatible_long_double_val(θ_MODE_ID_RAD, data))));
    } else {
        rb_raise(R_ERR_ARG, "| m{Math}-> sf{cos^2} may not convert the arg{%"PRIsVALUE"} into a theta_angle |", val);
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

static VALUE m_cot2(const VALUE self, const VALUE val) {
    if (is_theta_angle(val)) {
        👉θ data; TypedData_Get_Struct(val, ThetaAngle, & θ_type, data);
        const long double val_self = θ_get_compatible_long_double_val(θ_MODE_ID_RAD, data);
        return DBL2NUM(LDBL_POW2(cosl(val_self) / sinl(val_self)));
    } else {
        rb_raise(R_ERR_ARG, "| m{Math}-> sf{cos^2} may not convert the arg{%"PRIsVALUE"} into a theta_angle |", val);
    }
}

static inline void internal_only_add_frozen_const_to(VALUE kclass, VALUE * internal_global, const char * const_name, VALUE val_to_freeze) {
    RB_OBJ_FREEZE(val_to_freeze);
    *internal_global = val_to_freeze;
    rb_define_const(kclass, const_name, val_to_freeze);
    rb_global_variable(internal_global);
}

static inline void startup_step2_add_ruuuby_c_extensions(void) {
    cached_global_sym_many_args = ID2SYM(rb_intern("*args"));
    rb_define_readonly_variable("$PRM_MANY", &cached_global_sym_many_args);

    💎add_public_func_0args_to(R_OBJ, "ary?"       , m_obj_ary)
    💎add_public_func_0args_to(R_OBJ, "bool?"      , m_obj_bool)
    💎add_public_func_kargs_to(R_OBJ, "int?"       , m_obj_int)
    💎add_public_func_0args_to(R_OBJ, "flt?"        , m_obj_flt)
    💎add_public_func_0args_to(R_OBJ, "hsh?"       , m_obj_hash)
    💎add_public_func_kargs_to(R_OBJ, "sym?"       , m_obj_sym)
    💎add_public_func_kargs_to(R_OBJ, "str?"       , m_obj_str)
    💎add_public_func_0args_to(R_OBJ, "chr?"       , m_obj_chr)
    💎add_public_func_0args_to(R_OBJ, "set?"       , m_obj_set)
    💎add_public_func_kargs_to(R_OBJ, "num?"       , m_obj_num)
    //💎add_public_func_0args_to(R_OBJ, "class?"     , m_obj_class)
    //💎add_public_func_0args_to(R_OBJ, "module?"    , m_obj_module)
    //💎add_public_func_0args_to(R_OBJ, "nucleotide?", m_obj_nucleotide)

    💎add_public_func_0args_to(R_INT, "finite?"  , m_int_is_finite)
    💎add_public_func_0args_to(R_INT, "infinite?", m_int_is_not_finite)

    // | f11 | creates alias of Integer's func{^} which is originally provided for bitwise XOR
    💎add_func_alias(R_INT, "bitwise_xor", "^")
    💎add_public_func_1args_to(R_INT, "^", m_int_patch_for_exponentials)

    💎add_public_func_0args_to(R_FLT, "has_decimals?", m_flt_has_decimals)
    💎add_public_func_1args_to(R_FLT, "basically_equal?", m_flt_basically_equal)
    💎add_public_func_1args_to(R_FLT, "^", m_flt_patch_for_exponentials)

    💎add_public_func_0args_to(R_NIL, "empty?", m_nil_empty)

    💎add_public_func_0args_to(R_FALSE, "to_b?", m_bool_to_b)
    💎add_public_func_0args_to(R_FALSE, "to_i", m_false_to_i)

    💎add_public_func_0args_to(R_TRUE, "to_b?",  m_bool_to_b)
    💎add_public_func_0args_to(R_TRUE, "to_i", m_true_to_i)

    💎add_public_func_1args_to(R_STR, ">>", m_str_prepend)
    💎add_public_func_0args_to(R_STR, "err_to_num", m_str_err_to_num)

    💎add_public_func_0args_to(R_ARY, "remove_empty!"    , m_ary_remove_empty)
    💎add_public_func_0args_to(R_ARY, "frequency_counts" , m_ary_frequency_counts)
    💎add_public_func_1args_to(R_ARY, "disjunctive_union", m_ary_disjunctive_union)
    💎add_public_func_1args_to(R_ARY, "equal_contents?"  , m_ary_equal_contents)
    💎add_public_func_1args_to(R_ARY, ">>"               , m_ary_prepend)

    💎add_public_func_2args_to(R_MODULE, "f_add_aliases", m_module_add_aliases)

    cached_class_theta_angle = rb_define_class("ThetaAngle", rb_cData);
    rb_define_alloc_func(cached_class_theta_angle, θ_alloc);
    rb_define_private_method(cached_class_theta_angle, "initialize" , θ_m_initialize, 2);

    rb_define_attr(cached_class_theta_angle, "real", 0, 0);
    rb_define_attr(cached_class_theta_angle, "repr", 0, 0);

    💎add_public_func_0args_to(cached_class_theta_angle, "real",               θ_m_get_real)
    💎add_public_func_0args_to(cached_class_theta_angle, "repr",               θ_m_get_repr)
    💎add_public_func_0args_to(cached_class_theta_angle, "windings",           θ_m_get_windings)
    💎add_public_func_0args_to(cached_class_theta_angle, "to_a",               θ_m_to_array)
    💎add_public_func_0args_to(cached_class_theta_angle, "as_radian",          θ_get_as_radian)
    💎add_public_func_0args_to(cached_class_theta_angle, "as_degree",          θ_get_as_degree)
    💎add_public_func_0args_to(cached_class_theta_angle, "as_gon",             θ_get_as_gon)
    💎add_public_func_0args_to(cached_class_theta_angle, "as_turn",            θ_get_as_turn)
    💎add_public_func_0args_to(cached_class_theta_angle, "radians?",           θ_get_is_radians)
    💎add_public_func_0args_to(cached_class_theta_angle, "degrees?",           θ_get_is_degrees)
    💎add_public_func_0args_to(cached_class_theta_angle, "gons?",              θ_get_is_gons)
    💎add_public_func_0args_to(cached_class_theta_angle, "turns?",             θ_get_is_turns)
    💎add_public_func_0args_to(cached_class_theta_angle, "normal?",            θ_m_is_normal)
    💎add_public_func_0args_to(cached_class_theta_angle, "normalize",          θ_m_normalize)
    💎add_public_func_0args_to(cached_class_theta_angle, "normalize!",         θ_m_normalize_self)
    💎add_public_func_0args_to(cached_class_theta_angle, "-@",                 θ_m_unary_subtraction)
    💎add_public_func_0args_to(cached_class_theta_angle, "+@",                 θ_m_unary_addition)
    💎add_public_func_0args_to(cached_class_theta_angle, "~",                  θ_m_unary_complement)
    💎add_public_func_0args_to(cached_class_theta_angle, "!",                  θ_m_unary_not)
    💎add_public_func_0args_to(cached_class_theta_angle, "abs",                θ_m_abs)
    💎add_public_func_0args_to(cached_class_theta_angle, "abs!",               θ_m_abs_self)
    💎add_public_func_0args_to(cached_class_theta_angle, "positive?",          θ_m_is_positive)
    💎add_public_func_0args_to(cached_class_theta_angle, "negative?",          θ_m_is_negative)
    💎add_public_func_0args_to(cached_class_theta_angle, "zero?",              θ_m_is_zero)

    💎add_public_func_1args_to(cached_class_theta_angle, "coerce"             , θ_m_coerce)
    💎add_public_func_1args_to(cached_class_theta_angle, "%"                  , θ_m_modulo)
    💎add_public_func_1args_to(cached_class_theta_angle, "modulo!"            , θ_m_modulo_eq)
    💎add_public_func_1args_to(cached_class_theta_angle, "real="              , θ_m_set_real)
    💎add_public_func_1args_to(cached_class_theta_angle, "+"                  , θ_m_addition)
    💎add_public_func_1args_to(cached_class_theta_angle, "self_addition"      , θ_m_addition_eq)
    💎add_public_func_1args_to(cached_class_theta_angle, "-"                  , θ_m_subtraction)
    💎add_public_func_1args_to(cached_class_theta_angle, "self_subtraction"   , θ_m_subtraction_eq)
    💎add_public_func_1args_to(cached_class_theta_angle, "*"                  , θ_m_multiplication)
    💎add_public_func_1args_to(cached_class_theta_angle, "self_multiplication", θ_m_multiplication_eq)
    💎add_public_func_1args_to(cached_class_theta_angle, "/"                  , θ_m_division)
    💎add_public_func_1args_to(cached_class_theta_angle, "self_division"      , θ_m_division_eq)
    💎add_public_func_1args_to(cached_class_theta_angle, "=="                 , θ_m_equals)
    💎add_public_func_1args_to(cached_class_theta_angle, "<=>"                , θ_m_comparable)
    💎add_public_func_1args_to(cached_class_theta_angle, "angle?"             , θ_m_matches_vocab_term)
    💎add_public_func_1args_to(cached_class_theta_angle, "complementary_with?", θ_m_is_complementary_with)
    💎add_public_func_1args_to(cached_class_theta_angle, "supplementary_with?", θ_m_is_supplementary_with)
    💎add_public_func_1args_to(cached_class_theta_angle, "explementary_with?" , θ_m_is_explementary_with)
    💎add_public_func_1args_to(cached_class_theta_angle, "golden_with?"       , θ_m_is_golden_with)

    💎add_func_alias(cached_class_theta_angle, "to_f", "real")

    💎add_const_theta_angle("ANGLE_GOLDEN",  Ⴔ_AS_DGR, cached_sym_as_degree, cached_const_angle_golden)
    💎add_const_theta_angle("ANGLE_TAU",     τ, cached_sym_as_radian, cached_const_angle_tau)
    💎add_const_flt("CONST_EULER_MASCHERONI", γ)
    💎add_const_flt("RATIO_GOLDEN",           𝚽)
    💎add_const_flt("CONST_PYTHAGORAS",       PYTHAGORAS_CONSTANT)
    💎add_const_flt("RATIO_GOLDEN_SUPER",     Ψ)
    💎add_const_flt("CONST_OMEGA",            Ω)
    💎add_const_flt("RATIO_PLASTIC",          ρ)
    💎add_const_flt("RATIO_SILVER",           δ)

    internal_only_add_frozen_const_to(R_ARY, & cached_ref_empty_ary, "EMPTY_INSTANCE", rb_ary_new_capa(0L));

    VALUE ref;
    💎add_const_flt_wo_ref("ONE_HALF"      , ½, & ref);
    💎add_const_flt_wo_ref("ONE_THIRD"     , ⅓, & ref);
    💎add_const_flt_wo_ref("TWO_THIRDS"    , ⅔, & ref);
    💎add_const_flt_wo_ref("ONE_FOURTH"    , ¼, & ref);
    💎add_const_flt_wo_ref("THREE_FOURTHS" , ¾, & ref);
    💎add_const_flt_wo_ref("ONE_FIFTH"     , ⅕, & ref);
    💎add_const_flt_wo_ref("TWO_FIFTHS"    , ⅖, & ref);
    💎add_const_flt_wo_ref("THREE_FIFTHS"  , ⅗, & ref);
    💎add_const_flt_wo_ref("FOUR_FIFTHS"   , ⅘, & ref);
    💎add_const_flt_wo_ref("ONE_SIXTH"     , ⅙, & ref);
    💎add_const_flt_wo_ref("FIVE_SIXTH"    , ⅚, & ref);
    💎add_const_flt_wo_ref("ONE_SEVENTH"   , ⅐, & ref);
    💎add_const_flt_wo_ref("ONE_EIGHTH"    , ⅛, & ref);
    💎add_const_flt_wo_ref("THREE_EIGHTHS" , ⅜, & ref);
    💎add_const_flt_wo_ref("FIVE_EIGHTHS"  , ⅝, & ref);
    💎add_const_flt_wo_ref("SEVEN_EIGHTHS" , ⅞, & ref);
    💎add_const_flt_wo_ref("ONE_NINTH"     , ⅑, & ref);
    💎add_const_flt_wo_ref("ONE_TENTH"     , ⅒, & ref);

    💎add_singleton_func_1args_to(cached_class_theta_angle, "new_radian", θ_m_initialize_as_radian)
    💎add_singleton_func_1args_to(cached_class_theta_angle, "new_degree", θ_m_initialize_as_degree)
    💎add_singleton_func_1args_to(cached_class_theta_angle, "new_gon", θ_m_initialize_as_gon)
    💎add_singleton_func_1args_to(cached_class_theta_angle, "new_turn", θ_m_initialize_as_turn)

    💎add_singleton_func_1args_to(R_MATH, "cubic_root", m_cubic_root)
    💎add_singleton_func_1args_to(R_MATH, "square_root", m_square_root)
    💎add_singleton_func_1args_to(R_MATH, "log_e", m_log_e)

    💎add_singleton_func_1args_to(R_MATH, "cott", m_cot)
    💎add_singleton_func_1args_to(R_MATH, "coss", m_cos)
    💎add_singleton_func_1args_to(R_MATH, "sinn", m_sin)
    💎add_singleton_func_1args_to(R_MATH, "tann", m_tan)
    💎add_singleton_func_1args_to(R_MATH, "cott", m_cot)
    💎add_singleton_func_1args_to(R_MATH, "cscc", m_csc)
    💎add_singleton_func_1args_to(R_MATH, "secc", m_sec)
    💎add_singleton_func_1args_to(R_MATH, "sin_squared", m_sin2)
    💎add_singleton_func_1args_to(R_MATH, "cos_squared", m_cos2)
    💎add_singleton_func_1args_to(R_MATH, "tan_squared", m_tan2)
    💎add_singleton_func_1args_to(R_MATH, "cot_squared", m_cot2)
    💎add_singleton_func_1args_to(R_MATH, "csc_squared", m_csc2)
    💎add_singleton_func_1args_to(R_MATH, "sec_squared", m_sec2)
}

void Init_ruby_class_mods(void) {
    startup_step0_load_f98_b02();
    startup_step1_before_loading_extension();
    startup_step2_add_ruuuby_c_extensions();
    startup_step4_load_needed_ruuuby_files();

    //ruby_vm_at_exit(& at_exit);

    //💎set_program_name("ruuuby:v.0.0.34"); //ruuuby:v.0.0.34

    startup_step5_protect_against_gc();
}

/*
  # TODO: w/ TDD for Class(String) {create w/ extension so that 'U*' ID can be re-used)
  #
  # @return [Array]
  def as_utf8_hex; self.as_utf8.unpack('U*'); end
*/
