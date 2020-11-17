# encoding: UTF-8

require_relative '../../../lib/ruuuby/module/gem'
require_relative '../../../lib/ruuuby/module/bundler'

module ::TTY
  class Command
    attribute_versionable('0.10.0'){::TTY::Command::VERSION}

    # @return [Boolean]
    def self.healthy?
      ::TTY::Command.record_separator == $/ && !::TTY::Command.windows? && ::TTY::Command.∃version?
    end
  end
end
