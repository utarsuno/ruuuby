// encoding: UTF-8

/*____________________________________________________________________________________________________________________________________________________________________
         __   __        __                  __   __   __  ___  __
 |    | |__) |__)  /\  |__) \ /    |  |\/| |__) /  \ |__)  |  /__`
 |___ | |__) |  \ /~~\ |  \  |     |  |  | |    \__/ |  \  |  .__/
____________________________________________________________________________________________________________________________________________________________________ */

#ifndef CRUUUBY_H5_INTERNAL_STRUCTS
#include "c5_internal_structs.h"
#endif

#ifndef CRUUUBY_H6_FEATURE_MACROS
#define CRUUUBY_H6_FEATURE_MACROS

//ensure_loaded_default(tzinfo)

/*
 * the following Ruby libs are loaded dynamically (lazy-loaded):
 *   | csv       |
 *   | yaml      |
 *   | digest    |
 *   | prime     |
 *   | tempfile   |
 *   | benchmark |
 */
#define startup_step0_load_f98_b02_ruby(){\
    ensure_loaded_default(bigdecimal)\
    ensure_loaded_default(singleton)\
    ensure_loaded_default(logger)\
    ensure_loaded_default(time)\
    ensure_loaded_default(net/https)\
    ensure_loaded_default(pp)\
    ensure_loaded_default(json)\
}

/*
 * the following 3rd-party libs are loaded dynamically (lazy-loaded):
 *   | docker |
 *   | rugged |
 */
#define startup_step0_load_f98_b02_3rd_party(){\
    ensure_loaded_default(tty-command)\
    ensure_loaded_default(finite_machine)\
}

#define startup_step0_load_f98(){\
    startup_step0_load_f98_b02_ruby()\
    startup_step0_load_f98_b02_3rd_party()\
}

/*   ___    __   ______
   /'___\ /'__`\/\  ___\
  /\ \__//\ \/\ \ \ \__/
  \ \ ,__\ \ \ \ \ \___``\
   \ \ \_/\ \ \_\ \/\ \L\ \
    \ \_\  \ \____/\ \____/
     \/_/   \/___/  \/___/ */

#define init_f05(){\
    💎add_public_func_1args_by_id(R_STR, ID_OF_RSHIFT, m_str_prepend)\
    💎add_public_func_1args_by_id(R_ARY, ID_OF_RSHIFT, m_ary_prepend)\
}

/*   ___    __     ____
   /'___\ /'__`\  /'___\
  /\ \__//\ \/\ \/\ \__/
  \ \ ,__\ \ \ \ \ \  _``\
   \ \ \_/\ \ \_\ \ \ \L\ \
    \ \_\  \ \____/\ \____/
     \/_/   \/___/  \/___/ */

#define init_f06(){\
    💎add_public_func_0args_to(R_OBJ, "bool?",        m_obj_is_bool)\
    💎add_public_func_0args_to(R_OBJ, "hsh?",         m_obj_is_hash)\
    💎add_public_func_0args_to(R_OBJ, "chr?",         m_obj_is_chr)\
    💎add_public_func_0args_to(R_OBJ, "set?",         m_obj_is_set)\
    💎add_public_func_0args_to(R_OBJ, "theta_angle?", is_theta_angle)\
    💎add_public_func_kargs_to(R_OBJ, "ary?",         m_obj_is_ary)\
    💎add_public_func_kargs_to(R_OBJ, "int?",         m_obj_is_int)\
    💎add_public_func_kargs_to(R_OBJ, "flt?" ,         m_obj_is_flt)\
    💎add_public_func_kargs_to(R_OBJ, "sym?",         m_obj_is_sym)\
    💎add_public_func_kargs_to(R_OBJ, "str?",         m_obj_is_str)\
    💎add_public_func_kargs_to(R_OBJ, "num?",         m_obj_is_num)\
}

#define init_f06_b08(){\
    💎add_public_func_0args_to(R_OBJ, "matrix?", is_a_matrix)\
}

#define init_f06_b09(){\
    💎add_public_func_0args_to(R_OBJ, "vec?", is_a_vector)\
}

/*   ___    ___       __
   /'___\ /'___`\   /'__`\
  /\ \__//\_\ /\ \ /\_\L\ \
  \ \ ,__\/_/// /__\/_/_\_<_
   \ \ \_/  // /_\ \ /\ \L\ \
    \ \_\  /\______/ \ \____/
     \/_/  \/_____/   \/___/ */

