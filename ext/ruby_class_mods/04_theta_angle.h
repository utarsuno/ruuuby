// encoding: UTF-8

#ifndef CRUUUBY_H3_MACRO_UTILITIES
#include "03_macro_utilities.h"
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
} BITWISE_FLAGS_8;

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
// used as a quicker check if this value is exactly 1 full turn or not
#define θFLAG_IS_PERIGON 7

#define θFLAG_VOCAB_IS_RIGHT 0
#define θFLAG_VOCAB_IS_STRAIGHT 1
#define θFLAG_VOCAB_IS_ACUTE 2
#define θFLAG_VOCAB_IS_SEXTANT 3
#define θFLAG_VOCAB_IS_OBLIQUE 4
#define θFLAG_VOCAB_IS_REFLEX 5

typedef struct ThetaAngles {
    double          angle_value;
    unsigned char   angle_mode;
    BITWISE_FLAGS_8 flags_meta_data;
    //BITWISE_FLAGS_8 flags_vocab;
} ThetaAngle;

typedef struct ThetaAngles * ptr_theta_angle;
#define ptrθ ptr_theta_angle

#define TA_FLAGS_ZERO_POSITIVE_NORMAL 0x7

#define FLAGS_NON_CONST_ZERO 0x7
#define FLAGS_NON_CONST_POSITIVE_NORMAL 0x6
#define FLAGS_NON_CONST_POSITIVE_NOT_NORMAL 0x2
#define FLAGS_NON_CONST_NEGATIVE_NORMAL 0x4
#define FLAGS_NON_CONST_NEGATIVE_NOT_NORMAL 0x0
#define FLAGS_ZERO_AND_POSITIVE 0x3
#define FLAGS_NORMAL 0x4
#define FLAGS_ZERO_OR_PERIGON 0x41

#define TA_SET_FLAGS(the_data, the_flags) the_data->flags_meta_data.generic_byte = the_flags;
#define TA_FLAGS_ON(the_data, the_flags) the_data->flags_meta_data.generic_byte |= the_flags;
#define NO_MATCH_FOR_θ(the_data, the_flags) (the_data->flags_meta_data.generic_byte & the_flags) == 0
#define ANY_MATCH_FOR_FLAGS(the_data, the_flags) (the_data->flags_meta_data.generic_byte & the_flags) != 0
#define NO_MATCH_FOR_ANY_θ(the_data, the_flags) (the_data->flags_meta_data.generic_byte & the_flags) == 0

#define ptrθ_flags_val_is_zero(data){\
    ptrθ_flag_set_is_zero(data);\
    ptrθ_flag_set_is_positive(data);\
    ptrθ_flag_set_is_normal(data);\
    ptrθ_flag_clr_perigon(data);\
}

#define ptrθ_flags_val_is_perigon(data, as_positive_perigon){\
    ptrθ_flag_clr_is_zero(data);\
    ptrθ_flag_set_is_normal(data);\
    ptrθ_flag_set_perigon(data);\
    if (as_positive_perigon){\
        ptrθ_flag_set_is_positive(data);\
    } else {\
        ptrθ_flag_clr_is_positive(data);\
    }\
}

#define ptrθ_flags_val_is_below_perigon(data, as_positive_perigon){\
    ptrθ_flag_clr_is_zero(data);\
    ptrθ_flag_set_is_normal(data);\
    ptrθ_flag_clr_perigon(data);\
    if (as_positive_perigon){\
        ptrθ_flag_set_is_positive(data);\
    } else {\
        ptrθ_flag_clr_is_positive(data);\
    }\
}

#define ptrθ_flags_val_is_beyond_perigon(data, as_positive_perigon){\
    ptrθ_flag_clr_is_zero(data);\
    ptrθ_flag_clr_is_normal(data);\
    ptrθ_flag_clr_perigon(data);\
    if (as_positive_perigon){\
        ptrθ_flag_set_is_positive(data);\
    } else {\
        ptrθ_flag_clr_is_positive(data);\
    }\
}

