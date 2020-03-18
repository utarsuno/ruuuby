# coding: utf-8

module ::Ruuuby

  # container for version number to ensure it does not get modified
  module Version

    # major version of *Ruuuby*
    #
    # @type [Integer]
    MAJOR = 0

    # minor version of *Ruuuby*
    #
    # @type [Integer]
    MINOR = 0

    # tiny version of *Ruuuby*
    #
    # @type [Integer]
    TINY = 18

    # the version of *Ruuuby*, reflected in gemspec, currently{0.0.18}
    #
    # @type [String]
    VERSION = "#{MAJOR.to_s}.#{MINOR.to_s}.#{TINY.to_s}".❄️

    🙈constants⟶ :MAJOR, :MINOR, :TINY

    ❄️
  end

  # @type [String] constant
  VERSION = ::Ruuuby::Version::VERSION

end
