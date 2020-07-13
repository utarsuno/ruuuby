# encoding: UTF-8

# -------------------------------------------- ⚠️ --------------------------------------------

# `💎`
module ::Ruuuby

  # information and utilities that define and work w/ aspects of `Ruuuby`
  module MetaData

    # `💎.engine.api_locale`
    class LocaleAPI < ::Ruuuby::MetaData::RuuubyAPIComponent

      def initialize(engine)
        super(engine)
      end

      # @param [String] required_version
      # @param [String] required_header
      #
      # @raise [ArgumentError]
      #
      # @return [Boolean]
      def ∃_brew_h_file?(required_version, required_header)
        🛑strs❓([required_version, required_header])
        result = @engine.api.run_cmd!("find /usr/local/Cellar -name \"#{required_header}\"")
        result.∋?(required_version) && result.∋?("include/#{required_header}")
      end

    end # end: Class{LocaleAPI}
  end
end

# TODO: before setting up more servers, start some automation for: `iconv --list`

# -------------------------------------------- ⚠️ --------------------------------------------
