// encoding: UTF-8

#ifndef CRUUUBY_H6_FEATURE_MACROS
#include "c6_feature_macros.h"
#endif

#ifndef CRUUUBY_H7_TIME_SERIES_DATA
#define CRUUUBY_H7_TIME_SERIES_DATA


/*            __   __   __   __
   |\/|  /\  /  ` |__) /  \ /__`
   |  | /~~\ \__, |  \ \__/ .__/ */
#define 🛑_time_series_oob(func_name, the_arg)                                  rb_raise(R_ERR_ARG, "| c{TimeSeriesData}-> m{%s} got arg out-of-bounds w/ value{%"PRIsVALUE"}-type{%s} |", func_name, the_arg, rb_obj_classname(the_arg));
#define 🛑_time_series_requires_fixnum_arg(func_name, arg_name, the_arg)         rb_raise(R_ERR_ARG, "| c{TimeSeriesData}-> m{%s} got did get type{Fixnum} for arg(%s){%"PRIsVALUE"} but type{%s} |", func_name, arg_name, the_arg, rb_obj_classname(the_arg));
#define 🛑_time_series_requires_fixnum_or_float_arg(func_name, arg_name, the_arg) rb_raise(R_ERR_ARG, "| c{TimeSeriesData}-> m{%s} got did get type{Fixnum, Float} for arg(%s){%"PRIsVALUE"} but type{%s} |", func_name, arg_name, the_arg, rb_obj_classname(the_arg));
#define 🛑_time_series_is_currently_normalized(func_name)                       rb_raise(R_ERR_RUNTIME, "| c{TimeSeriesData}-> m{%s} may not be performed as this{TimeSeriesData} is currently normalized |", func_name);
#define 🛑check_if_time_series_is_normalized(the_arg, func_name)                if (ptr_ts_flag_is_normalized(the_arg)) {🛑_time_series_is_currently_normalized(func_name)}

// TODO: macros for loops, look into the ext-funcs offered
// TODO: funcs for spawning w/ randomly generated data (ex: sin vs pure-noise vs noise between 0-1.0)
// TODO: multi-dimensional data (w/o reinventing the wheel w/ matrix math)

/*              __
               /\ \__
    ____     __\ \ ,_\  __  __  _____
   /',__\  /'__`\ \ \/ /\ \/\ \/\ '__`\
  /\__, `\/\  __/\ \ \_\ \ \_\ \ \ \L\ \
  \/\____/\ \____\\ \__\\ \____/\ \ ,__/
   \/___/  \/____/ \/__/ \/___/  \ \ \/
                                  \ \_\
                                   \/_/ */

#define TS_FLAG_CONTAINS_VALUE_ZERO 0
#define TS_FLAG_CONTAINS_NO_NEGATIVES 1
#define TS_FLAG_IS_NORMALIZED 2
#define TS_FLAG_IS_LEN_EVEN 3
#define TS_FLAG_IS_STRICTLY_INCREASING 4
#define TS_FLAG_IS_STRICTLY_DECREASING 5
#define TS_FLAG_IS_ALL_SAME 6
#define TS_SET_FLAGS(the_data, the_flags) the_data->flags_meta_data.generic_byte = the_flags;

typedef struct Time_Series_Data {
    double *        vals;
    unsigned long   len;
    double          leeen;
    long double     leeeeeen;
    unsigned long   mem_allocated;
    unsigned long   n;
    BITWISE_FLAGS_8 flags_meta_data;

    /* __        __        ___                   ___  __       __        __   ___
      /  `  /\  /  ` |__| |__     |     /\  \ / |__  |__) .   |__)  /\  /__` |__
      \__, /~~\ \__, |  | |___    |___ /~~\  |  |___ |  \ .   |__) /~~\ .__/ |___ */
    double          cached_mean;
    double          cached_mean_weighted;
    double          cached_mean_geometric;
    double          cached_q1;
    double          cached_median; // the same value as the second quartile Q2
    double          cached_q3;
    double          cached_iqr; // the `Interquartile Range`
    double          cached_max;
    double          cached_min;
    double          cached_range;
    double          cached_variance;
    double          cached_std_dev;
    double          cached_sum;
    double          cached_sum_weighted;
    double          cached_product;
    double          cached_sum_squared;
    double          cached_sum_of_squares;
    double          cached_pearson_correlation_coefficient;
    // TODO: spawn-able chunks/segments
    // TODO: ^ hold off on above shortly, w8 on relating Classes (ex: Monte Carlo simulations, need to determine % ownership between the two on which should handle splitting the data into properly isolated time-segments {ex: `walk forward analysis`})

    /* __        __        ___                   ___  __       __   ___  __          ___  __
      /  `  /\  /  ` |__| |__     |     /\  \ / |__  |__) .   |  \ |__  |__) | \  / |__  |  \
      \__, /~~\ \__, |  | |___    |___ /~~\  |  |___ |  \ .   |__/ |___ |  \ |  \/  |___ |__/ */
    // TODO: consider caching, the % difference noticed between the `mean` and the `geometric mean`

    double cached_boundary_outliers_min;
    double cached_boundary_outliers_max;

    /*___  ___        __   __   __        __                  __        ___        ___      ___      ___    __
       |  |__   |\/| |__) /  \ |__)  /\  |__) \ /    |  |\/| |__) |    |__   |\/| |__  |\ |  |   /\   |  | /  \ |\ |
       |  |___  |  | |    \__/ |  \ /~~\ |  \  |     |  |  | |    |___ |___  |  | |___ | \|  |  /~~\  |  | \__/ | \| */
    // the default value will be{1.0} as default weight utilized is: `1.0 / len_data`cached_sum_weights
    double cached_sum_weights;
} TimeSeriesData;

typedef struct Time_Series_Data * ptr_time_series_data;
#define ptr_time_series ptr_time_series_data

