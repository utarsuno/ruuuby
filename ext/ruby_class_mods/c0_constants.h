// encoding: UTF-8

#ifndef CRUUUBY_H0_CONSTANTS
#define CRUUUBY_H0_CONSTANTS "defined(CRUUUBY_H0_CONSTANTS)"

/*____________________________________________________________________________________________________________________________________________________________________
  __   __        __  ___           ___                         ___  __
 /  ` /  \ |\ | /__`  |   /\  |\ |  |     \  /  /\  |    |  | |__  /__`
 \__, \__/ | \| .__/  |  /~~\ | \|  |      \/  /~~\ |___ \__/ |___ .__/
____________________________________________________________________________________________________________________________________________________________________ */
#define γ      0.5772156649015329
#define γL     0.5772156649015329L
#define π      3.14159265358979323846264338327950288  // double      pi  = acos(-1);
#define πL     3.14159265358979323846264338327950288L // long double pie = acosl(-1);
#define 𝚽      1.618033988749895 // more accurate version --> 1.61803398874989484820458683436
#define Ω      0.5671432904097838
#define ΩL     0.567143290409783872999968662210L
#define Ψ      1.46557123187676802665673122521993910  // less accurate version --> 1.4655712318767682
#define ΨL     1.46557123187676802665673122521993910L
#define ρ      1.324717957244746                      // more accurate version --> 1.1.3247179572447460259609088544780973407344040569017333
#define ρL     1.324717957244746L
#define δ      2.414213562373095
#define δL     2.414213562373095L
#define Ⴔ_DGR  137.507764050037854
#define ႴL_DGR 137.507764050037854L
#define Ⴔ_RAD  2.399963229728653
#define ႴL_RAD 2.399963229728653L   // more accurate version --> 2.39996322972865332
#define Ⴔ_TRN  (1.0 / (1.618033988749895 * 1.618033988749895))
#define 𝞽      (2.0 * π)
//#define M_SQRT2 1.41421356237309504880168872420969808

#define GENERIC_DECIMAL_VAL_MAX 1.7976931348623157e+100
#define GENERIC_DECIMAL_VAL_MIN 1.7976931348623157e-100

#define FLAG_FALSE 0u
#define FLAG_TRUE  1u

#define θRAD2DGR(arg)                   ((180.0 * arg) / π)
#define θRAD2GON(arg)                   ((200.0 * arg) / π)
#define θRAD2TRN(arg)                   (arg / 𝞽)
#define θDGR2RAD(arg)                   ((arg * π) / 180.0)
#define θDGR2GON(arg)                   ((200.0 / 180.0) * arg)
#define θDGR2TRN(arg)                   (arg / 360.0)
#define θGON2DGR(arg)                   ((180.0 / 200.0) * arg)
#define θGON2RAD(arg)                   ((arg * π) / 200.0)
#define θGON2TRN(arg)                   (arg / 400.0)
#define θTRN2DGR(arg)                   (arg * 360.0)
#define θTRN2RAD(arg)                   (arg * 𝞽)
#define θTRN2GON(arg)                   (arg * 400.0)

#define MINUTE_OF_ARC (1.0/60.0) // of 1 degree
#define SECOND_OF_ARC (1.0/3600.0) // of 1 degree
#define BINARY_ANGLE  (1.0/256.0) // of 1 𝞽

#define θRADL2LDGR(arg)                 ((180.0L * arg) / πL)
#define θRADL2LGON(arg)                 ((200.0L * arg) / πL)
#define θRADL2LTRN(arg)                 (arg / (2.0L * πL))
#define θDGRL2LRAD(arg)                 ((arg * πL) / 180.0L)
#define θDGRL2LGON(arg)                 ((200.0L / 180.0L) * arg)
#define θDGRL2LTRN(arg)                 (arg / 360.0L)
#define θGONL2LDGR(arg)                 ((180.0L / 200.0L) * arg)
#define θGONL2LRAD(arg)                 ((arg * πL) / 200.0L)
#define θGONL2LTRN(arg)                 (arg / 400.0L)
#define θTRNL2LDGR(arg)                 (arg * 360.0L)
#define θTRNL2LRAD(arg)                 (arg * (2.0L * πL))
#define θTRNL2LGON(arg)                 (arg * 400.0L)

//#define M_FLT_MIN_NORMAL 2.2250738585072014e-308
#define M_FLT_MAX                  1.7976931348623157e+308
#define M_FLT_EPSILON              2.220446049250313e-16
#define M_FLT_RELATIVE_ERR         0.1 // 2 // 0.00001
#define M_FLT_RELATIVE_ERR_RELAXED 2 // 2 // 0.00001

