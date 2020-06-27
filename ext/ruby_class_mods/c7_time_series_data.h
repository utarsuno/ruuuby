// encoding: UTF-8

#ifndef CRUUUBY_H6_FEATURE_MACROS
#include "c6_feature_macros.h"
#endif

#ifndef CRUUUBY_H7_TIME_SERIES_DATA
#define CRUUUBY_H7_TIME_SERIES_DATA

typedef struct Time_Series_Data {
    double * vals;
    unsigned long len;
    double leeen;
    unsigned long mem_allocated;
    unsigned long n;
    double cached_mean;
    double cached_median;
    double cached_max;
    double cached_min;
    double cached_range;
    double cached_variance;
    double cached_std_dev;
    double cached_sum;
    // TODO: spawn-able chunks/segments
} TimeSeriesData;

typedef struct Time_Series_Data * ptr_time_series_data;
#define ptr_time_series ptr_time_series_data

static void ptr_time_series_free_content(ptr_time_series data);
static void time_series_free(void * data);
static size_t ptr_time_series_size(const ptr_time_series data);
static size_t time_series_size(const void * data);
static VALUE time_series_alloc(VALUE self);

static void ptr_time_series_free_content(ptr_time_series data) {
    if (data != NULL) {
        if (data->vals != NULL) {
            free(data->vals);
            data->vals          = NULL;
            data->len           = 0;
            data->leeen         = 0.0;
            data->mem_allocated = 0.0;
        }
    }
}

static void time_series_free(void * data) {
    if (data != NULL) {
        ptr_time_series_free_content(data);
        xfree(data);
    }
}

static size_t ptr_time_series_size(const ptr_time_series data) {
    if (data->vals != NULL) {
        return sizeof(TimeSeriesData) + data->mem_allocated;
    } else {
        return sizeof(TimeSeriesData);
    }
}

static size_t time_series_size(const void * data) {return ptr_time_series_size((const ptr_time_series) data);}

static const rb_data_type_t time_series_type = {
    .data             = NULL,
    .flags             = RUBY_TYPED_PROMOTED1,
    .wrap_struct_name = "time_series_data",
    .function         = {
        .dmark = NULL, // NULL as the struct contains no references to the c-data-type{VALUE}
        .dfree = time_series_free,
        .dsize = time_series_size,
    },
};

static VALUE time_series_alloc(VALUE self) {
    ptr_time_series data;
    return TypedData_Make_Struct(self, TimeSeriesData, & time_series_type, data);
}

#define 💎parse_ptr_time_series(the_data, the_ptr) TypedData_Get_Struct(the_data, TimeSeriesData, & time_series_type, the_ptr)
#define 💎self_to_ptr_time_series ptr_time_series data; 💎parse_ptr_time_series(self, data);

static VALUE time_series_m_free(const VALUE self);
static VALUE time_series_m_free(const VALUE self) {
    💎self_to_ptr_time_series
    ptr_time_series_free_content(data);
    return Qnil;
}

static double ptr_time_series_calculate_median(ptr_time_series data);
static double ptr_time_series_calculate_variance(ptr_time_series data);

static double ptr_time_series_calculate_median(ptr_time_series data) {
    if (data->len % 2 == 0) {
        return (data->vals[(data->len / 2)] + data->vals[(data->len / 2) - 1]) / 2.0;
    } else {
        return data->vals[(data->len / 2)];
    }
}

static double ptr_time_series_calculate_variance(ptr_time_series data) {
    double * end       = data->vals + data->len;
    double * iter      = data->vals;
    double _total      = 0.0;
    const double _mean = data->cached_mean;
    while(iter < end) {
        _total += pow((*iter) - _mean, 2.0);
        iter++;
    }
    return _total / (data->leeen - 1.0);
}

static VALUE time_series_m_initialize(VALUE self, VALUE data_points, const VALUE n);
static VALUE time_series_m_initialize(VALUE self, VALUE data_points, const VALUE n) {
    if (!is_ary(data_points) || !is_fixnum(n)) {
        rb_raise(R_ERR_ARG, "| c{TimeSeriesData}-> m{new} expects args of type{Array, Fixnum}, received{%s, %s} of vals{%"PRIsVALUE", %"PRIsVALUE"} |", rb_obj_classname(data_points), rb_obj_classname(n), data_points, n);
    }
    const unsigned long len_data_points = (unsigned long) r_ary_len(data_points);
    if (len_data_points <= 2l) {
        rb_raise(R_ERR_ARG, "| c{TimeSeriesData}-> m{new} expects arg(data_points} to have at least{3} vals, not the provided{%ld} |", len_data_points);
    }
    data_points = rb_ary_sort(data_points);

    💎self_to_ptr_time_series
    data->n             = FIX2INT(n);
    data->len           = (unsigned long) r_ary_len(data_points);
    data->leeen         = ((double) data->len);
    data->mem_allocated = sizeof(double) * data->len;
    data->vals          = ALLOC_N(double, data->len);

    double total        = 0.0;
    double val_min      = 1.7976931348623157e+100;
    double val_max      = 1.7976931348623157e-100;
    unsigned long i;
    VALUE v;
    for (i = 0; i < len_data_points; i++) {
        v                    = r_ary_get(data_points, (long) i)
        const double curr    = NUM2DBL(v);
        (* (data->vals + i)) = curr;
        total               += curr;
        if (val_min > curr) {
            val_min = curr;
        } else if (val_max < curr) {
            val_max = curr;
        }
    }
    data->cached_sum      = total;
    data->cached_mean     = total / data->leeen;
    data->cached_max      = val_max;
    data->cached_min      = val_min;
    data->cached_range    = val_max - val_min;
    data->cached_median   = ptr_time_series_calculate_median(data);
    data->cached_variance = ptr_time_series_calculate_variance(data);
    data->cached_std_dev  = sqrt(data->cached_variance);

    re_me
}

