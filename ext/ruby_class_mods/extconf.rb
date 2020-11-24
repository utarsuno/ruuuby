# encoding: UTF-8
# frozen-string-literal: false

require_relative '../../lib/ruuuby/version'
require 'mkmf'

os = ENV['RUUUBY_OS_CURRENT']

env_f00     = ENV['RUUUBY_F00']
flags_f00    = [false, false]
unless env_f00.nil?
  if env_f00.include?('b04')
    flags_f00[0] = true
  elsif env_f00.include?('b05')
    flags_f00[1] = true
  end
end

env_f06     = ENV['RUUUBY_F06']
flag_f06_b08 = false
flag_f06_b09 = false
unless env_f06.nil?
  if env_f06.include?('b08')
    flag_f06_b08 = true
  end
  if env_f06.include?('b09')
    flag_f06_b09 = true
  end
end

env_f10     = ENV['RUUUBY_F10']
flag_f10_b04 = false
unless env_f10.nil?
  if env_f10.include?('b03')
    flag_f10_b04 = true
  end
end

env_f22 = ENV['RUUUBY_F22']
if env_f22.nil?
  flag_f22_b01 = false
  flag_f22_b05 = false
  flag_f22_b06 = false
  flag_f22_b07 = false
else
  flag_f22_b01 = env_f22.include?('b01')
  flag_f22_b05 = env_f22.include?('b05')
  flag_f22_b06 = env_f22.include?('b06')
  flag_f22_b07 = env_f22.include?('b07')
end

env_f28 = ENV['RUUUBY_F28']
if env_f28.nil?
  flag_f28_b09 = false
else
  flag_f28_b09 = env_f28.include?('b09')
end

env_f38 = ENV['RUUUBY_F38']
flag_f38 = false
unless env_f38.nil?
  flag_f38 = true
end

env_f92     = ENV['RUUUBY_F92']
flag_f92_b00 = false
flag_f92_b01 = false
flag_f92_b02 = false
flag_f92_b03 = false
unless env_f92.nil?
  if env_f92.include?('b00')
    flag_f92_b00 = true
  end
  if env_f92.include?('b01')
    flag_f92_b01 = true
  end
  if env_f92.include?('b02')
    flag_f92_b02 = true
  end
  if env_f92.include?('b02')
    flag_f92_b03 = true
  end
end

env_f43 = ENV['RUUUBY_F43']
flag_f43 = !env_f43.nil?

env_f93 = ENV['RUUUBY_F93']

if env_f93.nil?
  flag_f93 = false
else
  flag_f93 = true
end

env_f98 = ENV['RUUUBY_F98']
if env_f98.nil?
  env_f98 = 0
else
  begin
    env_f98 = env_f98.to_i
    if env_f98 >= 0 && env_f98 <= 63
      flag_debug    = env_f98 != 0
      flag_timer    = env_f98.odd?
      flag_memory   = (env_f98 & 2) != 0
      flag_opencl   = (env_f98 & 4) != 0
      flag_compiler = (env_f98 & 8) != 0
      flag_openmp   = (env_f98 & 16) != 0
      flag_opengl   = (env_f98 & 32) != 0
    else
      raise "not compiling w/ valid ENV{RUUUBY_F98}, expected int between val{0-63}, got{#{env_f98.to_s}}"
    end
  rescue
    raise "not compiling w/ valid ENV{RUUUBY_F98}, expected int between val{0-63}, got{#{env_f98.to_s}}"
  end
end

#puts "compiling ruuuby-extensions{#{::Ruuuby::VERSION}} w/ env_f98{#{env_f98.to_s}}"

$VERBOSE = true
$DEBUG = true

the_flags = []

# optimization
the_flags += %w(O3 fgnu89-inline fstrict-enums flto ftree-vectorize fvectorize fzvector)

# etc
the_flags += %w(Wall Wformat fexceptions pipe)

# compiler GNU extensions standard (note: `gnu11` is intentionally used over `c17`)
the_flags += %w(std=gnu11)

# x86_64
the_flags += %w(fPIC malign-double)

path_overlap_ruby = 'rbenv/versions/3.0.0-preview1/include/ruby-3.0.0'

# flags for MacOS only
if os == 'mac'
  the_flags += %w(fdeclspec)

  append_cflags("-include ~/.#{path_overlap_ruby}/x86_64-darwin19/rb_mjit_min_header-3.0.0.h")
  append_cflags("-include ~/.#{path_overlap_ruby}/ruby/internal/core/rbasic.h")
  append_cflags("-include ~/.#{path_overlap_ruby}/ruby/internal/intern/sprintf.h")
  append_cflags("-include ~/.#{path_overlap_ruby}/ruby/internal/core/rdata.h")

  the_flags += %w(fapinotes fapple-pragma-pack fblocks ftarget-variant-availability-checks fmacro-backtrace-limit=0 fconstexpr-backtrace-limit=0 nostdinc++ fforce-emit-vtables fwhole-program-vtables mpie-copy-relocations)

  # OpenMP
  #the_flags += %w(Xpreprocessor fopenmp) #lomp
  #the_flags += %w(DCMAKE_C_COMPILER=clang DOpenMP_libomp_LIBRARY DLIBOMP_ARCH=x86_64 DCMAKE_BUILD_TYPE=Debug DCMAKE_SHARED_LINKER_FLAGS)
  #the_flags += %w(DOpenMP_libomp_LIBRARY DCMAKE_SHARED_LINKER_FLAGS)
