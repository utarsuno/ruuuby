# encoding: UTF-8

# -------------------------------------------- ⚠️ --------------------------------------------

# `💎`
module ::Ruuuby

  # information and utilities that define and work w/ aspects of `Ruuuby`
  module MetaData

    # TODO: take note, unlike other gems, updating `rubygems-update` can be performed w/ `gem update --system 3.2.0.rc.1`
    #
    # `💎.engine.api_locale`
    class LocaleAPI < ::Ruuuby::MetaData::RuuubyAPIComponent

      attr_reader :api_docker

      def initialize(engine)
        super(engine)
        @api_docker = ::Ruuuby::MetaData::DockerAPI.new(engine, '1.40')
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

      #         __         __   __
      # |    | |__) .   | /  ` /  \ |\ | \  /
      # |___ | |__) .   | \__, \__/ | \|  \/
      #
      # @see https://man7.org/linux/man-pages/man3/iconv.3.html
      # @see https://en.wikipedia.org/wiki/Iconv
      # @see https://apple.stackexchange.com/questions/346453/what-the-difference-and-usage-of-encodings-utf-8-and-utf-8-mac-in-iconv

      # @return [String]
      def iconv_version; @engine.api.run_cmd!('iconv --version'); end

      # @param [String] expected_version
      #
      # @raise [ArgumentError]
      #
      # @return [String]
      def iconv_version?(expected_version)
        results = self.iconv_version
        if results.ary?
          results[0].∋?(expected_version)
        else
          results.∋?(expected_version)
        end
      end

      # @return [Array]
      def iconv_supported_encodings; @engine.api.run_cmd!('iconv -l'); end

      # @param [String] encoding_to_find
      #
      # @raise [ArgumentError]
      #
      # @return [Boolean] true, if the specified encoding was found locally
      def iconv_∃_encoding?(encoding_to_find)
        🛑str❓('encoding_to_find', encoding_to_find)
        begin
          results = @engine.api.run_cmd!("iconv -l | grep \"#{encoding_to_find}\"")
          if results.ary?
            results.∀ do |e|
              return true if e.∋?(encoding_to_find)
            end
            false
          else
            results.∋?(encoding_to_find)
          end
        rescue ::TTY::Command::ExitError
          false
        end
      end

    end # end: Class{LocaleAPI}
  end
end

# -------------------------------------------- ⚠️ --------------------------------------------
