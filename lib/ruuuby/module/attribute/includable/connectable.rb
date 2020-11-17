# encoding: UTF-8

module ::Ruuuby::Attribute

  # should be included
  module Connectable

    # @param [Boolean] wait_for_connection
    #
    # @raise [ArgumentError]
    def connect(wait_for_connection=false)
      🛑bool❓('wait_for_connection', wait_for_connection)
      self._connect(wait_for_connection) unless self.connected?
    end

    # @return [Boolean]
    def connected?;
      begin
        self._connected?
      rescue
        false
      end
    end

    def disconnect; self._disconnect if self.connected?; end

    # @param [Boolean] wait_for_connection
    #
    # @raise [ArgumentError, RuntimeError]
    def connect!(wait_for_connection=false)
      🛑bool❓('wait_for_connection', wait_for_connection)
      if self.connected?
        🛑 ::RuntimeError.new("| {#{self.Ⓣ}}-> m{connect!} called when the connection already exists |")
      else
        self._connect(wait_for_connection)
      end
    end

    # @raise [RuntimeError]
    def disconnect!
      if self.connected?
        self._disconnect
      else
        🛑 ::RuntimeError.new("| {#{self.Ⓣ}}-> m{disconnect!} called when the docker-engine is not running |")
      end
    end

  end

end

