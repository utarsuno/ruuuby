# encoding: UTF-8

module ::Math
  module UniversalFunctions
  end
end

module ::Kernel

  # @param [Float]
  #
  # @return [Float]
  def 𝚪(flt); ::Math::UniversalFunctions.gamma(flt); end

  # @param [Float] s
  # @param [Float] z
  #
  # @return [Float]
  #def 𝛾(s, z); ::Math::UniversalFunctions.gamma_incomplete(s, z); end

end