// -------------------------------------------------------------------------------------------------------------------

/*                  __                __            __                   ___  ___
                   /\ \__            /\ \          /\ \__              /'___\/\_ \
    ___ ___      __\ \ ,_\    __     \_\ \     __  \ \ ,_\    __      /\ \__/\//\ \      __       __     ____
  /' __` __`\  /'__`\ \ \/  /'__`\   /'_` \  /'__`\ \ \ \/  /'__`\    \ \ ,__\ \ \ \   /'__`\   /'_ `\  /',__\
  /\ \/\ \/\ \/\  __/\ \ \_/\ \L\.\_/\ \L\ \/\ \L\.\_\ \ \_/\ \L\.\_   \ \ \_/  \_\ \_/\ \L\.\_/\ \L\ \/\__, `\
  \ \_\ \_\ \_\ \____\\ \__\ \__/.\_\ \___,_\ \__/.\_\\ \__\ \__/.\_\   \ \_\   /\____\ \__/.\_\ \____ \/\____/
   \/_/\/_/\/_/\/____/ \/__/\/__/\/_/\/__,_ /\/__/\/_/ \/__/\/__/\/_/    \/_/   \/____/\/__/\/_/\/___L\ \/___/
                                                                                                  /\____/
                                                                                                  \_/__/       */

#define CREATE_FLAG_TS_FUNC_SETTER(func_name, expr, flag_value) static inline void func_name(ptr_time_series data);static inline void func_name(ptr_time_series data){expr = flag_value;}
#define CREATE_FLAG_TS_FUNC_SET_ON(func_name, expr) static inline void func_name(ptr_time_series data);static inline void func_name(ptr_time_series data){expr = FLAG_TRUE;}
#define CREATE_FLAG_TS_FUNC_SET_OFF(func_name, expr) static inline void func_name(ptr_time_series data);static inline void func_name(ptr_time_series data){expr = FLAG_FALSE;}
#define CREATE_FLAG_TS_FUNC_GETTER(func_name, expr) static inline int func_name(ptr_time_series data);static inline int func_name(ptr_time_series data){return expr == FLAG_TRUE;}

CREATE_FLAG_TS_FUNC_SET_ON(ptr_ts_flag_set_contains_zero, data->flags_meta_data.b.b0)
CREATE_FLAG_TS_FUNC_SET_OFF(ptr_ts_flag_clr_contains_zero, data->flags_meta_data.b.b0)
CREATE_FLAG_TS_FUNC_GETTER(ptr_ts_flag_contains_zero, data->flags_meta_data.b.b0)

CREATE_FLAG_TS_FUNC_SET_ON(ptr_ts_flag_set_contains_negative, data->flags_meta_data.b.b1)
CREATE_FLAG_TS_FUNC_SET_OFF(ptr_ts_flag_clr_contains_negative, data->flags_meta_data.b.b1)
CREATE_FLAG_TS_FUNC_GETTER(ptr_ts_flag_contains_negative, data->flags_meta_data.b.b1)

CREATE_FLAG_TS_FUNC_SET_ON(ptr_ts_flag_set_normalized, data->flags_meta_data.b.b2)
CREATE_FLAG_TS_FUNC_SET_OFF(ptr_ts_flag_clr_normalized, data->flags_meta_data.b.b2)
CREATE_FLAG_TS_FUNC_GETTER(ptr_ts_flag_is_normalized, data->flags_meta_data.b.b2)

CREATE_FLAG_TS_FUNC_SET_ON(ptr_ts_flag_set_len_even, data->flags_meta_data.b.b3)
CREATE_FLAG_TS_FUNC_SET_OFF(ptr_ts_flag_clr_len_even, data->flags_meta_data.b.b3)
CREATE_FLAG_TS_FUNC_GETTER(ptr_ts_flag_is_len_even, data->flags_meta_data.b.b3)

CREATE_FLAG_TS_FUNC_SET_ON(ptr_ts_flag_set_strictly_increasing, data->flags_meta_data.b.b4)
CREATE_FLAG_TS_FUNC_SET_OFF(ptr_ts_flag_clr_strictly_increasing, data->flags_meta_data.b.b4)
CREATE_FLAG_TS_FUNC_GETTER(ptr_ts_flag_is_strictly_increasing, data->flags_meta_data.b.b4)

CREATE_FLAG_TS_FUNC_SET_ON(ptr_ts_flag_set_strictly_decreasing, data->flags_meta_data.b.b5)
CREATE_FLAG_TS_FUNC_SET_OFF(ptr_ts_flag_clr_strictly_decreasing, data->flags_meta_data.b.b5)
CREATE_FLAG_TS_FUNC_GETTER(ptr_ts_flag_is_strictly_decreasing, data->flags_meta_data.b.b5)

CREATE_FLAG_TS_FUNC_SET_ON(ptr_ts_flag_set_all_same, data->flags_meta_data.b.b6)
CREATE_FLAG_TS_FUNC_SET_OFF(ptr_ts_flag_clr_all_same, data->flags_meta_data.b.b6)
CREATE_FLAG_TS_FUNC_GETTER(ptr_ts_flag_is_all_same, data->flags_meta_data.b.b6)

static inline void ptr_time_series_set_length(ptr_time_series data, const unsigned long data_len);
static inline void ptr_time_series_set_length(ptr_time_series data, const unsigned long data_len) {
    if (data_len == 0) {
        data->len           = 0UL;
        data->leeen         = 0.0;
        data->leeeeeen      = 0.0L;
        data->mem_allocated = 0UL;
        TS_SET_FLAGS(data, 0x0)
    } else {
        data->len           = data_len;
        data->leeen         = (double) data_len;
        data->leeeeeen      = (long double) data->leeen;
        data->mem_allocated = sizeof(double) * data_len;
        if (data->len % 2 == 0) {
            ptr_ts_flag_set_len_even(data);
        } else {
            ptr_ts_flag_clr_len_even(data);
        }
    }
}

