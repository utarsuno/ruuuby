# coding: UTF-8

# mathematics related
module ::Math

  # math related code that can be categorized under +Space+
  module Space

    # elements are ordered n-paired numbers
    class EuclideanSpace < AbstractSpace
      def initialize(symbol, num_dimensions); super('euclidean', symbol, num_dimensions); end
    end

    # elements are ordered 1-paired numbers
    class EuclideanSpace𝔼¹ < EuclideanSpace
      include ::Ruuuby::Attribute::Includable::RuuubySingleton

      def initialize; super(:𝔼¹, 1); end
    end

    # elements are ordered 2-paired numbers
    class EuclideanSpace𝔼² < EuclideanSpace
      include ::Ruuuby::Attribute::Includable::RuuubySingleton

      def initialize; super(:𝔼², 2); end
    end

    # elements are ordered 3-paired numbers
    class EuclideanSpace𝔼³ < EuclideanSpace
      include ::Ruuuby::Attribute::Includable::RuuubySingleton

      def initialize; super(:𝔼³, 3); end
    end

  end

end
