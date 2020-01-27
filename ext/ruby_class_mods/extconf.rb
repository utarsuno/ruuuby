# -*- encoding : utf-8 -*-

require 'mkmf'

extension_name = 'ruby_class_mods'
$LANG          = 'UTF-8'
$DEBUG         = true
LIBDIR         = RbConfig::CONFIG['libdir']
INCLUDEDIR     = RbConfig::CONFIG['includedir']

HEADER_DIRS = [
    # First search /opt/local for macports
    #'/opt/local/include',

    # Then search /usr/local for people that installed from source
    '/usr/local/include',

    # Then search /usr/local for people that installed from source
    '/usr/local/bin',

    # Check the ruby install locations
    INCLUDEDIR,

    # Finally fall back to /usr
    '/usr/include',
]

LIB_DIRS = [
    # First search /opt/local for macports
    #'/opt/local/lib',

    # Then search /usr/local for people that installed from source
    '/usr/local/lib',

    # Then search /usr/local for people that installed from source
    '/usr/local/bin',

    # Check the ruby install locations
    LIBDIR,

    # Finally fall back to /usr
    '/usr/lib',
]

#dir_config(extension_name)
dir_config(extension_name, HEADER_DIRS, LIB_DIRS)

create_makefile(extension_name)
