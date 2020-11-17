// encoding: UTF-8

#ifndef CRUUUBY_H2_EXTENSION_MEMORY
#include "c2_extension_memory.h"
#endif

#ifndef CRUUUBY_H3_MACRO_UTILITIES
#define CRUUUBY_H3_MACRO_UTILITIES "defined(CRUUUBY_H3_MACRO_UTILITIES)"

// macros for internal pre-processing generators

#define CREATE_FLAG_FUNC_SETTER(func_name, ptr_type, expr, flag_value) static inline void func_name(ptr_type data);static inline void func_name(ptr_type data){expr = flag_value;}
#define CREATE_FLAG_FUNC_GETTER(func_name, ptr_type, expr) static inline int func_name(ptr_type data);static inline int func_name(ptr_type data){return expr == FLAG_TRUE;}

/*____________________________________________________________________________________________________________________________________________________________________
            __   __   __   __       __   __   ___     __   __   __   __   ___  __   __          __
 |\/|  /\  /  ` |__) /  \ /__` .   |__) |__) |__  __ |__) |__) /  \ /  ` |__  /__` /__` | |\ | / _`
 |  | /~~\ \__, |  \ \__/ .__/ .   |    |  \ |___    |    |  \ \__/ \__, |___ .__/ .__/ | | \| \__>
____________________________________________________________________________________________________________________________________________________________________ */

#define 💎set_field(var_name, var_var) rb_iv_set(self, var_name, var_var);
#define 💎get_field(var_name)          rb_iv_get(self, var_name);

#define _set_instance_field(kclass, the_val, field_name)  rb_iv_set(kclass, field_name, the_val);
#define 💎set_instance_field(kclass, the_val, field_name) _set_instance_field(kclass, the_val, "@" #field_name)

#define _get_instance_field(kclass, field_name)  rb_iv_get(kclass, field_name);
#define 💎get_instance_field(kclass, field_name) _get_instance_field(kclass, "@" #field_name)

#define ensure_loaded_db(path)                   ensure_file_loaded("ruuuby/db/" #path)
#define ensure_loaded_ruuuby(path)               ensure_file_loaded("ruuuby/" #path)
#define ensure_loaded_io(path)                   ensure_file_loaded("ruuuby/class/io/" #path)
#define ensure_loaded_enumerable(path)           ensure_file_loaded("ruuuby/class/enumerable/" #path)
#define ensure_loaded_module(path)               ensure_file_loaded("ruuuby/module/" #path)
#define ensure_loaded_math(path)                 ensure_file_loaded("ruuuby/math/" #path)
#define ensure_loaded_set_theory(path)           ensure_file_loaded("ruuuby/math/set_theory/" #path)
#define ensure_loaded_group_theory(path)         ensure_file_loaded("ruuuby/math/group_theory/" #path)
#define ensure_loaded_attribute_includable(path) ensure_file_loaded("ruuuby/module/attribute/includable/" #path)
#define ensure_loaded_attribute_extendable(path) ensure_file_loaded("ruuuby/module/attribute/extendable/" #path)
#define ensure_loaded_class(path)                ensure_file_loaded("ruuuby/class/" #path)
#define ensure_loaded_nums(path)                 ensure_file_loaded("ruuuby/class/nums/" #path)
#define ensure_loaded_default(path)              ensure_file_loaded("" #path)

#define ensure_all_loaded_for_io(){\
    ensure_loaded_io(file)\
    ensure_loaded_io(dir)\
}

#define ensure_all_loaded_for_set_theory(){\
    ensure_loaded_set_theory(closure)\
    ensure_loaded_set_theory(number_set)\
    ensure_loaded_set_theory(discrete/algebraic_numbers)\
    ensure_loaded_set_theory(discrete/boolean_numbers)\
    ensure_loaded_set_theory(discrete/complex_numbers)\
    ensure_loaded_set_theory(discrete/empty_set)\
    ensure_loaded_set_theory(discrete/imaginary_numbers)\
    ensure_loaded_set_theory(discrete/integer_numbers)\
    ensure_loaded_set_theory(discrete/irrational_numbers)\
    ensure_loaded_set_theory(discrete/natural_numbers)\
    ensure_loaded_set_theory(discrete/rational_numbers)\
    ensure_loaded_set_theory(discrete/real_algebraic_numbers)\
    ensure_loaded_set_theory(discrete/real_numbers)\
    ensure_loaded_set_theory(discrete/universal_set)\
    ensure_loaded_set_theory(discrete/whole_numbers)\
}
//ensure_loaded_set_theory(discrete/null_set)
//ensure_loaded_group_theory(circle_group)

