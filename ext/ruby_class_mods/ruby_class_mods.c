// -*- encoding : utf-8 -*-

/*____________________________________________________________________________________________________________________________________________________________________
         __   __        __                  __   __   __  ___  __
 |    | |__) |__)  /\  |__) \ /    |  |\/| |__) /  \ |__)  |  /__`
 |___ | |__) |  \ /~~\ |  \  |     |  |  | |    \__/ |  \  |  .__/
____________________________________________________________________________________________________________________________________________________________________ */
#include <ruby.h>

/*____________________________________________________________________________________________________________________________________________________________________
  __   __        __  ___           ___                         ___  __
 /  ` /  \ |\ | /__`  |   /\  |\ |  |     \  /  /\  |    |  | |__  /__`
 \__, \__/ | \| .__/  |  /~~\ | \|  |      \/  /~~\ |___ \__/ |___ .__/
____________________________________________________________________________________________________________________________________________________________________ */
#define TRUE Qtrue
#define FALSE Qfalse
#define NIL Qnil
#define R_STR rb_cString
#define R_OBJ rb_cObject
#define R_NIL rb_cNilClass
#define R_ARY rb_cArray
#define R_KRL rb_mKernel // Kernel

/*____________________________________________________________________________________________________________________________________________________________________
            __   __   __   __       __   __   ___     __   __   __   __   ___  __   __          __
 |\/|  /\  /  ` |__) /  \ /__` .   |__) |__) |__  __ |__) |__) /  \ /  ` |__  /__` /__` | |\ | / _`
 |  | /~~\ \__, |  \ \__/ .__/ .   |    |  \ |___    |    |  \ \__/ \__, |___ .__/ .__/ | | \| \__>
____________________________________________________________________________________________________________________________________________________________________ */
#define r_get_class(r_class) rb_const_get(rb_cObject, rb_intern(r_class))
#define r_class_add_method(r_class, func_name, func, num_args) rb_define_method(r_class, func_name, RUBY_METHOD_FUNC(func), num_args)
#define r_as_bool(expr) return expr ? TRUE : FALSE;

#define raise_error_if_frozen(arg_to_check) rb_check_frozen(arg_to_check)
#define r_type(arg_to_check, r_class) RB_TYPE_P(arg_to_check, r_class)
#define is_nil(arg_to_check) RTEST(NIL_P(v))
#define is_ary(ary) r_type(ary, T_ARRAY)
#define is_hsh(hsh) RB_TYPE_P(hsh, T_HASH)
#define is_str(str) (CLASS_OF(str) == R_STR)
#define is_int(int_arg) RB_INTEGER_TYPE_P(int_arg)
#define is_sym(sym) SYMBOL_P(sym)
#define is_bool(bool_arg) (r_type(bool_arg, T_TRUE) || r_type(bool_arg, T_FALSE))

#define len_ary(ary) RARRAY_LEN(ary)
#define len_str(str) RSTRING_LEN(str)

#define is_empty_hsh(hsh) RHASH_EMPTY_P(hsh)
#define is_empty_ary(ary) len_ary(ary) == 0
#define is_empty_str(str) len_str(str) == 0

#define declare_func(func_name, expr, return_type, func_params) return_type func_name(func_params);return_type func_name(func_params){expr}
#define r_func_raw(func_name, expr) declare_func(func_name, expr, VALUE, VALUE self)
#define r_func(func_name, expr) r_func_raw(func_name, r_as_bool(expr))
#define c_func(func_name, expr) declare_func(func_name, expr, void, void)

#define re_me return self;

/*____________________________________________________________________________________________________________________________________________________________________
  ___            __   __       __   ___  __             __       ___    __        __                      __        ___        ___      ___      ___    __        __
 |__  |  | |\ | /  ` /__` .   |  \ |__  /  ` |     /\  |__)  /\   |  | /  \ |\ | /__`    __|__   |  |\/| |__) |    |__   |\/| |__  |\ |  |   /\   |  | /  \ |\ | /__`
 |    \__/ | \| \__, .__/ .   |__/ |___ \__, |___ /~~\ |  \ /~~\  |  | \__/ | \| .__/      |     |  |  | |    |___ |___  |  | |___ | \|  |  /~~\  |  | \__/ | \| .__/
____________________________________________________________________________________________________________________________________________________________________ */

// class{Object}
r_func(m_ary, is_ary(self))
r_func(m_bool, is_bool(self))
r_func(m_hash, is_hsh(self))
r_func(m_int , is_int(self))
r_func(m_str , is_str(self))
r_func(m_sym , is_sym(self))

// class{NilClass} - function{empty?}
r_func_raw(m_empty, return TRUE;)

// class{Array} - function{remove_empty!}
r_func_raw(
m_remove_empty,
    raise_error_if_frozen(self);
    if (is_empty_ary(self)){re_me}
    long len = len_ary(self);
    long i;
    VALUE v;
    for (i = 0; i < len;) {
        v = RARRAY_PTR(self)[i];
        if (is_nil(v) || (is_str(v) && is_empty_str(v)) || (is_ary(v) && is_empty_ary(v)) || (is_hsh(v) && is_empty_hsh(v))) {
            rb_ary_delete_at(self, i);
            len--;
        } else {i++;}
    }
    re_me
)

// adds the needed C 'main method' function for this extension
c_func(
Init_ruby_class_mods,
    r_class_add_method(R_OBJ, "ary?"         , m_ary         , 0);
    r_class_add_method(R_OBJ, "bool?"        , m_bool        , 0);
    r_class_add_method(R_OBJ, "int?"         , m_int         , 0);
    r_class_add_method(R_OBJ, "hsh?"         , m_hash        , 0);
    r_class_add_method(R_OBJ, "str?"         , m_str         , 0);
    r_class_add_method(R_OBJ, "sym?"         , m_sym         , 0);
    r_class_add_method(R_NIL, "empty?"       , m_empty       , 0);
    r_class_add_method(R_ARY, "remove_empty!", m_remove_empty, 0);
)
