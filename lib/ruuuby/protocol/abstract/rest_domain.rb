# utf-8

# utilities for various web protocols
module ::Ruuuby::Protocols
  # for simple domains only, does not support any complexity whatsoever (for now)
  class DomainREST
    attr_reader :protocol, :host, :port, :base_headers, :base_params, :url

    # @param [String]          protocol
    # @param [String]          host
    # @param [String, Integer] port
    # @param [Hash]            _base_params
    # @param [Hash]            _base_headers
    def initialize(protocol = 'http://', host = 'localhost', port = 80, _base_params = nil, _base_headers = nil)
      @protocol     = protocol
      @host         = host
      @port         = port.to_s
      @url          = "#{@protocol}#{@host}:#{@port}"
      # optional defaults
      @base_headers = nil
      @base_params  = nil
    end
  end
end