/*                                                           __
                                                            /\ \                 __
    ___ ___      __    ___ ___     ___   _ __   __  __      \_\ \___        ____/\_\  ____      __
  /' __` __`\  /'__`\/' __` __`\  / __`\/\`'__\/\ \/\ \    /\___  __\      /',__\/\ \/\_ ,`\  /'__`\
  /\ \/\ \/\ \/\  __//\ \/\ \/\ \/\ \L\ \ \ \/ \ \ \_\ \   \/__/\ \_/     /\__, `\ \ \/_/  /_/\  __/
  \ \_\ \_\ \_\ \____\ \_\ \_\ \_\ \____/\ \_\  \/`____ \      \ \_\      \/\____/\ \_\/\____\ \____\
   \/_/\/_/\/_/\/____/\/_/\/_/\/_/\/___/  \/_/   `/___/> \      \/_/       \/___/  \/_/\/____/\/____/
                                                    /\___/
                                                    \/__/                                            */

static void   ptr_time_series_free(ptr_time_series data);
static void   _time_series_free(void * data);
static size_t _time_series_size(const void * data);
static size_t ptr_time_series_size(const ptr_time_series data);
static VALUE  time_series_alloc(VALUE self);
static VALUE  time_series_m_free(const VALUE self);

static void ptr_time_series_free(ptr_time_series data) {
    if (data != NULL) {
        if (data->vals != NULL && data->len != 0) {
            xfree(data->vals);
            //data->vals = NULL;
            ptr_time_series_set_length(data, 0.0L);
            data->n = 0L;
        }
    }
}

static void _time_series_free(void * data) {
    if (data != NULL) {
        ptr_time_series_free(data);
        xfree(data);
    }
}

static size_t _time_series_size(const void * data) {return ptr_time_series_size((const ptr_time_series) data);}

static size_t ptr_time_series_size(const ptr_time_series data) {
    if (data->vals != NULL) {return sizeof(TimeSeriesData) + data->mem_allocated;}
    else                    {return sizeof(TimeSeriesData);}
}

static const rb_data_type_t type_time_series = {
    .data             = NULL,
    .flags             = RUBY_TYPED_PROMOTED1,
    .wrap_struct_name = "time_series_data",
    .function         = {
        .dmark = NULL, // NULL as the struct contains no references to the c-data-type{VALUE}
        .dfree = _time_series_free,
        .dsize = _time_series_size,
    },
};

static VALUE time_series_alloc(VALUE self) {
    ptr_time_series data;
    return TypedData_Make_Struct(self, TimeSeriesData, & type_time_series, data);
}

#define 💎parse_ptr_time_series(the_data, the_ptr) TypedData_Get_Struct(the_data, TimeSeriesData, & type_time_series, the_ptr)
#define 💎self_to_ptr_time_series ptr_time_series data; 💎parse_ptr_time_series(self, data);

static VALUE time_series_m_free(const VALUE self) {
    💎self_to_ptr_time_series
    ptr_time_series_free(data);
    return Qnil;
}

/*   ___                         __                                  ___        __
   /'___\                       /\ \__  __                          /\_ \    __/\ \__
  /\ \__/  __  __    ___     ___\ \ ,_\/\_\    ___     ___      __  \//\ \  /\_\ \ ,_\  __  __
  \ \ ,__\/\ \/\ \ /' _ `\  /'___\ \ \/\/\ \  / __`\ /' _ `\  /'__`\  \ \ \ \/\ \ \ \/ /\ \/\ \
   \ \ \_/\ \ \_\ \/\ \/\ \/\ \__/\ \ \_\ \ \/\ \L\ \/\ \/\ \/\ \L\.\_ \_\ \_\ \ \ \ \_\ \ \_\ \
    \ \_\  \ \____/\ \_\ \_\ \____\\ \__\\ \_\ \____/\ \_\ \_\ \__/.\_\/\____\\ \_\ \__\\/`____ \
     \/_/   \/___/  \/_/\/_/\/____/ \/__/ \/_/\/___/  \/_/\/_/\/__/\/_/\/____/ \/_/\/__/ `/___/> \
                                                                                            /\___/
                                                                                            \/__/ */

static inline double ptr_time_series_get_first(ptr_time_series data);
static inline double ptr_time_series_get_last(ptr_time_series data);

static VALUE time_series_m_initialize(VALUE self, VALUE data_points, const VALUE n);
static VALUE time_series_m_get_size(const VALUE self);
static VALUE time_series_m_get_val_at_index(const VALUE self, const VALUE index);
static VALUE time_series_calculate_mean_square_of_errors(const VALUE self, const VALUE them);

static double ptr_time_series_calculate_variance(ptr_time_series data);
static double ptr_time_series_calculate_median(ptr_time_series data);
static double ptr_time_series_calculate_q1(ptr_time_series data);
static double ptr_time_series_calculate_q3(ptr_time_series data);

static VALUE time_series_get_percentile(const VALUE self, const VALUE percentile);
static VALUE time_series_get_nth_percent_rank(const VALUE self, const VALUE index);

static inline VALUE ptr_time_series_get_max(ptr_time_series data);
static inline VALUE ptr_time_series_get_min(ptr_time_series data);
static void ptr_time_series_calculate_standard_cache(ptr_time_series data);
static inline void ptr_time_series_sync_curr(ptr_time_series data, const double val_added);
static inline void ptr_time_series_sync_last(ptr_time_series data, const double val_added);
static void ptr_time_series_calculate_cached_pearson_correlation_coefficient(ptr_time_series data);
static double ptr_time_series_get_percentile_from_dbl(ptr_time_series data, const double the_percentile);
static double ptr_time_series_get_nth_percent_rank(ptr_time_series data, const unsigned long index);

