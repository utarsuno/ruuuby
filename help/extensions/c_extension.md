
### extension code guidelines

| guideline |
| --- |
| if including `include/ruby/ruby.h`, don't use the `..._PTR` macros (ex: `RARRAY_PTR`, instead use function `rb_ary_aref`) |
| avoid `rb_eval_string` when possible, it's quite slow `ಠ╭╮ಠ` (relative to most alternatives) |

| resources |
| --- |
| https://docs.ruby-lang.org/en/2.7.0/extension_rdoc.html#label-Ruby+Language+Core |
| https://www.ruby-forum.com/t/rb-gc-register-address-or-rb-gc-mark/219828/13 |

## Ruby Methods

```

# TODO: finish documenting this (look for option to create stackless-func-call)
table from:
https://we4tech.wordpress.com/2013/05/09/different-type-methods-in-ruby/
```

| flag | use-case |
| --- | --- |
| VM_METHOD_TYPE_ISEQ | for "any ruby method which is referenced from source code" |
| VM_METHOD_TYPE_CFUNC | "method which is created on behalf of native C function |
| VM_METHOD_TYPE_ATTRSET | methods "declaring attribute setter using 'attr_writer'" |
| VM_METHOD_TYPE_IVAR | methods "declaring attribute getter using 'attr_reader'" |
| VM_METHOD_TYPE_BMETHOD | methods "declaring method using 'define_method' and passing proc for method body" |
| VM_METHOD_TYPE_ZSUPER | methods "explicitly declaring method scope (private, public, or protected) from the class hierarchy, ruby will redeclare method in the child class and mark that one with this flag" |
| VM_METHOD_TYPE_UNDEF | methods "undef using (undef_method or undef) will be marked with this flag (still method exists but won't respond to) |
| VM_METHOD_TYPE_NOTIMPLEMENTED | "if not implemented c function (which actually refers to rb_f_notimplement function)" |
| VM_METHOD_TYPE_OPTIMIZED | "this flag is used for separating few sets of methods from rest; so that VM can handle them better and optimized way", ex: Kernel#send, Proc#call, etc |
| VM_METHOD_TYPE_MISSING | "When method_missing is declared and

### Warnings
```
// see: https://croisant.net/ruby-c-extension-cheat-sheet/
rb_warn
rb_warning (only print warning if $VERBOSE is true)
```

### GCC flags

https://gcc.gnu.org/onlinedocs/gcc/Invoking-GCC.html#Invoking-GCC

### MacOS C Support
```

// to fix missing header: sys/statfs.h

brew cask install osxfuse
// (kinda, header still missing but adding the following 2 works)
#include <sys/param.h>
#include <sys/mount.h>

* http://macappstore.org/osxfuse/
* https://developer.apple.com/library/archive/documentation/System/Conceptual/ManPages_iPhoneOS/man2/statfs.2.html

```

### Source Code Snippets

```
//rb_enc_set_default_external(rb_enc_from_encoding(rb_utf8_encoding()));
//rb_enc_set_default_internal(rb_enc_from_encoding(rb_utf8_encoding()));

/* locale insensitive functions */

static inline int rb_isascii(int c){ return '\0' <= c && c <= '\x7f'; }
static inline int rb_isupper(int c){ return 'A' <= c && c <= 'Z'; }
static inline int rb_islower(int c){ return 'a' <= c && c <= 'z'; }
static inline int rb_isalpha(int c){ return rb_isupper(c) || rb_islower(c); }
static inline int rb_isdigit(int c){ return '0' <= c && c <= '9'; }
static inline int rb_isalnum(int c){ return rb_isalpha(c) || rb_isdigit(c); }
static inline int rb_isxdigit(int c){ return rb_isdigit(c) || ('A' <= c && c <= 'F') || ('a' <= c && c <= 'f'); }
static inline int rb_isblank(int c){ return c == ' ' || c == '\t'; }
static inline int rb_isspace(int c){ return c == ' ' || ('\t' <= c && c <= '\r'); }
static inline int rb_iscntrl(int c){ return ('\0' <= c && c < ' ') || c == '\x7f'; }
static inline int rb_isprint(int c){ return ' ' <= c && c <= '\x7e'; }
static inline int rb_ispunct(int c){ return !rb_isalnum(c); }
static inline int rb_isgraph(int c){ return '!' <= c && c <= '\x7e'; }
static inline int rb_tolower(int c) { return rb_isupper(c) ? (c|0x20) : c; }
static inline int rb_toupper(int c) { return rb_islower(c) ? (c&0x5f) : c; }

```
