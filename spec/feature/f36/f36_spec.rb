# coding: UTF-8

RSpec.describe 'f36' do

  before :all do
    @data_all_same  = ::TimeSeriesData.new([10, 10, 10, 10, 10, 10, 10, 10, 10, 10], 8)
    @data           = ::TimeSeriesData.new((0..99).to_a, 10)
    @data_leet      = ::TimeSeriesData.new([1337, 1337, 1337, 1337, 1337, 1337, 1337, 1337, 1338, 1338, 1339], 7)
    @data_simple    = ::TimeSeriesData.new([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 3)
    @data_predicted = [1.9, 2.8, 3.7, 4.6, 5.4, 6.4, 7.3, 8.2, 9.1, 10.0]
  end

  after :all do
    expect{@data_all_same.free_memory}.to_not raise_error
    expect{@data.free_memory}.to_not raise_error
    expect{@data_leet.free_memory}.to_not raise_error
    expect{@data_simple.free_memory}.to_not raise_error
  end

  context 'functionality' do
    context 'class{TimeSeriesData}' do

      context 'can be created' do
        it 'w/ regular integer data' do
          expect(@data.ⓣ).to eq(::TimeSeriesData)
        end
      end

      context 'has needed functions' do
        context 'relating to stats/math' do

          context 'mean squares of errors (MSE)' do
            context 'func{mse}' do
              context 'handles needed scenarios' do
                it 'cases: positive' do
                  expect(@data_simple.mse(@data_predicted)).to eq(0.30666666666666653)
                end
                it 'cases: error' do
                  expect{@data_simple.mse((@data_predicted + [1337]))}.to raise_error(ArgumentError)
                  expect{@data_simple.mse(([1337] + @data_predicted))}.to raise_error(ArgumentError)
                  expect{@data_simple.mse([1337])}.to raise_error(ArgumentError)
                  expect{@data_simple.mse(nil)}.to raise_error(ArgumentError)
                end
              end
            end
          end

          context 'func{mean}' do
            context 'handles needed scenarios' do
              it 'cases: positive' do
                expect(@data.mean).to eq(49.5)
                expect(@data_all_same.mean).to eq(10)
                expect(@data_leet.mean).to eq(1337.3636363636363)
              end
            end
          end # end: {mean}
          context 'func{median}' do
            context 'handles needed scenarios' do
              it 'cases: positive' do
                expect(@data.median).to eq(49.5)
                expect(@data_all_same.median).to eq(10)
                expect(@data_leet.median).to eq(1337.0)
              end
            end
          end # end: {median}
          context 'func{range}' do
            context 'handles needed scenarios' do
              it 'cases: positive' do
                expect(@data.range).to eq(99)
                expect(@data_all_same.range).to eq(0)
                expect(@data_leet.range).to eq(2)
              end
            end
          end # end: {range}
          context 'func{std_dev}' do
            context 'handles needed scenarios' do
              it 'cases: positive' do
                expect(@data.σ).to eq(29.011491975882016)
                expect(@data_all_same.σ).to eq(0)
                expect(@data_leet.σ).to eq(0.6741998624632421)
              end
            end
          end # end: {std_dev}
          context 'func{variance}' do
            context 'handles needed scenarios' do
              it 'cases: positive' do
                expect(@data.σ²).to eq(841.6666666666666)
                expect(@data_all_same.σ²).to eq(0)
                expect(@data_leet.σ²).to eq(0.4545454545454546)
              end
            end
          end # end: {variance}
          context '{max}' do
            context 'handles needed scenarios' do
              it 'cases: positive' do
                expect(@data.max).to eq(99)
                expect(@data_all_same.max).to eq(10)
                expect(@data_leet.max).to eq(1339)
              end
            end
          end # end: {max}
          context '{min}' do
            context 'handles needed scenarios' do
              it 'cases: positive' do
                expect(@data.min).to eq(0)
                expect(@data_all_same.min).to eq(10)
                expect(@data_leet.min).to eq(1337)
              end
            end
          end # end: {min}
          context '{percentile}' do
            context 'handles needed scenarios' do
              it 'cases: positive' do
                (0..99).∀{|scenario| expect(@data.percentile(scenario)).to eq(scenario)}
                (0..99).∀{|scenario| expect(@data.percentile(scenario.to_f / 100.0)).to eq(scenario)}
              end
            end
          end # end: {percentile}
        end # end: {relating to stats/math}

        context 'standard operators' do
          context 'func{len}' do
            context 'handles needed scenarios' do
              it 'cases: positive' do
                expect(@data.len).to eq(100)
                expect(@data_all_same.len).to eq(10)
                expect(@data_leet.len).to eq(11)
              end
            end
          end # end: {func{len}}
          context 'func{[]}' do
            context 'handles needed scenarios' do
              it 'cases: positive' do
                (0..99).∀{|scenario| expect(@data[scenario]).to eq(scenario)}
                (0..9).∀{|scenario| expect(@data_all_same[scenario]).to eq(10)}
                expect(@data_leet[0]).to eq(1337)
                expect(@data_leet[5]).to eq(1337)
                expect(@data_leet[8]).to eq(1338)
                expect(@data_leet[10]).to eq(1339)
              end
              it 'cases: negative' do
                expect{@data_leet[-1]}.to raise_error(ArgumentError)
                expect{@data_all_same[1337]}.to raise_error(ArgumentError)
                expect{@data[::Float::INFINITY]}.to raise_error(ArgumentError)
              end
            end
          end # end: {func{[]}}
        end

        context 'memory related functions' do
          context 'func{mem_size}' do
            context 'handles needed scenarios' do
              it 'cases: positive' do
                expect(@data.len > @data_leet.len).to eq(true)
                expect(@data.len > @data_all_same.len).to eq(true)
                expect(@data_leet.len > @data_all_same.len).to eq(true)
              end
            end
          end
        end

      end # end: {has needed functions}
    end # end: {class{TimeSeriesData}}
  end

  context 'audits',:audit do
    context '{f36} creates class{`TimeSeriesData`}' do
      it 'within module{Math::Stats}' do
        expect_∃ᶜ(:TimeSeriesData, ::Math::Stats)
      end
      context 'class{TimeSeriesData} is defined as needed' do
        it 'w/ needed funcs' do
          expect_∃⨍(:mean, ::TimeSeriesData)
          expect_∃⨍(:median, ::TimeSeriesData)
          expect_∃⨍(:range, ::TimeSeriesData)
          expect_∃⨍(:max, ::TimeSeriesData)
          expect_∃⨍(:min, ::TimeSeriesData)
          expect_∃⨍(:variance, ::TimeSeriesData)
          expect_∃⨍(:σ², ::TimeSeriesData)
          expect_∃⨍(:std_dev, ::TimeSeriesData)
          expect_∃⨍(:σ, ::TimeSeriesData)
        end
      end
    end
  end


end