static VALUE time_series_m_get_flags(const VALUE self);
static VALUE time_series_m_get_flags(const VALUE self) {
    💎self_to_ptr_time_series
    return INT2NUM((int) data->flags_meta_data.generic_byte);
}

static double ptr_time_series_calculate_median(ptr_time_series data) {
    if (ptr_ts_flag_is_len_even(data)) {
        return (data->vals[(data->len / 2)] + data->vals[(data->len / 2) - 1]) / 2.0;
    } else {
        return data->vals[(data->len / 2)];
    }
}

// TODO: Q1 & Q3 CALCULATION SHOULD ONLY BE PERFORMED IF THE DATA IS SORTED!!
static double ptr_time_series_calculate_q1(ptr_time_series data) {
    return ptr_time_series_get_percentile_from_dbl(data, 0.25);
}

// TODO: Q1 & Q3 CALCULATION SHOULD ONLY BE PERFORMED IF THE DATA IS SORTED!!
static double ptr_time_series_calculate_q3(ptr_time_series data) {
    return ptr_time_series_get_percentile_from_dbl(data, 0.75);
}

static double ptr_time_series_calculate_variance(ptr_time_series data) {
    double * end       = data->vals + data->len;
    double * iter      = data->vals;
    double _total      = 0.0;
    const double _mean = data->cached_mean;
    while(iter < end) {
        _total += DBL_POW_2((*iter) - _mean);
        iter++;
    }
    return _total / (data->leeen - 1.0);
}

static inline void ptr_time_series_set_cached_mean(ptr_time_series data);
static inline void ptr_time_series_set_cached_pearson_correlation_coefficient(ptr_time_series data, const double the_val);

static inline void ptr_time_series_set_cached_pearson_correlation_coefficient(ptr_time_series data, const double the_val) {
    if (the_val > 1.0) {
        data->cached_pearson_correlation_coefficient = 1.0;
    } else if (the_val < -1.0) {
        data->cached_pearson_correlation_coefficient = -1.0;
    } else {
        data->cached_pearson_correlation_coefficient = the_val;
    }
}

static inline void ptr_time_series_set_cached_mean(ptr_time_series data) {
    const double new_mean = data->cached_sum / data->leeen;
    if (new_mean < 1.0e-12) {
        data->cached_mean           = 0.0;
        data->cached_mean_geometric = 0.0;
        data->cached_mean_weighted  = 0.0;
    } else {
        data->cached_mean           = new_mean;
        data->cached_mean_geometric = DBL_POW_N(data->cached_product, 1.0 / data->leeen);
        data->cached_mean_weighted  = data->cached_sum_weighted / data->cached_sum_weights;
    }
}

static void ptr_time_series_calculate_cached_pearson_correlation_coefficient(ptr_time_series data) {
    const double mean_x  = ((data->leeen * (data->leeen - 1.0)) / 2.0) / data->leeen;
    double numerator     = 0.0;
    double denominator_x = 0.0;
    double denominator_y = 0.0;
    double * end         = data->vals + data->len;
    double * iter        = data->vals;
    double i_dbl         = 0.0;
    while(iter < end) {
        const double curr = (*iter);
        numerator     += (i_dbl - mean_x) * (curr - data->cached_mean);
        denominator_x += DBL_POW_2(i_dbl - mean_x);
        denominator_y += DBL_POW_2(curr - data->cached_mean);
        iter++;
        ++i_dbl;
    }
    const double the_denominator = sqrt(denominator_x) * sqrt(denominator_y);
    if (the_denominator == 0.0) {
        data->cached_pearson_correlation_coefficient = 1.0;
    } else {
        ptr_time_series_set_cached_pearson_correlation_coefficient(data, numerator / the_denominator);
    }
}

static double ptr_time_series_get_nth_percent_rank(ptr_time_series data, const unsigned long index) {
   return ((100.0 / data->leeen) * ((index + 1) - 0.5)) / 100.0;
}

static VALUE time_series_get_nth_percent_rank(const VALUE self, const VALUE index) {
    💎self_to_ptr_time_series
    🛑_is_fixnum("TimeSeriesData", "percent_rank", "index", index)
    const unsigned long val_index = FIX2ULONG(index);
    if (val_index >= data->len) {
        🛑_time_series_oob("percent_rank", index)
    } else {
        return DBL2NUM(ptr_time_series_get_nth_percent_rank(data, val_index));
    }
}

static double ptr_time_series_get_percentile_from_dbl(ptr_time_series data, const double the_percentile);
static double ptr_time_series_get_percentile_from_dbl(ptr_time_series data, const double the_percentile) {
    if (the_percentile == 1.0) {
        return data->cached_max;
    } else if (the_percentile == 0.0) {
        return data->cached_min;
    } else if (isfinite(the_percentile) && the_percentile > 0.0 && the_percentile < 1.0) {
        unsigned long rank_index = 0UL;
        double percent_rank_curr = ptr_time_series_get_nth_percent_rank(data, rank_index);
        if (the_percentile <= percent_rank_curr) {
            return ptr_time_series_get_first(data);
        } else if (the_percentile >= ptr_time_series_get_nth_percent_rank(data, data->len - 1UL)) {
            return ptr_time_series_get_last(data);
        } else {
            double integral;
            const double calculated_index = the_percentile * (data->leeen - 1.0);
            const double index_floor       = floor(calculated_index);
            const double index_ceil       = ceil(calculated_index);
            double fractional             = modf(calculated_index, & integral);
            const double _val_curr = data->vals[(size_t) index_floor];
            if (index_floor == index_ceil) {
                return _val_curr;
            } else {
                const double _val_next = data->vals[(size_t) index_ceil];
                return _val_curr + fractional * (_val_next - _val_curr);
            }
            printf("\nerror scenario!!!!\n");
            return -1337.0;
        }
    } else {
        VALUE as_value = DBL2NUM(the_percentile);
        🛑_time_series_oob("the_percentile", as_value)
    }
}

