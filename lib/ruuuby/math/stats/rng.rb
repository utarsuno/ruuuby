# encoding: UTF-8

# `🎲` | random number generation
module ::Math::Stats::RNG

  def self.𝔦𝔦(min, max)
    🛑int❓('min', min)
    🛑int❓('max', max)
    if min >= max
      🛑 ::ArgumentError.new("| a{🎲}-> m{𝔦𝔦} received args min{#{min.to_s}} and max{#{max.to_s}} w/ min being larger or equal to max |")
    end
    min + rand((max - min) + 1)
  end

  def self.𝔦(arg)
    🛑int❓('arg', arg, :∉∅)
    if arg > 0
      return rand(arg + 1)
    end
    rand(arg - 1) * -1
  end

  def self.𝔣; rand(0); end

end
