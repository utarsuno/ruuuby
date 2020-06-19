# coding: UTF-8

RSpec.describe 'f35_b00' do

  context 'feature{f35} behavior{b03} functionality' do

    context 'module{TimeSeries}' do
      it 'exists', :audit do
        expect_∃ᵐ(:TimeSeries, ::Math::Stats)
      end
    end

    context 'adds needed static functions' do

      context 'func{exponential_moving_average}' do
        context 'handles needed scenarios' do
          # @TODO: missing scenario checks
          it 'cases: positive' do
            # @see sample data source: https://school.stockcharts.com/doku.php?id=technical_indicators:moving_averages
            data    = [22.27, 22.19, 22.08, 22.17, 22.18, 22.13, 22.23, 22.43, 22.24, 22.29, 22.15, 22.39, 22.38, 22.61, 23.36, 24.05, 23.75, 23.83, 23.95, 23.63, 23.82, 23.87, 23.65, 23.19, 23.10, 23.33, 22.68, 23.10, 22.40, 22.17]
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
          it 'cases: error' do
            expect{::Math::Stats.arithmetic_mean()}.to raise_error(ArgumentError)
            expect{::Math::Stats.arithmetic_mean(nil)}.to raise_error(ArgumentError)
            expect{::Math::Stats.arithmetic_mean([::Float::INFINITY, -1], -1)}.to raise_error(ArgumentError)
            expect{::Math::Stats.arithmetic_mean([1337], -1337)}.to raise_error(ArgumentError)
          end
        end

      end

    end

  end # end: {functionality}
end
