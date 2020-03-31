
/*____________________________________________________________________________________________________________________________________________________________________
            __   __   __   __       __   __   ___     __   __   __   __   ___  __   __          __
 |\/|  /\  /  ` |__) /  \ /__` .   |__) |__) |__  __ |__) |__) /  \ /  ` |__  /__` /__` | |\ | / _`
 |  | /~~\ \__, |  \ \__/ .__/ .   |    |  \ |___    |    |  \ \__/ \__, |___ .__/ .__/ | | \| \__>
____________________________________________________________________________________________________________________________________________________________________ */

#define ensure_file_loaded(path)                  if (rb_require(path) != Qtrue){printf("FAILED TO LOAD PATH{%s}\n", path);};
#define ensure_loaded_ruuuby(path)               ensure_file_loaded("ruuuby/" #path)
#define ensure_loaded_io(path)                   ensure_file_loaded("ruuuby/class/io/" #path)
#define ensure_loaded_enumerable(path)           ensure_file_loaded("ruuuby/class/enumerable/" #path)
#define ensure_loaded_module(path)               ensure_file_loaded("ruuuby/module/" #path)
#define ensure_loaded_attribute_includable(path) ensure_file_loaded("ruuuby/module/attribute/includable/attribute_" #path)
#define ensure_loaded_attribute_extendable(path) ensure_file_loaded("ruuuby/module/attribute/extendable/attribute_" #path)
#define ensure_loaded_class(path)                ensure_file_loaded("ruuuby/class/" #path)
#define ensure_loaded_nums(path)                 ensure_file_loaded("ruuuby/class/nums/" #path)
#define ensure_loaded_default(path)              ensure_file_loaded("" #path)

/*____________________________________________________________________________________________________________________________________________________________________
  __   __        __  ___           ___                         ___  __
 /  ` /  \ |\ | /__`  |   /\  |\ |  |     \  /  /\  |    |  | |__  /__`
 \__, \__/ | \| .__/  |  /~~\ | \|  |      \/  /~~\ |___ \__/ |___ .__/
____________________________________________________________________________________________________________________________________________________________________ */
#define ERROR_RUNTIME        rb_eRuntimeError
#define ERROR_ARGUMENT       rb_eArgError
#define ERROR_DIVIDE_BY_ZERO rb_eZeroDivError

#define CUSTOM_ERROR_CODE 137

#define M_PIE 3.14159265358979323846264338327950288

#define RELATIVE_ERROR 0.00001

// superscripts: -9 to +9 (and 3 spots for infs)
#define 𝔠EXPONENTS 22
#define 𝔠ULONG sizeof(unsigned long)
// rb_ary_new: uses a default size of 16
#define 𝔠ARY_DEFAULT 16L

static VALUE ℤn9 = INT2NUM(-9);
static VALUE ℤn8 = INT2NUM(-8);
static VALUE ℤn7 = INT2NUM(-7);
static VALUE ℤn6 = INT2NUM(-6);
static VALUE ℤn5 = INT2NUM(-5);
static VALUE ℤn4 = INT2NUM(-4);
static VALUE ℤn3 = INT2NUM(-3);
static VALUE ℤn2 = INT2NUM(-2);
static VALUE ℤn1 = INT2NUM(-1);
static VALUE ℤ0  = INT2NUM(0);
static VALUE ℤ1  = INT2NUM(1);
static VALUE ℤ2  = INT2NUM(2);
static VALUE ℤ3  = INT2NUM(3);
static VALUE ℤ4  = INT2NUM(4);
static VALUE ℤ5  = INT2NUM(5);
static VALUE ℤ6  = INT2NUM(6);
static VALUE ℤ7  = INT2NUM(7);
static VALUE ℤ8  = INT2NUM(8);
static VALUE ℤ9  = INT2NUM(9);

/*____________________________________________________________________________________________________________________________________________________________________
  __        __        ___
 /  `  /\  /  ` |__| |__
 \__, /~~\ \__, |  | |___
____________________________________________________________________________________________________________________________________________________________________ */

static VALUE cached_flt_nan;
static VALUE cached_flt_inf;
static VALUE cached_flt_negative_inf;
static VALUE cached_flt_inf_complex;

// | 0x0 |
static VALUE cached_module_ruuuby;
static VALUE cached_module_param_err;
// | --- |

static VALUE cached_global_sym_many_args;

static VALUE cached_class_big_decimal;
static VALUE cached_rb_intern_ints_bitwise_xor;
static VALUE cached_rb_intern_raise_to_power;
static VALUE cached_rb_intern_is_a;
static VALUE cached_rb_intern_is_empty;

static unsigned long exponential_ids[𝔠EXPONENTS];
// make these const ints?
static int           exponential_indexes[𝔠EXPONENTS];

/*____________________________________________________________________________________________________________________
  ___            __   __       __   ___  __             __       ___    __        __
 |__  |  | |\ | /  ` /__` .   |  \ |__  /  ` |     /\  |__)  /\   |  | /  \ |\ | /__`
 |    \__/ | \| \__, .__/ .   |__/ |___ \__, |___ /~~\ |  \ /~~\  |  | \__/ | \| .__/
_____________________________________________________________________________________________________________________ */

static inline void assign_exponential_index_position(unsigned long object_id, const int represented_integer);
static int internal_only_compare_func_4_object_id(const void * l , const void * r);


/*
//unsigned long id_7 = NUM2ULONG(rb_obj_id(rb_const_get_at(rb_cNumeric, rb_intern("EXPONENTIAL_ID_7"))));

// static VALUE cached_module_virtual_types; // = ext_api_add_module_under(module_ruuuby, "VirtualTypes")
//static VALUE cached_class_wrong_param_type; // = ext_api_add_new_sub_class_under(cached_module_param_err, ERROR_ARGUMENT, "WrongParamType")
*/
