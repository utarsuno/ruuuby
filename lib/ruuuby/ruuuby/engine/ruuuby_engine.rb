# encoding: UTF-8

module ::Ruuuby

  # information and utilities that define and work w/ aspects of `Ruuuby`
  module MetaData

    # TODO: https://unix.stackexchange.com/questions/88644/how-to-check-os-and-version-using-a-linux-command
    # TODO: https://nodesource.com/blog/an-absolute-beginners-guide-to-using-npm/
    # TODO: https://webpack.js.org/guides/production/
    # TODO: https://www.sitepoint.com/unit-test-javascript-mocha-chai/
    #
    # TODO: ADD TESTS FOR {dpkg --print-architecture}
    #
    # | env_var          | purpose                                    |
    # | ---------------- | ------------------------------------------ |
    # | `RUUUBY_NUM_CPU` |  |
    #
    # `💎.engine`
    class RuuubyEngine

      class << self; def _get_engine; 💎.engine; end; end

      module Syntax
        FEATURE_BEHAVIOR = 'b\d\d({\w+})?'
      end

      include ::Ruuuby::Attribute::Includable::SyntaxCache
      include ::Singleton

      attr_reader :logger, :state_flag, :logging_level, :logging_mode, :api, :api_locale, :path_base, :api_zsh

      attr_reader :stats_ext_timer, :stats_ext_compiler, :stats_ext, :stats_ext_mem_pre_load, :stats_ext_mem_post_load

      def print_ext_stats
        delta_ms   = @stats_ext_timer / 1000.0
        mem_start  = @stats_ext_mem_pre_load.to_f / 1024.0
        mem_end    = @stats_ext_mem_post_load.to_f / 1024.0
        @stats_ext = "extensions w/ compiler{#{@stats_ext_compiler}}, loaded in{#{delta_ms.to_s} ms}, w/ following pre/post-loaded-memory: {#{mem_start.to_s} MB -> #{mem_end.to_s} MB}"
        💎.engine.info(@stats_ext)
      end

      # state flags
      # | 0 | not started     |
      # | 1 | engine started  |
      # | 2 | engined stopped |
      def initialize
        @path_base      = "#{::File.dirname(::File.dirname(::File.dirname(::File.dirname(::File.dirname(__FILE__)))))}/"
        @path_ruby      = nil
        @state_flag      = 0
        @logger         = nil
        @echo_to_stdout = false
        @logging_mode   = nil
        @logging_level  = ::Logger::DEBUG
        @api            = ::Ruuuby::MetaData::RuuubyAPI.new(self, 30)
        @api_locale     = ::Ruuuby::MetaData::LocaleAPI.new(self)
        @api_zsh        = ::Ruuuby::MetaData::ZshAPI.new(self)
        @orm            = nil
      end

      # @return [String]
      def path_ruby
        if @path_ruby.nil?
          @path_ruby = ::File.join(::RbConfig::CONFIG['bindir'], ::RbConfig::CONFIG['ruby_install_name'] + ::RbConfig::CONFIG['EXEEXT'])
        end
        @path_ruby
      end

      # @raise [RuntimeError] if called more than once
      def warm_up
        if @state_flag == 0
          self.setup_logger
          if @logging_level == ::Logger::INFO
            mem_kb = self.gc.total_memory_usage_current
            self.info("pid{#{$$.to_s}} starting-up w/ memory-usage currently at{#{mem_kb.to_s}} KB, equivalently: {#{(mem_kb / 1024).to_s}} MB")
          end
          @state_flag += 1
        else
          🛑 ::RuntimeError.new("| RuuubyEngine should only be warmed up once |")
        end
      end

      # @return [::Ruuuby::MetaData::RuuubyORM]
      def orm
        if @orm.nil?
          self.enable_orm
        end
        @orm
      end

      def enable_orm
        require_relative '../ruuuby_orm'
        @orm = ::Ruuuby::MetaData::RuuubyORM.new(self)
        @orm.ensure_loaded_db_libs
      end

      # @raise [RuntimeError] if called when the engine isn't currently warm
      def cool_down
        if @state_flag == 1
          unless @logger == nil
            if @logging_level == ::Logger::INFO
              mem_kb = self.gc.total_memory_usage_current
              self.info("pid{#{$$.to_s}} terminating w/ memory-usage currently at{#{mem_kb.to_s}} KB, equivalently: {#{(mem_kb / 1024).to_s}} MB")
            end
            self.debug('closing logger!')
            @logger.close
          end
          unless @orm.nil?

          end
          @state_flag += 1
        else
          🛑 RuntimeError.new("| RuuubyEngine w/ func{cool_down} tried to move to state{2} when currently in state{#{@state_flag.to_s}} |")
        end
      end

      🙈

      #    ___    __      _
      #  /'___\ /'__`\  /' \
      # /\ \__//\ \/\ \/\_, \
      # \ \ ,__\ \ \ \ \/_/\ \
      #  \ \ \_/\ \ \_\ \ \ \ \
      #   \ \_\  \ \____/  \ \_\
      #    \/_/   \/___/    \/_/
      #

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

  end # end: {MetaData}

end

# TODO: for later; https://ruby-doc.org/core-2.5.1/Process.html#method-c-setpriority
# TODO: https://ruby-doc.org/core-2.5.1/Process.html

=begin
# TODO: https://stackoverflow.com/questions/5902488/uninstall-old-versions-of-ruby-gems
      # @return [ActiveRecord::TimeZone]
      #def timezone
      #  @engine.orm
        #💎.engine.enable_orm
      #  @cached_timezone = ::ActiveSupport::TimeZone.new('Central Time (US & Canada)') if @cached_timezone == nil
      #  @cached_timezone
      #end
=end
