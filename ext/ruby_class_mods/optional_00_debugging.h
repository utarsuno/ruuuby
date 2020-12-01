// encoding: UTF-8

#ifndef RUUUBY_OPTIONAL_00
#define RUUUBY_OPTIONAL_00

#define STR_HELPER(x) #x
#define STR(x) STR_HELPER(x)

// ---------------------------------------------------------------------------------------------------------------------

#define COMPILED_AT_DATETIME __DATE__ " " __TIME__

// ---------------------------------------------------------------------------------------------------------------------

#if RBIMPL_COMPILER_IS_GCC
    #define COMPILER_NAME "gcc"
#elif RBIMPL_COMPILER_IS_Intel
    #define COMPILER_NAME "intel"
#elif RBIMPL_COMPILER_IS_MSVC
    #define COMPILER_NAME "msvc"
#elif RBIMPL_COMPILER_IS_SunPro
    #define COMPILER_NAME "sunpro"
#elif RBIMPL_COMPILER_IS_Apple
    #define COMPILER_NAME "apple"
#elif RBIMPL_COMPILER_IS_Clang
    #define COMPILER_NAME "clang"
#endif

// ---------------------------------------------------------------------------------------------------------------------

#ifndef COMPILER_NAME
    #define COMPILER_NAME "???"
    #define COMPILER_VERSION "???"
#else
    #define COMPILER_VERSION STR(RBIMPL_COMPILER_VERSION_MAJOR) "." STR(RBIMPL_COMPILER_VERSION_MINOR) "." STR(RBIMPL_COMPILER_VERSION_PATCH)
#endif

// ---------------------------------------------------------------------------------------------------------------------
// @see https://stackoverflow.com/questions/14737104/what-is-the-default-c-std-standard-version-for-the-current-gcc-especially-on-u
#define VAL_STD_VERSION_C_99    199901
#define VAL_STD_VERSION_C_11    201112
#define VAL_STD_VERSION_C_17    201710
#define VAL_STD_VERSION_GNU_99  VAL_STD_VERSION_C_99
#define VAL_STD_VERSION_GNU_11  VAL_STD_VERSION_C_11
#define VAL_STD_VERSION_GNU_17  VAL_STD_VERSION_C_17
#define VAL_STD_VERSION_DEFAULT VAL_STD_VERSION_GNU_17

#ifdef __STRICT_ANSI__
    #ifdef __STDC_VERSION__
        #if __STDC_VERSION__ == VAL_STD_VERSION_C_99
            #define COMPILER_STANDARD "c99"
        #elif __STDC_VERSION__ == VAL_STD_VERSION_C_11
            #define COMPILER_STANDARD "c11"
        #elif __STDC_VERSION__ == VAL_STD_VERSION_C_17
            #define COMPILER_STANDARD "c17"
        #else
            #define COMPILER_STANDARD "default"
        #endif
    #else
        #define COMPILER_STANDARD "c89"
    #endif
#else
    #ifdef __STDC_VERSION__
        #if __STDC_VERSION__ == VAL_STD_VERSION_GNU_99
            #define COMPILER_STANDARD "gnu99"
        #elif __STDC_VERSION__ == VAL_STD_VERSION_GNU_11
            #define COMPILER_STANDARD "gnu11"
        #elif __STDC_VERSION__ == VAL_STD_VERSION_GNU_17
            #define COMPILER_STANDARD "gnu17"
        #else
            #define COMPILER_STANDARD "default"
        #endif
    #else
        #define COMPILER_STANDARD "c89"
    #endif
#endif

// ---------------------------------------------------------------------------------------------------------------------

/*
char buffer[256];
freopen("/dev/null", "a", stdout);
setbuf(stdout, buffer);
// the following function prints to stdout which will be stored into the buffer
ruby_show_version();
freopen ("/dev/tty", "a", stdout);

//ruby_show_version();
//ruby_show_copyright();
*/

// ---------------------------------------------------------------------------------------------------------------------

#endif