static VALUE time_series_get_percentile(const VALUE self, const VALUE param_val) {
    if (is_float(param_val)) {
        💎self_to_ptr_time_series
        return DBL2NUM(ptr_time_series_get_percentile_from_dbl(data, NUM2DBL(param_val)));
    } else if (is_fixnum(param_val)) {
        💎self_to_ptr_time_series
        return DBL2NUM(ptr_time_series_get_percentile_from_dbl(data, ((double) (FIX2INT(param_val))) / 100.0));
    } else {🛑_time_series_requires_fixnum_or_float_arg("percentile", "index", param_val)}
}

static void ptr_time_series_calculate_standard_cache(ptr_time_series data) {
    ptr_time_series_set_cached_mean(data);
    data->cached_range                 = data->cached_max - data->cached_min;
    data->cached_median                = ptr_time_series_calculate_median(data);
    data->cached_q1                    = ptr_time_series_calculate_q1(data);
    data->cached_q3                    = ptr_time_series_calculate_q3(data);
    data->cached_iqr                   = data->cached_q3 - data->cached_q1;
    data->cached_boundary_outliers_min = data->cached_q3 - (1.5 * (data->cached_iqr));
    data->cached_boundary_outliers_max = data->cached_q3 + (1.5 * (data->cached_iqr));
    data->cached_variance              = ptr_time_series_calculate_variance(data);
    data->cached_std_dev               = sqrt(data->cached_variance);
    ptr_time_series_calculate_cached_pearson_correlation_coefficient(data);
}

static inline void ptr_time_series_sync_prev_curr(ptr_time_series data, const double val_prev, const double val_curr);
static inline void ptr_time_series_sync_min_max(ptr_time_series data, const double val_added);

static inline void ptr_time_series_sync_pre(ptr_time_series data);
static inline void ptr_time_series_sync_pre(ptr_time_series data) {
    data->cached_min            = GENERIC_DECIMAL_VAL_MAX;
    data->cached_max            = GENERIC_DECIMAL_VAL_MIN;
    data->cached_sum            = 0.0;
    data->cached_sum_weighted   = 0.0;
    data->cached_product        = 1.0;
    data->cached_sum_squared    = 0.0;
    data->cached_sum_of_squares = 0.0;
}

static inline void ptr_time_series_sync_min_max(ptr_time_series data, const double val_added) {
    if (data->cached_min > val_added) {data->cached_min = val_added;}
    if (data->cached_max < val_added) {data->cached_max = val_added;}
}

static inline void ptr_time_series_sync_prev_curr(ptr_time_series data, const double val_prev, const double val_curr) {
    if (ptr_ts_flag_is_strictly_increasing(data) && val_prev > val_curr) {ptr_ts_flag_clr_strictly_increasing(data);}
    if (ptr_ts_flag_is_strictly_decreasing(data) && val_prev < val_curr) {ptr_ts_flag_clr_strictly_decreasing(data);}
    if (ptr_ts_flag_is_all_same(data) && val_prev != val_curr)           {ptr_ts_flag_clr_all_same(data);}
}

static inline void ptr_time_series_sync_curr(ptr_time_series data, const double val_added) {
    if (val_added == 0.0) {
        ptr_ts_flag_set_contains_zero(data);
    } else if (val_added < 0.0) {
        ptr_ts_flag_set_contains_negative(data);
        data->cached_product *= val_added;
    } else {
        data->cached_product *= val_added;
    }
    ptr_time_series_sync_min_max(data, val_added);
    data->cached_sum            += val_added;
    data->cached_sum_weighted   += val_added * (1.0 / data->leeen);
    data->cached_sum_of_squares += DBL_POW_2(val_added);
}

static inline void ptr_time_series_sync_last(ptr_time_series data, const double val_added) {
    ptr_time_series_sync_curr(data, val_added);
    if (ptr_ts_flag_is_all_same(data)) {
        if (ptr_ts_flag_is_strictly_increasing(data)) {ptr_ts_flag_clr_strictly_increasing(data);}
        if (ptr_ts_flag_is_strictly_decreasing(data)) {ptr_ts_flag_clr_strictly_decreasing(data);}
    }
    data->cached_sum_squared = DBL_POW_2(data->cached_sum);
}

static inline void ptr_time_series_update_val_at_position(ptr_time_series data, const double new_value, const unsigned long position);
static inline void ptr_time_series_update_val_at_position(ptr_time_series data, const double new_value, const unsigned long position) {
    if (position == 0) {
        ptr_time_series_sync_pre(data);
        ptr_time_series_sync_curr(data, new_value);
    } else if (position == data->len - 1) {
        ptr_time_series_sync_last(data, new_value);
    } else {
        ptr_time_series_sync_curr(data, new_value);
    }
}