#define ENGINE_STAT_SET(the_str, the_val) r_hsh_set(hsh_ruuuby_engine_stats, rb_str_new_cstr(the_str), the_val);
#define ENGINE_STAT_SET_DISABLED(the_str) r_hsh_set(hsh_ruuuby_engine_stats, rb_str_new_cstr(the_str), Qfalse);

/*   ___    ___    ________
   /'___\ /'___`\ /\_____  \
  /\ \__//\_\ /\ \\/___//'/'
  \ \ ,__\/_/// /__   /' /'
   \ \ \_/  // /_\ \/' /'
    \ \_\  /\______/\_/
     \/_/  \/_____/\//     */

#define init_f27(){\
    💎define_new_ruby_class_as_wrapper_over_c_struct(Ⓒtheta_angle, "ThetaAngle", θ_alloc)\
    rb_define_private_method(Ⓒtheta_angle, "initialize", θ_m_initialize, 2);\
    rb_define_attr(Ⓒtheta_angle, "real", 0, 0);\
    rb_define_attr(Ⓒtheta_angle, "repr", 0, 0);\
    💎add_public_func_0args_to(Ⓒtheta_angle, "flags",               θ_m_get_flags)\
    💎add_public_func_0args_to(Ⓒtheta_angle, "real",               θ_m_get_real)\
    💎add_public_func_0args_to(Ⓒtheta_angle, "repr",               θ_m_get_repr)\
    💎add_public_func_0args_to(Ⓒtheta_angle, "windings",           θ_m_get_windings)\
    💎add_public_func_0args_to(Ⓒtheta_angle, "as_radian",          θ_get_as_radian)\
    💎add_public_func_0args_to(Ⓒtheta_angle, "as_degree",          θ_get_as_degree)\
    💎add_public_func_0args_to(Ⓒtheta_angle, "as_gon",             θ_get_as_gon)\
    💎add_public_func_0args_to(Ⓒtheta_angle, "as_turn",            θ_get_as_turn)\
    💎add_public_func_0args_to(Ⓒtheta_angle, "radians?",           θ_get_is_radians)\
    💎add_public_func_0args_to(Ⓒtheta_angle, "degrees?",           θ_get_is_degrees)\
    💎add_public_func_0args_to(Ⓒtheta_angle, "gons?",              θ_get_is_gons)\
    💎add_public_func_0args_to(Ⓒtheta_angle, "turns?",             θ_get_is_turns)\
    💎add_public_func_0args_to(Ⓒtheta_angle, "normal?",            θ_m_is_normal)\
    💎add_public_func_0args_to(Ⓒtheta_angle, "normalize",          θ_m_normalize)\
    💎add_public_func_0args_to(Ⓒtheta_angle, "normalize!",         θ_m_normalize_self)\
    💎add_public_func_0args_by_id(Ⓒtheta_angle, ID_OF_UMINUS, θ_m_unary_subtraction)\
    💎add_public_func_0args_by_id(Ⓒtheta_angle, ID_OF_UPLUS, θ_m_unary_addition)\
    💎add_public_func_0args_to(Ⓒtheta_angle, "~",                  θ_m_unary_complement)\
    💎add_public_func_0args_to(Ⓒtheta_angle, "!",                  θ_m_unary_not)\
    💎add_public_func_0args_to(Ⓒtheta_angle, "abs",                θ_m_abs)\
    💎add_public_func_0args_to(Ⓒtheta_angle, "abs!",               θ_m_abs_self)\
    💎add_public_func_0args_to(Ⓒtheta_angle, "positive?",          θ_m_is_positive)\
    💎add_public_func_0args_to(Ⓒtheta_angle, "negative?",          θ_m_is_negative)\
    💎add_public_func_0args_to(Ⓒtheta_angle, "zero?",              θ_m_is_zero)\
    💎add_public_func_0args_to(Ⓒtheta_angle, "right?",             θ_m_is_right)\
    💎add_public_func_0args_to(Ⓒtheta_angle, "obtuse?",            θ_m_is_obtuse)\
    💎add_public_func_0args_to(Ⓒtheta_angle, "acute?",             θ_m_is_acute)\
    💎add_public_func_0args_to(Ⓒtheta_angle, "straight?",          θ_m_is_straight)\
    💎add_public_func_0args_to(Ⓒtheta_angle, "oblique?",           θ_m_is_oblique)\
    💎add_public_func_0args_to(Ⓒtheta_angle, "perigon?",           θ_m_is_perigon)\
    💎add_public_func_0args_to(Ⓒtheta_angle, "octant?",            θ_m_is_octant)\
    💎add_public_func_0args_to(Ⓒtheta_angle, "sextant?",           θ_m_is_sextant)\
    💎add_public_func_0args_to(Ⓒtheta_angle, "reflex?",             θ_m_is_reflex)\
    💎add_public_func_1args_to(Ⓒtheta_angle, "coerce"             , θ_m_coerce)\
    💎add_public_func_1args_to(Ⓒtheta_angle, "%"                  , θ_m_modulo)\
    💎add_public_func_1args_to(Ⓒtheta_angle, "modulo!"            , θ_m_modulo_eq)\
    💎add_public_func_1args_to(Ⓒtheta_angle, "real="              , θ_m_set_real)\
    💎add_public_func_1args_to(Ⓒtheta_angle, "+"                  , θ_m_addition)\
    💎add_public_func_1args_to(Ⓒtheta_angle, "self_addition"      , θ_m_addition_eq)\
    💎add_public_func_1args_to(Ⓒtheta_angle, "-"                  , θ_m_subtraction)\
    💎add_public_func_1args_to(Ⓒtheta_angle, "self_subtraction"   , θ_m_subtraction_eq)\
    💎add_public_func_1args_to(Ⓒtheta_angle, "*"                  , θ_m_multiplication)\
    💎add_public_func_1args_to(Ⓒtheta_angle, "self_multiplication", θ_m_multiplication_eq)\
    💎add_public_func_1args_to(Ⓒtheta_angle, "/"                  , θ_m_division)\
    💎add_public_func_1args_to(Ⓒtheta_angle, "self_division"      , θ_m_division_eq)\
    💎add_public_func_1args_to(Ⓒtheta_angle, "=="                 , θ_m_equals)\
    💎add_public_func_1args_by_id(Ⓒtheta_angle, ID_OF_COMPARE, θ_m_comparable)\
    💎add_func_alias(Ⓒtheta_angle, "to_f", "real")\
    💎add_public_func_0args_to(Ⓒtheta_angle, "mem_size", θ_m_get_size)\
    💎add_singleton_func_1args_to(Ⓒtheta_angle, "new_radian", θ_m_init_as_rad)\
    💎add_singleton_func_1args_to(Ⓒtheta_angle, "new_degree", θ_m_init_as_dgr)\
    💎add_singleton_func_1args_to(Ⓒtheta_angle, "new_gon", θ_m_init_as_gon)\
    💎add_singleton_func_1args_to(Ⓒtheta_angle, "new_turn", θ_m_init_as_trn)\
}

