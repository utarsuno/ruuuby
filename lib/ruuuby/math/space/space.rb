# coding: UTF-8

# mathematics related code
module ::Math

  class AbstractSpace

    attr_reader :name, :symbol, :num_dimensions

    # @param [String]  space_type
    # @param [Symbol]  symbol
    # @param [Integer] num_dimensions
    def initialize(space_type, symbol, num_dimensions)
      🛑str❓(:space_type, space_type)
      🛑sym❓(:symbol, symbol)
      🛑int❓(:num_dimensions, num_dimensions)
      @space_type     = space_type.freeze
      @symbol         = symbol
      @num_dimensions = num_dimensions
    end

  end

end
