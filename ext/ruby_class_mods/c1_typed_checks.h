// encoding: utf-8

/*____________________________________________________________________________________________________________________________________________________________________
         __   __        __                  __   __   __  ___  __
 |    | |__) |__)  /\  |__) \ /    |  |\/| |__) /  \ |__)  |  /__`
 |___ | |__) |  \ /~~\ |  \  |     |  |  | |    \__/ |  \  |  .__/
____________________________________________________________________________________________________________________________________________________________________ */

#ifndef CRUUUBY_H0_CONSTANTS
#include "c0_constants.h"
#endif

#ifndef CRUUUBY_H1_CONSTANTS_TYPE_HEADERS
#define CRUUUBY_H1_CONSTANTS_TYPE_HEADERS "defined(CRUUUBY_H1_CONSTANTS_TYPE_HEADERS)"

/*____________________________________________________________________________________________________________________________________________________________________
  __   __        __  ___           ___                         ___  __
 /  ` /  \ |\ | /__`  |   /\  |\ |  |     \  /  /\  |    |  | |__  /__`
 \__, \__/ | \| .__/  |  /~~\ | \|  |      \/  /~~\ |___ \__/ |___ .__/
____________________________________________________________________________________________________________________________________________________________________ */
#define R_ERR_RUNTIME       rb_eRuntimeError
#define R_ERR_ARG           rb_eArgError
#define R_ERR_ZERO_DIVISION rb_eZeroDivError

// true  --> Qtrue
// false --> Qfalse
// nil   --> Qnil
#define R_STR      rb_cString
#define R_OBJ      rb_cObject
#define R_INT      rb_cInteger
#define R_FLT      rb_cFloat
#define R_MATH     rb_mMath
#define R_NIL      rb_cNilClass
#define R_TRUE     rb_cTrueClass
#define R_FALSE    rb_cFalseClass
#define R_NUM      rb_cNumeric
#define R_COMPLEX  rb_cComplex
#define R_RATIONAL rb_cRational
#define R_HSH      rb_cHash
#define R_ARY      rb_cArray
#define R_MODULE   rb_cModule
#define R_FILE     rb_cFile
#define R_SYM      rb_cSymbol
#define R_KRL      rb_mKernel

/*____________________________________________________________________________________________________________________________________________________________________
            __   __   __   __       __   __   ___     __   __   __   __   ___  __   __          __
 |\/|  /\  /  ` |__) /  \ /__` .   |__) |__) |__  __ |__) |__) /  \ /  ` |__  /__` /__` | |\ | / _`
 |  | /~~\ \__, |  \ \__/ .__/ .   |    |  \ |___    |    |  \ \__/ \__, |___ .__/ .__/ | | \| \__>
____________________________________________________________________________________________________________________________________________________________________ */

#define LDBL_IS_ZERO(arg) ((arg + 0.0L) == 0.0L)
#define LDBL_CBRT(arg)    cbrtl(arg)
#define LDBL_SQRT(arg)    sqrtl(arg)

static long double LDBL_POW2(const long double n);
static long double LDBL_POW2(const long double n){return powl(n, 2.0L);}

#define SWAP_INTS(arg_a, arg_b) {\
    arg_a += arg_b;\
    arg_b = arg_a - arg_b;\
    arg_a -= arg_b;\
}

static inline VALUE 💎new_ary(const long known_max_size);
#define 💎new_ary_size2(arg_a, arg_b) rb_assoc_new(arg_a, arg_b);

