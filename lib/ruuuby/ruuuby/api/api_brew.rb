# encoding: UTF-8

# -------------------------------------------- ⚠️ --------------------------------------------

# `🍺`
#
# `💎.engine.api_locale.api_brew`
module ::Ruuuby

  # information and utilities that define and work w/ aspects of `Ruuuby`
  module MetaData

    # brew install libgit2
    #
    # TODO: https://github.com/Homebrew/brew/releases
    # TODO: https://www.unixtutorial.org/brew-cask-vs-brew-formula/
    # TODO: https://brew.sh/
    #
    # | term    | definition |
    # | ------- | --------- |
    # | formula |           |
    # | cask    |           |
    # | tap     |           |
    class BrewAPI < ::Ruuuby::MetaData::EngineComponentAPICLI

      def initialize(engine)
        super(engine, 'brew')
        @path_openssl         = nil
        @env_var_no_analytics = nil
      end

      # ----------------------------------------------------------------------------------------------------------------------------------
      #   __                                      __       ___
      #  /\ \                __                  /\ \     /\_ \                  __
      #  \_\ \     __  _ __ /\_\  __  __    __   \_\ \    \//\ \     ___     __ /\_\    ___
      #  /'_` \  /'__`/\`'__\/\ \/\ \/\ \ /'__`\ /'_` \     \ \ \   / __`\ /'_ `\/\ \  /'___\
      # /\ \L\ \/\  __\ \ \/ \ \ \ \ \_/ /\  __//\ \L\ \     \_\ \_/\ \L\ /\ \L\ \ \ \/\ \__/
      # \ \___,_\ \____\ \_\  \ \_\ \___/\ \____\ \___,_\    /\____\ \____\ \____ \ \_\ \____\
      #  \/__,_ /\/____/\/_/   \/_/\/__/  \/____/\/__,_ /    \/____/\/___/ \/___L\ \/_/\/____/
      #                                                                      /\____/
      #                                                                      \_/__/
      # ----------------------------------------------------------------------------------------------------------------------------------

      # @param [Boolean] production_standards
      #
      # @raise [RuntimeError]
      #
      # @return [Boolean]
      def healthy?(production_standards=false)
        if self.doctor == 'Your system is ready to brew.'
          if production_standards
            return self.analytics? == false
          else
            return true
          end
        else
          false
        end
      end

      # ----------------------------------------------------------------------------------------------------------------------------------
      #  __                                                                                             __
      # /\ \                                                  __                                       /\ \__ __
      # \ \ \____  _ __   __  __  __  __         __    _____ /\_\        ___   _____     __  _ __   __ \ \ ,_/\_\    ___    ___     ____
      #  \ \ '__`\/\`'__/'__`/\ \/\ \/\ \      /'__`\ /\ '__`\/\ \      / __`\/\ '__`\ /'__`/\`'__/'__`\\ \ \\/\ \  / __`\/' _ `\  /',__\
      #   \ \ \L\ \ \ \/\  __\ \ \_/ \_/ \    /\ \L\.\\ \ \L\ \ \ \    /\ \L\ \ \ \L\ /\  __\ \ \/\ \L\.\\ \ \\ \ \/\ \L\ /\ \/\ \/\__, `\
      #    \ \_,__/\ \_\ \____\ \___x___/'    \ \__/.\_\ \ ,__/\ \_\   \ \____/\ \ ,__\ \____\ \_\ \__/.\_\ \__\ \_\ \____\ \_\ \_\/\____/
      #     \/___/  \/_/\/____/\/__//__/       \/__/\/_/\ \ \/  \/_/    \/___/  \ \ \/ \/____/\/_/\/__/\/_/\/__/\/_/\/___/ \/_/\/_/\/___/
      #                                                  \ \_\                   \ \_\
      #                                                   \/_/                    \/_/
      # ------------------------------------------------------------------------------------------------------------------------------------

      # @raise [RuntimeError]
      #
      # @return [Boolean]
      def analytics?; self.env_var_no_analytics ? false : self.run_cmd('analytics state') == 'Analytics are disabled.'; end

      # @return [Boolean]
      def analytics_disabled?; self.env_var_no_analytics; end

      # @raise [RuntimeError]
      #
      # @return [String]
      def analytics_set_on;
        if self.env_var_no_analytics
          🛑 ::RuntimeError.new('| {🍺}-> m{analytics_set_on} called when the ENV_VAR{HOMEBREW_NO_ANALYTICS} is set to{1}, thus function call would have no effect |')
        else
          self.run_cmd('analytics on')
        end
      end

      # @raise [RuntimeError]
      #
      # @return [String]
      def analytics_set_off
        if self.env_var_no_analytics
          🛑 ::RuntimeError.new('| {🍺}-> m{analytics_set_off} called when the ENV_VAR{HOMEBREW_NO_ANALYTICS} is set to{1}, thus function call would have no effect |')
        else
          self.run_cmd('analytics off')
        end
      end

      # @raise [RuntimeError]
      #
      # @return [String]
      def doctor; self.run_cmd('doctor'); end

      # @raise [RuntimeError]
      #
      # @return [String]
      def cleanup; self.run_cmd('cleanup --verbose'); end

      # @param [String] package_name
      #
      # @raise [ArgumentError]
      #
      # @return [String]
      def package_prefix(package_name)
        🛑str❓('package_name', package_name)
        self.run_cmd("--prefix #{package_name}")
      end

      # TODO:
      #  - 'brew info <package>', ex: 'brew info ruby-build' helps indicate the dependencies{autoconf, pk-config, readline}

      # ----------------------------------------------------------------------------------------------------------------------------------
      #                                            ___
      #                                           /\_ \
      #   ___   _____     __    ___     ____   ___\//\ \
      #  / __`\/\ '__`\ /'__`\/' _ `\  /',__\ /',__\\ \ \
      # /\ \L\ \ \ \L\ /\  __//\ \/\ \/\__, `/\__, `\\_\ \_
      # \ \____/\ \ ,__\ \____\ \_\ \_\/\____\/\____//\____\
      #  \/___/  \ \ \/ \/____/\/_/\/_/\/___/ \/___/ \/____/
      #           \ \_\
      #            \/_/
      #  ----------------------------------------------------------------------------------------------------------------------------------

      # @raise [RuntimeError]
      #
      # @return [String]
      def openssl_version; self.run_cmd_raw("#{self.openssl_path}/bin/openssl version"); end

      # @raise [RuntimeError]
      #
      # @return [String]
      def openssl_path_executable; "#{self.openssl_path}/bin/openssl"; end

      # @return [String]
      def openssl_path
        if @path_openssl.∅?
          require 'openssl'
          @path_openssl = self.package_prefix('openssl@1.1')
        end
        @path_openssl
      end

      # @param [String] required_version
      # @param [String] required_header
      #
      # @raise [ArgumentError]
      #
      # @return [Boolean]
      def ∃_h_file?(required_version, required_header)
        🛑strs❓([required_version, required_header])
        result = @engine.api.run_cmd!("find /usr/local/Cellar -name \"#{required_header}\"")
        result.∋?(required_version) && result.∋?("include/#{required_header}")
      end

      🙈

      # @return [Boolean]
      def env_var_no_analytics
        if @env_var_no_analytics.nil?
          if ENV.∃?('HOMEBREW_NO_ANALYTICS')
            @env_var_no_analytics = ENV.fetch🔑('HOMEBREW_NO_ANALYTICS') == '1'
          else
            @env_var_no_analytics = false
          end
        end
        @env_var_no_analytics
      end

    end # end: Class{BrewAPI}
  end
end

# -------------------------------------------- ⚠️ --------------------------------------------
