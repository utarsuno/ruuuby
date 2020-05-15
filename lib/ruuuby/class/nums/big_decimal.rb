# coding: UTF-8

# `Ruuuby` modifications to existing class{+BigDecimal+}
class BigDecimal

  # @return [Boolean]
  def one?; self == 1; end

  # @return [Boolean]
  def smells_like_int?; self.finite? && ((self % 1) == 0); end

end