static VALUE time_series_m_initialize(VALUE self, VALUE data_points, const VALUE n) {
    if (!is_ary(data_points) || !is_fixnum(n)) {
        rb_raise(R_ERR_ARG, "| c{TimeSeriesData}-> m{new} expects args of type{Array, Fixnum}, received{%s, %s} of vals{%"PRIsVALUE", %"PRIsVALUE"} |", rb_obj_classname(data_points), rb_obj_classname(n), data_points, n);
    }
    const unsigned long len_data_points = (unsigned long) r_ary_len(data_points);
    if (len_data_points < (unsigned long) TIME_SERIES_DATA_MIN_LEN) {
        rb_raise(R_ERR_ARG, "| c{TimeSeriesData}-> m{new} expects arg(data_points} to have at least{%d} vals, not the provided{%ld} |", TIME_SERIES_DATA_MIN_LEN, len_data_points);
    }
    💎self_to_ptr_time_series
    TS_SET_FLAGS(data, 0x0)
    ptr_time_series_set_length(data, (unsigned long) r_ary_len(data_points));
    data->cached_sum_weights = 1.0;
    data->n                  = FIX2INT(n);
    data->vals               = 💎create_ptr_dbls(data->len);
    unsigned long i;
    ptr_ts_flag_set_strictly_increasing(data);
    ptr_ts_flag_set_strictly_decreasing(data);
    ptr_ts_flag_set_all_same(data);
    double curr   = NUM2DBL(r_ary_get_first(data_points));
    double prev   = curr;
    data->vals[0] = curr;
    ptr_time_series_sync_pre(data);
    ptr_time_series_sync_curr(data, curr);
    for (i = 1; i < len_data_points - 1; i++) {
        prev          = curr;
        curr          = NUM2DBL(r_ary_get(data_points, i));
        ptr_time_series_sync_prev_curr(data, prev, curr);
        data->vals[i] = curr;
        ptr_time_series_sync_curr(data, curr);
    }
    prev          = curr;
    curr          = NUM2DBL(r_ary_get(data_points, i));
    ptr_time_series_sync_prev_curr(data, prev, curr);
    data->vals[i] = curr;
    ptr_time_series_sync_last(data, curr);
    ptr_time_series_calculate_standard_cache(data);
    re_me
}

static VALUE time_series_m_get_size(const VALUE self){re_me_mem_size}

static VALUE time_series_m_get_val_at_index(const VALUE self, const VALUE index) {
    🛑_is_fixnum("TimeSeriesData", "mse", "index", index)
    💎self_to_ptr_time_series
    const int i = NUM2INT(index);
    if (i < 0 || (unsigned long) i >= data->len) {
        rb_raise(R_ERR_ARG, "| c{TimeSeriesData}-> m{[]} for arg(index){%"PRIsVALUE"} which is < 0 or >= data->len{%ld} |", index, data->len);
    }
    return DBL2NUM(data->vals[i]);
}

static VALUE time_series_print_debugging(const VALUE self);
static VALUE time_series_print_debugging(const VALUE self) {
    💎self_to_ptr_time_series
    double * end  = data->vals + data->len;
    double * iter = data->vals;
    long i        = 0;
    while(iter < end) {
        printf("\t[%ld]: {%f}\n", i, (*iter));
        ++i;
        iter++;
    }
    re_me
}

static VALUE time_series_self_normalize(const VALUE self) {
    💎self_to_ptr_time_series
    if (data->cached_std_dev == 0.0) {
        rb_raise(R_ERR_RUNTIME, "| c{TimeSeriesData}-> m{normalize!} may not be performed when the field(std_dev) has val{0.0} |");
    }
    🛑check_if_time_series_is_normalized(data, "normalize!");
    double * end  = data->vals + data->len;
    double * iter = data->vals;
    long i        = 0;
    ptr_time_series_sync_pre(data);
    ptr_ts_flag_set_normalized(data);
    while(iter < end) {
        data->vals[i] -= data->cached_mean;
        data->vals[i] /= data->cached_std_dev;
        ptr_time_series_update_val_at_position(data, data->vals[i], (unsigned long) i);
        ++i;
        iter++;
    }
    ptr_time_series_calculate_standard_cache(data);
    re_me
}

static VALUE time_series_self_scale_by_addition(const VALUE self, const VALUE scale_by);
static VALUE time_series_self_scale_by_addition(const VALUE self, const VALUE scale_by) {
    if (is_fixnum(scale_by)) {
        💎self_to_ptr_time_series
        const int val_them = FIX2INT(scale_by);
        🛑check_if_time_series_is_normalized(data, "scale_by_addition");
        double * end  = data->vals + data->len;
        double * iter = data->vals;
        long i        = 0;
        ptr_time_series_sync_pre(data);
        while(iter < end) {
            data->vals[i] += (double) val_them;
            ptr_time_series_update_val_at_position(data, data->vals[i], (unsigned long) i);
            ++i;
            iter++;
        }
        ptr_time_series_calculate_standard_cache(data);
        re_me
    } else if (is_float(scale_by)) {
        💎self_to_ptr_time_series
        const double val_them = NUM2DBL(scale_by);
        if (isfinite(val_them)) {
            🛑check_if_time_series_is_normalized(data, "scale_by_addition");
            double * end  = data->vals + data->len;
            double * iter = data->vals;
            long i        = 0;
            ptr_time_series_sync_pre(data);
            while(iter < end) {
                data->vals[i] += val_them;
                ptr_time_series_update_val_at_position(data, data->vals[i], (unsigned long) i);
                ++i;
                iter++;
            }
            ptr_time_series_calculate_standard_cache(data);
            re_me
        } else {🛑_time_series_oob("scale_by_addition", scale_by)}
    } else {🛑_time_series_requires_fixnum_or_float_arg("scale_by_addition", "scale_by", scale_by)}
}

static VALUE time_series_self_scale_by_multiplication(const VALUE self, const VALUE scale_by);
static VALUE time_series_self_scale_by_multiplication(const VALUE self, const VALUE scale_by) {
    if (is_fixnum(scale_by)) {
        💎self_to_ptr_time_series
        const int val_them = FIX2INT(scale_by);
        🛑check_if_time_series_is_normalized(data, "scale_by_multiplication");
        double * end  = data->vals + data->len;
        double * iter = data->vals;
        long i        = 0;
        ptr_time_series_sync_pre(data);
        while(iter < end) {
            data->vals[i] *= (double) val_them;
            ptr_time_series_update_val_at_position(data, data->vals[i], (unsigned long) i);
            ++i;
            iter++;
        }
        ptr_time_series_calculate_standard_cache(data);
        re_me
    } else if (is_float(scale_by)) {
        💎self_to_ptr_time_series
        const double val_them = NUM2DBL(scale_by);
        if (isfinite(val_them)) {
            🛑check_if_time_series_is_normalized(data, "scale_by_multiplication");
            double * end  = data->vals + data->len;
            double * iter = data->vals;
            long i        = 0;
            ptr_time_series_sync_pre(data);
            while(iter < end) {
                data->vals[i] *= val_them;
                ptr_time_series_update_val_at_position(data, data->vals[i], (unsigned long) i);
                ++i;
                iter++;
            }
            ptr_time_series_calculate_standard_cache(data);
            re_me
        } else {🛑_time_series_oob("scale_by_multiplication", scale_by)}
    } else {🛑_time_series_requires_fixnum_or_float_arg("scale_by_multiplication", "scale_by", scale_by)}
}

