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

#include "ruby_class_mods.h"

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
  __   __        __  ___           ___                         ___  __
 /  ` /  \ |\ | /__`  |   /\  |\ |  |     \  /  /\  |    |  | |__  /__`
 \__, \__/ | \| .__/  |  /~~\ | \|  |      \/  /~~\ |___ \__/ |___ .__/
____________________________________________________________________________________________________________________________________________________________________ */
// true  --> Qtrue
// false --> Qfalse
// nil   --> Qnil
#define R_STR      rb_cString
#define R_OBJ      rb_cObject
#define R_INT      rb_cInteger
#define R_FLT      rb_cFloat
#define R_NIL      rb_cNilClass
#define R_NUM      rb_cNumeric
#define R_COMPLEX  rb_cComplex
#define R_RATIONAL rb_cRational;
#define R_HSH      rb_cHash
#define R_ARY      rb_cArray
#define R_FILE     rb_cFile
#define R_SYM      rb_cSymbol
#define R_KRL      rb_mKernel

/*____________________________________________________________________________________________________________________________________________________________________
            __   __   __   __       __   __   ___     __   __   __   __   ___  __   __          __
 |\/|  /\  /  ` |__) /  \ /__` .   |__) |__) |__  __ |__) |__) /  \ /  ` |__  /__` /__` | |\ | / _`
 |  | /~~\ \__, |  \ \__/ .__/ .   |    |  \ |___    |    |  \ \__/ \__, |___ .__/ .__/ | | \| \__>
____________________________________________________________________________________________________________________________________________________________________ */

#define ext_api_add_public_method_0args_to_class(r_class, func_name, the_func) rb_define_method(r_class, func_name, RUBY_METHOD_FUNC(the_func), 0);
#define ext_api_add_public_method_1args_to_class(r_class, func_name, the_func) rb_define_method(r_class, func_name, RUBY_METHOD_FUNC(the_func), 1);
#define ext_api_add_private_method_0args_to_class(r_class, func_name, the_func) rb_define_private_method(r_class, func_name, RUBY_METHOD_FUNC(the_func), 0);
#define ext_api_add_private_method_1args_to_class(r_class, func_name, the_func) rb_define_private_method(r_class, func_name, RUBY_METHOD_FUNC(the_func), 1);

#define ext_api_add_global_const_str(const_name, const_value)      rb_define_global_const(const_name, r_str_new_frozen_literal(const_value));
#define ext_api_add_global_module(str)                             rb_define_module(str);
#define ext_api_add_module_under(under_me, str)                    rb_define_module_under(under_me, str);
#define ext_api_add_new_sub_class_under(under_me, base_class, str) rb_define_class_under(under_me, str, base_class);

#define ext_api_add_func_alias(kclass, new_func_name, previous_func_name) rb_define_alias(kclass, new_func_name, previous_func_name);
#define ext_api_add_const_under(kclass, const_name, const_value) rb_define_const(kclass, const_name, const_value);

#define r_type(arg_to_check, r_class) RB_TYPE_P(arg_to_check, r_class)

#define is_nil(arg)           RTEST(NIL_P(arg))
#define is_ary(arg)           r_type(arg, T_ARRAY)
#define is_non_empty_ary(arg) (is_ary(arg) && is_empty_ary(arg))
#define is_hsh(arg)           RB_TYPE_P(arg, T_HASH)
#define is_non_empty_hsh(arg) (is_hsh(arg) && is_empty_hsh(arg))
#define is_str(arg)           (CLASS_OF(arg) == R_STR)
#define is_non_empty_str(arg) (is_str(arg) && is_empty_str(arg))
#define is_int(arg)           RB_INTEGER_TYPE_P(arg)
#define is_float(arg)          RB_FLOAT_TYPE_P(arg)
#define is_fix_num(arg)        FIXNUM_P(arg)
#define is_big_num(arg)       RB_TYPE_P(arg, T_BIGNUM)
#define is_sym(arg)           SYMBOL_P(arg)
#define is_bool(arg)          (r_type(arg, T_TRUE) || r_type(arg, T_FALSE))

#define len_ary(ary) RARRAY_LEN(ary)
#define len_str(str) RSTRING_LEN(str)
#define len_hsh(hsh) RHASH_SIZE(hsh)

#define raise_err_bad_arg_type(error_message, error_param) rb_raise(ERROR_ARGUMENT, error_message, rb_obj_classname(error_param));
#define raise_err_array_bad_arg_type(func_name, them)      raise_err_bad_arg_type("| c{Array}-> m{" #func_name "} got arg(them) w/ type{%s}, required-type{Array} |", them)
#define raise_err_string_bad_arg_type(func_name, them)     raise_err_bad_arg_type("| c{String}-> m{" #func_name "} got arg(them) w/ type{%s}, required-type{String} |", them)

#define ensure_not_frozen(arg_to_check) rb_check_frozen(arg_to_check);

#define is_empty_hsh(arg) RHASH_EMPTY_P(arg)
#define is_empty_str(arg) len_str(arg) == 0
#define is_empty_ary(arg) len_ary(arg) == 0

#define r_str_prepend(str, elem) rb_str_update(str, 0L, 0L, elem);
#define r_ary_prepend(ary, elem) rb_ary_unshift(ary, elem);

#define r_str_new_frozen_literal(arg) rb_str_new_frozen(rb_str_new_cstr(arg))
#define r_str_pre_modify(str)         rb_str_modify(str);
#define cstr_to_rstr(arg)             rb_str_new_cstr(arg)

#define r_hsh_increment_keys_val(hsh, key) rb_hash_aset(hsh, key, LONG2FIX(RB_FIX2LONG(rb_hash_aref(hsh, key)) + 1));
#define r_hsh_set_val_to_one(hsh, key) rb_hash_aset(hsh, key, ℤ1);

#define r_hsh_has_key(hsh, key) (rb_hash_has_key(hsh, key) == Qtrue)
#define r_ary_has(ary, elem) rb_ary_includes(ary, elem)

#define r_ary_get(ary, index) rb_ary_entry(ary, index)
#define r_ary_add(ary, elem) rb_ary_push(ary, elem);
#define r_ary_del_at(ary, index) rb_ary_delete_at(ary, index);

#define declare_func(func_name, expr, return_type, single_param) return_type func_name(single_param);return_type func_name(single_param){expr}
#define declare_static_func(func_name, expr, return_type, single_param) static return_type func_name(single_param);static return_type func_name(single_param){expr}
#define r_func_raw(func_name, expr) declare_static_func(func_name, expr, VALUE, VALUE self)
#define r_func_raw2(func_name, param_0, param_1, expr) VALUE func_name(VALUE param_0, VALUE param_1);VALUE func_name(VALUE param_0, VALUE param_1){expr}
#define r_func_self_them(func_name, expr) r_func_raw2(func_name, self, them, expr)
#define r_func(func_name, expr) r_func_raw(func_name, return (expr) ? Qtrue : Qfalse;)
#define c_func(func_name, expr) declare_func(func_name, expr, void, void)

#define re_ye  return Qtrue;
#define re_no  return Qfalse;
#define re_me  return self;
#define re_1   return ℤ1;
#define re_n1  return ℤn1;
// essentially returns "self.send(func_name, arg)"
#define re_me_func_1args(func_name, arg) return rb_funcall(self, func_name, 1, arg);

#define r_add_global_const(const_name, const_value) rb_define_global_const(const_name, const_value);
#define r_add_global_const_str(const_name, const_value) r_add_global_const("" #const_name, cstr_to_rstr("" #const_value))
#define r_get_class(r_class) rb_const_get(rb_cObject, rb_intern(r_class));

#define get_numerical_const(the_num) NUM2ULONG(rb_obj_id(rb_const_get_at(rb_cNumeric, rb_intern(the_num))))
#define internal_define_set_exponential_negative(num_position, num_val) exponential_ids[num_position] = NUM2ULONG(rb_obj_id(rb_const_get_at(rb_cNumeric, rb_intern("EXPONENTIAL_n" #num_val))));
#define internal_define_set_exponential(num_position, num_val)          exponential_ids[num_position] = NUM2ULONG(rb_obj_id(rb_const_get_at(rb_cNumeric, rb_intern("EXPONENTIAL_" #num_val))));

#define bsearch_ulong(val_to_find) (unsigned long *) bsearch (&val_to_find, exponential_ids, 𝔠EXPONENTS, 𝔠ULONG, internal_only_compare_func_4_object_id);

/*____________________________________________________________________________________________________________________________________________________________________
  ___            __   __       __   ___  __             __       ___    __        __                      __        ___        ___      ___      ___    __        __
 |__  |  | |\ | /  ` /__` .   |  \ |__  /  ` |     /\  |__)  /\   |  | /  \ |\ | /__`    __|__   |  |\/| |__) |    |__   |\/| |__  |\ |  |   /\   |  | /  \ |\ | /__`
 |    \__/ | \| \__, .__/ .   |__/ |___ \__, |___ /~~\ |  \ /~~\  |  | \__/ | \| .__/      |     |  |  | |    |___ |___  |  | |___ | \|  |  /~~\  |  | \__/ | \| .__/