// -------------------------

#define CREATE_FLAG_TA_FUNC_SETTER(func_name, expr, flag_value) static inline void func_name(ptrθ data);static inline void func_name(ptrθ data){expr = flag_value;}
#define CREATE_FLAG_TA_FUNC_GETTER(func_name, expr) static inline int func_name(ptrθ data);static inline int func_name(ptrθ data){return expr == FLAG_TRUE;}

CREATE_FLAG_TA_FUNC_SETTER(ptrθ_flag_set_is_zero, data->flags_meta_data.b.b0, FLAG_TRUE)
CREATE_FLAG_TA_FUNC_SETTER(ptrθ_flag_clr_is_zero, data->flags_meta_data.b.b0, FLAG_FALSE)
CREATE_FLAG_TA_FUNC_GETTER(ptrθ_flag_is_zero, data->flags_meta_data.b.b0)

CREATE_FLAG_TA_FUNC_SETTER(ptrθ_flag_set_is_positive, data->flags_meta_data.b.b1, FLAG_TRUE)
CREATE_FLAG_TA_FUNC_SETTER(ptrθ_flag_clr_is_positive, data->flags_meta_data.b.b1, FLAG_FALSE)
CREATE_FLAG_TA_FUNC_GETTER(ptrθ_flag_is_positive, data->flags_meta_data.b.b1)

CREATE_FLAG_TA_FUNC_SETTER(ptrθ_flag_set_is_normal, data->flags_meta_data.b.b2, FLAG_TRUE)
CREATE_FLAG_TA_FUNC_SETTER(ptrθ_flag_clr_is_normal, data->flags_meta_data.b.b2, FLAG_FALSE)
CREATE_FLAG_TA_FUNC_GETTER(ptrθ_flag_is_normal, data->flags_meta_data.b.b2)

CREATE_FLAG_TA_FUNC_SETTER(ptrθ_flag_set_constant, data->flags_meta_data.b.b3, FLAG_TRUE)
CREATE_FLAG_TA_FUNC_SETTER(ptrθ_flag_clr_constant, data->flags_meta_data.b.b3, FLAG_FALSE)
CREATE_FLAG_TA_FUNC_GETTER(ptrθ_flag_is_constant, data->flags_meta_data.b.b3)

CREATE_FLAG_TA_FUNC_SETTER(ptrθ_flag_set_coerce, data->flags_meta_data.b.b4, FLAG_TRUE)
CREATE_FLAG_TA_FUNC_SETTER(ptrθ_flag_clr_coerce, data->flags_meta_data.b.b4, FLAG_FALSE)
CREATE_FLAG_TA_FUNC_GETTER(ptrθ_flag_is_coerce, data->flags_meta_data.b.b4)

CREATE_FLAG_TA_FUNC_SETTER(ptrθ_flag_set_cache_synced, data->flags_meta_data.b.b5, FLAG_TRUE)
CREATE_FLAG_TA_FUNC_SETTER(ptrθ_flag_clr_cache_synced, data->flags_meta_data.b.b5, FLAG_FALSE)
CREATE_FLAG_TA_FUNC_GETTER(ptrθ_flag_is_cache_synced, data->flags_meta_data.b.b5)

CREATE_FLAG_TA_FUNC_SETTER(ptrθ_flag_set_perigon, data->flags_meta_data.b.b7, FLAG_TRUE)
CREATE_FLAG_TA_FUNC_SETTER(ptrθ_flag_clr_perigon, data->flags_meta_data.b.b7, FLAG_FALSE)
CREATE_FLAG_TA_FUNC_GETTER(ptrθ_flag_is_perigon, data->flags_meta_data.b.b7)

