# utf-8

module ::Math::Stats
  module Distribution
    # utilities for common operations performed w/ `normal distributions`
    module Normal
      class << self
        # `cdf`: `cumulative distribution function`
        # integral on normal distribution over range [-∞, z]
        alias cdf area_below
      end
    end
  end
end
