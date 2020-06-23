// encoding: UTF-8

/*____________________________________________________________________________________________________________________________________________________________________
         __   __        __                  __   __   __  ___  __
 |    | |__) |__)  /\  |__) \ /    |  |\/| |__) /  \ |__)  |  /__`
 |___ | |__) |  \ /~~\ |  \  |     |  |  | |    \__/ |  \  |  .__/
____________________________________________________________________________________________________________________________________________________________________ */

#ifndef CRUUUBY_H4_THETA_ANGLE
#include "c4_theta_angle.h"
#endif

#ifndef CRUUUBY_H5_INTERNAL_STRUCTS
#define CRUUUBY_H5_INTERNAL_STRUCTS

/*                                                                 __         ___        __
                                                                  /\ \__  __ /\_ \    __/\ \__  __
    ___ ___      __    ___ ___     ___   _ __   __  __      __  __\ \ ,_\/\_\\//\ \  /\_\ \ ,_\/\_\     __    ____
  /' __` __`\  /'__`\/' __` __`\  / __`\/\`'__\/\ \/\ \    /\ \/\ \\ \ \/\/\ \ \ \ \ \/\ \ \ \/\/\ \  /'__`\ /',__\
  /\ \/\ \/\ \/\  __//\ \/\ \/\ \/\ \L\ \ \ \/ \ \ \_\ \   \ \ \_\ \\ \ \_\ \ \ \_\ \_\ \ \ \ \_\ \ \/\  __//\__, `\
  \ \_\ \_\ \_\ \____\ \_\ \_\ \_\ \____/\ \_\  \/`____ \   \ \____/ \ \__\\ \_\/\____\\ \_\ \__\\ \_\ \____\/\____/
   \/_/\/_/\/_/\/____/\/_/\/_/\/_/\/___/  \/_/   `/___/> \   \/___/   \/__/ \/_/\/____/ \/_/\/__/ \/_/\/____/\/___/
                                                    /\___/
                                                    \/__/                                                           */

// @see https://www.man7.org/linux/man-pages/man2/getrusage.2.html
// @see https://pubs.opengroup.org/onlinepubs/009695399/functions/getrusage.html

static double memory_peak_this_runtime(void);
static double memory_peak_this_runtime() {
    struct rusage r_usage;
    getrusage(RUSAGE_SELF,&r_usage);
    return ((double) (r_usage.ru_maxrss)) / 1024.0;
}

static VALUE m_memory_peak_this_runtime(const VALUE self);
static VALUE m_memory_peak_this_runtime(const VALUE self) {
    return DBL2NUM(memory_peak_this_runtime());
}

#define stats_memory_track(rusage){\
    getrusage(RUSAGE_SELF, rusage);\
}

static inline void print_flt_as_mem(const double dbl) {
    printf("KB{%f}, MB{%f}\n", dbl, dbl / 1024.0);
}

/*                              ___               __
         __                    /\_ \             /\ \__  __
    ____/\_\    ___ ___   _____\//\ \      __    \ \ ,_\/\_\    ___ ___      __   _ __
   /',__\/\ \ /' __` __`\/\ '__`\\ \ \   /'__`\   \ \ \/\/\ \ /' __` __`\  /'__`\/\`'__\
  /\__, `\ \ \/\ \/\ \/\ \ \ \L\ \\_\ \_/\  __/    \ \ \_\ \ \/\ \/\ \/\ \/\  __/\ \ \/
  \/\____/\ \_\ \_\ \_\ \_\ \ ,__//\____\ \____\    \ \__\\ \_\ \_\ \_\ \_\ \____\\ \_\
   \/___/  \/_/\/_/\/_/\/_/\ \ \/ \/____/\/____/     \/__/ \/_/\/_/\/_/\/_/\/____/ \/_/
                            \ \_\
                             \/_/                                                       */

typedef struct SimpleTimerStruct {
    struct timespec time_start;
    struct timespec time_end;
} SimpleTimer;

void simple_timer_start(SimpleTimer * simple_timer);
void simple_timer_end(SimpleTimer * simple_timer);
void simple_timer_print_delta(SimpleTimer * simple_timer, const char * description);

void simple_timer_start(SimpleTimer * simple_timer) {
    clock_gettime(CLOCK_MONOTONIC_RAW, & ((* simple_timer).time_start));
}

void simple_timer_end(SimpleTimer * simple_timer) {
    clock_gettime(CLOCK_MONOTONIC_RAW, & ((* simple_timer).time_end));
}

void simple_timer_print_delta(SimpleTimer * simple_timer, const char * description) {
    // source from: https://stackoverflow.com/questions/10192903/time-in-milliseconds-in-c
    const uint64_t delta_us = (simple_timer->time_end.tv_sec - simple_timer->time_start.tv_sec) * 1000000 + (simple_timer->time_end.tv_nsec - simple_timer->time_start.tv_nsec) / 1000;
    printf("%s %" PRIu64 " ms, or{%" PRIu64 "} microseconds\n", description, delta_us / 1000, delta_us);
}

/*                               __
                                /\ \                                         __
   _ __   __  __  __  __  __  __\ \ \____  __  __         __    ___      __ /\_\    ___      __
  /\`'__\/\ \/\ \/\ \/\ \/\ \/\ \\ \ '__`\/\ \/\ \      /'__`\/' _ `\  /'_ `\/\ \ /' _ `\  /'__`\
  \ \ \/ \ \ \_\ \ \ \_\ \ \ \_\ \\ \ \L\ \ \ \_\ \    /\  __//\ \/\ \/\ \L\ \ \ \/\ \/\ \/\  __/
   \ \_\  \ \____/\ \____/\ \____/ \ \_,__/\/`____ \   \ \____\ \_\ \_\ \____ \ \_\ \_\ \_\ \____\
    \/_/   \/___/  \/___/  \/___/   \/___/  `/___/> \   \/____/\/_/\/_/\/___L\ \/_/\/_/\/_/\/____/
                                               /\___/                    /\____/
                                               \/__/                     \_/__/                   */

static void establish_logging_mode(void);
static void establish_logging_mode() {
    const char * s = getenv("RUUUBY_FULL_DEBUG");
    if (s != NULL && (*s) == 't') {
        RUUUBY_FULL_DEBUG = FLAG_TRUE;
        memory_at_start   = memory_peak_this_runtime();
        //print_flt_as_mem(memory_at_start);
    }
}

#endif
