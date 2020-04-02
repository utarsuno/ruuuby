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

// ---------------------------------------------------------------------------------------------------------------------

#define re_ye           return Qtrue;
#define re_no           return Qfalse;
#define re_me           return self;
#define re_0            return ℤ0;
#define re_nan          return cached_flt_nan;
#define re_inf          return cached_flt_inf;
#define re_negative_inf return cached_flt_negative_inf;
#define re_inf_complex  return cached_flt_inf_complex;
#define re_1            return ℤ1;
#define re_n1           return ℤn1;
// essentially returns "self.send(func_name, arg)"
#define re_me_func_1args(func_name, arg) return rb_funcall(self, func_name, 1, arg);

#endif