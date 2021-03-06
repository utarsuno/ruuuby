# encoding: UTF-8

# information and utilities that define and work w/ aspects of `Ruuuby`
module ::Ruuuby::MetaData
  class EngineComponentAPICLI < ::Ruuuby::MetaData::EngineComponent

    attr_reader :cmd_start

    # @param [*]      engine
    # @param [String] cmd_start
    #
    # @raise [ArgumentError]
    def initialize(engine, cmd_start)
      🛑str❓('cmd_start', cmd_start)
      super(engine)
      @cmd_start = cmd_start
    end

    # @param [String] cmd
    # @param [String] output
    def executed_cmd_returned_expected_output(cmd, output)
      🛑strs❓([cmd, output])
      @engine.api.run_cmd!("#{@cmd_start} #{cmd}") == output
    end

    # @param [String] cmd
    def run_cmd(cmd)
      🛑str❓('cmd', cmd)
      @engine.api.run_cmd!("#{@cmd_start} #{cmd}")
    end

    # @param [String] cmd
    def run_cmd_raw(cmd)
      🛑str❓('cmd', cmd)
      @engine.api.run_cmd!(cmd)
    end

  end
end