#define is_class(arg)             (TYPE(arg) == T_CLASS)
#define is_module(arg)            (TYPE(arg) == T_MODULE)
#define is_nucleotide(arg)        (is_class(arg) || is_module(arg))
#define is_nil(arg)               RTEST(NIL_P(arg))
#define is_ary(arg)               RB_TYPE_P(arg, T_ARRAY)
#define is_hsh(arg)               RB_TYPE_P(arg, T_HASH)
#define is_str(arg)               (CLASS_OF(arg) == R_STR)
#define is_int(arg)               RB_INTEGER_TYPE_P(arg)
#define is_float(arg)              RB_FLOAT_TYPE_P(arg)
#define is_rational(arg)          RB_TYPE_P(arg, T_RATIONAL)
#define is_fixnum(arg)             FIXNUM_P(arg)
#define is_bignum(arg)            RB_TYPE_P(arg, T_BIGNUM)
#define is_sym(arg)               SYMBOL_P(arg)
#define is_bool(arg)              (RB_TYPE_P(arg, T_TRUE) || RB_TYPE_P(arg, T_FALSE))
#define is_empty_generic(arg)     (rb_respond_to(arg, cached_rb_intern_is_empty) && rb_funcall(arg, cached_rb_intern_is_empty, 0) == Qtrue)
#define is_non_empty_generic(arg) (rb_respond_to(arg, cached_rb_intern_is_empty) && rb_funcall(arg, cached_rb_intern_is_empty, 0) == Qfalse)

#define r_hsh_len(arg)      RHASH_SIZE(arg)
#define r_hsh_is_empty(arg) RHASH_EMPTY_P(arg)

#define r_ary_len(arg)           RARRAY_LEN(arg)
#define r_ary_is_empty(arg)      r_ary_len(arg) == 0
#define r_ary_get(ary, index)    rb_ary_entry(ary, index);
#define r_ary_del(ary, index)    rb_ary_delete_at(ary, index);
#define r_ary_add(ary, elem)     rb_ary_push(ary, elem);
#define r_ary_has(ary, elem)     rb_ary_includes(ary, elem)
#define r_ary_pre_modify(arg)    rb_ary_modify(arg);
#define r_ary_prepend(arg, elem) rb_ary_unshift(arg, elem);

#define c_str_to_r_str(arg)             rb_str_new_cstr(arg)
#define c_str_to_frozen_r_str(the_cstr) rb_str_new_frozen(c_str_to_r_str(the_cstr))
#define r_str_len(arg)                  RSTRING_LEN(arg)
#define r_str_is_empty(arg)             r_str_len(arg) == 0
#define r_str_prepend(arg, elem)        rb_str_update(arg, 0L, 0L, elem);
#define r_str_pre_modify(arg)           rb_str_modify(arg);

static inline int c_int_is_natural(const int c_int);
static inline int c_int_is_natural(const int c_int) {return c_int > 0;}
static inline int c_int_is_whole(const int c_int);
static inline int c_int_is_whole(const int c_int) {return c_int >= 0;}

static inline VALUE r_flt_is_universal(const double flt);
static inline VALUE r_flt_has_decimals(const double flt);
static inline VALUE r_flt_smells_like_int(const double flt);

#define r_int_passes_normalizer(self, the_normalizer, func_name, converter_func) {\
    if (the_normalizer == 🅽_universal || the_normalizer == 🅽_integer || the_normalizer == 🅽_universal_w_str_allowed || the_normalizer == 🅽_integer_w_str_allowed) {\
        re_ye\
    } else if (the_normalizer == 🅽_natural || the_normalizer == 🅽_natural_w_str_allowed) {\
        re_as_bool(c_int_is_natural(converter_func(self)))\
    } else if (the_normalizer == 🅽_whole || the_normalizer == 🅽_whole_w_str_allowed) {\
        re_as_bool(c_int_is_whole(converter_func(self)))\
    } else {\
        raise_err_arg("| <%"PRIsVALUE">-> m{%s} did not receive a valid normalizer{%"PRIsVALUE"}; either it is invalid or the current type of{%s} is not valid w/ the valid normalizer |", self, func_name, the_normalizer, rb_obj_classname(self));\
    }\
}

