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

#define LDBL_IS_ZERO(arg)         ((arg + 0.0L) == 0.0L)
#define LDBL_POW2(arg)            (powl(arg, 2.0L))
#define LDBL_CBRT(arg)            cbrtl(arg)
#define LDBL_SQRT(arg)            sqrtl(arg)

#define is_class(arg)             (TYPE(arg) == T_CLASS)
#define is_module(arg)            (TYPE(arg) == T_MODULE)
#define is_nucleotide(arg)        (is_class(arg) || is_module(arg))
#define is_nil(arg)               RTEST(NIL_P(arg))
#define is_ary(arg)               RB_TYPE_P(arg, T_ARRAY)
#define is_non_empty_ary(arg)     (is_ary(arg) && is_empty_ary(arg))
#define is_hsh(arg)               RB_TYPE_P(arg, T_HASH)
#define is_non_empty_hsh(arg)     (is_hsh(arg) && is_empty_hsh(arg))
// SafeStringValue(value)
#define is_str(arg)               (CLASS_OF(arg) == R_STR)
#define is_non_empty_str(arg)     (is_str(arg) && is_empty_str(arg))
#define is_int(arg)               RB_INTEGER_TYPE_P(arg)
#define is_float(arg)              RB_FLOAT_TYPE_P(arg)
#define is_fix_num(arg)            FIXNUM_P(arg)
#define is_big_num(arg)           RB_TYPE_P(arg, T_BIGNUM)
#define is_sym(arg)               SYMBOL_P(arg)
#define is_bool(arg)              (RB_TYPE_P(arg, T_TRUE) || RB_TYPE_P(arg, T_FALSE))
#define is_empty_generic(arg)     (rb_respond_to(arg, cached_rb_intern_is_empty) && rb_funcall(arg, cached_rb_intern_is_empty, 0) == Qtrue)
#define is_non_empty_generic(arg) (rb_respond_to(arg, cached_rb_intern_is_empty) && rb_funcall(arg, cached_rb_intern_is_empty, 0) == Qfalse)

#define len_ary(arg)      RARRAY_LEN(arg)
#define len_str(arg)      RSTRING_LEN(arg)
#define len_hsh(arg)      RHASH_SIZE(arg)
#define is_empty_hsh(arg) RHASH_EMPTY_P(arg)
#define is_empty_str(arg) len_str(arg) == 0
#define is_empty_ary(arg) len_ary(arg) == 0

#define r_hsh_has_key(hsh, key)            (rb_hash_has_key(hsh, key) == Qtrue)
#define r_hsh_increment_keys_val(hsh, key) rb_hash_aset(hsh, key, LONG2FIX(RB_FIX2LONG(rb_hash_aref(hsh, key)) + 1));
#define r_hsh_set_val_to_one(hsh, key)     rb_hash_aset(hsh, key, ℤ1);

#define r_ary_get(ary, index)    rb_ary_entry(ary, index);
#define r_ary_del(ary, index)    rb_ary_delete_at(ary, index);
#define r_ary_add(ary, elem)     rb_ary_push(ary, elem);
#define r_ary_has(ary, elem)     rb_ary_includes(ary, elem)

#define r_ary_prepend(arg, elem) rb_ary_unshift(arg, elem);
#define r_str_prepend(arg, elem) rb_str_update(arg, 0L, 0L, elem);

#define r_ary_pre_modify(arg) rb_ary_modify(arg);
#define r_str_pre_modify(arg) rb_str_modify(arg);

#endif
