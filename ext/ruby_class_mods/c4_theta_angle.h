// encoding: utf-8

#ifndef CRUUUBY_H3_MACRO_UTILITIES
#include "c3_macro_utilities.h"
#endif

#ifndef CRUUUBY_H4_THETA_ANGLE
#define CRUUUBY_H4_THETA_ANGLE

/*____________________________________________________________________________________________________________________
 __  ___  __        __  ___               __      ___            __   __
/__`  |  |__) |  | /  `  |      /\  |\ | |  \    |__  |     /\  / _` /__`
.__/  |  |  \ \__/ \__,  |     /~~\ | \| |__/    |    |___ /~~\ \__> .__/
_____________________________________________________________________________________________________________________ */

// @see original bitwise struct from: https://www.chiefdelphi.com/t/extracting-individual-bits-in-c/48028/8

typedef union {
    struct {
        unsigned b0:1;
        unsigned b1:1;
        unsigned b2:1;
        unsigned b3:1;
        unsigned b4:1;
        unsigned b5:1;
        unsigned b6:1;
        unsigned b7:1;
    };
    unsigned char generic_byte;
} generic_byte;

typedef struct generic_bits {
	unsigned char b0:1;
	unsigned char b1:1;
	unsigned char b2:1;
	unsigned char b3:1;
	unsigned char b4:1;
	unsigned char b5:1;
	unsigned char b6:1;
	unsigned char b7:1;
} GENERIC_BITS;

typedef union generic_bitwise_8_flags {
	unsigned char generic_byte;
	GENERIC_BITS b;
} GENERIC_BITWISE_8_FLAGS;

#define θFLAG_IS_ZERO 0
// 0 for negative, 1 for positive
#define θFLAG_SIGN 1
// 0 means magnitude is beyond 1 full rotation
#define θFLAG_IS_NORMAL 2
// 0 custom flag to ensure value does not get changed
#define θFLAG_IS_CONSTANT 3
// used to support math operations when ThetaAngle appears on RHS instead of LHS
#define θFLAG_IS_COERCE 4
// used to avoid un-necessary calls to DBL2NUM when not needed
#define θFLAG_IS_CACHE_SYNCED 5
// 0 indicates that the value is currently an exact match, 1 indicates the current value may have had operations performed on it and thus may contain precision error
#define θFLAG_LIKELY_HAS_PRECISION_LOSS 6

typedef struct ThetaAngles {
    double                  angle_value;
    unsigned char           angle_mode;
    GENERIC_BITWISE_8_FLAGS flags_meta_data;
    //GENERIC_BITWISE_8_FLAGS flags_vocab;
} ThetaAngle;

typedef struct ThetaAngles * ptr_theta_angle;
#define ptrθ ptr_theta_angle

// TODO: combined flag checks

//#define ptrθ_flag_set_coerce(ptr_to_theta_angle) ptr_to_theta_angle->flags_meta_data.b.b4 = FLAG_TRUE;
//#define ptrθ_flag_clr_coerce(ptr_to_theta_angle) ptr_to_theta_angle->flags_meta_data.b.b4 = FLAG_FALSE;
//#define ptrθ_flag_get_coerce(ptr_to_theta_angle) ptr_to_theta_angle->flags_meta_data.b.b4;

static inline void ptrθ_flag_set_coerce(const ptrθ data);
static inline void ptrθ_flag_clr_coerce(const ptrθ data);
static inline int ptrθ_flag_is_coerce(const ptrθ data);

static inline void ptrθ_flag_set_constant(const ptrθ data);
static inline void ptrθ_flag_clr_constant(const ptrθ data);
static inline int ptrθ_flag_is_constant(const ptrθ data);

static inline void ptrθ_flag_set_cache_synced(const ptrθ data);
static inline void ptrθ_flag_clr_cache_synced(const ptrθ data);
static inline int ptrθ_flag_is_cache_synced(const ptrθ data);

/*____________________________________________________________________________________________________________________
 __   __           __   ___  ___               __      __   ___ ___       __
/  \ |__)    |    |  \ |__  |__      /\  |\ | |  \    /__` |__   |  |  | |__)
\__/ |__) \__/    |__/ |___ |       /~~\ | \| |__/    .__/ |___  |  \__/ |
_____________________________________________________________________________________________________________________ */

#define 💎parse_ptrθ(the_data, the_ptr) TypedData_Get_Struct(the_data, ThetaAngle, & θ_type, the_ptr)
#define 💎self_to_ptrθ_data ptrθ data;  💎parse_ptrθ(self, data);

static void θ_free(void * data);
static size_t θ_size(const void * data);
static VALUE θ_alloc(VALUE self);
static VALUE θ_m_initialize(VALUE self, const VALUE angle, const VALUE angle_mode);

static VALUE θ_new(const double angle, const VALUE sym_mode);
static VALUE θ_new_constant(const double angle, const VALUE sym_mode);

// ---------------------------------------

static VALUE θ_m_initialize_as_radian(VALUE self, const VALUE angle);
static VALUE θ_m_initialize_as_degree(VALUE self, const VALUE angle);
static VALUE θ_m_initialize_as_gon(VALUE self, const VALUE angle);
static VALUE θ_m_initialize_as_turn(VALUE self, const VALUE angle);

