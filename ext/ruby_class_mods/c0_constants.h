// encoding: utf-8

#ifndef CRUUUBY_H0_CONSTANTS
#define CRUUUBY_H0_CONSTANTS "defined(CRUUUBY_H0_CONSTANTS)"

/*____________________________________________________________________________________________________________________________________________________________________
  __   __        __  ___           ___                         ___  __
 /  ` /  \ |\ | /__`  |   /\  |\ |  |     \  /  /\  |    |  | |__  /__`
 \__, \__/ | \| .__/  |  /~~\ | \|  |      \/  /~~\ |___ \__/ |___ .__/
____________________________________________________________________________________________________________________________________________________________________ */
#define CUSTOM_ERROR_CODE 137

#define π                               3.14159265358979323846264338327950288
#define πL                              3.14159265358979323846264338327950288L

#define FLAG_FALSE 0u
#define FLAG_TRUE  1u

#define θRAD2DGR(arg)                   ((180.0 * arg) / π)
#define θRAD2GON(arg)                   ((200.0 * arg) / π)
#define θRAD2TRN(arg)                   (arg / (2.0 * π))
#define θDGR2RAD(arg)                   ((arg * π) / 180.0)
#define θDGR2GON(arg)                   ((200.0 / 180.0) * arg)
#define θDGR2TRN(arg)                   (arg / 360.0)
#define θGON2DGR(arg)                   ((180.0 / 200.0) * arg)
#define θGON2RAD(arg)                   ((arg * π) / 200.0)
#define θGON2TRN(arg)                   (arg / 400.0)
#define θTRN2DGR(arg)                   (arg * 360.0)
#define θTRN2RAD(arg)                   (arg * (2.0 * π))
#define θTRN2GON(arg)                   (arg * 400.0)

#define 𝚽                               1.618033988749895
#define Ⴔ_AS_DGR                        137.507764050037854

#define M_FLT_GOLDEN_ANGLE_AS_FRACTION  (1.0 / (1.618033988749895 * 1.618033988749895))
#define M_FLT_GOLDEN_ANGLE_AS_RADIANS   2.399963229728653
#define M_FLT_EULER_MASCHERONI_CONSTANT 0.5772156649015329
#define M_FLT_MIN_NORMAL                1.17549435E-38
#define M_FLT_RELATIVE_ERROR            0.00001
//#define M_FLT_INF_COMPLEX             (-10.0e-30f * 10.0e-30f)
//#define M_FLT_INF_COMPLEX             -0.0
#define ½                               0.50

#define ⅓                               (1.0/3.0)
#define ⅔                               (2.0/3.0)

#define ¼                               0.25
#define ¾                               0.75

#define ⅕                               0.20
#define ⅖                               0.40
#define ⅗                               0.60
#define ⅘                               0.80

#define ⅙                               (1.0/6.0)
#define ⅚                               (5.0/6.0)

#define ⅐                              (1.0/7.0)

#define ⅛                               0.125
#define ⅜                               0.375
#define ⅝                               0.625
#define ⅞                               0.875

#define ⅑                              (1.0/9.0)
#define ⅒                              0.10

#define θ_DGR_UNIT             (1.0 / 360.0)
#define θ_GON_UNIT             (1.0 / 400.0)
#define θ_RAD_UNIT             (0.0025 * (π * 2.0))
#define θ_TRN_UNIT             0.0025
#define θ_RAD_OCTANT           (¼ * π)
#define θ_GON_OCTANT           50.0
#define θ_DGR_OCTANT           45.0
#define θ_TRN_OCTANT           ⅛
#define θ_RAD_SEXTANT          ((60.0 / 360.0) * (2.0 * π))
#define θ_GON_SEXTANT          ((60.0 / 360.0) * 400.0)
#define θ_DGR_SEXTANT          60.0
#define θ_TRN_SEXTANT          (60.0 / 360.0)
#define θ_RAD_QUADRANT         (½ * π)
#define θ_GON_QUADRANT         100.0
#define θ_DGR_QUADRANT         90.0
#define θ_TRN_QUADRANT         ¼
#define θ_RAD_STRAIGHT         π
#define θ_GON_STRAIGHT         200.0
#define θ_DGR_STRAIGHT         180.0
#define θ_TRN_STRAIGHT         ½
#define θ_RAD_PERIGON          (2.0 * π)
#define θ_GON_PERIGON          400.0
#define θ_DGR_PERIGON          360.0
#define θ_TRN_PERIGON          1.0
#define θ_RAD_PERIGON_NEGATIVE (-2.0 * π)
#define θ_GON_PERIGON_NEGATIVE -400.0
#define θ_DGR_PERIGON_NEGATIVE -360.0
#define θ_TRN_PERIGON_NEGATIVE -1.0

#define CACHE_INDEX_INF                 1337
#define CACHE_INDEX_INF_NEGATIVE        1338
#define CACHE_INDEX_INF_COMPLEX         1339

#define θ_MODE_RADIAN                   Qnil
#define θ_MODE_DEGREE                   Qtrue
#define θ_MODE_GON                      Qfalse
#define θ_MODE_ID_RAD                   3
#define θ_MODE_ID_DGR                   4
#define θ_MODE_ID_GON                   5
#define θ_MODE_ID_TRN                   6

// superscripts: -9 to +9
#define 𝔠EXPONENTS 22 // 19 vs 22
#define 𝔠LONGLONG sizeof(long long)
//#define 𝔠θ sizeof(FloatAngle)
// rb_ary_new: uses a default size of 16
#define 𝔠ARY_DEFAULT 16L

// ---------------------------------------------------------------------------------------------------------------------
static VALUE ℤn9 = INT2FIX(-9);
static VALUE ℤn8 = INT2FIX(-8);
static VALUE ℤn7 = INT2FIX(-7);
static VALUE ℤn6 = INT2FIX(-6);
static VALUE ℤn5 = INT2FIX(-5);
static VALUE ℤn4 = INT2FIX(-4);
static VALUE ℤn3 = INT2FIX(-3);
static VALUE ℤn2 = INT2FIX(-2);
static VALUE ℤn1 = INT2FIX(-1);
static VALUE ℤ0  = INT2FIX(0);
static VALUE ℤ1  = INT2FIX(1);
static VALUE ℤ2  = INT2FIX(2);
static VALUE ℤ3  = INT2FIX(3);
static VALUE ℤ4  = INT2FIX(4);
static VALUE ℤ5  = INT2FIX(5);
static VALUE ℤ6  = INT2FIX(6);
static VALUE ℤ7  = INT2FIX(7);
static VALUE ℤ8  = INT2FIX(8);
static VALUE ℤ9  = INT2FIX(9);

// ---------------------------------------------------------------------------------------------------------------------

#define ARG_OPTS_ONE_OPTIONAL "01"

#endif
