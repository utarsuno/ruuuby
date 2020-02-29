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
    DIRS_HEADER            = [MACPORTS, SOURCE_A, SOURCE_B, RUBY_INSTALLED_HEADERS, FALLBACK] #MACPORTS (for index 0)
    DIRS_LIB               = [MACPORTS, SOURCE_A, SOURCE_B, RUBY_INSTALLED_LIBS, FALLBACK] #MACPORTS (for index 0)
  end

  module Headers
    FOR_RUBY = %w(ruby ruby/encoding ruby/intern ruby/version ruby/debug)
    FOR_C    = %w(stdio unistd sys/types sys/stat sys/param sys/mount fcntl string stdlib)
    ALL      = FOR_RUBY + FOR_C
  end

end

dir_config(ExtconfConfigHelper::EXTENSION_NAME, ExtconfConfigHelper::Dir::DIRS_HEADER, ExtconfConfigHelper::Dir::DIRS_LIB)

ExtconfConfigHelper::Headers::ALL.each do |h|
  find_header("#{h}.h")
end

create_makefile(ExtconfConfigHelper::EXTENSION_NAME)
