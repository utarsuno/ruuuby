// # File: ruuuby/ext/ruby_class_mods/ruby_class_mods.c

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
static VALUE r_class_str;

/*____________________________________________________________________________________________________________________________________________________________________
            __   __   __   __       __   __   ___     __   __   __   __   ___  __   __          __
 |\/|  /\  /  ` |__) /  \ /__` .   |__) |__) |__  __ |__) |__) /  \ /  ` |__  /__` /__` | |\ | / _`
 |  | /~~\ \__, |  \ \__/ .__/ .   |    |  \ |___    |    |  \ \__/ \__, |___ .__/ .__/ | | \| \__>
____________________________________________________________________________________________________________________________________________________________________ */
#define r_get_class(r_class) rb_const_get(rb_cObject, rb_intern(r_class))
#define r_class_add_method(r_class, func_name, func, num_args) rb_define_method(r_class, func_name, RUBY_METHOD_FUNC(func), num_args)
#define r_class_obj_add_method(func_name, func, num_args) r_class_add_method(r_class_obj, func_name, func, num_args)
#define r_is_my_class(r_class) RB_TYPE_P(self, r_class)
#define r_as_bool(expr) return expr ? TRUE : FALSE;
#define r_func(func_name, expr) VALUE func_name(VALUE self);VALUE func_name(VALUE self){expr}
#define r_func_raw(func_name, expr) VALUE func_name(VALUE self);VALUE func_name(VALUE self){expr}
#define c_func(func_name, expr) void func_name(void);void func_name(void){expr}

/*____________________________________________________________________________________________________________________________________________________________________
  ___            __   __       __   ___  __             __       ___    __        __                      __        ___        ___      ___      ___    __        __
 |__  |  | |\ | /  ` /__` .   |  \ |__  /  ` |     /\  |__)  /\   |  | /  \ |\ | /__`    __|__   |  |\/| |__) |    |__   |\/| |__  |\ |  |   /\   |  | /  \ |\ | /__`
 |    \__/ | \| \__, .__/ .   |__/ |___ \__, |___ /~~\ |  \ /~~\  |  | \__/ | \| .__/      |     |  |  | |    |___ |___  |  | |___ | \|  |  /~~\  |  | \__/ | \| .__/
____________________________________________________________________________________________________________________________________________________________________ */

// Ruuuby's additions to class{Object} for easy type checking
// ex ruby code scenarios:
//               '1337'.int? -> false
//                 1337.int? -> true
r_func(m_ary , r_as_bool(r_is_my_class(T_ARRAY))) // future note: https://ruby.fandom.com/wiki/C_API/Array
r_func(m_bool, r_as_bool(r_is_my_class(T_TRUE) || r_is_my_class(T_FALSE)))
r_func(m_int , r_as_bool(RB_INTEGER_TYPE_P(self)))
r_func(m_str , r_as_bool(CLASS_OF(self) == r_class_str))
r_func(m_sym , r_as_bool(SYMBOL_P(self)))

// Ruuuby's addition to class{NilClass} to have function{empty?}, see README.md for clearer reasoning
r_func_raw(m_empty, return TRUE;)

// adds the needed C 'main method' function for this extension
c_func(
Init_ruby_class_mods,
    VALUE r_class_obj = r_get_class("Object");
    r_class_str       = r_get_class("String");
    r_class_obj_add_method("ary?" , m_ary , 0);
    r_class_obj_add_method("bool?", m_bool, 0);
    r_class_obj_add_method("int?" , m_int , 0);
    r_class_obj_add_method("str?" , m_str , 0);
    r_class_obj_add_method("sym?" , m_sym , 0);
    r_class_add_method(r_get_class("NilClass"), "empty?", m_empty, 0);
)