#define ensure_all_loaded_for_math_space(){\
    ensure_loaded_math(space/space)\
    ensure_loaded_math(space/types_space)\
    ensure_loaded_math(space/discrete/boolean_space)\
    ensure_loaded_math(space/discrete/nucleotide_space)\
    ensure_loaded_math(space/discrete/number_space)\
    ensure_loaded_math(space/discrete/symbolic_numbers_space)\
}

#define ensure_all_loaded_for_tropical_algebra(){\
    ensure_loaded_math(algebra/tropical/tropical)\
    ensure_loaded_math(algebra/tropical/context_numeric)\
    ensure_loaded_math(algebra/tropical/context_matrix)\
}

#define ensure_all_loaded_for_geometry(){\
    ensure_loaded_math(geometry/theta_angle)\
    ensure_loaded_math(geometry/trig)\
}

#define ensure_all_loaded_for_statistics(){\
    ensure_loaded_math(combinatorics/combinatorics)\
    ensure_loaded_math(stats/stats)\
    ensure_loaded_math(stats/rng)\
    ensure_loaded_math(stats/time_series)\
    ensure_loaded_math(stats/descriptive)\
    ensure_loaded_math(stats/time_series_data)\
}

#define ensure_all_loaded_for_ruuuby(){\
    ensure_loaded_ruuuby(env)\
    ensure_loaded_ruuuby(ruuuby/ruuuby_api)\
    ensure_loaded_ruuuby(ruuuby/api/git/api_git)\
    ensure_loaded_ruuuby(ruuuby/api/api_brew)\
    ensure_loaded_ruuuby(ruuuby/api/api_locale)\
    ensure_loaded_ruuuby(ruuuby/engine/ruuuby_engine)\
    ensure_loaded_ruuuby(configs)\
}

#define ensure_all_loaded_for_ruuuby_engine(){\
    ensure_loaded_ruuuby(ruuuby/engine/component/component)\
    ensure_loaded_ruuuby(ruuuby/engine/component/api)\
    ensure_loaded_ruuuby(ruuuby/engine/component/api_cli)\
}

#define ensure_all_loaded_for_nums(){\
    ensure_loaded_nums(int)\
    ensure_loaded_nums(float)\
    ensure_loaded_nums(numeric)\
    ensure_loaded_nums(big_decimal)\
    ensure_loaded_nums(rational)\
    ensure_loaded_nums(complex)\
}

#define ensure_all_loaded_for_attribute_includable(){\
    ensure_loaded_attribute_includable(syntax_cache)\
    ensure_loaded_attribute_includable(connectable)\
}

#define ensure_all_loaded_for_module(){\
    ensure_loaded_module(enumerable)\
    ensure_loaded_module(module)\
    ensure_loaded_module(kernel)\
    ensure_loaded_module(math)\
}

// ---------------------------------------------------------------------------------------------------------------------

#define re_ye                       return Qtrue;
#define re_c_ye                     return 1;
#define re_no                       return Qfalse;
#define re_nil                      return Qnil;
#define re_c_no                     return 0;
#define re_as_bool(expr)            if (expr) {re_ye} else {re_no}
#define re_as_bool_opposite(expr)   if (expr) {re_no} else {re_ye}
#define re_as_c_bool(expr)          if (expr) {return 1;} else {return 0;}
#define re_me                       return self;
#define re_me_eq_to(arg)            return rb_obj_equal(self, arg);
#define re_0                        return ℤ0;
#define re_nan                      return cached_flt_nan;
#define re_inf                      return cached_flt_inf;
#define re_negative_inf             return cached_flt_negative_inf;
#define re_inf_complex              return cached_flt_inf_complex;
#define re_1                        return ℤ1;
#define re_n1                       return ℤn1;
#define re_me_mem_size              return UINT2NUM((unsigned int) rb_obj_memsize_of(self));
// essentially returns "self.send(func_name, arg)"
#define re_me_func_1args(func_name, arg) return rb_funcall(self, func_name, 1, arg);