#define r_flt_passes_normalizer(self, the_normalizer, func_name) {\
    if (the_normalizer == 🅽_universal || the_normalizer == 🅽_universal_w_str_allowed) {\
        return r_flt_is_universal(NUM2DBL(self));\
    } else if (the_normalizer == 🅽_integer || the_normalizer == 🅽_integer_w_str_allowed) {\
        return r_flt_smells_like_int(NUM2DBL(self));\
    } else if (the_normalizer == 🅽_natural || the_normalizer == 🅽_natural_w_str_allowed) {\
        const double val_self = NUM2DBL(self);\
        if (r_flt_smells_like_int(val_self)) {\
            if (val_self >= 1.0) {return Qtrue;} else {return Qfalse;}\
        } else {return Qfalse;}\
    } else if (the_normalizer == 🅽_whole || the_normalizer == 🅽_whole_w_str_allowed) {\
        const double val_self = NUM2DBL(self);\
        if (r_flt_smells_like_int(val_self)) {\
            if (val_self >= 0.0) {return Qtrue;} else {return Qfalse;}\
        } else {return Qfalse;}\
    } else {\
        raise_err_arg("| <%"PRIsVALUE">-> m{%s} did not receive a valid normalizer{%"PRIsVALUE"}; either it is invalid or the current type of{%s} is not valid w/ the valid normalizer |", self, func_name, the_normalizer, rb_obj_classname(self));\
    }\
}

#define r_non_simple_num_passes_normalizer(self, the_normalizer, func_name) {\
    if (them == 🅽_universal || them == 🅽_universal_w_str_allowed) {\
        return is_finite_num(self);\
    } else if (them == 🅽_natural || them == 🅽_natural_w_str_allowed) {\
        if (has_smell_of_int(self)) {\
            if(NUM2DBL(self) >= 1.0) {return Qtrue;} else {return Qfalse;}\
        } else {return Qfalse;}\
    } else if (them == 🅽_whole || them == 🅽_whole_w_str_allowed) {\
        if (has_smell_of_int(self)) {\
            if(NUM2DBL(self) >= 0.0) {return Qtrue;} else {return Qfalse;}\
        } else {return Qfalse;}\
    } else if (them == 🅽_integer || them == 🅽_integer_w_str_allowed) {\
        if (has_smell_of_int(self)) {\
            return Qtrue;\
        } else {return Qfalse;}\
    } else {\
        raise_err_arg("| <%"PRIsVALUE">-> m{%s} does not support the received normalizer{%"PRIsVALUE"}; either it is invalid or the current type of{%s} is not valid w/ the valid normalizer |", self, func_name, the_normalizer, rb_obj_classname(self));\
    }\
}

#define r_str_passes_normalizer(self, the_normalizer, func_name) {\
    VALUE looks_like_num = rb_funcall(self, rb_intern("to_num?"), 0);\
    if (looks_like_num) {\
        VALUE const as_num = rb_funcall(self, rb_intern("to_num"), 0);\
        if (them == 🅽_universal_w_str_allowed) {\
            if (is_finite_num(as_num)) {return Qtrue;} else {return Qfalse;}\
        } else if (them == 🅽_natural_w_str_allowed) {\
            if (has_smell_of_int(as_num)) {\
                if (NUM2INT(as_num) > 0) {return Qtrue;} else {return Qfalse;}\
            } else {return Qfalse;}\
        } else if (them == 🅽_whole_w_str_allowed) {\
            if (has_smell_of_int(as_num)) {\
                if (NUM2INT(as_num) >= 0) {return Qtrue;} else {return Qfalse;}\
            } else {return Qfalse;}\
        } else if (them == 🅽_integer_w_str_allowed) {\
            if (has_smell_of_int(as_num)) {\
                return Qtrue;\
            } else {return Qfalse;}\
        } else {\
            raise_err_arg("| <%"PRIsVALUE">-> m{%s} does not support the received normalizer{%"PRIsVALUE"}; either it is invalid or the current type of{String} is not valid w/ the valid normalizer |", self, func_name, them);\
        }\
    } else {return Qfalse;}\
}

static inline int is_num(const VALUE arg);
//static inline int is_simple_num(const VALUE arg);
static inline int is_non_simple_num(const VALUE arg);

static inline int is_int_or_flt(const VALUE arg);
static inline int is_int_or_flt(const VALUE arg){
    switch(TYPE(arg)){
        case RUBY_T_FIXNUM:
        case RUBY_T_FLOAT:
            return 1;
        default:
            return 0;
    }
}

#endif
