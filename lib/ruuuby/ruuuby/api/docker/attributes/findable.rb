# utf-8

module ::Ruuuby::Attribute

  # should be extended
  module Findable

    # @param [String] name
    #
    # @raise [ArgumentError]
    def validate_name_arg(name); 🛑str❓(self::SEARCH_ARG, name); end

    # @param [String] name
    #
    # @raise [ArgumentError]
    #
    # @return [Boolean]
    def ∃?(name)
      self.validate_name_arg(name)
      begin
        self.get(name).ⓣ == self
      rescue ::Docker::Error::NotFoundError
        false
      end
    end

    # @param [String] name
    #
    # @raise [ArgumentError]
    #
    # @return [Boolean]
    def ∄?(name); !(self.∃?(name)); end

    # @param [String] name
    #
    # @raise [ArgumentError]
    #
    # @return [*]
    def fetch(name)
      self.validate_name_arg(name)
      begin
        self.get(name)
      rescue ::Docker::Error::NotFoundError => err
        raise err
      end
    end

    alias [] fetch

    # @param [String] name
    #
    # @raise [ArgumentError, RuntimeError]
    #
    # @return [Boolean]
    def ♻️(name)
      if self.∃?(name)
        self._♻️(name)
        return true
      end
      false
    end

    # @param [String] name
    #
    # @raise [ArgumentError, RuntimeError]
    def ♻️!(name)
      unless self.∃?(name)
        🛑 ::RuntimeError.new("| c{#{self.Ⓣ}}-> m{♻️!} did not find any matched for name{#{name}} |")
      end
      self._♻️(name)
    end

    🛡️

    # @param [String] name
    #
    # @raise [ArgumentError]
    def _♻️(name)
      self.validate_name_arg(name)
      self.get(name).♻️
    end

  end # end: {module {Findable}}

end