/*                                     ___    ___
             __                       /\_ \  /\_ \
    ___ ___ /\_\    ____    ___     __\//\ \ \//\ \      __      ___      __    ___   __  __    ____
  /' __` __`\/\ \  /',__\  /'___\ /'__`\\ \ \  \ \ \   /'__`\  /' _ `\  /'__`\ / __`\/\ \/\ \  /',__\
  /\ \/\ \/\ \ \ \/\__, `\/\ \__//\  __/ \_\ \_ \_\ \_/\ \L\.\_/\ \/\ \/\  __//\ \L\ \ \ \_\ \/\__, `\
  \ \_\ \_\ \_\ \_\/\____/\ \____\ \____\/\____\/\____\ \__/.\_\ \_\ \_\ \____\ \____/\ \____/\/\____/
   \/_/\/_/\/_/\/_/\/___/  \/____/\/____/\/____/\/____/\/__/\/_/\/_/\/_/\/____/\/___/  \/___/  \/___/


==void funcs
- ruby_show_version();
- ruby_show_copyright();

//VALUE rb_gc_enable(void);
//VALUE rb_gc_disable(void);

time_t timer;
time(&timer);
printf ("The current local time is: %s\n", ctime (&timer));

//ruby_vm_at_exit(& at_exit);
//static void at_exit (void) {
    //printf("for when needed, this func will run after END {} blocks\n");
//}

  # TODO: w/ TDD for Class(String) {create w/ extension so that 'U*' ID can be re-used)
  #
  # @return [Array]
  def as_utf8_hex; self.as_utf8.unpack('U*'); end

static inline void internal_only_add_frozen_const_to(VALUE kclass, VALUE * internal_global, const char * const_name, VALUE val_to_freeze);

static inline void internal_only_add_frozen_const_to(VALUE kclass, VALUE * internal_global, const char * const_name, VALUE val_to_freeze) {
    RB_OBJ_FREEZE(val_to_freeze);
    *internal_global = val_to_freeze;
    rb_define_const(kclass, const_name, val_to_freeze);
    rb_global_variable(internal_global);
}


// source solution credit: https://tutorialspoint.dev/algorithm/mathematical-algorithms/steins-algorithm-for-finding-gcd
ⓡ𝑓_self_a_b(m_number_theory_gcd,
    int a = RB_FIX2INT(param_a);
    if (a == 0) {return param_b;}
    int b = RB_FIX2INT(param_b);
    if (b == 0) {return param_a;}
    else if (a == 1 || b == 1) {re_1}
    // `k` is the greatest shared power of 2
    int k = 0;
    for (k = 0; (a > 1 && ((a % 2) == 0)) && (b > 1 && ((b % 2) == 0)); ++k) {
        a /= 2;
        b /= 2;
    }
    // set `a` to be odd
    while (a % 2 == 0) {
        a /= 2;
    }
    do {
        while (b % 2 == 0) {
            b /= 2;
        }
        // `a` and `b` are both `odd` here
        if (a > b) {
            SWAP_INTS(a, b);
        }
        b -= a;
    } while (b != 0);
    return INT2NUM(a << k);
)
💎add_singleton_func_2args_to(ⓜnumber_theory, "fast_gcd", m_number_theory_gcd)
*/

/*                                             __                     __
                                              /\ \                   /\ \
     __   _ __   _ __   ___   _ __         ___\ \ \___      __    ___\ \ \/'\     ____
   /'__`\/\`'__\/\`'__\/ __`\/\`'__\      /'___\ \  _ `\  /'__`\ /'___\ \ , <    /',__\
  /\  __/\ \ \/ \ \ \//\ \L\ \ \ \/      /\ \__/\ \ \ \ \/\  __//\ \__/\ \ \\`\ /\__, `\
  \ \____\\ \_\  \ \_\\ \____/\ \_\      \ \____\\ \_\ \_\ \____\ \____\\ \_\ \_\/\____/
   \/____/ \/_/   \/_/ \/___/  \/_/       \/____/ \/_/\/_/\/____/\/____/ \/_/\/_/\/___/ */

#define raise_err_arg(...)           rb_raise(R_ERR_ARG, __VA_ARGS__);
#define raise_err_runtime(...)       rb_raise(R_ERR_RUNTIME, __VA_ARGS__);
#define raise_err_zero_division(...) rb_raise(R_ERR_ZERO_DIVISION, __VA_ARGS__);

#define 🛑arg_nums rb_raise(E_ERR_ARG, __VA_ARGS__);
#define 🛑expected_kargs(the_func, num_args_expected) raise_err_arg("| self{%s}-> m{%s} w/ self{%"PRIsVALUE"} got{%d} args instead of the expected{%s} |", rb_obj_classname(self), the_func, self, argc, num_args_expected);
#define 🛑expected_sym(the_func, arg_name, the_arg)   raise_err_arg("| self{%s}-> m{%s} w/ self{%"PRIsVALUE"} got{%"PRIsVALUE"} w/ type{%s} instead of the expected type{Symbol} |", rb_obj_classname(self), the_func, self, the_arg, rb_obj_classname(the_arg));

