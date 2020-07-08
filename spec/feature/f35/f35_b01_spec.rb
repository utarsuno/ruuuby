# coding: UTF-8

RSpec.describe 'f35_b01' do

  context 'feature{f35} behavior{b01} functionality' do

    context 'adds needed static functions' do
      context 'func{arithmetic_mean}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect(::Math::Stats.μ(1337, 1)).to eq(1338 / 2)
            expect(::Math::Stats.μ(1337, 1338, 1339)).to eq((1337 + 1338 + 1339) / 3.0)
          end
          context 'cases: error' do
            it 'bad args' do
              expect{::Math::Stats.μ()}.to raise_error(ArgumentError)
              expect{::Math::Stats.μ(nil)}.to raise_error(ArgumentError)
            end
            it 'values outside of 𝕌' do
              expect{::Math::Stats.μ(::Float::INFINITY)}.to raise_error(ArgumentError)
              expect{::Math::Stats.μ(::Float::INFINITY_NEGATIVE)}.to raise_error(ArgumentError)
            end
          end
        end
      end # end: {func{arithmetic_mean}}

      context 'func{median}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect(::Math::Stats.x̃(1337)).to eq(1337)
            expect(::Math::Stats.x̃(*[1337])).to eq(1337)

            expect(::Math::Stats.x̃(0, 1)).to eq(0.5)
            expect(::Math::Stats.x̃(1, 0)).to eq(0.5)

            expect(::Math::Stats.x̃(1, 2, 3)).to eq(2)
            expect(::Math::Stats.x̃(3, 1, 2)).to eq(2)

            expect(::Math::Stats.x̃(3, 3, 1)).to eq(3)
            expect(::Math::Stats.x̃(3, 3, 3)).to eq(3)

            expect(::Math::Stats.x̃(1337, 1337, 1335, 1335)).to eq(1336)
            expect(::Math::Stats.x̃(1337, 1337, 1335, 1335, 1337)).to eq(1337)
            expect(::Math::Stats.x̃(1337, 1337, 1335, 1335, 1337, 1337)).to eq(1337)
          end
          context 'cases: negative' do
            it 'bad args' do
              expect{::Math::Stats.x̃()}.to raise_error(ArgumentError)
              expect{::Math::Stats.x̃(nil)}.to raise_error(ArgumentError)
            end
            it 'values outside of 𝕌' do
              expect{::Math::Stats.x̃(::Float::INFINITY)}.to raise_error(ArgumentError)
              expect{::Math::Stats.x̃(::Float::INFINITY_NEGATIVE)}.to raise_error(ArgumentError)
            end
          end
        end
      end # end: {func{median}}
    end # end: {adds needed static functions}
  end # end: {functionality}

  context 'feature{f35} behavior{b01} audit', :audit do
    context 'module{Descriptive}' do
      it 'exists' do
        expect_∃ᵐ(:Descriptive, ::Math::Stats)
      end
      context 'w/ needed funcs' do
        it 'func{exponential_moving_average} aliased via{ema}' do
          expect_∃⨍_static(:percentage_error, ::Math::Stats::Descriptive)
          expect_∃⨍_static(:𝛿, ::Math::Stats::Descriptive)
        end
      end
    end
  end # end: {audit}

end
