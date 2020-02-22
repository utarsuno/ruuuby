# coding: utf-8

require_relative 'class/obj' unless ::Object.respond_to?(:❄️)

module ::Ruuuby

  # @return [String]
  def self.version
    ::Ruuuby::VERSION::VERSION
  end

  private

  # container for version number to ensure it does not get modified
  module VERSION
    # The version of *Ruuuby*, reflected in gemspec, currently{0.0.11}.
    #
    # @type [String]
    VERSION = '0.0.11'.❄️

    ❄️
  end

end
