# encoding: UTF-8

require_relative '../../../lib/ruuuby/module/gem'
require_relative '../../../lib/ruuuby/module/bundler'

module ::Ruuuby::MetaData
  class EngineComponent
    def version
      @cached_version = self._calculate_version if @cached_version.∅?
      @cached_version
    end
  end
end

module ::Ruuuby::MetaData
  class EngineComponentAPICLI < ::Ruuuby::MetaData::EngineComponent
    # @return [String, Array]
    def _calculate_version; self.run_cmd('--version'); end
  end
end

module ::TTY
  class Command
    attribute_versionable('0.10.0'){::TTY::Command::VERSION}

    # @return [Boolean]
    def self.healthy?
      ::TTY::Command.record_separator == $/ && !::TTY::Command.windows? && ::TTY::Command.∃version?
    end
  end
end
