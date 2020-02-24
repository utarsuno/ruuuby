# coding: utf-8

module ::Ruuuby

  # @return [String]
  def self.version
    ::Ruuuby::VERSION::VERSION
  end

  # container for version number to ensure it does not get modified
  module VERSION

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
    TINY = 12

    # The version of *Ruuuby*, reflected in gemspec, currently{0.0.12}.
    #
    # @type [String]
    VERSION = "#{MAJOR.to_s}.#{MINOR.to_s}.#{TINY.to_s}".❄️

    🙈constants⟶ :MAJOR, :MINOR, :TINY

    ❄️
  end

end
