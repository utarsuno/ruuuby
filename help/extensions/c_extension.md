
| resources |
| --- |
| https://docs.ruby-lang.org/en/2.7.0/extension_rdoc.html#label-Ruby+Language+Core |

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

### WIP :P

```c

 * https://silverhammermba.github.io/emberb/c/#string // You can pass the string VALUE to rb_str_export_locale() to get a new VALUE with your locale’s encoding


#define MYFILE "FILE_PATH_=)"
int m_file_get_last_n_bytes();
int m_file_get_last_n_bytes() {
    //int fd;

    FILE *fp;
    //char buf[BUFSIZ] = "Garbage";
    char buf[BUFSIZ] = {0};

    //ssize_t read_byte;
    //char c[4097];

    //c_file_read(fd, MYFILE)
    //if (fd == -1) {
    //    printf("Error opening file{MYFILE}\n");
    //    return -1;
    //}

    //////
    //struct statfs fsInfo = {0};
    //long optimal_size;
    //long optimal_transfer;
    //if (fstatfs(fd, &fsInfo) == -1) {
    //    optimal_size = 4096; // 4 * 1024 * 1024
    //    optimal_transfer = -1337L;
    //} else {
    //    optimal_size = fsInfo.f_bsize;
    //    optimal_transfer = fsInfo.f_iosize;
    //}
    //////


    //lseek(fd, -4096L, SEEK_END);
    //read_byte = read(fd, c, 4096L); // Read 1024 bytes
    //c[read_byte] = '\0';

    int i;
    if ((fp = fopen(MYFILE, "r")) == NULL) {
        perror (MYFILE);
        return (EXIT_FAILURE);
    }
    i = 0;
    while (fgets(buf, sizeof(buf), fp) != NULL) {
        printf ("Line %4d: %s", i, buf);
        i++;
    }
    printf ("AAAAAA Line %4d: %s\n", i, buf);
    fclose(fp);
    //return(0);

    //printf("OPTIMIAL SIZE {%lu}\n", optimal_size);
    //printf("OPTIMIAL TRANSFER SIZE {%lu}\n", optimal_transfer);
    //printf("%s\n", c);
    //c_file_close(fd)

    return 0;
}

//#define c_file_read(file_descriptor, path) file_descriptor = open(path, O_RDONLY);
#define c_file_read(file_descriptor, path) file_descriptor = open(path, O_RDONLY);
#define c_file_close(file_descriptor) fclose(file_descriptor);


#define raise_err_error_opening_file(error_message, error_param) rb_raise(ERROR_RUNTIME, error_message, rb_id2str(rb_intern(error_param)));

//#define r_hsh_has_key(hsh, key) ((!(!RHASH(hsh)->ntbl)) && (st_lookup(RHASH(hsh)->ntbl, key, 0)))
//#define r_hsh_has_key(hsh, key) ((st_lookup(RHASH(hsh)->ntbl, key, 0)) ? R_TRUE : R_FALSE)
#define r_hsh_has_key(hsh, key) (rb_hash_has_key(hsh, key) == Qtrue)


# TODO: more testing
// | 0x5c | class{Array} | function{disjunctive_union} |
r_func_self_them(m_ary_disjunctive_union,
    if (is_ary(them)) {
        long  len_me   = len_ary(self);
        long  len_them = len_ary(them);
        if (len_me == 0) {
            //rb_copy_generic_ivar(them, output);
            //rb_copy_generic_ivar(output, them);
            return rb_ary_dup(them);
        } else if (len_them == 0) {
            //rb_copy_generic_ivar(self, output);
            //rb_copy_generic_ivar(output, self);
            return rb_ary_dup(self);
        } else {

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

//#include <stdlib.h>

// needed for utilizing 'statfs' and others to get file information
//#include <sys/param.h>
//#include <sys/mount.h>

// additional C libs
//#include <stdio.h>
//#include <unistd.h>
//#include <sys/types.h>
//#include <sys/stat.h>
//#include <fcntl.h>
//#include <string.h>


// see warning at: https://docs.ruby-lang.org/en/2.4.0/extension_rdoc.html
#define len_ary(ary) RARRAY_LEN(ary)
#define len_str(str) RSTRING_LEN(str)


//#define r_get_class(r_class) rb_const_get(rb_cObject, rb_intern(r_class))
//#define r_class_add_method_private(r_class, func_name, func, num_args) rb_define_private_method(r_class, func_name, RUBY_METHOD_FUNC(func), num_args);
//#define ensure_they_are_ary(func_name, them, expr) if (is_ary(them)) {expr} else {raise_err_array_bad_arg_type(func_name, them)}


    //rb_enc_set_default_external(rb_enc_from_encoding(rb_utf8_encoding()));
    //rb_enc_set_default_internal(rb_enc_from_encoding(rb_utf8_encoding()));

    //rb_define_global_const("²", rb_int_new(2));
    //rb_define_global_const(rb_utf8_str_new_cstr("²"), rb_int_new(2));
    //rb_string_value_cstr
    //rb_usascii_str_new_literal
    //StringValueCStr

    //compiles but weird: rb_define_global_const(rb_utf8_str_new_lit("²"), rb_int_new(2));
    //rb_define_global_const(rb_str_new_literal("²"), rb_int_new(2));


    VALUE power_2 = rb_str_new_literal("AHH²");
    StringValue(power_2);
    power_2 = rb_str_export_locale(power_2);

    rb_define_global_const(rb_str_to_cstr(power_2), rb_int_new(2));

    //return rb_ary_new_capa(0L);

```