// ---------------------------------------

static VALUE θ_duplicate_as_mode(const ptrθ original, const unsigned char angle_mode);

/*____________________________________________________________________________________________________________________
 __   __   ___  __       ___    __        __                __          ___         __
/  \ |__) |__  |__)  /\   |  | /  \ |\ | /__`     /\  |\ | |  \    |  |  |  | |    /__`
\__/ |    |___ |  \ /~~\  |  | \__/ | \| .__/    /~~\ | \| |__/    \__/  |  | |___ .__/
_____________________________________________________________________________________________________________________ */

static inline VALUE cθ_get_repr(const unsigned char angle_mode);

static VALUE θ_m_get_real(const VALUE self);
static VALUE θ_m_set_real(const VALUE self, const VALUE num);
//PUREFUNC(static VALUE θ_get_as_radian(const VALUE self));
//PUREFUNC(static VALUE θ_get_as_degree(const VALUE self));
//PUREFUNC(static VALUE θ_get_as_gon(const VALUE self));
//PUREFUNC(static VALUE θ_get_as_turn(const VALUE self));
//PUREFUNC(static VALUE θ_m_get_repr(const VALUE self));
//PUREFUNC(static VALUE θ_get_is_radians(const VALUE self));
//PUREFUNC(static VALUE θ_get_is_degrees(const VALUE self));
//PUREFUNC(static VALUE θ_get_is_gons(const VALUE self));
//PUREFUNC(static VALUE θ_get_is_turns(const VALUE self));
//static VALUE θ_m_get_windings(const VALUE self);

static VALUE θ_m_to_array(const VALUE self);
static VALUE θ_m_unary_subtraction(const VALUE self);
static VALUE θ_m_unary_addition(const VALUE self);
static VALUE θ_m_unary_complement(const VALUE self);
static VALUE θ_m_unary_not(const VALUE self);
static VALUE θ_m_abs(const VALUE self);
static VALUE θ_m_abs_self(const VALUE self);
static VALUE θ_m_is_normal(const VALUE self);
static VALUE θ_m_normalize(const VALUE self);
static VALUE θ_m_normalize_self(const VALUE self);

static VALUE θ_m_addition(const VALUE self, const VALUE value);
static VALUE θ_m_addition_eq(const VALUE self, const VALUE value);
static VALUE θ_m_subtraction(const VALUE self, const VALUE value);
static VALUE θ_m_subtraction_eq(const VALUE self, const VALUE value);
static VALUE θ_m_multiplication(const VALUE self, const VALUE value);
static VALUE θ_m_multiplication_eq(const VALUE self, const VALUE value);
static VALUE θ_m_division(const VALUE self, const VALUE value);
static VALUE θ_m_division_eq(const VALUE self, const VALUE value);
static VALUE θ_m_comparable(const VALUE self, const VALUE them);

static VALUE θ_m_equals(const VALUE self, const VALUE them);
static double θ_get_normalized_value(const double value, const unsigned char angle_mode);
static void ptrθ_normalize(ptrθ data);

static VALUE θ_m_matches_vocab_term(const VALUE self, const VALUE angle_type);

static VALUE ptrθ_is_normal(const ptrθ data);

static VALUE θ_m_is_explementary_with(const VALUE self, const VALUE them);
static VALUE θ_m_is_supplementary_with(const VALUE self, const VALUE them);

static inline double θ_get_val_as_mode(const unsigned char angle_mode, const ptrθ them);
static inline long double θ_get_val_precise_as_mode(const unsigned char angle_mode, const ptrθ them);
static inline double ptrθ_get_val_from_θ(const ptrθ self, const ptrθ them);
static inline double ptrθ_get_val_from_VALUE(const ptrθ self, const VALUE value);

static inline void ptrθ_addition_w_double(const ptrθ data, const double value);
static inline void ptrθ_subtraction_w_double(const ptrθ data, const double value);
static inline void ptrθ_multiplication_w_double(const ptrθ data, const double value);
static inline void ptrθ_division_w_double(const ptrθ data, const double value);

//static inline double ptrθ_get_const_unit(const ptrθ data);
static inline double ptrθ_get_const_quadrant(const ptrθ data);
static inline double ptrθ_get_const_straight(const ptrθ data);
static inline double ptrθ_get_const_perigon(const ptrθ data);
static inline double ptrθ_get_const_perigon_minus_quadrant(const ptrθ data);

static inline VALUE ptrθ_get_repr_as_sym(const ptrθ data);

// -------------------

#define is_theta_angle(arg) rb_obj_is_instance_of(arg, cached_class_theta_angle)

#define ptrθ_func(func_name, expr) static VALUE func_name(const VALUE self);static VALUE func_name(const VALUE self){💎self_to_ptrθ_data; expr}

/*static inline double ptrθ_get_const_unit(const ptrθ data) {
    switch(data->angle_mode) {
    case θ_MODE_ID_RAD: return θ_RAD_UNIT;
    case θ_MODE_ID_DGR: return θ_DGR_UNIT;
    case θ_MODE_ID_TRN: return θ_TRN_UNIT;
    default:            return θ_GON_UNIT;
    }
}*/

#endif