static double vocab_value_perigon_negative(const unsigned char angle_mode);
static double vocab_value_perigon(const unsigned char angle_mode);
static double vocab_value_sextant(const unsigned char angle_mode);
static double vocab_value_octant(const unsigned char angle_mode);
static double vocab_value_straight(const unsigned char angle_mode);
static double vocab_value_quadrant(const unsigned char angle_mode);

/*____________________________________________________________________________________________________________________
 __   __           __   ___  ___               __      __   ___ ___       __
/  \ |__)    |    |  \ |__  |__      /\  |\ | |  \    /__` |__   |  |  | |__)
\__/ |__) \__/    |__/ |___ |       /~~\ | \| |__/    .__/ |___  |  \__/ |
_____________________________________________________________________________________________________________________ */

static void ptrθ_free(ptrθ data);
static void ptrθ_free(ptrθ data) {
    //printf("ABOUT TO FREE THETA_ANGLE{%f}\n", data->angle_value);
    //rb_raise(R_ERR_ARG, "| ABOUT TO FREE {%"PRIsVALUE"} into a theta_angle |", (void *)data);
    free(data);
}

static void θ_free(void * data);
static void θ_free(void * data) {
    ptrθ_free(data);
}

static size_t θ_size(const void * data) {return sizeof(ThetaAngle);}

static const rb_data_type_t type_θ = {
    .data             = NULL,
    .flags             = RUBY_TYPED_FREE_IMMEDIATELY,
    .wrap_struct_name = "theta_angle",
    .function         = {
        .dmark = NULL, // NULL as the struct contains no references to the c-data-type{VALUE}
        .dfree = θ_free,
        .dsize = θ_size,
    },
};

#define 💎parse_ptrθ(the_data, the_ptr) TypedData_Get_Struct(the_data, ThetaAngle, & type_θ, the_ptr)
#define 💎self_to_ptrθ_data ptrθ data;  💎parse_ptrθ(self, data);

static size_t θ_size(const void * data);

static VALUE θ_alloc(VALUE self);
static VALUE θ_alloc(VALUE self) {
    ptrθ data;
    return TypedData_Make_Struct(self, ThetaAngle, & type_θ, data);
}

static VALUE θ_m_initialize(VALUE self, const VALUE angle, const VALUE angle_mode);

static VALUE θ_new(const double angle, const VALUE sym_mode);
static VALUE θ_new(const double angle, const VALUE sym_mode) {
    ptrθ data;
    VALUE argv[2] = {DBL2NUM(angle), sym_mode};
    VALUE obj     = TypedData_Make_Struct(Ⓒtheta_angle, ThetaAngle, & type_θ, data);
    rb_obj_call_init(obj, 2, argv);
    return obj;
}

static VALUE θ_new_constant(const double angle, const VALUE sym_mode, const unsigned char initial_flags);
static VALUE θ_new_constant(const double angle, const VALUE sym_mode, const unsigned char initial_flags) {
    VALUE obj = θ_new(angle, sym_mode);
    ptrθ data; 💎parse_ptrθ(obj, data);
    💎set_instance_field(obj,DBL2NUM(data->angle_value),real)
    TA_SET_FLAGS(data, initial_flags);
    RB_OBJ_FREEZE(obj);
    return obj;
}

// ---------------------------------------

static VALUE θ_m_init_as_rad(VALUE self, const VALUE angle);
static VALUE θ_m_init_as_dgr(VALUE self, const VALUE angle);
static VALUE θ_m_init_as_gon(VALUE self, const VALUE angle);
static VALUE θ_m_init_as_trn(VALUE self, const VALUE angle);

#define 💎θ_INIT_AS(angle, mode_id, mode_value, arg_name) {\
    if (is_theta_angle(angle)) {\
        ptrθ data_them; 💎parse_ptrθ(angle, data_them);\
        return θ_new(θ_get_val_as_mode(mode_id, data_them), mode_value);\
    } else if (is_num(angle)) {\
        return θ_new(NUM2DBL(angle), mode_value);\
    } else {\
        ERR_m_param_type("ThetaAngle", "new", arg_name, angle, "Numeric")\
    }\
}

