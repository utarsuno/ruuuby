// encoding: utf-8

#ifndef CRUUUBY_H0_CONSTANTS
#define CRUUUBY_H0_CONSTANTS "defined(CRUUUBY_H0_CONSTANTS)"

/*____________________________________________________________________________________________________________________________________________________________________
  __   __        __  ___           ___                         ___  __
 /  ` /  \ |\ | /__`  |   /\  |\ |  |     \  /  /\  |    |  | |__  /__`
 \__, \__/ | \| .__/  |  /~~\ | \|  |      \/  /~~\ |___ \__/ |___ .__/
____________________________________________________________________________________________________________________________________________________________________ */
#define CUSTOM_ERROR_CODE 137

#define M_PIE                           3.14159265358979323846264338327950288
#define M_FLT_GOLDEN_RATIO              1.618033988749895
#define M_FLT_EULER_MASCHERONI_CONSTANT 0.5772156649015329
//#define M_FLT_EULER_MASCHERONI_CONSTANT 0.57721566490153286060651209008240243104215933593992
#define M_FLT_MIN_NORMAL                1.17549435E-38
#define M_FLT_RELATIVE_ERROR            0.00001
//#define M_FLT_INF_COMPLEX               (-10.0e-30f * 10.0e-30f)
//#define M_FLT_INF_COMPLEX -0.0

// superscripts: -9 to +9 (and 3 spots for infs)
#define 𝔠EXPONENTS 22
#define 𝔠ULONG sizeof(unsigned long)
// rb_ary_new: uses a default size of 16
#define 𝔠ARY_DEFAULT 16L

// ---------------------------------------------------------------------------------------------------------------------

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

// ---------------------------------------------------------------------------------------------------------------------

#define ARG_OPTS_ONE_OPTIONAL "01"

#endif
