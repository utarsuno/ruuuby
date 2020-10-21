# encoding: UTF-8

module ::Ruuuby::Protocols

  class DomainREST

    # @param [String]  base_uri
    # @param [Integer] base_port
    # @param [Hash]    base_params
    # @param [Hash]    base_headers
    def initialize(base_uri, base_port=80, base_params=nil, base_headers=nil)
      @base_uri     = base_uri
      @base_port    = base_port
      # optional defaults
      @base_headers = nil
      @base_params  = nil
    end

    def generate_uri(endpoint)
      🛑str❓('endpoint', endpoint)
      "#{@base_uri}:#{@base_port.to_s}#{endpoint}"
    end

  end

end