#define init_f27_add_constants(){\
    rb_gc_adjust_memory_usage((size_t) (56 * 4));\
    💎add_const_theta_angle("ANGLE_GOLDEN",   Ⴔ_RAD, THETA_MODE_RAD, cached_const_angle_golden, 0x7)\
    💎add_const_theta_angle("ANGLE_TAU",      𝞽, THETA_MODE_RAD, cached_const_angle_tau, 0xE)\
    💎add_const_theta_angle("ANGLE_RIGHT",    (π / 2.0), THETA_MODE_RAD, cached_const_angle_right, 0x7)\
    💎add_const_theta_angle("ANGLE_STRAIGHT", π, THETA_MODE_RAD, cached_const_angle_straight, 0x7)\
}

/*   ___    ___       __           ____        __      __
   /'___\ /'___`\   /'_ `\        /\  _`\    /'__`\  /'_ `\
  /\ \__//\_\ /\ \ /\ \L\ \       \ \ \L\ \ /\ \/\ \/\ \L\ \
  \ \ ,__\/_/// /__\/_> _ <_       \ \  _ <'\ \ \ \ \ \___, \
   \ \ \_/  // /_\ \ /\ \L\ \       \ \ \L\ \\ \ \_\ \/__,/\ \
    \ \_\  /\______/ \ \____/        \ \____/ \ \____/    \ \_\
     \/_/  \/_____/   \/___/   _______\/___/   \/___/      \/_/
                              /\______\
                              \/______/                        */

