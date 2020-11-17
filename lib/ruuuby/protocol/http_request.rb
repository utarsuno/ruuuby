# encoding: UTF-8

class Net::HTTPResponse

  def time_received; ::Time.parse(self.cache_warmup['date']); end

  # @return [Integer]
  def content_length; self.cache_warmup['content-length'].to_i; end

  # @return [String, Array]
  def content_type; self.cache_warmup['content-type']; end

  # @see https://stackoverflow.com/questions/9254891/what-does-content-type-application-json-charset-utf-8-really-mean
  #
  # @return [Boolean]
  def content_type_json?; self.content_type == 'application/json; charset=utf-8' || self.content_type == 'application/json'; end
end

module Net::HTTPHeader

  alias_method :∀ᴴ, :each_header
  alias_method :∀🔑, :each_key
  alias_method :∃🔑?, :key?

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
  #
  # @return [Boolean]
  def ∃ᴴ?(header_name)
    🛑str❓('header_name', header_name)
    self.cache_warmup
    if @cached_headers.∅?
      🛑 ::RuntimeError.new("| f{∃ᴴ?} called when the response object does not have any headers, val-self{#{self.to_s}}|")
    else
      self.∃🔑?(header_name)
    end
  end

end

module ::Ruuuby; module Protocols; end; end

# @see https://ruby-doc.org/stdlib-2.7.0/libdoc/net/http/rdoc/Net/HTTP.html
# @see https://yukimotopress.github.io/http
#
# `🌐`
module ::Ruuuby::Protocols::RequestHTTP

  module Syntax

    # @see https://stackoverflow.com/questions/1128168/validation-for-url-domain-using-regex-rails
    #
    # @type [String]
    URL = '^(((http|https):\/\/|)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,6}(:[0-9]{1,5})?(\/.*)?)$'

  end

  include ::Ruuuby::Attribute::Includable::SyntaxCache

  def self.execute_debugging(uri, params={}, headers=nil)
    the_uri  = self.parse_uri(uri, params)
    response = nil
    is_https = uri.to_s.include?('https')
    req      = ::Net::HTTP::Get.new(the_uri.request_uri)
    if headers != nil
      headers.each{|k,v| req[k] = v}
    end
    ::Net::HTTP.start(the_uri.host, the_uri.port, {use_ssl: is_https}) do |http|
      response = http.request(req)
    end
    return response, req
  end

  # TODO: TDD
  #
  # == Example
  #
  # response, request = 🌐.json("#{@domain_configs['uri']}#{@endpoint_latest}", {}, args)
  #
  # @param [URI]            uri
  # @param [Hash]           params
  # @param [Hash, NilClass] headers
  #
  # @return [Hash, NilClass]
  def self.execute_json(uri, params={}, headers={"content-type" => "application/json"})
    request, response = self.execute_post_debugging(uri, params, headers)

    if response.body.nil? || response.body.length == 0
      return nil
    end

    ::JSON.parse(response.body)
  end

  # == Example
  #
  # response, request = 🌐.post_dbg("#{@domain_configs['uri']}#{@endpoint_latest}", {}, args)
  #
  # @param [URI]            uri
  # @param [Hash]           params
  # @param [Hash, NilClass] headers
  def self.execute_post_debugging(uri, params={}, headers=nil)
    🛑hsh❓('params', params)
    🛑hsh❓('headers', headers) unless headers.nil?

    the_uri  = self.parse_uri(uri, {})
    response = nil
    is_https = uri.to_s.include?('https')
    req      = ::Net::HTTP::Post.new(the_uri.request_uri)
    if headers != nil
      headers.each{|k,v| req[k] = v}
    end
    req.body = params.to_json

    ::Net::HTTP.start(the_uri.host, the_uri.port, {use_ssl: is_https}) do |http|
      response = http.request(req)
    end

    return req, response
  end

  # @param [String, URI] uri
  # @param [Hash]        params
  # @param [Hash]        headers
  #
  # @raise [ArgumentError]
  #
  # @return [Net::HTTPResponse]
  def self.execute(uri, params={}, headers=nil)
    the_uri  = self.parse_uri(uri, params)
    response = nil
    is_https = uri.to_s.include?('https')

    req = ::Net::HTTP::Get.new(the_uri.request_uri)
    if headers != nil
      headers.each{|k,v| req[k] = v}
    end

    ::Net::HTTP.start(the_uri.host, the_uri.port, {use_ssl: is_https}) do |http|
      response = http.request(req)
    end
    return response
  end

  # TEMP
  def self.execute_get_json!(uri, params={}, headers={"content-type" => "application/json"})
    ::JSON.parse(self.execute!(uri, params, headers).body)
  end

  # TODO: add full testing coverage
  #
  # @param [String, URI] uri
  # @param [Hash]        params
  # @param [Hash]        headers
  #
  # @raise [ArgumentError, RuntimeError]
  #
  # @return [Net::HTTPResponse]
  def self.execute!(uri, params={}, headers=nil)
    the_uri  = self.parse_uri(uri, params)
    response = nil
    is_https = uri.to_s.include?('https')

    req = ::Net::HTTP::Get.new(the_uri.request_uri)
    if headers != nil
      headers.each{|k,v| req[k] = v}
    end

    ::Net::HTTP.start(the_uri.host, the_uri.port, {use_ssl: is_https}) do |http|
      response = http.request(req)
    end
    🛑 ::RuntimeError.new("| c{RequestHTTP}-> m{execute!} got non-200 response{#{response.code.to_s}} for uri{#{uri.to_s}} w/{#{the_uri.request_uri}} |") unless response.code == '200'
    return response
  end

  class << self
    alias_method :get, :execute
    alias_method :get!, :execute!
    alias_method :get_json!, :execute_get_json!
    alias_method :get_dbg, :execute_debugging
    alias_method :post_dbg, :execute_post_debugging
    alias_method :post_json, :execute_json
  end

  # @param [String, URI] uri
  #
  # @raise [ArgumentError, RuntimeError]
  #
  # @return [Net::HTTPResponse]
  def self.execute_timed!(uri)
    time_start = ::Time.now
    response   = self.execute!(uri)
    time_delta = time_start - response.time_received
    return response, time_delta
  end

  🙈

  # @see https://stackoverflow.com/questions/7785793/add-parameter-to-url/26867426
  #
  # @param [String, URI] uri
  # @param [Hash]        params
  #
  # @raise [ArgumentError]
  #
  # @return [URI, URI::HTTP]
  def self.parse_uri(uri, params)
    if uri.str?
      uri = URI(uri)
    elsif uri.ⓣ != URI && uri.ⓣ != URI::HTTP
      🛑 ::ArgumentError.new("| c{RequestHTTP}-> m{execute!} got invalid type{#{uri.Ⓣ}} for arg(uri) |")
    end
    unless params.empty?
      if uri.query == nil
        uri.query = URI.encode_www_form(params)
      else
        params    = Hash[URI.decode_www_form(uri.query || '')].merge(params)
        uri.query = URI.encode_www_form(params)
      end
    end
    uri
  end

end
