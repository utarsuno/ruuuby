// encoding: utf-8

/*____________________________________________________________________________________________________________________________________________________________________
         __   __        __                  __   __   __  ___  __
 |    | |__) |__)  /\  |__) \ /    |  |\/| |__) /  \ |__)  |  /__`
 |___ | |__) |  \ /~~\ |  \  |     |  |  | |    \__/ |  \  |  .__/
____________________________________________________________________________________________________________________________________________________________________ */
// ruby extension api

#include "ruby-2.7.0/x86_64-darwin18/rb_mjit_min_header-2.7.0.h"

#include <ruby.h>
#include <ruby/intern.h>
#include <ruby/debug.h>
#include <ruby/assert.h>
#include <ruby/missing.h>
#include <ruby/ruby.h>
#include <ruby/st.h>
#include <ruby/subst.h>
#include <ruby/thread.h>
#include <ruby/thread_native.h>
#include <ruby/util.h>
#include <ruby/version.h>
#include <ruby/vm.h>

/*____________________________________________________________________________________________________________________________________________________________________
  __   __        __  ___           ___                         ___  __
 /  ` /  \ |\ | /__`  |   /\  |\ |  |     \  /  /\  |    |  | |__  /__`
 \__, \__/ | \| .__/  |  /~~\ | \|  |      \/  /~~\ |___ \__/ |___ .__/
____________________________________________________________________________________________________________________________________________________________________ */
#define R_TRUE Qtrue
#define R_FALSE Qfalse
#define NIL Qnil
#define R_STR rb_cString
#define R_OBJ rb_cObject
#define R_INT rb_cInteger
#define R_NIL rb_cNilClass
#define R_HSH rb_cHash
#define R_ARY rb_cArray
// rb_ary_new: uses a default size of 16
#define R_ARY_DEFAULT_SIZE 16L
#define R_FILE rb_cFile
#define R_SYM rb_cSymbol
#define R_KRL rb_mKernel
#define ERROR_RUNTIME rb_eRuntimeError
#define ERROR_ARGUMENT rb_eArgError

// | 0x0 |
static VALUE module_ruuuby;
static VALUE module_param_errs;
static VALUE class_wrong_param_type;

// | 0x5d | 0x5e |
static const VALUE CONST_NUMBER_ONE = LONG2FIX(1L);

/*____________________________________________________________________________________________________________________________________________________________________
            __   __   __   __       __   __   ___     __   __   __   __   ___  __   __          __
 |\/|  /\  /  ` |__) /  \ /__` .   |__) |__) |__  __ |__) |__) /  \ /  ` |__  /__` /__` | |\ | / _`
 |  | /~~\ \__, |  \ \__/ .__/ .   |    |  \ |___    |    |  \ \__/ \__, |___ .__/ .__/ | | \| \__>
____________________________________________________________________________________________________________________________________________________________________ */
#define r_class_add_method_public(r_class, func_name, func, num_args) rb_define_method(r_class, func_name, RUBY_METHOD_FUNC(func), num_args);

#define r_module_add_child_class(class_name, parent_class, parent_module) rb_define_class_under(parent_module, "" #class_name, parent_class);
#define r_module_add(module_name) rb_define_module("" #module_name);
#define r_module_add_module(module_name, parent_module) rb_define_module_under(parent_module, "" #module_name);

#define r_type(arg_to_check, r_class) RB_TYPE_P(arg_to_check, r_class)
#define is_nil(arg_to_check) RTEST(NIL_P(v))
#define is_ary(ary) r_type(ary, T_ARRAY)
#define is_non_empty_ary(arg) (is_ary(arg) && is_empty_ary(arg))
#define is_hsh(hsh) RB_TYPE_P(hsh, T_HASH)
#define is_non_empty_hsh(arg) (is_hsh(arg) && is_empty_hsh(arg))
#define is_str(str) (CLASS_OF(str) == R_STR)
#define is_non_empty_str(arg) (is_str(arg) && is_empty_str(arg))
#define is_int(int_arg) RB_INTEGER_TYPE_P(int_arg)
#define is_sym(sym) SYMBOL_P(sym)
#define is_bool(bool_arg) (r_type(bool_arg, T_TRUE) || r_type(bool_arg, T_FALSE))

#define len_ary(ary) RARRAY_LEN(ary)
#define len_str(str) RSTRING_LEN(str)
#define len_hsh(hsh) RHASH_SIZE(hsh)

