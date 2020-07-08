# coding: UTF-8
# frozen-string-literal: false

require_relative '../../lib/ruuuby/version'
require 'mkmf'

env_f28 = ENV['RUUUBY_F28']
if env_f28.nil?
  flag_f28_b09 = false
else
  flag_f28_b09 = env_f28.include?('b09')
end

env_f98 = ENV['RUUUBY_F98']
if env_f98.nil?
  env_f98 = 0
else
  begin
    env_f98 = env_f98.to_i
    if env_f98 >= 0 && env_f98 <= 15
      flag_debug    = env_f98 != 0
      flag_timer    = env_f98.odd?
      flag_memory   = (env_f98 & 2) != 0
      flag_opencl   = (env_f98 & 4) != 0
      flag_compiler = (env_f98 & 8) != 0
    else
      raise "not compiling w/ valid ENV{RUUUBY_F98}, expected int between val{0-15}, got{#{env_f98.to_s}}"
    end
  rescue
    raise "not compiling w/ valid ENV{RUUUBY_F98}, expected int between val{0-15}, got{#{env_f98.to_s}}"
  end
end

puts "compiling ruuuby-extensions{#{::Ruuuby::VERSION}} w/ env_f98{#{env_f98.to_s}}"

$VERBOSE = true
$DEBUG = true

the_flags = []

# optimization
the_flags += %w(O3 fgnu89-inline fforce-emit-vtables fstrict-enums flto fwhole-program-vtables mpie-copy-relocations ftree-vectorize fvectorize fzvector)

# configs
the_flags += %w(fmacro-backtrace-limit=0 fconstexpr-backtrace-limit=0)

# etc
the_flags += %w(Wall Wformat nostdinc++ fexceptions pipe std=gnu11) #std=gnu11  #std=c17

# x86_64
the_flags += %w(fPIC malign-double)

# apple
the_flags += %w(fapinotes fapple-pragma-pack fblocks)

# utf-8
the_flags += %w(fextended-identifiers finput-charset=UTF-8)

# extra_checks
the_flags += %w(ftarget-variant-availability-checks funroll-loops)

the_flags += ["DRUUUBY_F98_DEBUG=#{env_f98.to_s}"] if flag_debug
the_flags += %w(DRUUUBY_F98_TIMER) if flag_timer
the_flags += %w(DRUUUBY_F98_MEMORY) if flag_memory
the_flags += %w(DRUUUBY_F98_OPENCL) if flag_opencl
the_flags += %w(DRUUUBY_F98_COMPILER) if flag_compiler

the_flags += %w(DRUUUBY_F28_B09) if flag_f28_b09

# warnings
the_flags += %w(Werror Wshadow Wdouble-promotion Wfloat-conversion Wundef fno-common g3 Wbad-function-cast
Wmissing-declarations Wmissing-prototypes Wold-style-definition Wdeclaration-after-statement
Wpointer-sign Wparentheses Winit-self Wmissing-include-dirs Wno-switch-bool Wswitch-default Wstrict-aliasing Winit-self)

append_cflags(the_flags.map!{|f| " -#{f}"})

if flag_opencl
  append_ldflags('-L/System/Library/Frameworks/OpenCL.framework')
  append_ldflags('-framework OpenCL')
  abort('no OpenCL') unless have_framework('OpenCL')
end

dir_config('ruby_class_mods', [::RbConfig::CONFIG['includedir']], [::RbConfig::CONFIG['libdir']])

headers = []

# for ruby
headers += %w(ruby ruby/assert ruby/debug ruby/defines ruby/encoding ruby/intern ruby/version ruby/missing)

# for ruuuby
headers += %w(c0_constants c1_typed_checks c2_extension_memory c3_macro_utilities c4_theta_angle c5_internal_structs c6_feature_macros c7_time_series_data ruby_class_mods)

# for c
headers += %w(stdio stdlib sys/types string float tgmath inttypes locale sys/resource) # tgmath includes {math, complex}

if flag_timer
  headers += %w(time sys/time)
end

headers.each do |h|
  abort("Unable to find header{#{h}.h}") unless find_header("#{h}.h")
end

#if env_f98 != 0
if env_f98 == 15
  ({
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
  }).each do |type, size|
    abort("expected sizeof(#{type.to_s}) to be{#{size.to_s}}") unless check_sizeof(type.to_s) == size
  end
  abort("expected sizeof(ID) to be{8}") unless check_sizeof('ID') == 8
  (1..9).each do |n|
    abort("Unable to find const{#{n}} in header{c0_constants.h}") unless have_const("ℤ#{n.to_s}", 'c0_constants.h')
    abort("Unable to find const{#{n}} in header{c0_constants.h}") unless have_const("ℤn#{n.to_s}", 'c0_constants.h')
  end
  abort("Unable to find const{ℤ0} in header{c0_constants.h}") unless have_const("ℤ0", 'c0_constants.h')
end

#abort("missing macro{M_SQRT2}") unless have_macro('M_SQRT2')

create_makefile('ruby_class_mods')
