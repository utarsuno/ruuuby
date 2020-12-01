# utf-8

RSpec.describe 'f35_b05' do
  let(:bell_curve){::Math::Stats::Distribution::Normal}
  let(:area_up_to_n1){0.1587}
  let(:area_up_to_n2){0.0228}
  let(:area_up_to_n3){0.0013}
  let(:area_up_to_1){0.8413}
  let(:area_up_to_2){0.9772}
  let(:area_up_to_3){0.9987}

  context 'feature{f35} behavior{b05} functionality' do
    context 'module{Distribution}' do
      context 'module{Normal}' do

        context 'func{area_above}' do
          context 'handles needed scenarios' do
            it 'cases: positive' do
              expect(bell_curve.area_above(::Float::INFINITY_NEGATIVE).round(5)).to eq(1.0)
              expect(bell_curve.area_above(::Float::INFINITY).round(5)).to eq(0.0)

              expect(bell_curve.area_above(-3.0).round(4)).to eq(area_up_to_3)
              expect(bell_curve.area_above(-2.0).round(4)).to eq(area_up_to_2)
              expect(bell_curve.area_above(-1.0).round(4)).to eq(area_up_to_1)
              expect(bell_curve.area_above(-0.5).round(4)).to eq(0.6915)
              expect(bell_curve.area_above(0.0).round(4)).to eq(0.5)
              expect(bell_curve.area_above(0.5).round(4)).to eq(0.3085)
              expect(bell_curve.area_above(1.0).round(4)).to eq(area_up_to_n1)
              expect(bell_curve.area_above(2.0).round(4)).to eq(area_up_to_n2)
              expect(bell_curve.area_above(3.0).round(4)).to eq(area_up_to_n3)
            end
            it 'cases: negative' do
              expect{bell_curve.area_above(nil)}.to raise_error(::ArgumentError)
              expect{bell_curve.area_above('1337')}.to raise_error(::ArgumentError)
            end
          end
        end

        context 'func{area_below} and alias{cdf}' do
          context 'handles needed scenarios' do
            context 'cases: positive' do
              it 'w/ area_below' do
                expect(bell_curve.area_below(::Float::INFINITY_NEGATIVE).round(5)).to eq(0.0)
                expect(bell_curve.area_below(::Float::INFINITY).round(5)).to eq(1.0)

                expect(bell_curve.area_below(-3.0).round(4)).to eq(area_up_to_n3)
                expect(bell_curve.area_below(-2.0).round(4)).to eq(area_up_to_n2)
                expect(bell_curve.area_below(-1.0).round(4)).to eq(area_up_to_n1)
                expect(bell_curve.area_below(-0.5).round(4)).to eq(0.3085)
                expect(bell_curve.area_below(0.0).round(4)).to eq(0.5)
                expect(bell_curve.area_below(0.5).round(4)).to eq(0.6915)
                expect(bell_curve.area_below(1.0).round(4)).to eq(area_up_to_1)
                expect(bell_curve.area_below(2.0).round(4)).to eq(area_up_to_2)
                expect(bell_curve.area_below(3.0).round(4)).to eq(area_up_to_3)
              end
              it 'w/ cdf' do
                expect(bell_curve.cdf(::Float::INFINITY_NEGATIVE).round(5)).to eq(0.0)
                expect(bell_curve.cdf(::Float::INFINITY).round(5)).to eq(1.0)

                expect(bell_curve.cdf(-3.0).round(4)).to eq(area_up_to_n3)
                expect(bell_curve.cdf(-2.0).round(4)).to eq(area_up_to_n2)
                expect(bell_curve.cdf(-1.0).round(4)).to eq(area_up_to_n1)
                expect(bell_curve.cdf(-0.5).round(4)).to eq(0.3085)
                expect(bell_curve.cdf(0.0).round(4)).to eq(0.5)
                expect(bell_curve.cdf(0.5).round(4)).to eq(0.6915)
                expect(bell_curve.cdf(1.0).round(4)).to eq(area_up_to_1)
                expect(bell_curve.cdf(2.0).round(4)).to eq(area_up_to_2)
                expect(bell_curve.cdf(3.0).round(4)).to eq(area_up_to_3)
              end
            end
            context 'cases: negative' do
              it 'w/ area_below' do
                expect{bell_curve.area_below(nil)}.to raise_error(::ArgumentError)
                expect{bell_curve.area_below('1337')}.to raise_error(::ArgumentError)
              end
              it 'w/ cdf' do
                expect{bell_curve.cdf(nil)}.to raise_error(::ArgumentError)
                expect{bell_curve.cdf('1337')}.to raise_error(::ArgumentError)
              end
            end
          end
        end

        context 'func{area_between}' do
          context 'handles needed scenarios' do
            it 'cases: positive' do
              expect(bell_curve.area_between(-12.0, 3.0).round(4)).to eq(area_up_to_3)
              expect(bell_curve.area_between(-12.0, 2.0).round(4)).to eq(area_up_to_2)
              expect(bell_curve.area_between(-12.0, 1.0).round(4)).to eq(area_up_to_1)
              expect(bell_curve.area_between(-12.0, 0.0).round(4)).to eq(0.5)

              expect(bell_curve.area_between(-3.0, 12.0).round(4)).to eq(area_up_to_3)
              expect(bell_curve.area_between(-2.0, 12.0).round(4)).to eq(area_up_to_2)
              expect(bell_curve.area_between(-1.0, 12.0).round(4)).to eq(area_up_to_1)
              expect(bell_curve.area_between(0.0, 12.0).round(4)).to eq(0.5)

              expect(bell_curve.area_between(-3.0, -2.0).round(4)).to eq(0.0214)
              expect(bell_curve.area_between(2.0, 3.0).round(4)).to eq(0.0214)

              expect(bell_curve.area_between(-1.0, -2.0).round(4)).to eq(0.1359)
              expect(bell_curve.area_between(2.0, 1.0).round(4)).to eq(0.1359)

              expect(bell_curve.area_between(-1.0, 1.0).round(4)).to eq(0.6827)
              expect(bell_curve.area_between(-2.0, 2.0).round(4)).to eq(0.9545)
              expect(bell_curve.area_between(-3.0, 3.0).round(4)).to eq(0.9973)
            end
            it 'cases: negative' do
              expect{bell_curve.area_between(nil, 1337.0)}.to raise_error(::ArgumentError)
              expect{bell_curve.area_between(1337.0, '1337')}.to raise_error(::ArgumentError)
            end
          end
        end

        context 'func{area_outside}' do
          context 'handles needed scenarios' do
            it 'cases: positive' do
              expect(bell_curve.area_outside(-12.0, 3.0).round(4)).to eq((1.0 - area_up_to_3).round(4))
              expect(bell_curve.area_outside(-12.0, 2.0).round(4)).to eq((1.0 - area_up_to_2).round(4))
              expect(bell_curve.area_outside(-12.0, 1.0).round(4)).to eq((1.0 - area_up_to_1).round(4))
              expect(bell_curve.area_outside(-12.0, 0.0).round(4)).to eq(0.5)

              expect(bell_curve.area_outside(-3.0, 12.0).round(4)).to eq((1.0 - area_up_to_3).round(4))
              expect(bell_curve.area_outside(-2.0, 12.0).round(4)).to eq((1.0 - area_up_to_2).round(4))
              expect(bell_curve.area_outside(-1.0, 12.0).round(4)).to eq((1.0 - area_up_to_1).round(4))
              expect(bell_curve.area_outside(0.0, 12.0).round(4)).to eq(0.5)

              expect(bell_curve.area_outside(-3.0, -2.0).round(4)).to eq((1.0 - 0.0214).round(4))
              expect(bell_curve.area_outside(2.0, 3.0).round(4)).to eq((1.0 - 0.0214).round(4))

              expect(bell_curve.area_outside(-1.0, -2.0).round(4)).to eq((1.0 - 0.1359).round(4))
              expect(bell_curve.area_outside(2.0, 1.0).round(4)).to eq((1.0 - 0.1359).round(4))

              expect(bell_curve.area_outside(-1.0, 1.0).round(4)).to eq((1.0 - 0.6827).round(4))
              expect(bell_curve.area_outside(-2.0, 2.0).round(4)).to eq((1.0 - 0.9545).round(4))
              expect(bell_curve.area_outside(-3.0, 3.0).round(4)).to eq((1.0 - 0.9973).round(4))
            end
            it 'cases: negative' do
              expect{bell_curve.area_outside(nil, 1337.0)}.to raise_error(::ArgumentError)
              expect{bell_curve.area_outside(1337.0, '1337')}.to raise_error(::ArgumentError)
            end
          end
        end

      end
    end
  end

  context 'feature{f35} behavior{b05} audit', :audit do
    context 'module{Descriptive}' do
      it 'exists' do
        expect_∃ᵐ(:Distribution, ::Math::Stats)
        expect_∃ᵐ(:Normal, ::Math::Stats::Distribution)
      end
      context 'w/ needed funcs' do
        it 'func{exponential_moving_average} aliased via{ema}' do
          expect_∃⨍_static(:area_below, ::Math::Stats::Distribution::Normal)
          expect_∃⨍_static(:cdf, ::Math::Stats::Distribution::Normal)
          expect_∃⨍_static(:area_above, ::Math::Stats::Distribution::Normal)
          expect_∃⨍_static(:area_between, ::Math::Stats::Distribution::Normal)
          expect_∃⨍_static(:area_outside, ::Math::Stats::Distribution::Normal)
        end
      end
    end
  end

  # TODO: TEMP LOCATION
  context '::Math::UniversalFunctions' do
    context 'gamma function' do
      context 'handles needed scenarios' do
        context 'cases: positive' do
          it 'regular nums' do
            expect≈≈(𝚪(0.5), √(π))
          end
          it 'equaling inf' do
            expect≈≈(𝚪(0.0), ∞)
            expect≈≈(𝚪(1337.0), ∞)
            expect≈≈(𝚪(∞), ∞)
          end
        end
        context 'cases: negative' do
          it 'returning NaN' do
            expect(𝚪(-1.0)).to eq(Float::INFINITY_COMPLEX)
          end
          it 'throwing error' do
            expect{𝚪(1337)}.to raise_error(::ArgumentError)
            expect{𝚪('1337')}.to raise_error(::ArgumentError)
            expect{𝚪(nil)}.to raise_error(::ArgumentError)
          end
        end
      end
    end
  end

end