#define init_f28_b09(){\
    VALUE ref;\
    💎add_const_flt_wo_ref("ONE_HALF"      , 0.50, & ref);\
    💎add_const_flt_wo_ref("ONE_THIRD"     , (1.0/3.0), & ref);\
    💎add_const_flt_wo_ref("TWO_THIRDS"    , (2.0/3.0), & ref);\
    💎add_const_flt_wo_ref("ONE_FOURTH"    , 0.25, & ref);\
    💎add_const_flt_wo_ref("THREE_FOURTHS" , 0.75, & ref);\
    💎add_const_flt_wo_ref("ONE_FIFTH"     , 0.20, & ref);\
    💎add_const_flt_wo_ref("TWO_FIFTHS"    , 0.40, & ref);\
    💎add_const_flt_wo_ref("THREE_FIFTHS"  , 0.60, & ref);\
    💎add_const_flt_wo_ref("FOUR_FIFTHS"   , 0.80, & ref);\
    💎add_const_flt_wo_ref("ONE_SIXTH"     , (1.0/6.0), & ref);\
    💎add_const_flt_wo_ref("FIVE_SIXTH"    , (5.0/6.0), & ref);\
    💎add_const_flt_wo_ref("ONE_SEVENTH"   , (1.0/7.0), & ref);\
    💎add_const_flt_wo_ref("ONE_EIGHTH"    , 0.125, & ref);\
    💎add_const_flt_wo_ref("THREE_EIGHTHS" , 0.375, & ref);\
    💎add_const_flt_wo_ref("FIVE_EIGHTHS"  , 0.625, & ref);\
    💎add_const_flt_wo_ref("SEVEN_EIGHTHS" , 0.875, & ref);\
    💎add_const_flt_wo_ref("ONE_NINTH"     , (1.0/9.0), & ref);\
    💎add_const_flt_wo_ref("ONE_TENTH"     , 0.10, & ref);\
}

/*   ___    __      ____
   /'___\ /'__`\   /'___\
  /\ \__//\_\L\ \ /\ \__/
  \ \ ,__\/_/_\_<_\ \  _``\
   \ \ \_/ /\ \L\ \\ \ \L\ \
    \ \_\  \ \____/ \ \____/
     \/_/   \/___/   \/___/*/

#define init_f36(){\
    💎define_new_ruby_class_as_wrapper_over_c_struct(Ⓒtime_series_data, "TimeSeriesData", time_series_alloc)\
    rb_define_private_method(Ⓒtime_series_data, "initialize" , time_series_m_initialize, 2);\
    💎add_public_func_0args_to(Ⓒtime_series_data, "print_debugging", time_series_print_debugging)\
}

#define init_f36_b00(){\
    💎add_public_func_0args_to(Ⓒtime_series_data, "len",              time_series_get_len)\
    💎add_public_func_0args_to(Ⓒtime_series_data, "first",             time_series_get_first)\
    💎add_public_func_0args_to(Ⓒtime_series_data, "last",             time_series_get_last)\
    💎add_public_func_1args_to(Ⓒtime_series_data, "[]",               time_series_m_get_val_at_index)\
    💎add_public_func_1args_to(Ⓒtime_series_data, "percentile",       time_series_get_percentile)\
    💎add_public_func_1args_to(Ⓒtime_series_data, "nth_percent_rank", time_series_get_nth_percent_rank)\
}

#define init_f36_b01(){\
    💎add_public_func_0args_to(Ⓒtime_series_data, "mem_size",    time_series_m_get_size)\
    💎add_public_func_0args_to(Ⓒtime_series_data, "free_memory", time_series_m_free)\
}

#define init_f36_b02(){\
    💎add_public_func_0args_to(Ⓒtime_series_data, "pearson_correlation_coefficient", time_series_get_cached_pearson_correlation_coefficient)\
    💎add_public_func_0args_to(Ⓒtime_series_data, "std_dev",                        time_series_get_cached_std_dev)\
    💎add_public_func_0args_to(Ⓒtime_series_data, "range",                          time_series_get_cached_range)\
    💎add_public_func_0args_to(Ⓒtime_series_data, "variance",                       time_series_get_cached_variance)\
    💎add_public_func_0args_to(Ⓒtime_series_data, "mean",                           time_series_get_cached_mean)\
    💎add_public_func_0args_to(Ⓒtime_series_data, "mean_weighted",                  time_series_get_cached_mean_weighted)\
    💎add_public_func_0args_to(Ⓒtime_series_data, "mean_geometric",                 time_series_get_cached_mean_geometric)\
    💎add_public_func_0args_to(Ⓒtime_series_data, "sum",                            time_series_get_cached_sum)\
    💎add_public_func_0args_to(Ⓒtime_series_data, "sum_weighted",                   time_series_get_cached_sum_weighted)\
    💎add_public_func_0args_to(Ⓒtime_series_data, "product",                        time_series_get_cached_product)\
    💎add_public_func_0args_to(Ⓒtime_series_data, "sum_squared",                    time_series_get_cached_sum_squared)\
    💎add_public_func_0args_to(Ⓒtime_series_data, "sum_of_squares",                 time_series_get_cached_sum_of_squares)\
    💎add_public_func_0args_to(Ⓒtime_series_data, "max",                            time_series_get_cached_max)\
    💎add_public_func_0args_to(Ⓒtime_series_data, "min",                            time_series_get_cached_min)\
    💎add_public_func_0args_to(Ⓒtime_series_data, "median",                         time_series_get_cached_median)\
}