// ---------------------------------------

static VALUE θ_m_get_size(const VALUE self);

/*____________________________________________________________________________________________________________________
 __   __   ___  __       ___    __        __                __          ___         __
/  \ |__) |__  |__)  /\   |  | /  \ |\ | /__`     /\  |\ | |  \    |  |  |  | |    /__`
\__/ |    |___ |  \ /~~\  |  | \__/ | \| .__/    /~~\ | \| |__/    \__/  |  | |___ .__/
_____________________________________________________________________________________________________________________ */

// ---------------------------------------

static VALUE θ_equals_θ(const ptrθ a, const ptrθ b);

static VALUE θVAL_equals_θVAL(const VALUE a, const VALUE b);

static VALUE θVAL_equals_NUM(const VALUE a, const VALUE b);
static VALUE θVAL_equals_NUM(const VALUE a, const VALUE b) {
    ptrθ data_a; 💎parse_ptrθ(a, data_a);
    re_as_bool(data_a->angle_value == NUM2DBL(b))
}

// ---------------------------------------

static inline VALUE cθ_get_repr(const unsigned char angle_mode);

static VALUE θ_m_get_real(const VALUE self);
static VALUE θ_m_set_real(const VALUE self, const VALUE num);

static VALUE θ_m_unary_subtraction(const VALUE self);
static VALUE θ_m_unary_addition(const VALUE self) __attribute__ ((const));
static VALUE θ_m_unary_complement(const VALUE self);
static VALUE θ_m_unary_not(const VALUE self);
static VALUE θ_m_abs(const VALUE self);
static VALUE θ_m_abs_self(VALUE self);
static VALUE θ_m_is_normal(const VALUE self);
static VALUE θ_m_normalize_self(VALUE self);

static VALUE θ_m_addition_eq(const VALUE self, const VALUE value);
static VALUE θ_m_subtraction(const VALUE self, const VALUE value);
static VALUE θ_m_subtraction_eq(const VALUE self, const VALUE value);
static VALUE θ_m_multiplication_eq(const VALUE self, const VALUE value);
static VALUE θ_m_division(const VALUE self, const VALUE value);
static VALUE θ_m_division_eq(const VALUE self, const VALUE value);
static VALUE θ_m_comparable(const VALUE self, const VALUE them);

static VALUE θ_m_equals(const VALUE self, const VALUE them);
static double θ_get_normalized_value(const double value, const unsigned char angle_mode);
static double ptrθ_normalize_and_get_val(ptrθ data);

static inline double θ_get_val_as_mode(const unsigned char angle_mode, const ptrθ them);
static inline long double θ_get_val_precise_as_mode(const unsigned char angle_mode, const ptrθ them);

static inline double ptrθ_get_val_from_θ(const ptrθ self, const ptrθ them);
static inline double ptrθ_get_val_from_VALUE(const ptrθ self, const VALUE value);

static inline void ptrθ_add_d(const ptrθ data, const double value);
static inline void ptrθ_subtract_d(const ptrθ data, const double value);
static inline void ptrθ_multiply_d(const ptrθ data, const double value);
static inline void ptrθ_division_d(const ptrθ data, const double value);

static inline double ptrθ_get_const_quadrant(const ptrθ data);
static inline double ptrθ_get_const_straight(const ptrθ data);
static inline double ptrθ_get_const_perigon(const ptrθ data);
static inline double ptrθ_get_const_perigon_minus_quadrant(const ptrθ data);

// -------------------

static inline VALUE is_theta_angle(const VALUE arg);
static inline VALUE is_theta_angle(const VALUE arg){return rb_obj_is_instance_of(arg, Ⓒtheta_angle);}

