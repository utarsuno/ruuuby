# encoding: UTF-8

# +Ruuuby+
module ::Ruuuby
  # @type [String] the version of Gem(*ruuuby*) reflected in this source code
  VERSION         = '0.1.0.pre.3'.freeze

  # @type [String] the version of Ruby utilized and minimum required
  VERSION_RUBY    = ::Gem.ruby_version.to_s.freeze

  # @type [String] the version of Gem{*rubygem-update*} utilized and recommended
  VERSION_BUNDLER = '3.2.0.rc.2'.freeze
end