else
  append_cflags("-include /usr/local/#{path_overlap_ruby}/x86_64-linux-musl/rb_mjit_min_header-3.0.0.h")
  append_cflags("-include /usr/local/#{path_overlap_ruby}/ruby/internal/intern/sprintf.h")
end

# utf-8
the_flags += %w(fextended-identifiers finput-charset=UTF-8)

# extra_checks
the_flags += %w(funroll-loops)

the_flags += ["DRUUUBY_F98_DEBUG=#{env_f98.to_s}"] if flag_debug
the_flags += %w(DRUUUBY_F98_TIMER) if flag_timer
if flag_memory
  the_flags += %w(DRUUUBY_F98_MEMORY)
  the_flags += %w(DRUUUBY_F22_B00)
end
the_flags += %w(DRUUUBY_F98_OPENCL) if flag_opencl
the_flags += %w(DRUUUBY_F98_COMPILER) if flag_compiler
the_flags += %w(DRUUUBY_F98_OPENMP) if flag_openmp
the_flags += %w(DRUUUBY_F98_OPENGL) if flag_opengl

the_flags += %w(DRUUUBY_F00_B04) if flags_f00[0]
the_flags += %w(DRUUUBY_F00_B05) if flags_f00[1]

the_flags += %w(DRUUUBY_F06_B08) if flag_f06_b08
the_flags += %w(DRUUUBY_F06_B09) if flag_f06_b09

the_flags += %w(DRUUUBY_F10_B04) if flag_f10_b04

the_flags += %w(DRUUUBY_F22_B01) if flag_f22_b01
the_flags += %w(DRUUUBY_F22_B05) if flag_f22_b05
the_flags += %w(DRUUUBY_F22_B06) if flag_f22_b06
the_flags += %w(DRUUUBY_F22_B07) if flag_f22_b07

the_flags += %w(DRUUUBY_F28_B09) if flag_f28_b09

the_flags += %w(DRUUUBY_F38) if flag_f38

the_flags += %w(DRUUUBY_F43) if flag_f43

the_flags += %w(DRUUUBY_F92_B00) if flag_f92_b00
the_flags += %w(DRUUUBY_F92_B01) if flag_f92_b01
the_flags += %w(DRUUUBY_F92_B02) if flag_f92_b02
the_flags += %w(DRUUUBY_F92_B03) if flag_f92_b03

the_flags += %w(DRUUUBY_F93) if flag_f93

if env_f98 >= 11
  the_flags += %w(DRUUUBY_DEBUGGING)
end

# warnings
# Wbad-function-cast
the_flags += %w(Werror Wshadow Wdouble-promotion Wfloat-conversion Wundef fno-common g3
Wmissing-declarations Wmissing-prototypes Wold-style-definition Wdeclaration-after-statement
Wpointer-sign Wparentheses Winit-self Wmissing-include-dirs Wno-switch-bool Wswitch-default Wstrict-aliasing Winit-self)

append_cflags(the_flags.map!{|f| " -#{f}"})

if os == 'mac'
  if flag_opencl
    append_ldflags('-L/System/Library/Frameworks/OpenCL.framework')
    append_ldflags('-framework OpenCL')
    abort('no OpenCL') unless have_framework('OpenCL')
  end
  if flag_opengl
    append_ldflags('-L/System/Library/Frameworks/OpenGL.framework')
    append_ldflags('-framework OpenGL')
    abort('no OpenGL') unless have_framework('OpenGL')
  end
  #if `flag_openmp
  #  append_ldflags('-L/usr/local/opt/libomp/lib')
  #  abort('no OpenMP') unless have_framework('OpenMP')
  #  headers += %w(omp)
  #end`
end

dir_config('ruby_class_mods', [::RbConfig::CONFIG['includedir']], [::RbConfig::CONFIG['libdir']])

headers = []

# for ruby
headers += %w(ruby ruby/assert ruby/debug ruby/defines ruby/encoding ruby/intern ruby/version ruby/missing)

# for ruuuby
headers += %w(00_constants 01_typed_checks 02_extension_memory 03_macro_utilities 04_theta_angle 05_feature_macros 06_time_series_data 07_graphs ruby_class_mods)

# for c
headers += %w(stdio stdlib sys/types string float tgmath inttypes locale sys/resource) # tgmath includes {math, complex}

if flag_timer
  headers += %w(time sys/time)
end

if env_f98 >= 11
  headers += %w(optional/00_debugging)
end

headers.each{|header_file| abort("Unable to find header{#{header_file}.h}") unless find_header("#{header_file}.h")}

#if env_f98 != 0
if env_f98 >= 15
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

abort("missing macro{M_SQRT2}") unless have_macro('M_SQRT2')

abort unless have_macro('RBIMPL_COMPILER_IS_CLANG_H')
abort unless have_macro('RBIMPL_COMPILER_IS_APPLE_H')

create_makefile('ruby_class_mods')