____________________________________________________________________________________________________________________________________________________________________ */

/*____________________________________________________________________________________________________________________
   __            ___  ___  __                          ___       __   ___  __   __
  /  `    | |\ |  |  |__  |__) |\ |  /\  |       |__| |__  |    |__) |__  |__) /__`
  \__,    | | \|  |  |___ |  \ | \| /~~\ |___    |  | |___ |___ |    |___ |  \ .__/
_____________________________________________________________________________________________________________________ */

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
        if(the_result != NULL) {
            switch(exponential_indexes[(((int)the_result - (int)exponential_ids) / 𝔠ULONG)]) {
            case -9: re_me_func_1args(cached_rb_intern_raise_to_power, ℤn9)
            case -8: re_me_func_1args(cached_rb_intern_raise_to_power, ℤn8)
            case -7: re_me_func_1args(cached_rb_intern_raise_to_power, ℤn7)
            case -6: re_me_func_1args(cached_rb_intern_raise_to_power, ℤn6)
            case -5: re_me_func_1args(cached_rb_intern_raise_to_power, ℤn5)
            case -4: re_me_func_1args(cached_rb_intern_raise_to_power, ℤn4)
            case -3: re_me_func_1args(cached_rb_intern_raise_to_power, ℤn3)
            case -2: re_me_func_1args(cached_rb_intern_raise_to_power, ℤn2)
            case -1: return rb_rational_new(ℤ1, self);
            case 0: re_1
            case 1: re_me
            case 2: re_me_func_1args(cached_rb_intern_raise_to_power, ℤ2)
            case 3: re_me_func_1args(cached_rb_intern_raise_to_power, ℤ3)
            case 4: re_me_func_1args(cached_rb_intern_raise_to_power, ℤ4)
            case 5: re_me_func_1args(cached_rb_intern_raise_to_power, ℤ5)
            case 6: re_me_func_1args(cached_rb_intern_raise_to_power, ℤ6)
            case 7: re_me_func_1args(cached_rb_intern_raise_to_power, ℤ7)
            case 8: re_me_func_1args(cached_rb_intern_raise_to_power, ℤ8)
            case 9: re_me_func_1args(cached_rb_intern_raise_to_power, ℤ9)
            default:
                re_me_func_1args(cached_rb_intern_ints_bitwise_xor, them)
            }
        } else { re_me_func_1args(cached_rb_intern_ints_bitwise_xor, them) }
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
        const unsigned long id_to_find = NUM2ULONG(rb_obj_id(them));
        unsigned long * the_result    = bsearch_ulong(id_to_find);
        if(the_result != NULL) {
            const double val_self = NUM2DBL(self); // RFLOAT_VALUE(self);
            if (isnan(val_self)) {rb_raise(ERROR_RUNTIME, "| c{Float}-> m{^} self(%"PRIsVALUE") may not be raised to an exponential power |", self);}
            const int power_to_raise_to = exponential_indexes[(((int)the_result - (int)exponential_ids) / 𝔠ULONG)];
            if (val_self == 0.0 && power_to_raise_to < 0) {
                rb_raise(ERROR_DIVIDE_BY_ZERO, "| c{Float}-> m{^} self(%"PRIsVALUE") may not be raised to a negative exponential power |", self);
            }
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
            case 0:
                if (isinf(val_self)) {
                    rb_raise(ERROR_RUNTIME, "| c{Float}-> m{^} self(%"PRIsVALUE") may not be raised to an exponential power(0) |", self);
                } else if (val_self >= 0) { re_1 } else { re_n1 }
            case 1: re_me
            case 2: re_me_func_1args(cached_rb_intern_raise_to_power, ℤ2)
            case 3: re_me_func_1args(cached_rb_intern_raise_to_power, ℤ3)
            case 4: re_me_func_1args(cached_rb_intern_raise_to_power, ℤ4)
            case 5: re_me_func_1args(cached_rb_intern_raise_to_power, ℤ5)
            case 6: re_me_func_1args(cached_rb_intern_raise_to_power, ℤ6)
            case 7: re_me_func_1args(cached_rb_intern_raise_to_power, ℤ7)
            case 8: re_me_func_1args(cached_rb_intern_raise_to_power, ℤ8)
            case 9: re_me_func_1args(cached_rb_intern_raise_to_power, ℤ9)
            default:
                rb_raise(ERROR_RUNTIME, "| c{Float}-> m{^} self(%"PRIsVALUE") received invalid argument(%"PRIsVALUE") |", self, them);
            }
        } else {
            rb_raise(ERROR_RUNTIME, "| c{Float}-> m{^} self(%"PRIsVALUE") unable to match exponential(%"PRIsVALUE") |", self, them);
        }
    } else { rb_raise(ERROR_RUNTIME, "| c{Float}-> m{^} self(%"PRIsVALUE") unable to match exponential(%"PRIsVALUE") |", self, them); }
    //} else { re_me_func_1args(cached_rb_intern_raise_to_power, them) }
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
    } else {raise_err_string_bad_arg_type(>>, them)}
)