static VALUE time_series_calculate_mean_square_of_errors(const VALUE self, const VALUE them) {
    🛑_is_ary("TimeSeriesData", "mse", "data_points", them)
    💎self_to_ptr_time_series
    const unsigned long len_them = r_ary_len(them);
    if (len_them != data->len) {
        rb_raise(R_ERR_ARG, "| c{TimeSeriesData}-> m{mse} expects arg(data_points} to be an ary of len{%ld}, not the received len{%ld} |", data->len, len_them);
    }
    double * end  = data->vals + data->len;
    double * iter = data->vals;
    long i        = 0;
    double _total = 0.0;
    while(iter < end) {
        const double val_v = NUM2DBL(r_ary_get(them, i));
        _total += pow((*iter) - val_v, 2.0);
        ++i;
        iter++;
    }
    return DBL2NUM(_total / (data->leeen - 1.0));
}

static VALUE time_series_calculate_mean_absolute_percentage_error(const VALUE self, const VALUE them) {
    🛑_is_ary("TimeSeriesData", "mape", "data_points", them)
    💎self_to_ptr_time_series
    const unsigned long len_them = r_ary_len(them);
    if (len_them != data->len) {
        rb_raise(R_ERR_ARG, "| c{TimeSeriesData}-> m{mape} expects arg(data_points} to be an ary of len{%ld}, not the received len{%ld} |", data->len, len_them);
    }
    if (ptr_ts_flag_contains_zero(data)) {
        rb_raise(R_ERR_RUNTIME, "| c{TimeSeriesData}-> m{mape} called when the base-data contains the value{0} |");
    }
    double * end  = data->vals + data->len;
    double * iter = data->vals;
    long i        = 0;
    double _total = 0.0;
    while (iter < end) {
        _total += relative_error_dbl(NUM2DBL(r_ary_get(them, i)), *iter);
        iter++;
        ++i;
    }
    return DBL2NUM(_total / data->leeen);
}

/*      ___       __   ___  __      __   ___ ___ ___  ___  __   __
  |__| |__  |    |__) |__  |__)    / _` |__   |   |  |__  |__) /__`
  |  | |___ |___ |    |___ |  \    \__> |___  |   |  |___ |  \ .__/ */
static inline double ptr_time_series_get_first(ptr_time_series data){return data->vals[0];}
static inline double ptr_time_series_get_last(ptr_time_series data){return data->vals[data->len - 1];}

static inline VALUE ptr_time_series_get_max(ptr_time_series data) {return DBL2NUM(data->cached_max);}
static inline VALUE ptr_time_series_get_min(ptr_time_series data) {return DBL2NUM(data->cached_min);}

/*                      __                 __         ___             ___       __
                       /\ \               /\ \      /'___\ __        /\_ \     /\ \
    ___     __      ___\ \ \___      __   \_\ \    /\ \__//\_\     __\//\ \    \_\ \    ____
   /'___\ /'__`\   /'___\ \  _ `\  /'__`\ /'_` \   \ \ ,__\/\ \  /'__`\\ \ \   /'_` \  /',__\
  /\ \__//\ \L\.\_/\ \__/\ \ \ \ \/\  __//\ \L\ \   \ \ \_/\ \ \/\  __/ \_\ \_/\ \L\ \/\__, `\
  \ \____\ \__/.\_\ \____\\ \_\ \_\ \____\ \___,_\   \ \_\  \ \_\ \____\/\____\ \___,_\/\____/
   \/____/\/__/\/_/\/____/ \/_/\/_/\/____/\/__,_ /    \/_/   \/_/\/____/\/____/\/__,_ /\/___/ */

#define ⓡ𝑓_ptr_time_series(func_name, expr)            static VALUE func_name(const VALUE self){💎self_to_ptr_time_series; expr}
#define ⓡ𝑓_ptr_time_series_getter(func_name, expr)     static VALUE func_name(const VALUE self){💎self_to_ptr_time_series; return expr;}
#define ⓡ𝑓_ptr_time_series_getter_dbl(func_name, expr) static VALUE func_name(const VALUE self){💎self_to_ptr_time_series; return DBL2NUM(expr);}

static VALUE time_series_get_cached_pearson_correlation_coefficient(const VALUE self);
static VALUE time_series_get_cached_variance(const VALUE self);
static VALUE time_series_get_cached_std_dev(const VALUE self);
static VALUE time_series_get_cached_range(const VALUE self);
static VALUE time_series_get_cached_mean(const VALUE self);
static VALUE time_series_get_cached_mean_weighted(const VALUE self);
static VALUE time_series_get_cached_mean_geometric(const VALUE self);
static VALUE time_series_get_cached_median(const VALUE self);
static VALUE time_series_get_cached_q1(const VALUE self);
static VALUE time_series_get_cached_q3(const VALUE self);
static VALUE time_series_get_cached_iqr(const VALUE self);
static VALUE time_series_get_cached_boundary_outliers_max(const VALUE self);
static VALUE time_series_get_cached_boundary_outliers_min(const VALUE self);
static VALUE time_series_get_cached_max(const VALUE self);
static VALUE time_series_get_cached_min(const VALUE self);
static VALUE time_series_get_cached_sum(const VALUE self);
static VALUE time_series_get_cached_sum_weighted(const VALUE self);
static VALUE time_series_get_cached_product(const VALUE self);
static VALUE time_series_get_cached_sum_squared(const VALUE self);
static VALUE time_series_get_cached_sum_of_squares(const VALUE self);
static VALUE time_series_get_len(const VALUE self);
static VALUE time_series_get_first(const VALUE self);
static VALUE time_series_get_last(const VALUE self);
static VALUE time_series_has_zero(const VALUE self);
static VALUE time_series_has_negative(const VALUE self);
static VALUE time_series_is_normalized(const VALUE self);
static VALUE time_series_is_even(const VALUE self);
static VALUE time_series_is_strictly_increasing(const VALUE self);
static VALUE time_series_is_strictly_decreasing(const VALUE self);
static VALUE time_series_is_all_same(const VALUE self);

