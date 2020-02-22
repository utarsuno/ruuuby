// encoding: utf-8

/*____________________________________________________________________________________________________________________________________________________________________
         __   __        __                  __   __   __  ___  __
 |    | |__) |__)  /\  |__) \ /    |  |\/| |__) /  \ |__)  |  /__`
 |___ | |__) |  \ /~~\ |  \  |     |  |  | |    \__/ |  \  |  .__/
____________________________________________________________________________________________________________________________________________________________________ */
#include <ruby.h>
#include <ruby/intern.h>
#include <ruby/debug.h>
#include <ruby/encoding.h>

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
#define ERROR_RUNTIME rb_eRuntimeError
#define ERROR_ARGUMENT rb_eArgError

/*____________________________________________________________________________________________________________________________________________________________________
            __   __   __   __       __   __   ___     __   __   __   __   ___  __   __          __
 |\/|  /\  /  ` |__) /  \ /__` .   |__) |__) |__  __ |__) |__) /  \ /  ` |__  /__` /__` | |\ | / _`
 |  | /~~\ \__, |  \ \__/ .__/ .   |    |  \ |___    |    |  \ \__/ \__, |___ .__/ .__/ | | \| \__>
____________________________________________________________________________________________________________________________________________________________________ */
#define r_get_class(r_class) rb_const_get(rb_cObject, rb_intern(r_class))
#define r_class_add_method_public(r_class, func_name, func, num_args) rb_define_method(r_class, func_name, RUBY_METHOD_FUNC(func), num_args);
#define r_class_add_method_private(r_class, func_name, func, num_args) rb_define_private_method(r_class, func_name, RUBY_METHOD_FUNC(func), num_args);
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

// see warning at: https://docs.ruby-lang.org/en/2.4.0/extension_rdoc.html
#define len_ary(ary) RARRAY_LEN(ary)
#define len_str(str) RSTRING_LEN(str)

#define raise_err_bad_arg_type(error_message, error_param) rb_raise(ERROR_ARGUMENT, error_message, rb_obj_classname(error_param));

#define r_ary_has(ary, elem) rb_ary_includes(ary, elem)
#define r_ary_get(ary, index) rb_ary_entry(ary, index)

#define is_empty_hsh(hsh) RHASH_EMPTY_P(hsh)
#define is_empty_ary(ary) len_ary(ary) == 0
#define is_empty_str(str) len_str(str) == 0

#define declare_func(func_name, expr, return_type, single_param) return_type func_name(single_param);return_type func_name(single_param){expr}
#define r_func_raw(func_name, expr) declare_func(func_name, expr, VALUE, VALUE self)
#define r_func_raw2(func_name, param_0, param_1, expr) VALUE func_name(VALUE param_0, VALUE param_1);VALUE func_name(VALUE param_0, VALUE param_1){expr}
#define r_func_me_them(func_name, expr) r_func2_raw(func_name, VALUE self, VALUE them, expr)
#define r_func(func_name, expr) r_func_raw(func_name, r_as_bool(expr))
#define c_func(func_name, expr) declare_func(func_name, expr, void, void)

#define re_me return self;
#define re_me_if_ary_empty(the_ary) if (is_empty_ary(the_ary)){re_me}

#define set_var_from_r_ary_val(var, ary, index) var = r_ary_get(ary, index);

/*____________________________________________________________________________________________________________________________________________________________________
  ___            __   __       __   ___  __             __       ___    __        __                      __        ___        ___      ___      ___    __        __
 |__  |  | |\ | /  ` /__` .   |  \ |__  /  ` |     /\  |__)  /\   |  | /  \ |\ | /__`    __|__   |  |\/| |__) |    |__   |\/| |__  |\ |  |   /\   |  | /  \ |\ | /__`
 |    \__/ | \| \__, .__/ .   |__/ |___ \__, |___ /~~\ |  \ /~~\  |  | \__/ | \| .__/      |     |  |  | |    |___ |___  |  | |___ | \|  |  /~~\  |  | \__/ | \| .__/
____________________________________________________________________________________________________________________________________________________________________ */

// class{Object}
r_func(m_ary , is_ary(self))
r_func(m_bool, is_bool(self))
r_func(m_hash, is_hsh(self))
r_func(m_int , is_int(self))
r_func(m_str , is_str(self))
r_func(m_sym , is_sym(self))

// class{NilClass} - function{empty?}
r_func_raw(m_empty, return TRUE;)

