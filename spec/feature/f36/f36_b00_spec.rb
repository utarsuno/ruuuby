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
    expect{@data_all_same.♻️}.to_not raise_error
    expect{@data.♻️}.to_not raise_error
    expect{@data_large.♻️}.to_not raise_error
    expect{@data_leet.♻️}.to_not raise_error
    expect{@data_simple.♻️}.to_not raise_error
    expect{@data_only_four.♻️}.to_not raise_error
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
                context 'w/ small data set (len{4})' do
                  it 'w/ ints' do
                    (0..12).∀{|scenario| expect(@data_only_four.percentile(scenario)).to eq(0)}
                    (88..99).∀{|scenario| expect(@data_only_four.percentile(scenario)).to eq(3.0)}
                    expect(@data_only_four.percentile(13)).to eq(0.39)
                    expect(@data_only_four.percentile(14)).to eq(0.42000000000000004)
                    expect(@data_only_four.percentile(15)).to eq(0.44999999999999996)
                    expect(@data_only_four.percentile(16)).to eq(0.48)
                    expect(@data_only_four.percentile(17)).to eq(0.51)
                    expect(@data_only_four.percentile(18)).to eq(0.54)
                    expect(@data_only_four.percentile(19)).to eq(0.5700000000000001)
                    expect(@data_only_four.percentile(20)).to eq(0.6000000000000001)
                    expect(@data_only_four.percentile(21)).to eq(0.63)
                    expect(@data_only_four.percentile(22)).to eq(0.66)
                    expect(@data_only_four.percentile(23)).to eq(0.6900000000000001)
                    expect(@data_only_four.percentile(24)).to eq(0.72)
                    expect(@data_only_four.percentile(25)).to eq(0.75)
                    expect(@data_only_four.percentile(26)).to eq(0.78)
                    expect(@data_only_four.percentile(27)).to eq(0.81)
                    expect(@data_only_four.percentile(28)).to eq(0.8400000000000001)
                    expect(@data_only_four.percentile(29)).to eq(0.8699999999999999)
                    expect(@data_only_four.percentile(30)).to eq(0.8999999999999999)
                    expect(@data_only_four.percentile(31)).to eq(0.9299999999999999)
                    expect(@data_only_four.percentile(32)).to eq(0.96)
                    expect(@data_only_four.percentile(33)).to eq(0.99)
                    expect(@data_only_four.percentile(34)).to eq(1.02)
                    expect(@data_only_four.percentile(35)).to eq(1.0499999999999998)
                    expect(@data_only_four.percentile(36)).to eq(1.08)
                    expect(@data_only_four.percentile(37)).to eq(1.1099999999999999)
                    expect(@data_only_four.percentile(38)).to eq(1.1400000000000001)
                    expect(@data_only_four.percentile(39)).to eq(1.17)
                    expect(@data_only_four.percentile(40)).to eq(1.2000000000000002)
                    expect(@data_only_four.percentile(41)).to eq(1.23)
                    expect(@data_only_four.percentile(42)).to eq(1.26)
                    expect(@data_only_four.percentile(43)).to eq(1.29)
                    expect(@data_only_four.percentile(44)).to eq(1.32)
                    expect(@data_only_four.percentile(45)).to eq(1.35)
                    expect(@data_only_four.percentile(46)).to eq(1.3800000000000001)
                    expect(@data_only_four.percentile(47)).to eq(1.41)
                    expect(@data_only_four.percentile(48)).to eq(1.44)
                    expect(@data_only_four.percentile(49)).to eq(1.47)
                    expect(@data_only_four.percentile(50)).to eq(1.5)
                    expect(@data_only_four.percentile(51)).to eq(1.53)
                    expect(@data_only_four.percentile(52)).to eq(1.56)
                    expect(@data_only_four.percentile(53)).to eq(1.59)
                    expect(@data_only_four.percentile(54)).to eq(1.62)
                    expect(@data_only_four.percentile(55)).to eq(1.6500000000000001)
                    expect(@data_only_four.percentile(56)).to eq(1.6800000000000002)
                    expect(@data_only_four.percentile(57)).to eq(1.71)
                    expect(@data_only_four.percentile(58)).to eq(1.7399999999999998)
                    expect(@data_only_four.percentile(59)).to eq(1.77)
                    expect(@data_only_four.percentile(60)).to eq(1.7999999999999998)
                    expect(@data_only_four.percentile(61)).to eq(1.83)
                    expect(@data_only_four.percentile(62)).to eq(1.8599999999999999)
                    expect(@data_only_four.percentile(63)).to eq(1.8900000000000001)
                    expect(@data_only_four.percentile(64)).to eq(1.92)
                    expect(@data_only_four.percentile(65)).to eq(1.9500000000000002)
                    expect(@data_only_four.percentile(66)).to eq(1.98)
                    expect(@data_only_four.percentile(67)).to eq(2.0100000000000002)
                    expect(@data_only_four.percentile(68)).to eq(2.04)
                    expect(@data_only_four.percentile(69)).to eq(2.07)
                    expect(@data_only_four.percentile(70)).to eq(2.0999999999999996)
                    expect(@data_only_four.percentile(71)).to eq(2.13)
                    expect(@data_only_four.percentile(72)).to eq(2.16)
                    expect(@data_only_four.percentile(73)).to eq(2.19)
                    expect(@data_only_four.percentile(74)).to eq(2.2199999999999998)
                    expect(@data_only_four.percentile(75)).to eq(2.25)
                    expect(@data_only_four.percentile(76)).to eq(2.2800000000000002)
                    expect(@data_only_four.percentile(77)).to eq(2.31)
                    expect(@data_only_four.percentile(78)).to eq(2.34)
                    expect(@data_only_four.percentile(79)).to eq(2.37)
                    expect(@data_only_four.percentile(80)).to eq(2.4000000000000004)
                    expect(@data_only_four.percentile(81)).to eq(2.43)
                    expect(@data_only_four.percentile(82)).to eq(2.46)
                    expect(@data_only_four.percentile(83)).to eq(2.4899999999999998)
                    expect(@data_only_four.percentile(84)).to eq(2.52)
                    expect(@data_only_four.percentile(85)).to eq(2.55)
                    expect(@data_only_four.percentile(86)).to eq(2.58)
                    expect(@data_only_four.percentile(87)).to eq(2.61)
                  end
                  it 'w/ floats' do
                    (0..12).∀{|scenario| expect(@data_only_four.percentile(scenario / 100.0)).to eq(0)}
                    (88..99).∀{|scenario| expect(@data_only_four.percentile(scenario / 100.0)).to eq(3.0)}
                    expect(@data_only_four.percentile(0.13)).to eq(0.39)
                    expect(@data_only_four.percentile(0.14)).to eq(0.42000000000000004)
                    expect(@data_only_four.percentile(0.15)).to eq(0.44999999999999996)
                    expect(@data_only_four.percentile(0.16)).to eq(0.48)
                    expect(@data_only_four.percentile(0.17)).to eq(0.51)
                    expect(@data_only_four.percentile(0.18)).to eq(0.54)
                    expect(@data_only_four.percentile(0.19)).to eq(0.5700000000000001)
                    expect(@data_only_four.percentile(0.20)).to eq(0.6000000000000001)
                    expect(@data_only_four.percentile(0.21)).to eq(0.63)
                    expect(@data_only_four.percentile(0.22)).to eq(0.66)
                    expect(@data_only_four.percentile(0.23)).to eq(0.6900000000000001)
                    expect(@data_only_four.percentile(0.24)).to eq(0.72)
                    expect(@data_only_four.percentile(0.25)).to eq(0.75)
                    expect(@data_only_four.percentile(0.26)).to eq(0.78)
                    expect(@data_only_four.percentile(0.27)).to eq(0.81)
                    expect(@data_only_four.percentile(0.28)).to eq(0.8400000000000001)
                    expect(@data_only_four.percentile(0.29)).to eq(0.8699999999999999)
                    expect(@data_only_four.percentile(0.30)).to eq(0.8999999999999999)
                    expect(@data_only_four.percentile(0.31)).to eq(0.9299999999999999)
                    expect(@data_only_four.percentile(0.32)).to eq(0.96)
                    expect(@data_only_four.percentile(0.33)).to eq(0.99)
                    expect(@data_only_four.percentile(0.34)).to eq(1.02)
                    expect(@data_only_four.percentile(0.35)).to eq(1.0499999999999998)
                    expect(@data_only_four.percentile(0.36)).to eq(1.08)
                    expect(@data_only_four.percentile(0.37)).to eq(1.1099999999999999)
                    expect(@data_only_four.percentile(0.38)).to eq(1.1400000000000001)
                    expect(@data_only_four.percentile(0.39)).to eq(1.17)
                    expect(@data_only_four.percentile(0.40)).to eq(1.2000000000000002)
                    expect(@data_only_four.percentile(0.41)).to eq(1.23)
                    expect(@data_only_four.percentile(0.42)).to eq(1.26)
                    expect(@data_only_four.percentile(0.43)).to eq(1.29)
                    expect(@data_only_four.percentile(0.44)).to eq(1.32)
                    expect(@data_only_four.percentile(0.45)).to eq(1.35)
                    expect(@data_only_four.percentile(0.46)).to eq(1.3800000000000001)
                    expect(@data_only_four.percentile(0.47)).to eq(1.41)
                    expect(@data_only_four.percentile(0.48)).to eq(1.44)
                    expect(@data_only_four.percentile(0.49)).to eq(1.47)
                    expect(@data_only_four.percentile(0.50)).to eq(1.5)
                    expect(@data_only_four.percentile(0.51)).to eq(1.53)
                    expect(@data_only_four.percentile(0.52)).to eq(1.56)
                    expect(@data_only_four.percentile(0.53)).to eq(1.59)
                    expect(@data_only_four.percentile(0.54)).to eq(1.62)
                    expect(@data_only_four.percentile(0.55)).to eq(1.6500000000000001)
                    expect(@data_only_four.percentile(0.56)).to eq(1.6800000000000002)
                    expect(@data_only_four.percentile(0.57)).to eq(1.71)
                    expect(@data_only_four.percentile(0.58)).to eq(1.7399999999999998)
                    expect(@data_only_four.percentile(0.59)).to eq(1.77)
                    expect(@data_only_four.percentile(0.60)).to eq(1.7999999999999998)
                    expect(@data_only_four.percentile(0.61)).to eq(1.83)
                    expect(@data_only_four.percentile(0.62)).to eq(1.8599999999999999)
                    expect(@data_only_four.percentile(0.63)).to eq(1.8900000000000001)
                    expect(@data_only_four.percentile(0.64)).to eq(1.92)
                    expect(@data_only_four.percentile(0.65)).to eq(1.9500000000000002)
                    expect(@data_only_four.percentile(0.66)).to eq(1.98)
                    expect(@data_only_four.percentile(0.67)).to eq(2.0100000000000002)
                    expect(@data_only_four.percentile(0.68)).to eq(2.04)
                    expect(@data_only_four.percentile(0.69)).to eq(2.07)
                    expect(@data_only_four.percentile(0.70)).to eq(2.0999999999999996)
                    expect(@data_only_four.percentile(0.71)).to eq(2.13)
                    expect(@data_only_four.percentile(0.72)).to eq(2.16)
                    expect(@data_only_four.percentile(0.73)).to eq(2.19)
                    expect(@data_only_four.percentile(0.74)).to eq(2.2199999999999998)
                    expect(@data_only_four.percentile(0.75)).to eq(2.25)
                    expect(@data_only_four.percentile(0.76)).to eq(2.2800000000000002)
                    expect(@data_only_four.percentile(0.77)).to eq(2.31)
                    expect(@data_only_four.percentile(0.78)).to eq(2.34)
                    expect(@data_only_four.percentile(0.79)).to eq(2.37)
                    expect(@data_only_four.percentile(0.80)).to eq(2.4000000000000004)
                    expect(@data_only_four.percentile(0.81)).to eq(2.43)
                    expect(@data_only_four.percentile(0.82)).to eq(2.46)
                    expect(@data_only_four.percentile(0.83)).to eq(2.4899999999999998)
                    expect(@data_only_four.percentile(0.84)).to eq(2.52)
                    expect(@data_only_four.percentile(0.85)).to eq(2.55)
                    expect(@data_only_four.percentile(0.86)).to eq(2.58)
                    expect(@data_only_four.percentile(0.87)).to eq(2.61)
                  end
                end
                it 'another scenario of length 4' do
                  # data credit, @see https://en.wikipedia.org/wiki/Percentile
                  data = ::TimeSeriesData.new([1.0,2.0,3.0,4.0],3)
                  expect(data.percentile(0.75)).to eq(3.25)
                  expect(data.percentile(0.75)).to eq(data.Q₃)
                  expect{data.♻️}.to_not raise_error
                end
                it 'a scenario of length 5' do
                  # data credit, @see https://en.wikipedia.org/wiki/Percentile
                  data = ::TimeSeriesData.new([15.0,20.0,35.0,40.0,50.0],3)
                  expect(data.percentile(0.40)).to eq(29.0)
                  expect{data.♻️}.to_not raise_error
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

          context 'func{nᵗʰ_percent_rank}' do
            context 'handles needed scenarios' do
              context 'cases: positive' do
                it 'w/ @data_all_same' do
                  expect(@data_all_same.nᵗʰ_percent_rank(0)).to eq(0.05)
                  expect(@data_all_same.nᵗʰ_percent_rank(1)).to eq(0.15)
                  expect(@data_all_same.nᵗʰ_percent_rank(2)).to eq(0.25)
                  expect(@data_all_same.nᵗʰ_percent_rank(3)).to eq(0.35)
                  expect(@data_all_same.nᵗʰ_percent_rank(4)).to eq(0.45)
                  expect(@data_all_same.nᵗʰ_percent_rank(5)).to eq(0.55)
                  expect(@data_all_same.nᵗʰ_percent_rank(6)).to eq(0.65)
                  expect(@data_all_same.nᵗʰ_percent_rank(7)).to eq(0.75)
                  expect(@data_all_same.nᵗʰ_percent_rank(8)).to eq(0.85)
                  expect(@data_all_same.nᵗʰ_percent_rank(9)).to eq(0.95)
                end
                it 'w/ @data_only_four' do
                  expect(@data_only_four.nᵗʰ_percent_rank(0)).to eq(0.125)
                  expect(@data_only_four.nᵗʰ_percent_rank(1)).to eq(0.375)
                  expect(@data_only_four.nᵗʰ_percent_rank(2)).to eq(0.625)
                  expect(@data_only_four.nᵗʰ_percent_rank(3)).to eq(0.875)
                end
              end
              context 'cases: negative' do
                it 'w/ @data_all_same' do
                  expect{@data_all_same.nᵗʰ_percent_rank(nil)}.to raise_error(::ArgumentError)
                  expect{@data_all_same.nᵗʰ_percent_rank(-1)}.to raise_error(::ArgumentError)
                  expect{@data_all_same.nᵗʰ_percent_rank(10)}.to raise_error(::ArgumentError)
                  expect{@data_all_same.nᵗʰ_percent_rank(1337)}.to raise_error(::ArgumentError)
                end
              end
            end
          end

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