#define ERR_param_type(nucleotide, kclass, the_func, arg_name, the_arg, required_type) raise_err_arg("| %s{%s}-> m{%s} got arg(%s) w/ type{%s}, required-type{%s} |", nucleotide, kclass, the_func, arg_name, rb_obj_classname(the_arg), required_type);
#define ERR_c_self_got_bad_param_type(the_func, the_arg, required_type)                raise_err_arg("| c{%s}-> m{%s} got arg w/ type{%s}, required-type{%s} |", rb_obj_classname(self), the_func, rb_obj_classname(the_arg), required_type);
#define ERR_c_self_got_non_ary_param(the_func, the_arg)                                raise_err_arg("| c{%s}-> m{%s} got arg w/ type{%s}, required-type{Array} |", rb_obj_classname(self), the_func, rb_obj_classname(the_arg));
#define ERR_c_self_got_non_str_param(the_func, the_arg)                                raise_err_arg("| c{%s}-> m{%s} got arg w/ type{%s}, required-type{String} |", rb_obj_classname(self), the_func, rb_obj_classname(the_arg));

#define ERR_c_self_arg_err__print_self_them(description) raise_err_arg(description, self, them);
#define ERR_c_self_err_runtime(...)                      raise_err_arg(description, self, them);

#define ERR_m_param_type(kclass, the_func, arg_name, the_arg, required_type) ERR_param_type("m", kclass, the_func, arg_name, the_arg, required_type)
#define ERR_c_param_type(kclass, the_func, arg_name, the_arg, required_type) ERR_param_type("c", kclass, the_func, arg_name, the_arg, required_type)

#define _internal_self_throw_arg_err_1opts(kclass, func_name, err_msg) raise_err_arg("| %s{%s}-> m{%s} %s |", kclass, rb_obj_classname(self), func_name, err_msg);
#define _internal_self_throw_arg_err_2opts(kclass, func_name, err_msg_start, opt_a_format, err_msg_end, opt_a) raise_err_arg("| %s{%s}-> m{%s} %s" #opt_a_format " %s |", kclass, rb_obj_classname(self), func_name, err_msg_start, opt_a, err_msg_end);

//#define _internal_self_throw_arg_err_1opts(kclass, func_name, err_msg)        rb_raise(R_ERR_ARG, "| %s{%s}-> m{%s} %s |", kclass, rb_obj_classname(self), func_name, err_msg);
//#define _internal_self_throw_arg_err_2opts(kclass, func_name, err_msg_start, opt_a_format, err_msg_end, opt_a) rb_raise(R_ERR_ARG, "| %s{%s}-> m{%s} %s" #opt_a_format " %s |", kclass, rb_obj_classname(self), func_name, err_msg_start, opt_a, err_msg_end);
//#define _internal_self_throw_arg_err_2opts_1int(kclass, func_name, err_msg_start, opt_a_format, err_msg_end, opt_a, the_int) rb_raise(R_ERR_ARG, "| %s{%s}-> m{%s} %s" #opt_a_format " %s |", kclass, rb_obj_classname(self), func_name, err_msg_start, opt_a, err_msg_end);

#define ERR_c_self_throw_arg_err_1opts(func_name, err_msg) _internal_self_throw_arg_err_1opts("c", func_name, err_msg)

#define ERR_is_num(kclass, the_func, arg_name, the_arg) if (!(is_num(the_arg))) {ERR_m_param_type(kclass, the_func, arg_name, the_arg, "Numeric")}
#define ERR_is_sym(kclass, the_func, arg_name, the_arg) if (!(is_sym(the_arg))) {ERR_m_param_type(kclass, the_func, arg_name, the_arg, "Symbol")}
#define 🛑_is_ary(kclass, the_func, arg_name, the_arg) if (!(is_ary(the_arg))) {ERR_m_param_type(kclass, the_func, arg_name, the_arg, "Array")}
#define 🛑_is_int(kclass, the_func, arg_name, the_arg) if (!(is_int(the_arg))) {ERR_m_param_type(kclass, the_func, arg_name, the_arg, "Integer")}
#define 🛑_is_fixnum(kclass, the_func, arg_name, the_arg) if (!(is_fixnum(the_arg))) {ERR_m_param_type(kclass, the_func, arg_name, the_arg, "Fixnum")}
#define 🛑_is_flt(kclass, the_func, arg_name, the_arg) if (!(is_float(the_arg))) {ERR_m_param_type(kclass, the_func, arg_name, the_arg, "Float")}

#define ERR_normalizer_invalid_value(func_name, the_normalizer) raise_err_arg("| <%"PRIsVALUE">-> m{%s} does not support the received normalizer{%"PRIsVALUE"} |", self, func_name, them);
#define 🛑normalizer_value(func_name, the_normalizer) ERR_normalizer_invalid_value(func_name, the_normalizer)

#endif
