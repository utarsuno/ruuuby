# coding: UTF-8

require 'mkmf'

$VERBOSE = true
$DEBUG = true

c_flags                = {}
c_flags[:optimization] = %w(O3)
c_flags[:etc]          = %w()
c_flags[:warnings]     = %w(v Werror Wshadow Wdouble-promotion Wfloat-conversion Wundef fno-common g3)
all_c_flags            = c_flags[:optimization] + c_flags[:warnings] + c_flags[:etc]
all_c_flags.each do |flag|
  $CFLAGS << " -#{flag}"
end

# faggressive-loop-optimizations
# fira-loop-pressure
# fearly-inlining
# fvariable-expansion-in-unroller

# "The compiler failed to generate an executable file. (RuntimeError) You have to install development tools first."
#$CFLAGS << ' -Wformat-overflow'
#$CFLAGS << ' -Wformat-truncation'

# "The compiler failed to generate an executable file. (RuntimeError) You have to install development tools first."
#$LDFLAGS << ' --gc-sections'

module ExtconfConfigHelper

  EXTENSION_NAME = 'ruby_class_mods'

  module Dir
    MACPORTS               = '/opt/local/include'
    SOURCE_A               = '/usr/local/include'
    SOURCE_B               = '/usr/local/bin'
    RUBY_INSTALLED_HEADERS = RbConfig::CONFIG['includedir']
    RUBY_INSTALLED_LIBS    = RbConfig::CONFIG['libdir']
    FALLBACK               = '/usr/include'
    DIRS_HEADER            = [] #[SOURCE_A]#, SOURCE_B]#, RUBY_INSTALLED_HEADERS]#, FALLBACK] #MACPORTS (for index 0)
    DIRS_LIB               = []#[SOURCE_A]#, SOURCE_B]#, RUBY_INSTALLED_LIBS]#, FALLBACK] #MACPORTS (for index 0)

    #DIRS_HEADER            = [SOURCE_A, SOURCE_B, RUBY_INSTALLED_HEADERS, FALLBACK] #MACPORTS (for index 0)
    #DIRS_LIB               = [SOURCE_A, SOURCE_B, RUBY_INSTALLED_LIBS, FALLBACK] #MACPORTS (for index 0)

  end

  module Headers
    FOR_RUBY = %w(ruby ruby/assert ruby/debug ruby/defines ruby/encoding ruby/intern ruby/version ruby/missing)
    #FOR_C    = %w(stdio unistd sys/types sys/stat sys/param sys/mount fcntl string stdlib)
    FOR_C    = %w(sys/types string stdlib math)
    ALL      = FOR_RUBY + FOR_C + %w(c0_constants c1_typed_checks c2_extension_memory c3_macro_utilities ruby_class_mods)
      #ALL = FOR_RUBY
  end

end

dir_config(ExtconfConfigHelper::EXTENSION_NAME, ExtconfConfigHelper::Dir::DIRS_HEADER, ExtconfConfigHelper::Dir::DIRS_LIB)

ExtconfConfigHelper::Headers::ALL.each do |h|
  current_header = "#{h}.h"

  abort("Unable to find header{#{current_header.to_s}}") unless find_header(current_header)
end

create_makefile(ExtconfConfigHelper::EXTENSION_NAME)
