# coding: UTF-8

require 'mkmf'

$VERBOSE = true
$DEBUG = true

c_flags                = {}
c_flags[:optimization] = %w(O3 fgnu89-inline fforce-emit-vtables fstrict-enums flto fwhole-program-vtables mpie-copy-relocations)
c_flags[:configs]       = %w(fmacro-backtrace-limit=0 fconstexpr-backtrace-limit=0)
c_flags[:etc]          = %w(Wall Wformat) # fsanitize-stats # std=gnu99
c_flags[:x86_64]       = %w(fPIC)
c_flags[:warnings]     = %w(Werror Wshadow Wdouble-promotion Wfloat-conversion Wundef fno-common g3 Wbad-function-cast
Wmissing-declarations Wmissing-prototypes Wold-style-definition Wdeclaration-after-statement
Wpointer-sign Wparentheses Winit-self Wmissing-include-dirs Wno-switch-bool Wswitch-default Wstrict-aliasing Winit-self)
c_flags[:utf8]         = %w(fextended-identifiers finput-charset=UTF-8)
c_flags[:extra_checks] = %w(ftarget-variant-availability-checks funroll-loops)
all_c_flags            = c_flags[:optimization] + c_flags[:warnings] + c_flags[:etc] + c_flags[:x86_64] + c_flags[:utf8] + c_flags[:extra_checks] + c_flags[:configs]
the_flags = []
all_c_flags.each do |flag|
  the_flags << " -#{flag}"
end

append_cflags(the_flags)

module ExtconfMeta

  EXTENSION_NAME = 'ruby_class_mods'

  module Headers
    FOR_RUBY = %w(ruby ruby/assert ruby/debug ruby/defines ruby/encoding ruby/intern ruby/version ruby/missing)
    #FOR_C    = %w(stdio unistd sys/types sys/stat sys/param sys/mount fcntl string stdlib)
    FOR_C    = %w(sys/types string stdlib float math tgmath complex inttypes locale time sys/time sys/resource)
    ALL      = FOR_RUBY + FOR_C + %w(c0_constants c1_typed_checks c2_extension_memory c3_macro_utilities c4_theta_angle c5_internal_structs c6_feature_macros ruby_class_mods)
  end

  module DataTypes
    FOR_C = {
        char: 1,
        'unsigned char': 1,
        short: 2,
        'unsigned short': 2,
        int: 4,
        'unsigned int': 4,
        float: 4,
        size_t: 8,
        long: 8,
        'unsigned long': 8,
        'long long': 8,
        double: 8,
        'long double': 16
    }
    FOR_EXT = {
        ID: 8
    }
  end

end

dir_config(ExtconfMeta::EXTENSION_NAME, [RbConfig::CONFIG['includedir']], [RbConfig::CONFIG['libdir']])

ExtconfMeta::Headers::ALL.each do |h|
  current_header = "#{h}.h"
  abort("Unable to find header{#{current_header.to_s}}") unless find_header(current_header)
end

ExtconfMeta::DataTypes::FOR_C.each do |type, size|
  abort("expected sizeof(#{type.to_s}) to be{#{size.to_s}}") unless check_sizeof(type.to_s) == size
end
abort("expected sizeof(#{type.to_s}) to be{#{size.to_s}}") unless check_sizeof('ID') == 8

(1..9).each do |n|
  abort("Unable to find const{#{n}} in header{c0_constants.h}") unless have_const("ℤ#{n.to_s}", 'c0_constants.h')
  abort("Unable to find const{#{n}} in header{c0_constants.h}") unless have_const("ℤn#{n.to_s}", 'c0_constants.h')
end
abort("Unable to find const{ℤ0} in header{c0_constants.h}") unless have_const("ℤ0", 'c0_constants.h')

#have_header('ruby/config.h')
#have_header('ruby/ruby.h')

#create_header

create_makefile(ExtconfMeta::EXTENSION_NAME)