#define THETA_DGR_UNIT             (1.0 / 360.0)
#define THETA_GON_UNIT             (1.0 / 400.0)
#define THETA_RAD_UNIT             (0.0025 * (π * 2.0))
#define THETA_TRN_UNIT             0.0025
#define THETA_RAD_OCTANT           (0.25 * π)
#define THETA_GON_OCTANT           50.0
#define THETA_DGR_OCTANT           45.0
#define THETA_TRN_OCTANT           0.125
#define THETA_RAD_SEXTANT          (π / 3.0) // (π * ⅓) // ((60.0 / 360.0) * 𝞽)
#define THETA_GON_SEXTANT          ((60.0 / 360.0) * 400.0)
#define THETA_DGR_SEXTANT          60.0
#define THETA_TRN_SEXTANT          (60.0 / 360.0)
#define THETA_RAD_QUADRANT         (0.5 * π)
#define THETA_GON_QUADRANT         100.0
#define THETA_DGR_QUADRANT         90.0
#define THETA_TRN_QUADRANT         0.25
#define THETA_RAD_STRAIGHT         π
#define THETA_GON_STRAIGHT         200.0
#define THETA_DGR_STRAIGHT         180.0
#define THETA_TRN_STRAIGHT         0.50
#define THETA_RAD_PERIGON_MINUS_QUADRANT (π * (3.0/2.0))
#define THETA_GON_PERIGON_MINUS_QUADRANT 300.0
#define THETA_DGR_PERIGON_MINUS_QUADRANT 270.0
#define THETA_TRN_PERIGON_MINUS_QUADRANT 0.75
#define THETA_RAD_PERIGON          𝞽
#define THETA_GON_PERIGON          400.0
#define THETA_DGR_PERIGON          360.0
#define THETA_TRN_PERIGON          1.0
#define THETA_RAD_PERIGON_NEGATIVE (-2.0 * π)
#define THETA_GON_PERIGON_NEGATIVE -400.0
#define THETA_DGR_PERIGON_NEGATIVE -360.0
#define THETA_TRN_PERIGON_NEGATIVE -1.0

#define CACHE_INDEX_INF          1337
#define CACHE_INDEX_INF_NEGATIVE 1338
#define CACHE_INDEX_INF_COMPLEX  1339

#define THETA_MODE_RAD ℤ3
#define THETA_MODE_DGR ℤ4
#define THETA_MODE_TRN ℤ5
#define THETA_MODE_GON ℤ6
#define THETA_MODE_ID_RAD (unsigned char) 3
#define THETA_MODE_ID_DGR (unsigned char) 4
#define THETA_MODE_ID_TRN (unsigned char) 5
#define THETA_MODE_ID_GON (unsigned char) 6

// superscripts: -9 to +9
#define NUM_EXPONENTS 22 // 19 vs 22
// ---------------------------------------------------------------------------------------------------------------------

// the object ID for a FIXNUM will always be the same (during Runtime)
// the VALUE for FIXNUMs will actually contain the numerical value encoded directly (as opposed to VALUE traditionally storing pointer information)
static const VALUE ℤn9 = INT2FIX(-9);
static const VALUE ℤn8 = INT2FIX(-8);
static const VALUE ℤn7 = INT2FIX(-7);
static const VALUE ℤn6 = INT2FIX(-6);
static const VALUE ℤn5 = INT2FIX(-5);
static const VALUE ℤn4 = INT2FIX(-4);
static const VALUE ℤn3 = INT2FIX(-3);
static const VALUE ℤn2 = INT2FIX(-2);
static const VALUE ℤn1 = INT2FIX(-1);
static const VALUE ℤ0  = INT2FIX(0);
static const VALUE ℤ1  = INT2FIX(1);
static VALUE ℤd1;
static const VALUE ℤ2  = INT2FIX(2);
static const VALUE ℤ3  = INT2FIX(3);
static const VALUE ℤ4  = INT2FIX(4);
static const VALUE ℤ5  = INT2FIX(5);
static const VALUE ℤ6  = INT2FIX(6);
static const VALUE ℤ7  = INT2FIX(7);
static const VALUE ℤ8  = INT2FIX(8);
static const VALUE ℤ9  = INT2FIX(9);

// ---------------------------------------------------------------------------------------------------------------------

//static ID cached_rb_intern_raise_to_power; rb_intern("**");
#define ID_OF_POW 134
#define ID_OF_UMINUS 133
#define ID_OF_UPLUS 132
#define ID_OF_COMPARE 135
#define ID_OF_POW 134
#define ID_OF_RSHIFT 137

// ---------------------------------------------------------------------------------------------------------------------

#define NORM_ERROR 0
#define NORM_UNIVERSAL 2
#define NORM_UNIVERSAL_W_STR 3
#define NORM_NATURAL 4
#define NORM_NATURAL_W_STR 5
#define NORM_WHOLE 6
#define NORM_WHOLE_W_STR 7
#define NORM_INTEGER 8
#define NORM_INTEGER_W_STR 9

// ---------------------------------------------------------------------------------------------------------------------

#define ARG_OPTS_ONE_OPTIONAL                  "01"
#define ARG_OPTS_ONE_REQUIRED_AND_ONE_OPTIONAL "11"

// ---------------------------------------------------------------------------------------------------------------------

#define FLAG_RUNTIME_VERSION_C_89 (unsigned short) 1
#define FLAG_RUNTIME_VERSION_C_99 (unsigned short) 2
#define FLAG_RUNTIME_VERSION_C_11 (unsigned short) 3
#define FLAG_RUNTIME_VERSION_C_17 (unsigned short) 4
#define FLAG_RUNTIME_VERSION_GNU_89 (unsigned short) 5
#define FLAG_RUNTIME_VERSION_GNU_99 (unsigned short) 6
#define FLAG_RUNTIME_VERSION_GNU_11 (unsigned short) 7
#define FLAG_RUNTIME_VERSION_GNU_17 (unsigned short) 8
#define FLAG_RUNTIME_VERSION_DEFAULT (unsigned short) 9

#define VAL_STD_VERSION_C_99 199901
#define VAL_STD_VERSION_C_11 201112
#define VAL_STD_VERSION_C_17 201710
#define VAL_STD_VERSION_GNU_99 VAL_STD_VERSION_C_99
#define VAL_STD_VERSION_GNU_11 VAL_STD_VERSION_C_11
#define VAL_STD_VERSION_GNU_17 VAL_STD_VERSION_C_17
#define VAL_STD_VERSION_DEFAULT VAL_STD_VERSION_GNU_17

#endif