// | function{err_to_num} |
r_func_raw(m_str_err_to_num,
     rb_raise(ERROR_RUNTIME, "| c{String}-> m{to_num} may not convert self(%"PRIsVALUE") into a valid numeric |", self);
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
    if (is_empty_ary(self)){re_me}
    long len_me = len_ary(self);
    long i;
    VALUE v;
    for (i = 0; i < len_me;) {
        v = RARRAY_PTR(self)[i];
        if (is_nil(v) || is_non_empty_str(v) || is_non_empty_ary(v) || is_non_empty_hsh(v)) {
            r_ary_del_at(self, i);
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
                    n = r_ary_get(them, i); if(!r_ary_has(self, n)){r_ary_add(output, n)}
                    n = r_ary_get(self, i); if(!r_ary_has(them, n)){r_ary_add(output, n)}
                }
                for (; i < len_me; i++) {
                    n = r_ary_get(self, i); if(!r_ary_has(them, n)){r_ary_add(output, n)}
                }
            } else {
                for (i = 0L; i < len_me; i++) {
                    n = r_ary_get(self, i); if(!r_ary_has(them, n)){r_ary_add(output, n)}
                    n = r_ary_get(them, i); if(!r_ary_has(self, n)){r_ary_add(output, n)}
                }
                for (; i < len_them; i++) {
                    n = r_ary_get(them, i); if(!r_ary_has(self, n)){r_ary_add(output, n)}
                }
            }
            return output;
        }
    } else {raise_err_array_bad_arg_type(disjunctive_union, them)}
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
    } else {raise_err_array_bad_arg_type(equal_contents?, them)}
)