#define raise_err_bad_arg_type(error_message, error_param) rb_raise(ERROR_ARGUMENT, error_message, rb_obj_classname(error_param));
#define raise_err_array_bad_arg_type(func_name, them) raise_err_bad_arg_type("| c{Array}-> m{" #func_name "} got arg(them) w/ type{%s}, required-type{Array} |", them)
#define raise_err_string_bad_arg_type(func_name, them) raise_err_bad_arg_type("| c{String}-> m{" #func_name "} got arg(them) w/ type{%s}, required-type{String} |", them)
#define ensure_not_frozen(arg_to_check) rb_check_frozen(arg_to_check);

#define is_empty_hsh(arg) RHASH_EMPTY_P(arg)
#define is_empty_str(arg) len_str(arg) == 0
#define is_empty_ary(arg) len_ary(arg) == 0

#define r_str_prepend(str, elem) rb_str_update(str, 0L, 0L, elem);
#define r_ary_prepend(ary, elem) rb_ary_unshift(ary, elem);

#define r_str_pre_modify(str) rb_str_modify(str);

#define r_hsh_increment_keys_val(hsh, key) rb_hash_aset(hsh, key, LONG2FIX(RB_FIX2LONG(rb_hash_aref(hsh, key)) + 1));
#define r_hsh_set_val_to_one(hsh, key) rb_hash_aset(hsh, key, CONST_NUMBER_ONE);

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
#define r_func(func_name, expr) r_func_raw(func_name, return (expr) ? R_TRUE : R_FALSE;)
#define c_func(func_name, expr) declare_func(func_name, expr, void, void)

#define re_ye return R_TRUE;
#define re_no return R_FALSE;
#define re_me return self;

#define autoload_file(path)        rb_require(path);
#define autoload_ruuuby(path)     autoload_file("ruuuby/" #path)
#define autoload_enumerable(path) autoload_file("ruuuby/class/enumerable/" #path)
#define autoload_module(path)     autoload_file("ruuuby/module/" #path)
#define autoload_class(path)      autoload_file("ruuuby/class/" #path)
#define autoload_nums(path)       autoload_file("ruuuby/class/nums/" #path)
#define autoload_default(path)    autoload_file("" #path)

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

// | 0x1a | class{Object} | function{ary?}  |
r_func(m_obj_ary , is_ary(self))
// | 0x1b | class{Object} | function{bool?} |
r_func(m_obj_bool, is_bool(self))
// | 0x1c | class{Object} | function{hash?} |
r_func(m_obj_hash, is_hsh(self))
// | 0x1d | class{Object} | function{int?}  |
r_func(m_obj_int , is_int(self))
// | 0x1e | class{Object} | function{sym?}  |
r_func(m_obj_sym , is_sym(self))
// | 0x1f | class{Object} | function{str?}  |
r_func(m_obj_str , is_str(self))
// | 0x1g | class{Object} | function{stry?} |
r_func(m_obj_stry, is_str(self) || is_sym(self))

/*___________________________________________________________________________________________________________________
       ___  ___  __   ___  __
| |\ |  |  |__  / _` |__  |__)
| | \|  |  |___ \__> |___ |  \
_____________________________________________________________________________________________________________________ */

// | 0x2a | class{Integer} | function{finite?}   |
r_func_raw(m_int_is_finite, re_ye)

// | 0x2b | class{Integer} | function{infinite?} |
r_func_raw(m_int_is_not_finite, re_no)

/*___________________________________________________________________________________________________________________

|\ | | |
| \| | |___
_____________________________________________________________________________________________________________________ */

// | 0x3 | class{NilClass} | function{empty?} |
r_func_raw(m_nil_empty, re_ye)

/*____________________________________________________________________________________________________________________
 __     ___     __                   __
/__`     |     |__)    |    |\ |    / _`
.__/     |     |  \    |    | \|    \__>
_____________________________________________________________________________________________________________________ */

// | 0x4 | class{String} | function{>>} |
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

/*___________________________________________________________________________________________________________________
         __      __
 /\     |__)    |__)     /\     \ /
/~~\    |  \    |  \    /~~\     |
_____________________________________________________________________________________________________________________ */

// | 0x5a | class{Array} | function{>>} |
r_func_self_them(m_ary_prepend,
    ensure_not_frozen(self)
    r_ary_prepend(self, them)
    re_me
)