/*____________________________________________________________________________________________________________________
 __     ___     __                   __
/__`     |     |__)    |    |\ |    / _`
.__/     |     |  \    |    | \|    \__>
_____________________________________________________________________________________________________________________ */

r_func_raw2(m_prepend_for_str, self, them, // function{>>} ----------------------------------------------------------
    if (!(is_str(them))) { raise_err_bad_arg_type("String method{>>} requires a string arg but received{%s}", them) }
    re_me_if_ary_empty(them)
    raise_error_if_frozen(self);
    rb_str_modify(self);
    rb_str_update(self, 0L, 0L, them);
    return self;
)

/*___________________________________________________________________________________________________________________
                __      __
        /\     |__)    |__)     /\     \ /
       /~~\    |  \    |  \    /~~\     |
_____________________________________________________________________________________________________________________ */

r_func_raw2(m_prepend_for_ary, self, them, // function{>>} ----------------------------------------------------------
    raise_error_if_frozen(self);
    rb_ary_unshift(self, them);
    re_me
)

r_func_raw(m_remove_empty, // function{remove_empty!} ---------------------------------------------------------------
    raise_error_if_frozen(self);
    re_me_if_ary_empty(self)
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

r_func_raw2(m_disjunctive_union, self, them, // function{disjunctive_union} -----------------------------------------
    VALUE ary_output = rb_ary_new();
    long len_me      = len_ary(self);
    long len_them    = len_ary(them);
    long i;
    VALUE elt;
    if (len_me >= len_them) {
        for (i = 0; i < len_them; i++) {
            set_var_from_r_ary_val(elt, them, i) if(!r_ary_has(self, elt)){rb_ary_push(ary_output, elt);}
            set_var_from_r_ary_val(elt, self, i) if(!r_ary_has(them, elt)){rb_ary_push(ary_output, elt);}
        }
        for (; i < len_me; i++) {
            set_var_from_r_ary_val(elt, self, i) if(!r_ary_has(them, elt)){rb_ary_push(ary_output, elt);}
        }
    } else {
        for (i = 0; i < len_me; i++) {
            set_var_from_r_ary_val(elt, self, i) if(!r_ary_has(them, elt)){rb_ary_push(ary_output, elt);}
            set_var_from_r_ary_val(elt, them, i) if(!r_ary_has(self, elt)){rb_ary_push(ary_output, elt);}
        }
        for (; i < len_them; i++) {
            set_var_from_r_ary_val(elt, them, i) if(!r_ary_has(self, elt)){rb_ary_push(ary_output, elt);}
        }
    }
    return ary_output;
)

/*____________________________________________________________________________________________________________________
 __      __   __   __   ___     ___      ___  __
/  `    /  ` /  \ |  \ |__     |__  |\ |  |  |__) \ /
\__,    \__, \__/ |__/ |___    |___ | \|  |  |  \  |
_____________________________________________________________________________________________________________________ */
c_func(Init_ruby_class_mods,

    // Object
    r_class_add_method_public  (R_OBJ, "ary?"             , m_ary              , 0)
    r_class_add_method_public  (R_OBJ, "bool?"            , m_bool             , 0)
    r_class_add_method_public  (R_OBJ, "int?"             , m_int              , 0)
    r_class_add_method_public  (R_OBJ, "hsh?"             , m_hash             , 0)
    r_class_add_method_public  (R_OBJ, "str?"             , m_str              , 0)
    r_class_add_method_public  (R_OBJ, "sym?"             , m_sym              , 0)
    // Array
    r_class_add_method_public  (R_ARY, "remove_empty!"    , m_remove_empty     , 0)
    r_class_add_method_private (R_ARY, "disjunctive_union", m_disjunctive_union, 1)
    r_class_add_method_public  (R_ARY, ">>"               , m_prepend_for_ary  , 1)
    // String
    r_class_add_method_public  (R_STR, ">>"               , m_prepend_for_str  , 1)
    // NilClass
    r_class_add_method_public  (R_NIL, "empty?"           , m_empty            , 0)

    rb_require("ruuuby/class/obj");
    rb_require("ruuuby/class/hsh");
    rb_require("ruuuby/class/nums/int");
    rb_require("ruuuby/class/nums/float");
    rb_require("bigdecimal");
    rb_require("ruuuby/class/nums/big_decimal");
    rb_require("ruuuby/class/nums/rational");
    rb_require("ruuuby/class/nums/complex");
    rb_require("ruuuby/class/nil");
    rb_require("ruuuby/class/ary");
    rb_require("ruuuby/class/str");
    rb_require("ruuuby/version");
)