static VALUE time_series_m_get_size(const VALUE self);
static VALUE time_series_m_get_size(const VALUE self){re_me_mem_size}

static VALUE get_val_at_index(const VALUE self, const VALUE index);
static VALUE get_val_at_index(const VALUE self, const VALUE index) {
    if (is_fixnum(index)) {
        💎self_to_ptr_time_series
        const int i = NUM2INT(index);
        if (i < 0 || (unsigned long) i >= data->len) {
            rb_raise(R_ERR_ARG, "| c{TimeSeriesData}-> m{[]} for arg(index){%"PRIsVALUE"} which is < 0 or >= data->len{%ld} |", index, data->len);
        }
        const double curr = data->vals[i];
        return DBL2NUM(curr);
    } else {
        rb_raise(R_ERR_ARG, "| c{TimeSeriesData}-> m{[]} got did get type{Fixnum} for arg(index){%"PRIsVALUE"} but type{%s} |", index, rb_obj_classname(index));
    }
}

static VALUE time_series_calculate_mean_square_of_errors(const VALUE self, const VALUE them);
static VALUE time_series_calculate_mean_square_of_errors(const VALUE self, const VALUE them) {
    if (!is_ary(them)) {
        rb_raise(R_ERR_ARG, "| c{TimeSeriesData}-> m{mse} expects arg(data_points} to be an ary, not{%"PRIsVALUE"} of type{%s} |", them, rb_obj_classname(them));
    }
    💎self_to_ptr_time_series
    const unsigned long len_them = r_ary_len(them);
    if (len_them != data->len) {
        rb_raise(R_ERR_ARG, "| c{TimeSeriesData}-> m{mse} expects arg(data_points} to be an ary of len{%ld}, not the received len{%ld} |", data->len, len_them);
    }
    VALUE v;
    double * end  = data->vals + data->len;
    double * iter = data->vals;
    long i        = 0;
    double _total = 0.0;
    while(iter < end) {
        v = r_ary_get(them, i);
        const double val_v = NUM2DBL(v);
        _total += pow((*iter) - val_v, 2.0);
        ++i;
        iter++;
    }
    return DBL2NUM(_total / (data->leeen - 1.0));
}

/*                      __                 __         ___             ___       __
                       /\ \               /\ \      /'___\ __        /\_ \     /\ \
    ___     __      ___\ \ \___      __   \_\ \    /\ \__//\_\     __\//\ \    \_\ \    ____
   /'___\ /'__`\   /'___\ \  _ `\  /'__`\ /'_` \   \ \ ,__\/\ \  /'__`\\ \ \   /'_` \  /',__\
  /\ \__//\ \L\.\_/\ \__/\ \ \ \ \/\  __//\ \L\ \   \ \ \_/\ \ \/\  __/ \_\ \_/\ \L\ \/\__, `\
  \ \____\ \__/.\_\ \____\\ \_\ \_\ \____\ \___,_\   \ \_\  \ \_\ \____\/\____\ \___,_\/\____/
   \/____/\/__/\/_/\/____/ \/_/\/_/\/____/\/__,_ /    \/_/   \/_/\/____/\/____/\/__,_ /\/___/ */

static VALUE get_cached_variance(const VALUE self);
static VALUE get_cached_std_dev(const VALUE self);
static VALUE get_cached_range(const VALUE self);
static VALUE get_cached_mean(const VALUE self);
static VALUE get_cached_median(const VALUE self);
static VALUE get_cached_max(const VALUE self);
static VALUE get_cached_min(const VALUE self);
static VALUE get_cached_sum(const VALUE self);
static VALUE time_series_get_len(const VALUE self);

static VALUE time_series_get_len(const VALUE self) {
    💎self_to_ptr_time_series
    return ULONG2NUM(data->len);
}

static VALUE get_cached_sum(const VALUE self) {
    💎self_to_ptr_time_series
    return DBL2NUM(data->cached_sum);
}

static VALUE get_cached_variance(const VALUE self) {
    💎self_to_ptr_time_series
    return DBL2NUM(data->cached_variance);
}

static VALUE get_cached_std_dev(const VALUE self) {
    💎self_to_ptr_time_series
    return DBL2NUM(data->cached_std_dev);
}

static VALUE get_cached_range(const VALUE self) {
    💎self_to_ptr_time_series
    return DBL2NUM(data->cached_range);
}

static VALUE get_cached_mean(const VALUE self) {
    💎self_to_ptr_time_series
    return DBL2NUM(data->cached_mean);
}

static VALUE get_cached_median(const VALUE self) {
    💎self_to_ptr_time_series
    return DBL2NUM(data->cached_median);
}

static VALUE get_cached_max(const VALUE self) {
    💎self_to_ptr_time_series
    return DBL2NUM(data->cached_max);
}

static VALUE get_cached_min(const VALUE self) {
    💎self_to_ptr_time_series
    return DBL2NUM(data->cached_min);
}

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
