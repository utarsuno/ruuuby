# coding: UTF-8

RSpec.describe 'f36' do

  before :all do
    @data_all_same  = ::TimeSeriesData.new([10, 10, 10, 10, 10, 10, 10, 10, 10, 10], 8)
    @data           = ::TimeSeriesData.new((0..99).to_a, 10)
    @data_leet      = ::TimeSeriesData.new([1337, 1337, 1337, 1337, 1337, 1337, 1337, 1337, 1338, 1338, 1339], 7)
    @data_simple    = ::TimeSeriesData.new([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 3)
    @data_predicted = [1.9, 2.8, 3.7, 4.6, 5.5, 6.4, 7.3, 8.2, 9.1, 10.0]
  end

  after :all do
    expect{@data_all_same.free_memory}.to_not raise_error
    expect{@data.free_memory}.to_not raise_error
    expect{@data_leet.free_memory}.to_not raise_error
    expect{@data_simple.free_memory}.to_not raise_error
  end

  context 'functionality' do
    context 'class{TimeSeriesData}' do

      context 'has needed functions' do
        context 'relating to stats/math' do

          context 'func{mse}' do
            context 'handles needed scenarios' do
              it 'cases: positive' do
                expect(@data_simple.mse(@data_predicted)).to eq(0.31666666666666654)
              end
              it 'cases: error' do
                expect{@data_simple.mse((@data_predicted + [1337]))}.to raise_error(::ArgumentError)
                expect{@data_simple.mse(([1337] + @data_predicted))}.to raise_error(::ArgumentError)
                expect{@data_simple.mse([1337])}.to raise_error(::ArgumentError)
                expect{@data_simple.mse(nil)}.to raise_error(::ArgumentError)
              end
            end
          end # end: {func{mse}}

          context 'func{mape}' do
            context 'handles needed scenarios' do
              it 'cases: positive' do
                expect(@data_simple.mape(@data_predicted)).to eq(0.19289682539682537)
              end
              context 'cases: error' do
                it 'bad args' do
                  expect{@data_simple.mape((@data_predicted + [1337]))}.to raise_error(::ArgumentError)
                  expect{@data_simple.mape(([1337] + @data_predicted))}.to raise_error(::ArgumentError)
                  expect{@data_simple.mape([1337])}.to raise_error(::ArgumentError)
                  expect{@data_simple.mape(nil)}.to raise_error(::ArgumentError)
                end
                it 'when original data contains value 0' do
                  expect{@data.mape((0..99).to_a)}.to raise_error(::RuntimeError)
                end
              end
            end
          end # end: {func{mape}}
        end # end: {relating to stats/math}

      end # end: {has needed functions}
    end # end: {class{TimeSeriesData}}
  end

  context 'hybrid tests', :integration do

    context '{f36_b03}, {f35_b00}' do
      context 'func{mape} can be verified w/ func{percentage_error} aliased via{𝛿}' do
        it 'handling needed test case' do
          calculated_values = [
              ::Math::Stats::Descriptive.𝛿(1.9, 1.0) / 100.0,
              ::Math::Stats::Descriptive.𝛿(2.8, 2.0) / 100.0,
              ::Math::Stats::Descriptive.𝛿(3.7, 3.0) / 100.0,
              ::Math::Stats::Descriptive.𝛿(4.6, 4.0) / 100.0,
              ::Math::Stats::Descriptive.𝛿(5.5, 5.0) / 100.0,
              ::Math::Stats::Descriptive.𝛿(6.4, 6.0) / 100.0,
              ::Math::Stats::Descriptive.𝛿(7.3, 7.0) / 100.0,
              ::Math::Stats::Descriptive.𝛿(8.2, 8.0) / 100.0,
              ::Math::Stats::Descriptive.𝛿(9.1, 9.0) / 100.0,
              ::Math::Stats::Descriptive.𝛿(10.0, 10.0) / 100.0,
          ]

          expect(calculated_values[0]).to eq(0.8999999999999999)
          expect(calculated_values[1]).to eq(0.3999999999999999)
          expect(calculated_values[2]).to eq(0.2333333333333334)
          expect(calculated_values[3]).to eq(0.1499999999999999)
          expect(calculated_values[4]).to eq(0.1)
          expect(calculated_values[5]).to eq(0.06666666666666672)
          expect(calculated_values[6]).to eq(0.04285714285714283)
          expect(calculated_values[7]).to eq(0.02499999999999991)
          expect(calculated_values[8]).to eq(0.011111111111111072)
          expect(calculated_values[9]).to eq(0.0)

          expect(@data_simple.mape(@data_predicted)).to eq(0.19289682539682537)
          expect(@data_simple.mape(@data_predicted)).to eq(::Math::Stats.μ(*calculated_values))
        end
      end
    end # end: {{f36_b03}, {f35_b00}}

  end # end: {hybrid tests}

  context 'audits{f36_b03}',:audit do
    context 'class{TimeSeriesData} is defined as needed' do
      it 'w/ needed funcs' do
        expect_∃⨍(:mse, ::TimeSeriesData)
        expect_∃⨍(:mape, ::TimeSeriesData)
      end
    end
  end


end
