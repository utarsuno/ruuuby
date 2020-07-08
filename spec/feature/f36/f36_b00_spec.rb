# coding: UTF-8

RSpec.describe 'f36_b00' do

  before :all do
    @data_all_same  = ::TimeSeriesData.new([10, 10, 10, 10, 10, 10, 10, 10, 10, 10], 8)
    @data           = ::TimeSeriesData.new((0..99).to_a, 10)
    @data_large     = ::TimeSeriesData.new((0..299).to_a, 10)
    @data_leet      = ::TimeSeriesData.new([1337, 1337, 1337, 1337, 1337, 1337, 1337, 1337, 1338, 1338, 1339], 7)
    @data_simple    = ::TimeSeriesData.new([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 3)
    @data_predicted = [1.9, 2.8, 3.7, 4.6, 5.4, 6.4, 7.3, 8.2, 9.1, 10.0]
    @data_only_four = ::TimeSeriesData.new([0, 1, 2, 3], 2)
  end

  after :all do
    expect{@data_all_same.free_memory}.to_not raise_error
    expect{@data.free_memory}.to_not raise_error
    expect{@data_large.free_memory}.to_not raise_error
    expect{@data_leet.free_memory}.to_not raise_error
    expect{@data_simple.free_memory}.to_not raise_error
    expect{@data_only_four.free_memory}.to_not raise_error
  end

  context 'functionality' do
    context 'class{TimeSeriesData}' do
      context 'has needed functions' do
        context 'standard operators' do

          context 'func{len}' do
            context 'handles needed scenarios' do
              it 'cases: positive' do
                expect(@data.len).to eq(100)
                expect(@data_all_same.len).to eq(10)
                expect(@data_leet.len).to eq(11)
                expect(@data_simple.len).to eq(10)
                expect(@data_only_four.len).to eq(4)
              end
            end
          end # end: {func{len}}

          context 'func{percentile}' do
            context 'handles needed scenarios' do
              context 'cases: positive' do
                it 'w/ small data set (len{4})' do
                  expect(@data_only_four.percentile(0)).to eq(0)
                  expect(@data_only_four.percentile(1)).to eq(0)
                  expect(@data_only_four.percentile(24)).to eq(0)
                  expect(@data_only_four.percentile(25)).to eq(1)
                  expect(@data_only_four.percentile(49)).to eq(1)
                  expect(@data_only_four.percentile(50)).to eq(2)
                  expect(@data_only_four.percentile(74)).to eq(2)
                  expect(@data_only_four.percentile(75)).to eq(3)
                  expect(@data_only_four.percentile(99)).to eq(3)
                  expect(@data_only_four.percentile(100)).to eq(3)

                  expect(@data_only_four.percentile(0.0)).to eq(0)
                  expect(@data_only_four.percentile(0.24)).to eq(0)
                  expect(@data_only_four.percentile(0.25)).to eq(1)
                  expect(@data_only_four.percentile(0.49)).to eq(1)
                  expect(@data_only_four.percentile(0.50)).to eq(2)
                  expect(@data_only_four.percentile(0.74)).to eq(2)
                  expect(@data_only_four.percentile(0.75)).to eq(3)
                  expect(@data_only_four.percentile(0.99)).to eq(3)
                  expect(@data_only_four.percentile(1.0)).to eq(3)
                end
              end
              context 'cases: negative' do
                it 'bad-args' do
                  expect{@data.percentile(1337.1337)}.to raise_error(::ArgumentError)
                  expect{@data.percentile(-1)}.to raise_error(::ArgumentError)
                  expect{@data.percentile(-1.0)}.to raise_error(::ArgumentError)
                  expect{@data.percentile(-1337)}.to raise_error(::ArgumentError)
                  expect{@data.percentile(-1337.0)}.to raise_error(::ArgumentError)
                  expect{@data.percentile(-0.01)}.to raise_error(::ArgumentError)
                  expect{@data.percentile(-0.01337)}.to raise_error(::ArgumentError)
                  expect{@data.percentile(::Float::INFINITY)}.to raise_error(::ArgumentError)
                  expect{@data.percentile(::Float::INFINITY_NEGATIVE)}.to raise_error(::ArgumentError)
                end
                it 'out-of-range' do
                  expect{@data.percentile(1337)}.to raise_error(::ArgumentError)
                  expect{@data.percentile(1337.1337)}.to raise_error(::ArgumentError)
                end
              end
            end
          end # end: {func{percentile}}

          context 'func{[]}' do
            context 'handles needed scenarios' do
              it 'cases: positive' do
                (0..99).∀{|scenario| expect(@data[scenario]).to eq(scenario)}
                (0..9).∀{|scenario| expect(@data_all_same[scenario]).to eq(10)}
                expect(@data_leet[0]).to eq(1337)
                expect(@data_leet[5]).to eq(1337)
                expect(@data_leet[8]).to eq(1338)
                expect(@data_leet[10]).to eq(1339)

                expect(@data_only_four[0]).to eq(0)
                expect(@data_only_four[1]).to eq(1)
                expect(@data_only_four[2]).to eq(2)
                expect(@data_only_four[3]).to eq(3)
              end
              it 'cases: negative' do
                expect{@data_only_four[nil]}.to raise_error(::ArgumentError)
                expect{@data_only_four[4]}.to raise_error(::ArgumentError)
                expect{@data_leet[-1]}.to raise_error(::ArgumentError)
                expect{@data_all_same[1337]}.to raise_error(::ArgumentError)
                expect{@data[::Float::INFINITY]}.to raise_error(::ArgumentError)
              end
            end
          end # end: {func{[]}}

          context 'func{first}' do
            context 'handles needed scenarios' do
              it 'cases: positive' do
                expect(@data_leet.first).to eq(1337)
                expect(@data_simple.first).to eq(1)
                expect(@data_large.first).to eq(0)
                expect(@data.first).to eq(0)
                expect(@data_all_same.first).to eq(10)
              end
            end
          end # end: {func{first}}

          context 'func{last}' do
            context 'handles needed scenarios' do
              it 'cases: positive' do
                expect(@data_leet.last).to eq(1339)
                expect(@data_simple.last).to eq(10)
                expect(@data_large.last).to eq(299)
                expect(@data.last).to eq(99)
                expect(@data_all_same.last).to eq(10)
              end
            end
          end # end: {func{last}}

        end # end: {standard operators}
      end # end: {has needed functions}
    end # end: {class{TimeSeriesData}}
  end

  context 'audits',:audit do
    context '{f36_b00}' do
      context 'class{TimeSeriesData} is defined as needed' do
        it 'w/ needed funcs' do
          expect_∃⨍(:[], ::TimeSeriesData)
          expect_∃⨍(:len, ::TimeSeriesData)
          expect_∃⨍(:percentile, ::TimeSeriesData)
          expect_∃⨍(:first, ::TimeSeriesData)
          expect_∃⨍(:last, ::TimeSeriesData)
        end
      end
    end
  end

end