#define init_f36_b03(){\
    💎add_public_func_1args_to(Ⓒtime_series_data, "mse",  time_series_calculate_mean_square_of_errors)\
    💎add_public_func_1args_to(Ⓒtime_series_data, "mape", time_series_calculate_mean_absolute_percentage_error)\
}

#define init_f36_b04(){\
    💎add_public_func_0args_to(Ⓒtime_series_data, "flags",                 time_series_m_get_flags)\
    💎add_public_func_0args_to(Ⓒtime_series_data, "has_zero?",            time_series_has_zero)\
    💎add_public_func_0args_to(Ⓒtime_series_data, "has_negative?",        time_series_has_negative)\
    💎add_public_func_0args_to(Ⓒtime_series_data, "normalized?",          time_series_is_normalized)\
    💎add_public_func_0args_to(Ⓒtime_series_data, "even?",                time_series_is_even)\
    💎add_public_func_0args_to(Ⓒtime_series_data, "strictly_increasing?", time_series_is_strictly_increasing)\
    💎add_public_func_0args_to(Ⓒtime_series_data, "strictly_decreasing?", time_series_is_strictly_decreasing)\
    💎add_public_func_0args_to(Ⓒtime_series_data, "all_same?",            time_series_is_all_same)\
}

#define init_f36_b05(){\
    💎add_public_func_0args_to(Ⓒtime_series_data, "normalize!",              time_series_self_normalize)\
    💎add_public_func_1args_to(Ⓒtime_series_data, "scale_by_addition",       time_series_self_scale_by_addition)\
    💎add_public_func_1args_to(Ⓒtime_series_data, "scale_by_multiplication", time_series_self_scale_by_multiplication)\
}

#define init_f36_b06(){\
    💎add_public_func_0args_to(Ⓒtime_series_data, "q1",                    time_series_get_cached_q1)\
    💎add_public_func_0args_to(Ⓒtime_series_data, "q3",                    time_series_get_cached_q3)\
    💎add_public_func_0args_to(Ⓒtime_series_data, "IQR",                   time_series_get_cached_iqr)\
    💎add_public_func_0args_to(Ⓒtime_series_data, "boundary_outliers_min", time_series_get_cached_boundary_outliers_min)\
    💎add_public_func_0args_to(Ⓒtime_series_data, "boundary_outliers_max", time_series_get_cached_boundary_outliers_max)\
}

/*   ___    __    ________
   /'___\ /'__`\ /\_____  \
  /\ \__//\_\L\ \\/___//'/'
  \ \ ,__\/_/_\_<_   /' /'
   \ \ \_/ /\ \L\ \/' /'
    \ \_\  \ \____/\_/
     \/_/   \/___/\//      */

#define init_f37(){\
    💎define_new_ruby_class_as_wrapper_over_c_struct(Ⓒpseudo_graph, "PseudoGraph", pseudo_graph_alloc)\
    rb_define_private_method(Ⓒpseudo_graph, "initialize",          pseudo_graph_m_initialize, 1);\
    💎add_public_func_0args_to(Ⓒpseudo_graph, "print_debugging",  pseudo_graph_m_print_debugging)\
    💎add_public_func_0args_to(Ⓒpseudo_graph, "num_nodes",        pseudo_graph_m_get_num_nodes)\
    💎add_public_func_0args_to(Ⓒpseudo_graph, "empty?",           pseudo_graph_m_get_is_empty)\
    💎add_public_func_0args_to(Ⓒpseudo_graph, "free_memory",      pseudo_graph_m_free)\
    💎add_public_func_2args_to(Ⓒpseudo_graph, "[]",               pseudo_graph_m_get_edge)\
    💎add_public_func_3args_to(Ⓒpseudo_graph, "set_edge",         pseudo_graph_m_set_edge)\
    💎add_public_func_3args_to(Ⓒpseudo_graph, "set_edge_inverse", pseudo_graph_m_set_edge_inverse)\
}

#endif
