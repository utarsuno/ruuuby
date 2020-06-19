// encoding: utf-8

#ifndef CRUUUBY_H2_EXTENSION_MEMORY
#include "c2_extension_memory.h"
#endif

#ifndef CRUUUBY_H3_MACRO_UTILITIES
#define CRUUUBY_H3_MACRO_UTILITIES "defined(CRUUUBY_H3_MACRO_UTILITIES)"

/*____________________________________________________________________________________________________________________________________________________________________
            __   __   __   __       __   __   ___     __   __   __   __   ___  __   __          __
 |\/|  /\  /  ` |__) /  \ /__` .   |__) |__) |__  __ |__) |__) /  \ /  ` |__  /__` /__` | |\ | / _`
 |  | /~~\ \__, |  \ \__/ .__/ .   |    |  \ |___    |    |  \ \__/ \__, |___ .__/ .__/ | | \| \__>
____________________________________________________________________________________________________________________________________________________________________ */

#define ensure_file_loaded(path) if (rb_require(path) != Qtrue){printf("path already loaded {%s}\n", path);};
/*__attribute__ ((access (read_only, 1))) static void ensure_file_loaded(const char * path);
__attribute__ ((access (read_only, 1))) static void ensure_file_loaded(const char * path) {
    if (rb_require(path) != Qtrue) {
        printf("path already loaded {%s}\n", path);
        rb_sys_fail("path was already loaded\n");
    };
}*/

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
    ensure_loaded_set_theory(discrete/null_set)\
    ensure_loaded_set_theory(discrete/rational_numbers)\
    ensure_loaded_set_theory(discrete/real_algebraic_numbers)\
    ensure_loaded_set_theory(discrete/real_numbers)\
    ensure_loaded_set_theory(discrete/universal_set)\
    ensure_loaded_set_theory(discrete/whole_numbers)\
    ensure_loaded_group_theory(circle_group)\
}

#define ensure_all_loaded_for_math_space(){\
    ensure_loaded_math(space/space)\
    ensure_loaded_math(space/types_space)\
    ensure_loaded_math(space/discrete/boolean_space)\
    ensure_loaded_math(space/discrete/nucleotide_space)\
    ensure_loaded_math(space/discrete/number_space)\
    ensure_loaded_math(space/discrete/symbolic_numbers_space)\
}

#define ensure_all_loaded_for_geometry(){\
    ensure_loaded_math(geometry/shape/shape)\
    ensure_loaded_math(geometry/shape/plane_figure)\
    ensure_loaded_math(geometry/shape/quadrilateral)\
    ensure_loaded_math(geometry/shape/circle)\
    ensure_loaded_math(geometry/shape/triangle)\
    ensure_loaded_math(geometry/trig)\
}

#define ensure_all_loaded_for_ruuuby(){\
    ensure_loaded_ruuuby(virtual/env)\
    ensure_loaded_ruuuby(virtual/f28)\
    ensure_loaded_ruuuby(ruuuby/ruuuby_api)\
    ensure_loaded_ruuuby(ruuuby/git_api)\
    ensure_loaded_ruuuby(ruuuby/engine/ruuuby_engine)\
    ensure_loaded_ruuuby(configs)\
}

#define ensure_all_loaded_for_nums(){\
    ensure_loaded_nums(int)\
    ensure_loaded_nums(float)\
    ensure_loaded_nums(numeric)\
    ensure_loaded_nums(big_decimal)\
    ensure_loaded_nums(rational)\
    ensure_loaded_nums(complex)\
    ensure_loaded_nums(theta_angle)\
}

#define ensure_all_loaded_for_attribute_includable(){\
    ensure_loaded_attribute_includable(cardinality)\
    ensure_loaded_attribute_includable(notation_set_mathematics)\
    ensure_loaded_attribute_includable(subscript_indexing)\
    ensure_loaded_attribute_includable(syntax_cache)\
}

#define ensure_all_loaded_for_module(){\
    ensure_loaded_module(enumerable)\
    ensure_loaded_module(module)\
    ensure_loaded_module(kernel)\
    ensure_loaded_module(math)\
}

// ---------------------------------------------------------------------------------------------------------------------

#define re_ye              return Qtrue;
#define re_c_ye            return 1;
#define re_no              return Qfalse;
#define re_nil             return Qnil;
#define re_c_no            return 0;
#define re_as_bool(expr)   if (expr) {re_ye} else {re_no}
#define re_as_c_bool(expr) if (expr) {return 1;} else {return 0;}
#define re_me              return self;
#define re_me_eq_to(arg)   return rb_obj_equal(self, arg);
#define re_0               return ℤ0;
#define re_nan             return cached_flt_nan;
#define re_inf             return cached_flt_inf;
#define re_negative_inf    return cached_flt_negative_inf;
#define re_inf_complex     return cached_flt_inf_complex;
#define re_1               return ℤ1;
#define re_n1              return ℤn1;
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

//💎set_program_name("ruuuby:v.0.0.34");

  # TODO: w/ TDD for Class(String) {create w/ extension so that 'U*' ID can be re-used)
  #
  # @return [Array]
  def as_utf8_hex; self.as_utf8.unpack('U*'); end


#define r_str_new_frozen_literal(arg) rb_str_new_frozen(rb_str_new_cstr(arg))
#define cstr_to_rstr(arg)             rb_str_new_cstr(arg)

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

#endif
