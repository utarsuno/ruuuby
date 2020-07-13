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

/*                              ___               __
         __                    /\_ \             /\ \__  __
    ____/\_\    ___ ___   _____\//\ \      __    \ \ ,_\/\_\    ___ ___      __   _ __
   /',__\/\ \ /' __` __`\/\ '__`\\ \ \   /'__`\   \ \ \/\/\ \ /' __` __`\  /'__`\/\`'__\
  /\__, `\ \ \/\ \/\ \/\ \ \ \L\ \\_\ \_/\  __/    \ \ \_\ \ \/\ \/\ \/\ \/\  __/\ \ \/
  \/\____/\ \_\ \_\ \_\ \_\ \ ,__//\____\ \____\    \ \__\\ \_\ \_\ \_\ \_\ \____\\ \_\
   \/___/  \/_/\/_/\/_/\/_/\ \ \/ \/____/\/____/     \/__/ \/_/\/_/\/_/\/_/\/____/ \/_/
                            \ \_\
                             \/_/                                                       */



/*                               __
                                /\ \                                         __
   _ __   __  __  __  __  __  __\ \ \____  __  __         __    ___      __ /\_\    ___      __
  /\`'__\/\ \/\ \/\ \/\ \/\ \/\ \\ \ '__`\/\ \/\ \      /'__`\/' _ `\  /'_ `\/\ \ /' _ `\  /'__`\
  \ \ \/ \ \ \_\ \ \ \_\ \ \ \_\ \\ \ \L\ \ \ \_\ \    /\  __//\ \/\ \/\ \L\ \ \ \/\ \/\ \/\  __/
   \ \_\  \ \____/\ \____/\ \____/ \ \_,__/\/`____ \   \ \____\ \_\ \_\ \____ \ \_\ \_\ \_\ \____\
    \/_/   \/___/  \/___/  \/___/   \/___/  `/___/> \   \/____/\/_/\/_/\/___L\ \/_/\/_/\/_/\/____/
                                               /\___/                    /\____/
                                               \/__/                     \_/__/*/
#define 💎parse_compiler_version_to_string(arg){\
    switch(compiler_version) {\
        case FLAG_RUNTIME_VERSION_C_89:\
            return c_str_to_frozen_r_str("c89");\
        case FLAG_RUNTIME_VERSION_C_99:\
            return c_str_to_frozen_r_str("c99");\
        case FLAG_RUNTIME_VERSION_C_11:\
            return c_str_to_frozen_r_str("c11");\
        case FLAG_RUNTIME_VERSION_C_17:\
            return c_str_to_frozen_r_str("c17");\
        case FLAG_RUNTIME_VERSION_GNU_11:\
            return c_str_to_frozen_r_str("gnu11");\
        case FLAG_RUNTIME_VERSION_GNU_17:\
            return c_str_to_frozen_r_str("gnu17");\
        case FLAG_RUNTIME_VERSION_GNU_89:\
            return c_str_to_frozen_r_str("gnu89");\
        case FLAG_RUNTIME_VERSION_GNU_99:\
            return c_str_to_frozen_r_str("gnu99");\
        case FLAG_RUNTIME_VERSION_DEFAULT:\
            return c_str_to_frozen_r_str("default");\
        default:\
            return c_str_to_frozen_r_str("???");\
    }\
}

#endif
