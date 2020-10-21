# encoding: UTF-8

# `💎.engine.api_locale.api_iconv`
module ::Ruuuby
  # information and utilities that define and work w/ aspects of `Ruuuby`
  module MetaData

    # @see https://man7.org/linux/man-pages/man3/iconv.3.html
    # @see https://en.wikipedia.org/wiki/Iconv
    # @see https://apple.stackexchange.com/questions/346453/what-the-difference-and-usage-of-encodings-utf-8-and-utf-8-mac-in-iconv
    class IconvAPI < ::Ruuuby::MetaData::EngineComponentAPICLI

      def initialize(engine)
        super(engine, 'iconv')
        attribute_versionable('iconv (GNU libiconv 1.11)'){💎.engine.api_locale.api_iconv.version}
      end

      # @return [Boolean]
      def healthy?; self.∃version? && self.∃_encoding?('UTF-8'); end

      # @param [String] encoding_to_find
      #
      # @raise [ArgumentError]
      #
      # @return [Boolean] true, if the specified encoding was found locally
      def ∃_encoding?(encoding_to_find)
        🛑str❓('encoding_to_find', encoding_to_find)
        begin
          results = self.run_cmd("-l | grep \"#{encoding_to_find}\"")
          if results.ary?
            results.∀{|e| return true if e.∋?(encoding_to_find)}
            return false
          else
            return results.∋?(encoding_to_find)
          end
        rescue ::TTY::Command::ExitError
          false
        end
      end

      # @return [Array]
      def supported_encodings; self.run_cmd('-l'); end

      # @return [String]
      def _calculate_version; self.run_cmd('--version')[0]; end

    end # end: {IconvAPI}

  end
end