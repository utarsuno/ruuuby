# coding: UTF-8

RSpec.describe 'f35_b00' do

  context 'feature{f35} behavior{b00} functionality' do

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
          context 'cases: error' do
            it 'bad args' do
              expect{::Math::Stats.arithmetic_mean()}.to raise_error(ArgumentError)
              expect{::Math::Stats.arithmetic_mean(nil)}.to raise_error(ArgumentError)
            end
            it 'values outside of 𝕌' do
              expect{::Math::Stats.arithmetic_mean(::Float::INFINITY)}.to raise_error(ArgumentError)
              expect{::Math::Stats.arithmetic_mean(::Float::INFINITY_NEGATIVE)}.to raise_error(ArgumentError)
            end
          end
        end
      end # end: {func{arithmetic_mean}}

      context 'func{median}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect(::Math::Stats.median(1337)).to eq(1337)
            expect(::Math::Stats.median(*[1337])).to eq(1337)

            expect(::Math::Stats.median(0, 1)).to eq(0.5)
            expect(::Math::Stats.median(1, 0)).to eq(0.5)

            expect(::Math::Stats.median(1, 2, 3)).to eq(2)
            expect(::Math::Stats.median(3, 1, 2)).to eq(2)

            expect(::Math::Stats.median(3, 3, 1)).to eq(3)
            expect(::Math::Stats.median(3, 3, 3)).to eq(3)

            expect(::Math::Stats.median(1337, 1337, 1335, 1335)).to eq(1336)
            expect(::Math::Stats.median(1337, 1337, 1335, 1335, 1337)).to eq(1337)
            expect(::Math::Stats.median(1337, 1337, 1335, 1335, 1337, 1337)).to eq(1337)
          end
          context 'cases: negative' do
            it 'bad args' do
              expect{::Math::Stats.median()}.to raise_error(ArgumentError)
              expect{::Math::Stats.median(nil)}.to raise_error(ArgumentError)
            end
            it 'values outside of 𝕌' do
              expect{::Math::Stats.median(::Float::INFINITY)}.to raise_error(ArgumentError)
              expect{::Math::Stats.median(::Float::INFINITY_NEGATIVE)}.to raise_error(ArgumentError)
            end
          end
        end
      end # end: {func{median}}
    end # end: {adds needed static functions}
  end # end: {functionality}

  context 'feature{f35} behavior{b00} audit', :audit do
    context 'module{Descriptive}' do
      it 'exists' do
        expect_∃ᵐ(:Descriptive, ::Math::Stats)
      end
      context 'w/ needed funcs' do
        it 'func{exponential_moving_average} aliased via{ema}' do
          expect_∃static⨍(:arithmetic_mean, ::Math::Stats)
          expect_∃static⨍(:median, ::Math::Stats)
        end
      end
    end
  end # end: {audit}

end
