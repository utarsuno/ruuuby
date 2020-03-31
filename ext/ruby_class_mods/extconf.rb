# coding: utf-8

require_relative '../../conditionals/ruuuby_configs'
gem_configs = ::RuuubyConfigs
gem_schema = gem_configs::NamingSchema

require 'mkmf'

$VERBOSE = true
$DEBUG = true
$CFLAGS << ' -v'

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
    FOR_C    = %w(sys/types string stdlib)
    ALL      = FOR_RUBY + FOR_C + ["ruby_class_mods"]
      #ALL = FOR_RUBY
  end

end

dir_config(gem_schema::RUUUBY_NAME_EXTENSION, ExtconfConfigHelper::Dir::DIRS_HEADER, ExtconfConfigHelper::Dir::DIRS_LIB)

ExtconfConfigHelper::Headers::ALL.each do |h|
  current_header = "#{h}.h"
  abort("Unable to find header{#{current_header.to_s}}") unless find_header(current_header)
end

create_makefile(gem_schema::RUUUBY_NAME_EXTENSION)