ⓡ𝑓_ptr_time_series(time_series_is_all_same, re_as_bool(ptr_ts_flag_is_all_same(data)))
ⓡ𝑓_ptr_time_series(time_series_is_strictly_decreasing, re_as_bool(ptr_ts_flag_is_strictly_decreasing(data)))
ⓡ𝑓_ptr_time_series(time_series_is_strictly_increasing, re_as_bool(ptr_ts_flag_is_strictly_increasing(data)))
ⓡ𝑓_ptr_time_series(time_series_is_even, re_as_bool(ptr_ts_flag_is_len_even(data)))
ⓡ𝑓_ptr_time_series(time_series_has_zero, re_as_bool(ptr_ts_flag_contains_zero(data)))
ⓡ𝑓_ptr_time_series(time_series_has_negative, re_as_bool(ptr_ts_flag_contains_negative(data)))
ⓡ𝑓_ptr_time_series(time_series_is_normalized, re_as_bool(ptr_ts_flag_is_normalized(data)))
ⓡ𝑓_ptr_time_series_getter(time_series_get_len, ULONG2NUM(data->len))
ⓡ𝑓_ptr_time_series_getter_dbl(time_series_get_first, ptr_time_series_get_first(data))
ⓡ𝑓_ptr_time_series_getter_dbl(time_series_get_last, ptr_time_series_get_last(data))
ⓡ𝑓_ptr_time_series_getter_dbl(time_series_get_cached_sum, data->cached_sum)
ⓡ𝑓_ptr_time_series_getter_dbl(time_series_get_cached_sum_weighted, data->cached_sum_weighted)
ⓡ𝑓_ptr_time_series_getter_dbl(time_series_get_cached_product, data->cached_product)
ⓡ𝑓_ptr_time_series_getter_dbl(time_series_get_cached_sum_squared, data->cached_sum_squared)
ⓡ𝑓_ptr_time_series_getter_dbl(time_series_get_cached_sum_of_squares, data->cached_sum_of_squares)
ⓡ𝑓_ptr_time_series_getter_dbl(time_series_get_cached_pearson_correlation_coefficient, data->cached_pearson_correlation_coefficient)
ⓡ𝑓_ptr_time_series_getter_dbl(time_series_get_cached_variance, data->cached_variance)
ⓡ𝑓_ptr_time_series_getter_dbl(time_series_get_cached_std_dev, data->cached_std_dev)
ⓡ𝑓_ptr_time_series_getter_dbl(time_series_get_cached_range, data->cached_range)

ⓡ𝑓_ptr_time_series_getter_dbl(time_series_get_cached_boundary_outliers_min, data->cached_boundary_outliers_min)
ⓡ𝑓_ptr_time_series_getter_dbl(time_series_get_cached_boundary_outliers_max, data->cached_boundary_outliers_max)

ⓡ𝑓_ptr_time_series_getter_dbl(time_series_get_cached_mean, data->cached_mean)
ⓡ𝑓_ptr_time_series_getter_dbl(time_series_get_cached_mean_weighted, data->cached_mean_weighted)
ⓡ𝑓_ptr_time_series_getter_dbl(time_series_get_cached_mean_geometric, data->cached_mean_geometric)
ⓡ𝑓_ptr_time_series_getter_dbl(time_series_get_cached_median, data->cached_median)
ⓡ𝑓_ptr_time_series_getter_dbl(time_series_get_cached_q1, data->cached_q1)
ⓡ𝑓_ptr_time_series_getter_dbl(time_series_get_cached_q3, data->cached_q3)
ⓡ𝑓_ptr_time_series_getter_dbl(time_series_get_cached_iqr, data->cached_iqr)
ⓡ𝑓_ptr_time_series(time_series_get_cached_max, return ptr_time_series_get_max(data);)
ⓡ𝑓_ptr_time_series(time_series_get_cached_min, return ptr_time_series_get_min(data);)

/*                          __
                           /\ \          __
   __  __  __    ___   _ __\ \ \/'\     /\_\    ___       _____   _ __   ___      __   _ __    __    ____    ____
  /\ \/\ \/\ \  / __`\/\`'__\ \ , <     \/\ \ /' _ `\    /\ '__`\/\`'__\/ __`\  /'_ `\/\`'__\/'__`\ /',__\  /',__\
  \ \ \_/ \_/ \/\ \L\ \ \ \/ \ \ \\`\    \ \ \/\ \/\ \   \ \ \L\ \ \ \//\ \L\ \/\ \L\ \ \ \//\  __//\__, `\/\__, `\
   \ \___x___/'\ \____/\ \_\  \ \_\ \_\   \ \_\ \_\ \_\   \ \ ,__/\ \_\\ \____/\ \____ \ \_\\ \____\/\____/\/\____/
    \/__//__/   \/___/  \/_/   \/_/\/_/    \/_/\/_/\/_/    \ \ \/  \/_/ \/___/  \/___L\ \/_/ \/____/\/___/  \/___/
                                                            \ \_\                 /\____/
                                                             \/_/                 \_/__/                           */


#endif
