# encoding: UTF-8

RSpec.describe 'f35_b00' do

  context 'feature{f35} behavior{b03} functionality' do
    # @see sample data source: https://school.stockcharts.com/doku.php?id=technical_indicators:moving_averages
    let(:data){[22.27, 22.19, 22.08, 22.17, 22.18, 22.13, 22.23, 22.43, 22.24, 22.29, 22.15, 22.39, 22.38, 22.61, 23.36, 24.05, 23.75, 23.83, 23.95, 23.63, 23.82, 23.87, 23.65, 23.19, 23.10, 23.33, 22.68, 23.10, 22.40, 22.17]}

    context 'adds needed static functions' do

      context 'func{exponential_moving_average}' do
        context 'handles needed scenarios' do
          # @TODO: missing scenario checks
          it 'cases: positive' do
            results = ::Math::Stats::TimeSeries.exponential_moving_average(data, 10, 2.0)
            expect(results[0].round(2)).to eq(22.22)
            expect(results[1].round(2)).to eq(22.21)
            expect(results[2].round(2)).to eq(22.24)
            expect(results[3].round(2)).to eq(22.27)
            expect(results[4].round(2)).to eq(22.33)
            expect(results[5].round(2)).to eq(22.52)
            expect(results[6].round(2)).to eq(22.80)
            expect(results[7].round(2)).to eq(22.97)
            expect(results[8].round(2)).to eq(23.13)
            expect(results[9].round(2)).to eq(23.28)
            expect(results[10].round(2)).to eq(23.34)
            expect(results[11].round(2)).to eq(23.43)
            expect(results[12].round(2)).to eq(23.51)
            expect(results[13].round(2)).to eq(23.53)
            expect(results[14].round(2)).to eq(23.47)
            expect(results[15].round(2)).to eq(23.40)
            expect(results[16].round(2)).to eq(23.39)
            expect(results[17].round(2)).to eq(23.26)
            expect(results[18].round(2)).to eq(23.23)
            expect(results[19].round(2)).to eq(23.08)
            expect(results[20].round(2)).to eq(22.92)
          end
          context 'cases: error' do
            it 'bad args' do
              expect{::Math::Stats::TimeSeries.exponential_moving_average()}.to raise_error(ArgumentError)
              expect{::Math::Stats::TimeSeries.exponential_moving_average(nil)}.to raise_error(ArgumentError)
            end
            it 'bad arg(3){smoothing_constant}' do
              expect{::Math::Stats::TimeSeries.exponential_moving_average([1, 2, 3, 4], 2, ::Float::INFINITY)}.to raise_error(ArgumentError)
            end
            it 'values outside of 𝕌 for arg(0) or outside of ℕ for arg(1)' do
              expect{::Math::Stats::TimeSeries.exponential_moving_average([::Float::INFINITY, -1], -1)}.to raise_error(ArgumentError)
              expect{::Math::Stats::TimeSeries.exponential_moving_average([1337], -1337)}.to raise_error(ArgumentError)
            end
          end
        end
      end # end: {func{exponential_moving_average}}

      context 'func{weighted_moving_average}' do
        context 'handles needed scenarios' do
          # @TODO: missing scenario checks
          it 'cases: positive' do
            results = ::Math::Stats::TimeSeries.weighted_moving_average(data, 10)
            expect(results[0].round(2)).to eq(22.20)
            expect(results[1].round(2)).to eq(22.19)
            expect(results[2].round(2)).to eq(22.20)
            expect(results[3].round(2)).to eq(22.23)
            expect(results[4].round(2)).to eq(22.25)
            expect(results[5].round(2)).to eq(22.30)
            expect(results[6].round(2)).to eq(22.38)
            expect(results[7].round(2)).to eq(22.48)
            expect(results[8].round(2)).to eq(22.57)
            expect(results[9].round(2)).to eq(22.72)
            expect(results[10].round(2)).to eq(22.89)
            expect(results[11].round(2)).to eq(23.11)
            expect(results[12].round(2)).to eq(23.32)
            expect(results[13].round(2)).to eq(23.55)
            expect(results[14].round(2)).to eq(23.75)
            expect(results[15].round(2)).to eq(23.81)
            expect(results[16].round(2)).to eq(23.73)
            expect(results[17].round(2)).to eq(23.68)
            expect(results[18].round(2)).to eq(23.61)
            expect(results[19].round(2)).to eq(23.49)
            expect(results[20].round(2)).to eq(23.40)
          end
          context 'cases: error' do
            it 'bad args' do
              expect{::Math::Stats::TimeSeries.weighted_moving_average()}.to raise_error(ArgumentError)
              expect{::Math::Stats::TimeSeries.weighted_moving_average(nil)}.to raise_error(ArgumentError)
            end
            it 'values outside of 𝕌 for arg(0) or outside of ℕ for arg(1)' do
              expect{::Math::Stats::TimeSeries.weighted_moving_average(::Float::INFINITY)}.to raise_error(ArgumentError)
              expect{::Math::Stats::TimeSeries.weighted_moving_average(::Float::INFINITY_NEGATIVE)}.to raise_error(ArgumentError)
            end
          end
        end
      end # end: {func{weighted_moving_average}}

      context 'func{simple_moving_average}' do
        context 'handles needed scenarios' do
          # @TODO: missing scenario checks
          it 'cases: positive' do
            results = ::Math::Stats::TimeSeries.simple_moving_average(data, 10)
            expect(results[0].round(2)).to eq(22.22)
            expect(results[1].round(2)).to eq(22.21)
            expect(results[2].round(2)).to eq(22.23)
            expect(results[3].round(2)).to eq(22.26)
            expect(results[4].round(2)).to eq(22.30)
            expect(results[5].round(2)).to eq(22.42)
            expect(results[6].round(2)).to eq(22.61)
            expect(results[7].round(2)).to eq(22.77)
            expect(results[8].round(2)).to eq(22.90)
            expect(results[9].round(2)).to eq(23.08)
            expect(results[10].round(2)).to eq(23.21)
            expect(results[11].round(2)).to eq(23.38)
            expect(results[12].round(2)).to eq(23.53)
            expect(results[13].round(2)).to eq(23.65)
            expect(results[14].round(2)).to eq(23.71)
            expect(results[15].round(2)).to eq(23.68)
            expect(results[16].round(2)).to eq(23.61)
            expect(results[17].round(2)).to eq(23.51)
            expect(results[18].round(2)).to eq(23.43)
            expect(results[19].round(2)).to eq(23.28)
            expect(results[20].round(2)).to eq(23.13)
          end
          context 'cases: error' do
            it 'bad args' do
              expect{::Math::Stats::TimeSeries.simple_moving_average()}.to raise_error(ArgumentError)
              expect{::Math::Stats::TimeSeries.simple_moving_average(nil)}.to raise_error(ArgumentError)
            end
            it 'values outside of 𝕌 for arg(0) or outside of ℕ for arg(1)' do
              expect{::Math::Stats::TimeSeries.simple_moving_average(::Float::INFINITY)}.to raise_error(ArgumentError)
              expect{::Math::Stats::TimeSeries.simple_moving_average(::Float::INFINITY_NEGATIVE)}.to raise_error(ArgumentError)
            end
          end
        end
      end # end: {func{simple_moving_average}}

      context 'func{aroon_up}' do
        context 'handles needed scenarios' do
          # @TODO: missing scenario checks
          it 'cases: positive' do
            results = ::Math::Stats::TimeSeries.aroon_up(data, 10)
            expect(results[0]).to eq(30)
            expect(results[1]).to eq(40)
            expect(results[2]).to eq(50)
            expect(results[3]).to eq(60)
            expect(results[4]).to eq(10)
            expect(results[5]).to eq(10)
            expect(results[6]).to eq(10)
            expect(results[7]).to eq(20)
            expect(results[8]).to eq(30)
            expect(results[9]).to eq(40)
            expect(results[10]).to eq(50)
            expect(results[11]).to eq(60)
            expect(results[12]).to eq(70)
            expect(results[13]).to eq(80)
            expect(results[14]).to eq(90)
            expect(results[15]).to eq(100)
            expect(results[16]).to eq(80)
            expect(results[17]).to eq(90)
            expect(results[18]).to eq(100)
            expect(results[19]).to eq(80)
            expect(results[20]).to eq(90)
          end
          context 'cases: error' do
            it 'bad args' do
              expect{::Math::Stats::TimeSeries.aroon_up()}.to raise_error(ArgumentError)
              expect{::Math::Stats::TimeSeries.aroon_up(nil)}.to raise_error(ArgumentError)
            end
            it 'values outside of 𝕌 for arg(0) or outside of ℕ for arg(1)' do
              expect{::Math::Stats::TimeSeries.aroon_up(::Float::INFINITY)}.to raise_error(ArgumentError)
              expect{::Math::Stats::TimeSeries.aroon_up(::Float::INFINITY_NEGATIVE)}.to raise_error(ArgumentError)
            end
          end
        end
      end # end: {func{aroon_up}}

      context 'func{aroon_down}' do
        context 'handles needed scenarios' do
          # @TODO: missing scenario checks
          it 'cases: positive' do
            results = ::Math::Stats::TimeSeries.aroon_down(data, 10)
            expect(results[0]).to eq(80)
            expect(results[1]).to eq(90)
            expect(results[2]).to eq(100)
            expect(results[3]).to eq(80)
            expect(results[4]).to eq(90)
            expect(results[5]).to eq(100)
            expect(results[6]).to eq(60)
            expect(results[7]).to eq(70)
            expect(results[8]).to eq(80)
            expect(results[9]).to eq(90)
            expect(results[10]).to eq(100)
            expect(results[11]).to eq(90)
            expect(results[12]).to eq(100)
            expect(results[13]).to eq(100)
            expect(results[14]).to eq(10)
            expect(results[15]).to eq(10)
            expect(results[16]).to eq(20)
            expect(results[17]).to eq(10)
            expect(results[18]).to eq(20)
            expect(results[19]).to eq(10)
            expect(results[20]).to eq(10)
          end
          context 'cases: error' do
            it 'bad args' do
              expect{::Math::Stats::TimeSeries.aroon_down()}.to raise_error(ArgumentError)
              expect{::Math::Stats::TimeSeries.aroon_down(nil)}.to raise_error(ArgumentError)
            end
            it 'values outside of 𝕌 for arg(0) or outside of ℕ for arg(1)' do
              expect{::Math::Stats::TimeSeries.aroon_down(::Float::INFINITY)}.to raise_error(ArgumentError)
              expect{::Math::Stats::TimeSeries.aroon_down(::Float::INFINITY_NEGATIVE)}.to raise_error(ArgumentError)
            end
          end
        end
      end # end: {func{aroon_down}}

      context 'func{aroon_oscillator}' do
        context 'handles needed scenarios' do
          # @TODO: missing scenario checks
          it 'cases: positive' do
            results    = ::Math::Stats::TimeSeries.aroon_oscillator(data, 10)
            aroon_up   = ::Math::Stats::TimeSeries.aroon_up(data, 10)
            aroon_down = ::Math::Stats::TimeSeries.aroon_down(data, 10)
            (0..20).∀ {|scenario| expect(results[scenario]).to eq(aroon_up[scenario] - aroon_down[scenario])}
          end
          context 'cases: error' do
            it 'bad args' do
              expect{::Math::Stats::TimeSeries.aroon_oscillator()}.to raise_error(ArgumentError)
              expect{::Math::Stats::TimeSeries.aroon_oscillator(nil)}.to raise_error(ArgumentError)
            end
            it 'values outside of 𝕌 for arg(0) or outside of ℕ for arg(1)' do
              expect{::Math::Stats::TimeSeries.aroon_oscillator(::Float::INFINITY)}.to raise_error(ArgumentError)
              expect{::Math::Stats::TimeSeries.aroon_oscillator(::Float::INFINITY_NEGATIVE)}.to raise_error(ArgumentError)
            end
          end
        end
      end # end: {func{aroon_oscillator}}

    end # end: {adds needed static functions}
  end # end: {functionality}

  context 'module{TimeSeries}', :audit do
    it 'exists', :audit do
      expect_∃ᵐ(:TimeSeries, ::Math::Stats)
    end
    context 'w/ needed funcs' do
      it 'func{exponential_moving_average} aliased via{ema}'  do
        expect_∃⨍_static(:exponential_moving_average, ::Math::Stats::TimeSeries)
        expect_∃⨍_static(:ema, ::Math::Stats::TimeSeries)
      end
      it 'func{weighted_moving_average} aliased via{wma}'  do
        expect_∃⨍_static(:weighted_moving_average, ::Math::Stats::TimeSeries)
        expect_∃⨍_static(:wma, ::Math::Stats::TimeSeries)
      end
      it 'func{simple_moving_average} aliased via{sma}'  do
        expect_∃⨍_static(:simple_moving_average, ::Math::Stats::TimeSeries)
        expect_∃⨍_static(:sma, ::Math::Stats::TimeSeries)
      end
      it 'func{aroon_up} aliased via{aroon⇧}' do
        expect_∃⨍_static(:aroon_up, ::Math::Stats::TimeSeries)
      end
      it 'func{aroon_down}' do
        expect_∃⨍_static(:aroon_down, ::Math::Stats::TimeSeries)
      end
      it 'func{aroon_oscillator}' do
        expect_∃⨍_static(:aroon_oscillator, ::Math::Stats::TimeSeries)
      end
    end
  end # end: {audits}

end