// | 0x5b | class{Array} | function{remove_empty!} |
r_func_raw(m_ary_remove_empty,
    ensure_not_frozen(self)
    if (is_empty_ary(self)){re_me}
    long len = len_ary(self);
    long i;
    VALUE v;
    for (i = 0; i < len;) {
        v = RARRAY_PTR(self)[i];
        if (is_nil(v) || is_non_empty_str(v) || is_non_empty_ary(v) || is_non_empty_hsh(v)) {
            r_ary_del_at(self, i);
            len--;
        } else {++i;}
    }
    re_me
)

// | 0x5c | class{Array} | function{disjunctive_union} |
r_func_self_them(m_ary_disjunctive_union,
    if (is_ary(them)) {
        long  len_me   = len_ary(self);
        long  len_them = len_ary(them);
        if (len_me == 0 && len_them == 0) {
            return rb_ary_new_capa(0L);
        } else if (len_me == 0) {
            return rb_ary_dup(them);
        } else if (len_them == 0) {
            return rb_ary_dup(self);
        } else {
            long  i;
            VALUE n;
            VALUE output = (len_me + len_them) < R_ARY_DEFAULT_SIZE ? rb_ary_new_capa(len_me + len_them) : rb_ary_new();
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

// | 0x5d | class{Array} | function(frequency_counts} |
r_func_raw(m_ary_frequency_counts,
    long len_me;
    if ((len_me = len_ary(self)) == 0) {return Qnil;}
    VALUE hsh = rb_hash_new();
    long i;
    VALUE n;
    for (i = 0; i < len_me; i++) {
        n = RARRAY_AREF(self, i);
        if (r_hsh_has_key(hsh, n)) {r_hsh_increment_keys_val(hsh, n)} else {r_hsh_set_val_to_one(hsh, n)}
    }
    return hsh;
)

// | 0x5e | class{Array} | function(equal_contents?} |
r_func_self_them(m_ary_equal_contents,
    if (is_ary(them)) {
        long len_me = len_ary(self);
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
                } else {rb_free_generic_ivar(hsh); re_no}
            }
            // all keys were matched
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
    module_ruuuby          = r_module_add(Ruuuby)
    module_param_errs      = r_module_add_module(ParamErr, module_ruuuby)
    class_wrong_param_type = r_module_add_child_class(WrongParamType, ERROR_ARGUMENT, module_param_errs)

    // | 0x1 |
    r_class_add_method_public  (R_OBJ, "ary?"             , m_obj_ary              , 0)
    r_class_add_method_public  (R_OBJ, "bool?"            , m_obj_bool             , 0)
    r_class_add_method_public  (R_OBJ, "int?"             , m_obj_int              , 0)
    r_class_add_method_public  (R_OBJ, "hsh?"             , m_obj_hash             , 0)
    r_class_add_method_public  (R_OBJ, "sym?"             , m_obj_sym              , 0)
    r_class_add_method_public  (R_OBJ, "str?"             , m_obj_str              , 0)
    r_class_add_method_public  (R_OBJ, "stry?"            , m_obj_stry             , 0)
    // | 0x2 |
    r_class_add_method_public  (R_INT, "finite?"           , m_int_is_finite         , 0)
    r_class_add_method_public  (R_INT, "infinite?"         , m_int_is_not_finite     , 0)
    // | 0x3 |
    r_class_add_method_public  (R_NIL, "empty?"           , m_nil_empty            , 0)
    // | 0x4 |
    r_class_add_method_public  (R_STR, ">>"               , m_str_prepend          , 1)
    // | 0x5 |
    r_class_add_method_public  (R_ARY, "remove_empty!"    , m_ary_remove_empty     , 0)
    r_class_add_method_public  (R_ARY, "disjunctive_union", m_ary_disjunctive_union, 1)
    r_class_add_method_public  (R_ARY, ">>"               , m_ary_prepend          , 1)
    r_class_add_method_public  (R_ARY, "equal_contents?"  , m_ary_equal_contents   , 1)
    r_class_add_method_public  (R_ARY, "frequency_counts" , m_ary_frequency_counts , 0)

    // | 0x6 |
    autoload_default(set)
    autoload_default(tty-command)
    autoload_module(enumerable)
    autoload_module(module)
    autoload_module(kernel)
    autoload_class(obj)
    autoload_ruuuby(arg_err)
    autoload_enumerable(hsh)
    autoload_nums(int)
    autoload_nums(float)
    autoload_nums(numeric)
    autoload_default(bigdecimal)
    autoload_nums(big_decimal)
    autoload_nums(rational)
    autoload_nums(complex)
    autoload_class(nil)
    autoload_enumerable(ary)
    autoload_enumerable(set)
    autoload_class(str)
)
