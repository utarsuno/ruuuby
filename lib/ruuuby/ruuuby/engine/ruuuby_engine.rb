# encoding: UTF-8

# `💎.engine`
module ::Ruuuby::MetaData

  # TODO: https://linuxcommandlibrary.com/man/ruby.html
  #
  # @see https://github.com/piotrmurach/finite_machine
  #
  # | env_var          | purpose                                    |
  # | ---------------- | ------------------------------------------ |
  # | `RUUUBY_NUM_CPU` |  |
  #
  # | for              | utilize                                                                                                        |
  # | ---------------- | -------------------------------------------------------------------------------------------------------------- |
  # | path ruby        | ::File.join(::RbConfig::CONFIG['bindir'], ::RbConfig::CONFIG['ruby_install_name'] + ::RbConfig::CONFIG['EXEEXT']) |
  # | path ruby        | ::RbConfig.ruby                                                                                                 |
  #
  # `💎.engine`
  class RuuubyEngine

    class << self
      def _get_engine; 💎.engine; end
    end

    module Syntax
      FEATURE_BEHAVIOR = 'b\d\d({\w+})?'
    end

    include ::Ruuuby::Attribute::Includable::SyntaxCache
    include ::Singleton

    attr_reader :logger, :logging_level, :logging_mode, :api, :api_locale, :path_base, :engine

    attr_accessor :stats_ext

    def log_ext_stats
      💎.engine.info(💎.engine.stats_ext.to_s)
      require_relative '../../feature_lazy_loader'
    end

    def initialize
      @path_base      = "#{::File.dirname(::File.dirname(::File.dirname(::File.dirname(::File.dirname(__FILE__)))))}/"
      @logger         = nil
      @echo_to_stdout = false
      @logging_mode   = nil
      @logging_level  = ::Logger::DEBUG
      @api            = ::Ruuuby::MetaData::RuuubyAPI.new(self, 30)
      @api_locale     = ::Ruuuby::MetaData::LocaleAPI.new(self)
      @orm            = nil

      @running = false
      @engine  = ::FiniteMachine.new(self, alias_target: :engine) do
        initial :neutral

        event :start, :neutral => :running, if: "engine_on?"
        event :stop,  :running => :neutral, unless: "engine_on?"

        on_before :start do |event|
          if event.from != :neutral
            🛑 ::RuntimeError.new("| ruuuby engine may only be started from state{neutral}, current state is{#{self.current}} |")
          end
          engine.turn_on
        end

        on_before :stop do |event|
          if event.from != :running
            🛑 ::RuntimeError.new("| ruuuby engine may only be stopped from state{running}, current state is{#{self.current}} |")
          end
          engine.turn_off
        end

      end
    end

    def engine_on?; @running; end

    def turn_off
      unless @logger == nil
        if @logging_level == ::Logger::INFO
          mem_kb = self.gc.total_memory_usage_current
          self.info("pid{#{$$.to_s}} terminating w/ memory-usage currently at{#{mem_kb.to_s}} KB, equivalently: {#{(mem_kb / 1024).to_s}} MB")
        end
        self.debug('closing logger!')
        @logger.close
      end
      #unless @orm.nil?
      #end
      @running = true
    end

    def turn_on
      self.setup_logger
      if @logging_level == ::Logger::INFO
        mem_kb = self.gc.total_memory_usage_current
        self.info("pid{#{$$.to_s}} starting-up w/ memory-usage currently at{#{mem_kb.to_s}} KB, equivalently: {#{(mem_kb / 1024).to_s}} MB")
      end
      @running = true
    end

    def dir(path)
      ::Dir.new(path.dup.ensure_start!(💎.engine.path_base))
    end

    def stats
      {
          percentage_fragmentation: self.gc.percentage_fragmentation,
          percentage_protected_from_minor_marks: self.gc.percentage_protected_from_minor_marks,
          mem_usage_peak: self.gc.mem_usage_peak,
          mem_usage_current: self.gc.total_memory_usage_current
      }
    end

    # @return [::Ruuuby::MetaData::RuuubyORM]
    def orm
      if @orm.nil?
        @orm = ::Ruuuby::MetaData::RuuubyORM.new(self)
      end
      @orm
    end

    🙈

    #    ___    __      _
    #  /'___\ /'__`\  /' \
    # /\ \__//\ \/\ \/\_, \
    # \ \ ,__\ \ \ \ \/_/\ \
    #  \ \ \_/\ \ \_\ \ \ \ \
    #   \ \_\  \ \____/  \ \_\
    #    \/_/   \/___/    \/_/
    def setup_logger
      if ENV.∃?('RUUUBY_F01')
        logging_modes = ENV.parse_feature_behaviors('RUUUBY_F01', 5, 0, 3)
        if logging_modes.∋?('b00')
          if logging_modes.length == 1
            self._create_default_logger_and_level
          else
            🛑 ::RuntimeError.new("| RuuubyEngine got multiple mode settings for ENV_VAR{RUUUBY_F01}, val{#{logging_modes.to_s}}, when mode(none){b00} was applied |")
          end
        else
          flag_b04 = logging_modes.find{|i| i.∋?('b04')}
          unless flag_b04.nil?
            self._set_logging_level(flag_b04)
          end
          flag_b01 = logging_modes.∋?('b01')
          flag_b02 = logging_modes.∋?('b02')
          flag_b03 = logging_modes.∋?('b03')
          if flag_b01 && flag_b02
            🛑 ::RuntimeError.new("| RuuubyEngine got multiple mode settings for ENV_VAR{RUUUBY_F01}, val{#{logging_modes.to_s}}, when mode(none){b00} was applied |")
          elsif flag_b01 && flag_b03
            @echo_to_stdout = true
            self._create_logger('b03')
            @logging_mode = %w(b01 b03)
          elsif flag_b01 && !flag_b03
            self._create_logger('b01')
          elsif flag_b02 && !flag_b03
            self._create_logger('b02')
          elsif flag_b03
            self._create_logger('b03')
          else
            🛑 ::RuntimeError.new("| RuuubyEngine; investigate unexpected-scenario |")
          end
        end
      else
        self._create_default_logger_and_level
      end
    end

    # @see https://ruby-doc.org/stdlib-2.7.0/libdoc/logger/rdoc/Logger/Severity.html
    #
    #==logging levels
    # [DEBUG]   "low-level information, mostly for developers"
    # [ERROR]   "a handleable error condition"
    # [FATAL]   "an unhandleable error that results in a program crash"
    # [INFO]    "generic (useful) information about system operation"
    # [UNKNOWN] "an unknown message that should always be logged"
    def _set_logging_level(val_b04)
      if val_b04.∋?('unknown')
        @logging_level = ::Logger::UNKNOWN
      elsif val_b04.∋?('fatal')
        @logging_level = ::Logger::FATAL
      elsif val_b04.∋?('error')
        @logging_level = ::Logger::ERROR
      elsif val_b04.∋?('warn')
        @logging_level = ::Logger::WARN
      elsif val_b04.∋?('info')
        @logging_level = ::Logger::INFO
      elsif val_b04.∋?('debug')
        @logging_level = ::Logger::DEBUG
      else
        🛑 RuntimeError.new("| RuuubyEngine got invalid arg for behavior{#{val_b04.to_s}} ENV_VAR{RUUUBY_F01} |")
      end
    end

    def _create_logger(logging_mode)
      @logging_mode = logging_mode
      case(@logging_mode)
      when 'b00'
        💎.engine.define_singleton_method(:info) do |content|
        end
        💎.engine.define_singleton_method(:debug) do |content|
        end
      when 'b01'
        @logger = ::Logger.new(STDOUT)
        💎.engine.define_singleton_method(:info) do |content|
          🛑str❓(:content, content)
          @logger.info(content)
        end
        💎.engine.define_singleton_method(:debug) do |content|
          🛑str❓(:content, content)
          @logger.debug(content)
        end
      when 'b02'
        @logger = ::Logger.new(STDERR)
        💎.engine.define_singleton_method(:info) do |content|
        end
        💎.engine.define_singleton_method(:debug) do |content|
        end
      when 'b03'
        @logger = ::Logger.new(::File.open("#{@path_base}tmp/ruuuby.log", ::File::WRONLY | ::File::APPEND | ::File::CREAT), 'daily')
        💎.engine.define_singleton_method(:info) do |content|
          🛑str❓(:content, content)
          @logger.info(content)
          puts content if @echo_to_stdout
        end
        💎.engine.define_singleton_method(:debug) do |content|
          🛑str❓(:content, content)
          @logger.debug(content)
          puts content if @echo_to_stdout
        end
      else
        🛑 ::RuntimeError.new("| RuuubyEngine got invalid @logging_mode{#{@logging_mode.to_s}} w/ type{#{@logging_mode.Ⓣ} for func{_create_logger} |")
      end
      unless @logger.nil?
        @logger.level = @logging_level
      end
      💎.engine.info("logger created w/ mode{#{logging_mode.to_s}} and logging-level{#{@logging_level.to_s}}")
    end

    def _create_default_logger_and_level
      self._set_logging_level('error')
      self._create_logger('b00')
    end

  end # end: {RuuubyEngine}

  # @return [::Ruuuby::MetaData::RuuubyEngine]
  def self.engine; ::Ruuuby::MetaData::RuuubyEngine.instance; end

end

# TODO: for later; https://ruby-doc.org/core-2.5.1/Process.html#method-c-setpriority
# TODO: https://ruby-doc.org/core-2.5.1/Process.html

=begin
# TODO: https://stackoverflow.com/questions/5902488/uninstall-old-versions-of-ruby-gems
      # @return [ActiveRecord::TimeZone]
      #def timezone
      #  @cached_timezone = ::ActiveSupport::TimeZone.new('Central Time (US & Canada)') if @cached_timezone == nil
      #  @cached_timezone
      #end
=end
