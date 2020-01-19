# File: extconf.rb

require 'mkmf'

extension_name = 'ruby_class_mods'

dir_config(extension_name)
create_makefile(extension_name)
