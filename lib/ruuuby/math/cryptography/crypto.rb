# encoding: UTF-8

# math related code that can be categorized under +Cryptography+
module ::Math::Crypto

  @lazy_loaded = false

  # @see https://en.wikipedia.org/wiki/MD5
  #
  # @param [String] content
  #
  # @raise [ArgumentError]
  #
  # @return [String] representing a 128-bit hash value
  def self.md5(content)
    # TODO: fix extension's handling of UTF-8
    #🛑str❓('content', content, :∉∅)
    🛑str❓('content', content)
    unless @lazy_loaded
      require 'digest'
      @lazy_loaded = true
    end
    ::Digest::MD5.hexdigest(content)
  end

end
