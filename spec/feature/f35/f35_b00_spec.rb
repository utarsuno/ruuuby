# coding: UTF-8

RSpec.describe 'f35_b00' do

  context 'feature{f35} behavior{b00} functionality' do

    context 'module{DescriptiveStatistics}' do
      it 'exists', :audit do
        expect_∃ᵐ(:DescriptiveStatistics, ::Math::Stats)
      end
    end

    context 'adds needed static functions' do

      context 'func{arithmetic_mean}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect(::Math::Stats.arithmetic_mean(1337, 1)).to eq(1338 / 2)
            expect(::Math::Stats.arithmetic_mean(1, 1337)).to eq(1338 / 2)
            expect(::Math::Stats.arithmetic_mean(*[1337, 1])).to eq(1338 / 2)
            expect(::Math::Stats.arithmetic_mean(*[1, 1337])).to eq(1338 / 2)

            expect(::Math::Stats.arithmetic_mean(1337)).to eq(1337)
            expect(::Math::Stats.arithmetic_mean(1337, 1337)).to eq(1337)
            expect(::Math::Stats.arithmetic_mean(1337, 1337, 1337)).to eq(1337)
            expect(::Math::Stats.arithmetic_mean(1337, 1337, 1337, 1337)).to eq(1337)
            expect(::Math::Stats.arithmetic_mean(1337, 1337, 1337, 1337, 1337)).to eq(1337)

            expect(::Math::Stats.arithmetic_mean(66, 57, 71, 54, 69, 58)).to eq(62.5)
            expect(::Math::Stats.arithmetic_mean(1.79, 1.61, 1.96, 2.08)).to eq(1.86)
            expect(::Math::Stats.arithmetic_mean(2.7, 8.3, 3.5, 5.1, 4.9)).to eq(4.9)
            expect(::Math::Stats.arithmetic_mean(2.6, 7.2, 3.5, 9.8, 2.5)).to eq(5.12)

            last_scenario = [234 + 643 + 65742 + 14532 - 625234 + 235 + 564362 + 1337 + 1337 - 99999]
            expect(::Math::Stats.arithmetic_mean(*last_scenario)).to eq((last_scenario.sum.to_f) / last_scenario.length)
          end
          it 'cases: error' do
            expect{::Math::Stats.arithmetic_mean()}.to raise_error(ArgumentError)
            expect{::Math::Stats.arithmetic_mean(nil)}.to raise_error(ArgumentError)
          end
        end
      end

    end

  end # end: {functionality}
end
