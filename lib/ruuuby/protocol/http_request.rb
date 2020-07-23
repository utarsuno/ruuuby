# encoding: UTF-8

module Net::HTTPHeader

  alias_method :∀ᴴ, :each_header
  alias_method :∀🔑, :each_key

  attr_reader :cached_headers

  # @return [Hash]
  def cache_warmup
    @cached_headers = self.∀ᴴ.to_h if @cached_headers.nil?
    @cached_headers
  end

  # expected values for arg{header_name}
  #  | value          |
  #  | -------------- |
  #  | server         |
  #  | date           |
  #  | content-type   |
  #  | content-length |
  #  | connection     |
  #
  # @param [String] header_name
  #
  # @raise [ArgumentError]
  def ∃ᴴ?(header_name)
    🛑str❓('header_name', header_name)
    self.cache_warmup
    if @cached_headers.∅?
      🛑 ::RuntimeError.new("| f{∃ᴴ?} called when the response object does not have any headers, val-self{#{self.to_s}}|")
    else
      self.∀🔑 do |header|
        return true if header == header_name
      end
      false
    end
  end

end

module ::Ruuuby
  module Protocols

    # @see https://ruby-doc.org/stdlib-2.7.0/libdoc/net/http/rdoc/Net/HTTP.html
    module RequestHTTP

      # TODO: add full testing coverage
      #
      # @param [String, URI] uri
      #
      # @raise [ArgumentError, RuntimeError]
      #
      # @return [Net::HTTPResponse]
      def self.execute!(uri)
        if uri.str?
          the_uri = URI(uri)
        elsif uri.ⓣ == URI
          the_uri = uri
        else
          🛑 ::ArgumentError.new("| c{RequestHTTP}-> m{execute!} got invalid type{#{uri.Ⓣ}} for arg(uri)|")
        end
        response = nil
        ::Net::HTTP.start(the_uri.host, the_uri.port) do |http|
          request  = Net::HTTP::Get.new(uri)
          response = http.request(request)
        end
        🛑 ::RuntimeError.new("| c{RequestHTTP}-> m{execute!} got non-200 response{#{response.code.to_s}} for uri{#{uri.to_s}}|") unless response.code == '200'
        return response
      end

    end
  end
end