/*____________________________________________________________________________________________________________________
 __      __   __   __   ___     ___      ___  __
/  `    /  ` /  \ |  \ |__     |__  |\ |  |  |__) \ /
\__,    \__, \__/ |__/ |___    |___ | \|  |  |  \  |
_____________________________________________________________________________________________________________________ */

c_func(Init_ruby_class_mods,

    // | f18 | load various Ruby internals |
    ensure_loaded_default(set)
    ensure_loaded_default(complex)
    ensure_loaded_default(bigdecimal)
    // | --------------------------------- |

    // | f11 | creates alias of Integer's func{^} which is originally provided for bitwise XOR
    ext_api_add_func_alias(R_INT, "bitwise_xor", "^")

    cached_class_big_decimal          = r_get_class("BigDecimal");
    cached_rb_intern_is_a             = rb_intern("is_a?");
    cached_rb_intern_ints_bitwise_xor = rb_intern("bitwise_xor");
    cached_rb_intern_raise_to_power   = rb_intern("**");
    // | --------------------------------- |

    /*___________________________________________________________________________________________________________
     __                  __
    |__) |  | |  | |  | |__) \ /
    |  \ \__/ \__/ \__/ |__)  |

     | 0x0 |
        module ::Ruuuby
            module ParamErr
                # +WrongParamType+ extends +ArgumentError+ and provides a light wrapper for throwing more specific arg errors.
                class WrongParamType < ArgumentError
                end
            end
        end
    _____________________________________________________________________________________________________________ */
    // | 0x0 | ::Ruuuby::ParamErr::WrongParamType
    cached_module_ruuuby    = ext_api_add_global_module("Ruuuby")
    cached_module_param_err = ext_api_add_module_under(cached_module_ruuuby, "ParamErr")
    ext_api_add_module_under(cached_module_ruuuby, "VirtualTypes")
    ext_api_add_new_sub_class_under(cached_module_param_err, ERROR_ARGUMENT, "WrongParamType")

    cached_global_sym_many_args = ID2SYM(rb_intern("*args"));
    rb_define_readonly_variable("$PRM_MANY", &cached_global_sym_many_args);

    ext_api_add_const_under(rb_mMath, "RATIO_DEGREES_TO_RADIAN", DBL2NUM(M_PIE / 180.0));
    ext_api_add_const_under(rb_mMath, "RATIO_RADIANS_TO_DEGREE", DBL2NUM(180.0 / M_PIE));

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


    // | f18 | load various Ruby internals |

    // 3rd party gem
    ensure_loaded_default(tty-command)

    // ruuuuby

    ensure_loaded_attribute_includable(cardinality)
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
    ensure_loaded_enumerable(hsh)
    ensure_loaded_nums(int)
    ensure_loaded_nums(float)
    ensure_loaded_nums(numeric)
    ensure_loaded_nums(big_decimal)
    ensure_loaded_nums(rational)
    ensure_loaded_nums(complex)
    ensure_loaded_class(nil)
    ensure_loaded_enumerable(ary)
    ensure_loaded_enumerable(set)

    ensure_loaded_attribute_includable(syntax_cache)
    ensure_loaded_attribute_extendable(syntax_cache)

    ensure_loaded_class(sym)

    ensure_loaded_class(str) // must be after{attribute_syntax_cache, attribute_cardinality}
    ensure_loaded_io(file)    // must be after{attribute_syntax_cache}
    ensure_loaded_io(dir)    // must be after{attribute_syntax_cache}

    ensure_loaded_ruuuby(version)
    // | --------------------------------- |

    // ____________________________________ ⚠️ ____________________________________

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

    // ____________________________________ ⚠️ ____________________________________

    // TODO: investigate if globals created in C (but not needed/exposed to Ruby) needed to guarded against garbage collection
    //rb_global_variable();

)
