# coding: UTF-8

RSpec.describe 'f35' do

  context 'hybrid tests', :integration do

    context 'dual-behaviors' do

      context 'feature{f35}, behaviors{b00, b03}' do
        it '{simple_moving_average} matches data provided from {arithmetic_mean}' do
          data = [1337, (🎲(1337) + 1), (🎲(1337) + 1), (🎲(1337) + 1), (🎲(1337) + 1)]
          expect(::Math::Stats.μ(*data)).to eq(::Math::Stats::TimeSeries.simple_moving_average(data, data.length)[0])
        end
      end # end: {feature{f35}, behaviors{b00, b03}}

    end # end: {dual-behaviors}

  end

end
