# coding: utf-8

require 'mkmf'

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
    DIRS_HEADER            = [SOURCE_A, SOURCE_B, RUBY_INSTALLED_HEADERS, FALLBACK] #MACPORTS (for index 0)
    DIRS_LIB               = [SOURCE_A, SOURCE_B, RUBY_INSTALLED_LIBS, FALLBACK] #MACPORTS (for index 0)
  end

  module Headers
    ALL = %w(ruby.h ruby/encoding.h ruby/intern.h ruby/version.h ruby/debug.h)
  end

end

dir_config(ExtconfConfigHelper::EXTENSION_NAME, ExtconfConfigHelper::Dir::DIRS_HEADER, ExtconfConfigHelper::Dir::DIRS_LIB)

ExtconfConfigHelper::Headers::ALL.each do |h|
  find_header(h)
end

create_makefile(ExtconfConfigHelper::EXTENSION_NAME)