#define ptrθ_func(func_name, expr)      static VALUE func_name(const VALUE self);static VALUE func_name(const VALUE self){💎self_to_ptrθ_data; expr}
#define ptrθ_func_1arg(func_name, expr) static VALUE func_name(const VALUE self, const VALUE them);static VALUE func_name(const VALUE self, const VALUE them){💎self_to_ptrθ_data; expr}

// ------------------------------------------------------------------------------------------------------------------

#define θ_ID2MODE(as_id) {\
    switch(as_id) {\
    case (unsigned char) THETA_MODE_ID_RAD:\
        return THETA_MODE_RAD;\
    case (unsigned char) THETA_MODE_ID_DGR:\
        return THETA_MODE_DGR;\
    case (unsigned char) THETA_MODE_ID_TRN:\
        return THETA_MODE_TRN;\
    default:\
        return THETA_MODE_GON;\
    }\
}
// ------------------------------------------------------------------------------------------------------------------

static double θ_get_abs_normalized_value(ptrθ data);

/*static double θ_get_abs_val(ptrθ data);
static double θ_get_abs_val(ptrθ data) {
    if (NO_MATCH_FOR_θ(data, FLAGS_ZERO_AND_POSITIVE)) {
        return -1.0 * data->angle_value;
    }
    return data->angle_value;
}*/

// ------------------------------------------------------------------------------------------------------------------

static double vocab_value_perigon(const unsigned char angle_mode) {
    switch(angle_mode){
    case THETA_MODE_ID_RAD:
        return THETA_RAD_PERIGON;
    case THETA_MODE_ID_DGR:
        return THETA_DGR_PERIGON;
    case THETA_MODE_ID_TRN:
        return THETA_TRN_PERIGON;
    default:
        return THETA_GON_PERIGON;
    }
}

static double vocab_value_perigon_negative(const unsigned char angle_mode) {
    switch(angle_mode){
    case THETA_MODE_ID_RAD:
        return THETA_RAD_PERIGON_NEGATIVE;
    case THETA_MODE_ID_DGR:
        return THETA_DGR_PERIGON_NEGATIVE;
    case THETA_MODE_ID_TRN:
        return THETA_TRN_PERIGON_NEGATIVE;
    default:
        return THETA_GON_PERIGON_NEGATIVE;
    }
}

static double vocab_value_octant(const unsigned char angle_mode) {
    switch(angle_mode){
    case THETA_MODE_ID_RAD:
        return THETA_RAD_OCTANT;
    case THETA_MODE_ID_DGR:
        return THETA_DGR_OCTANT;
    case THETA_MODE_ID_TRN:
        return THETA_TRN_OCTANT;
    default:
        return THETA_GON_OCTANT;
    }
}

static double vocab_value_sextant(const unsigned char angle_mode) {
    switch(angle_mode){
    case THETA_MODE_ID_RAD:
        return THETA_RAD_SEXTANT;
    case THETA_MODE_ID_DGR:
        return THETA_DGR_SEXTANT;
    case THETA_MODE_ID_TRN:
        return THETA_TRN_SEXTANT;
    default:
        return THETA_GON_SEXTANT;
    }
}

static double vocab_value_straight(const unsigned char angle_mode) {
    switch(angle_mode){
    case THETA_MODE_ID_RAD:
        return THETA_RAD_STRAIGHT;
    case THETA_MODE_ID_DGR:
        return THETA_DGR_STRAIGHT;
    case THETA_MODE_ID_TRN:
        return THETA_TRN_STRAIGHT;
    default:
        return THETA_GON_STRAIGHT;
    }
}

static double vocab_value_quadrant(const unsigned char angle_mode) {
    switch(angle_mode){
    case THETA_MODE_ID_RAD:
        return THETA_RAD_QUADRANT;
    case THETA_MODE_ID_DGR:
        return THETA_DGR_QUADRANT;
    case THETA_MODE_ID_TRN:
        return THETA_TRN_QUADRANT;
    default:
        return THETA_GON_QUADRANT;
    }
}

#endif
