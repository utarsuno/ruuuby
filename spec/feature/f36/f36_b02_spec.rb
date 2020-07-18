# encoding: UTF-8

RSpec.describe 'f36_b02' do

  before :all do
    @data_all_same               = ::TimeSeriesData.new([10, 10, 10, 10, 10, 10, 10, 10, 10, 10], 8)
    @data_same_base_w_fake_noise = ::TimeSeriesData.new([10 + 3, 10 - 3, 10 + 3, 10 - 3, 10 + 3, 10 - 3, 10 + 3, 10 - 3, 10 + 3, 10 - 3], 8)
    @data                        = ::TimeSeriesData.new((0..99).to_a, 10)
    @data_leet                   = ::TimeSeriesData.new([1337, 1337, 1337, 1337, 1337, 1337, 1337, 1337, 1338, 1338, 1339], 7)

    @data_noise                  = ::TimeSeriesData.new([137, 152, 124, 140, 139, 144, 138, 125, 150], 4)
    @data_negative_linear        = ::TimeSeriesData.new([1337, 1330, 1300, 1000, 300, 30, 3], 4)

    # TODO: utility function for generating the initial data-set
    #@data_random  = ::TimeSeriesData.new(...)
  end

  after :all do
    expect{@data_all_same.♻️}.to_not raise_error
    expect{@data_same_base_w_fake_noise.♻️}.to_not raise_error
    expect{@data.♻️}.to_not raise_error
    expect{@data_leet.♻️}.to_not raise_error
    expect{@data_noise.♻️}.to_not raise_error
    expect{@data_negative_linear.♻️}.to_not raise_error
  end

  context 'functionality' do
    context 'class{TimeSeriesData}' do

      context 'has needed functions' do
        context 'relating to stats/math' do

          context '{max}' do
            context 'handles needed scenarios' do
              it 'cases: positive' do
                expect(@data.max).to eq(99)
                expect(@data_all_same.max).to eq(10)
                expect(@data_same_base_w_fake_noise.max).to eq(13)
                expect(@data_leet.max).to eq(1339)
                expect(@data_noise.max).to eq(152)
                expect(@data_negative_linear.max).to eq(1337)
              end
            end
          end # end: {max}

          context '{min}' do
            context 'handles needed scenarios' do
              it 'cases: positive' do
                expect(@data.min).to eq(0)
                expect(@data_all_same.min).to eq(10)
                expect(@data_same_base_w_fake_noise.min).to eq(7)
                expect(@data_leet.min).to eq(1337)
                expect(@data_noise.min).to eq(124)
                expect(@data_negative_linear.min).to eq(3)
              end
            end
          end # end: {min}

          context 'func{mean}' do
            context 'handles needed scenarios' do
              it 'cases: positive' do
                expect(@data.μ).to eq(49.5)
                expect(@data_all_same.μ).to eq(10)
                expect(@data_same_base_w_fake_noise.μ).to eq(10)
                expect(@data_leet.μ).to eq(1337.3636363636363)
                expect(@data_noise.μ).to eq(138.77777777777777)
                expect(@data_negative_linear.μ).to eq(757.1428571428571)
              end
            end
          end # end: {mean}

          context 'func{median}' do
            context 'handles needed scenarios' do
              it 'cases: positive' do
                expect(@data.x̃).to eq(49.5)
                expect(@data_all_same.x̃).to eq(10)
                expect(@data_same_base_w_fake_noise.x̃).to eq(10)
                expect(@data_leet.x̃).to eq(1337.0)
                expect(@data_noise.x̃).to eq(139)
                expect(@data_negative_linear.x̃).to eq(1000)
              end
            end
          end # end: {median}

          context 'func{range}' do
            context 'handles needed scenarios' do
              it 'cases: positive' do
                expect(@data.range).to eq(99)
                expect(@data_all_same.range).to eq(0)
                expect(@data_same_base_w_fake_noise.range).to eq(6)
                expect(@data_leet.range).to eq(2)
                expect(@data_noise.range).to eq(28)
                expect(@data_negative_linear.range).to eq(1334)
              end
            end
          end # end: {range}

          context 'func{std_dev}' do
            context 'handles needed scenarios' do
              it 'cases: positive' do
                expect(@data.σ).to eq(29.011491975882016)
                expect(@data_all_same.σ).to eq(0)
                expect(@data_same_base_w_fake_noise.σ).to eq(3.1622776601683795)
                expect(@data_leet.σ).to eq(0.6741998624632421)
                expect(@data_noise.σ).to eq(9.627795409357454)
                expect(@data_negative_linear.σ).to eq(622.430833793718)
              end
            end
          end # end: {std_dev}

          context 'func{variance}' do
            context 'handles needed scenarios' do
              it 'cases: positive' do
                expect(@data.σ²).to eq(841.6666666666666)
                expect(@data_all_same.σ²).to eq(0)
                expect(@data_same_base_w_fake_noise.σ²).to eq(10.0)
                expect(@data_leet.σ²).to eq(0.4545454545454546)
                expect(@data_noise.σ²).to eq(92.69444444444444)
                expect(@data_negative_linear.σ²).to eq(387420.1428571429)
              end
            end
          end # end: {variance}

          context 'func{pearson_correlation_coefficient}' do
            context 'handles needed scenarios' do
              it 'cases: positive' do
                expect(@data.ρ).to eq(1)
                expect(@data_all_same.ρ).to eq(1)
                expect(@data_leet.ρ).to eq(0.7602631123499285)
                expect(@data_same_base_w_fake_noise.ρ).to eq(-0.17407765595569785)
                expect(@data_noise.ρ).to eq(0.014222429284611286)
                expect(@data_negative_linear.ρ).to eq(-0.9422846706213913)
              end
            end
          end # end: {pearson_correlation_coefficient}

          context 'sum' do

            context 'func{sum}' do
              context 'handles needed scenarios' do
                it 'cases: positive' do
                  expect(@data.sum).to eq(4950)
                  expect(@data_all_same.sum).to eq(100)
                  expect(@data_same_base_w_fake_noise.sum).to eq(100)
                  expect(@data_leet.sum).to eq(14711)
                  expect(@data_noise.sum).to eq(1249)
                  expect(@data_negative_linear.sum).to eq(5300)
                end
              end
            end # end: {func{sum}}

            context 'func{sum_weighted}' do
              context 'handles needed scenarios' do
                it 'cases: positive' do
                  expect(@data.sum_weighted).to eq(49.5)
                  expect(@data_all_same.sum_weighted).to eq(10.0)
                  expect(@data_same_base_w_fake_noise.sum_weighted).to eq(10.0)
                  expect(@data_leet.sum_weighted).to eq(1337.3636363636365)
                end
              end
            end # end: {func{sum_weighted}}

            context 'func{sum_squared}' do
              context 'handles needed scenarios' do
                context 'cases: positive' do
                  it 'w/o alias' do
                    expect(@data.sum_squared).to eq(4950 ** 2)
                    expect(@data_all_same.sum_squared).to eq(100 ** 2)
                    expect(@data_same_base_w_fake_noise.sum_squared).to eq(10000.0)
                    expect(@data_leet.sum_squared).to eq(14711 ** 2)
                    expect(@data_noise.sum_squared).to eq(1249 ** 2)
                    expect(@data_negative_linear.sum_squared).to eq(5300 ** 2)
                  end
                  it 'w/ alias' do
                    expect(@data.sum²).to eq(4950 ** 2)
                    expect(@data_all_same.sum²).to eq(100 ** 2)
                    expect(@data_same_base_w_fake_noise.sum²).to eq(10000.0)
                    expect(@data_leet.sum²).to eq(14711 ** 2)
                    expect(@data_noise.sum²).to eq(1249 ** 2)
                    expect(@data_negative_linear.sum²).to eq(5300 ** 2)
                  end
                end
              end
            end # end: {func{sum_squared}}

            context 'func{sum_of_squares}' do
              context 'handles needed scenarios' do
                it 'cases: positive' do
                  expect(@data.sum_of_squares).to eq(328350)
                  expect(@data_all_same.sum_of_squares).to eq(1000)
                  expect(@data_same_base_w_fake_noise.sum_of_squares).to eq(1090.0)
                  expect(@data_leet.sum_of_squares).to eq(19673961)
                  expect(@data_noise.sum_of_squares).to eq(174075)
                  expect(@data_negative_linear.sum_of_squares).to eq(6337378)
                end
              end
            end # end: {func{sum_of_squares}}

          end # end: {sum}

          context 'func{product}' do
            context 'handles needed scenarios' do
              it 'cases: positive' do
                expect(@data.product).to eq(9.33262154439441e+155)
                expect(@data_all_same.product).to eq(10000000000.0)
                expect(@data_same_base_w_fake_noise.product).to eq(6240321451.0)
                expect(@data_leet.product).to eq(2.4476203873183543e+34)
                expect(@data_noise.product).to eq(1.8722831412096e+19)
                expect(@data_negative_linear.product).to eq(6.2415171e+16)
              end
            end
          end # end: {func{product}}

          context 'func{mean_geometric}' do
            context 'handles needed scenarios' do
              it 'cases: positive' do
                expect(@data.mean_geometric).to eq(36.28273664733236)
                expect(@data_all_same.mean_geometric).to eq(10.000000000000002)
                expect(@data_same_base_w_fake_noise.mean_geometric).to eq(9.539392014169458)
                expect(@data_leet.mean_geometric).to eq(1337.3634819483345)
                expect(@data_noise.mean_geometric).to eq(138.47603316396265)
                expect(@data_negative_linear.mean_geometric).to eq(250.79978877004507)
              end
            end
          end # end: {func{mean_geometric}}

        end # end: {relating to stats/math}

      end # end: {has needed functions}

      context 'verifies against external examples' do

        context 'source{0x0}' do
          it 'produces same results' do
            data_x = ::TimeSeriesData.new([43.0,21.0,25.0,42.0,57.0,59.0], 3)
            data_y = ::TimeSeriesData.new([99.0,65.0,79.0,75.0,87.0,81.0], 3)

            expect(data_x.mean).to eq(41.166666666666664)
            expect(data_x.mean_geometric).to eq(38.36489254318112)
            expect(data_y.mean).to eq(81.0)
            expect(data_y.mean_geometric).to eq(80.32921622731054)

            expect(data_x.sum).to eq(247)
            expect(data_x.sum²).to eq(61009)
            expect(data_x.sum_of_squares).to eq(11409)

            expect(data_y.sum).to eq(486)
            expect(data_y.sum²).to eq(236196)
            expect(data_y.sum_of_squares).to eq(40022)

            expect(data_x.R(data_y)).to eq(0.5298089018901744)
            expect(data_y.R(data_x)).to eq(0.5298089018901744)

            expect(data_x.R²(data_y)).to eq(0.28069747252207244)
            expect(data_y.R²(data_x)).to eq(0.28069747252207244)

            expect{data_x.♻️}.to_not raise_error
            expect{data_y.♻️}.to_not raise_error
          end
        end # end: {source{0x0}}

        context 'source{0x2}' do
          it 'produces same results' do
            a = ::TimeSeriesData.new([3.0,8.0,10.0,17.0,24.0,27.0], 3)
            expect(a.product).to eq(2643840.0)
            expect(a.mean_geometric).to eq(11.759057883237519)
          end
        end

      end

    end # end: {class{TimeSeriesData}}
  end

  context 'audits', :audit do
    context '{f36_b02}' do
      it 'creates class{`TimeSeriesData`}' do
        expect_∃ᶜ(:TimeSeriesData)
      end
      context 'class{TimeSeriesData} is defined as needed' do
        context 'w/ needed funcs' do
          it 'representing cached fields' do
            expect_∃⨍_with_alias(:mean, :μ, ::TimeSeriesData)
            expect_∃⨍_with_alias(:median, :x̃, ::TimeSeriesData)
            expect_∃⨍_with_alias(:variance, :σ², ::TimeSeriesData)
            expect_∃⨍_with_alias(:std_dev, :σ, ::TimeSeriesData)
            expect_∃⨍(:pearson_correlation_coefficient, ::TimeSeriesData)
            expect_∃⨍(:ρ, ::TimeSeriesData)
            expect_∃⨍(:range, ::TimeSeriesData)
            expect_∃⨍(:max, ::TimeSeriesData)
            expect_∃⨍(:min, ::TimeSeriesData)
            expect_∃⨍(:sum, ::TimeSeriesData)
            expect_∃⨍(:sum_weighted, ::TimeSeriesData)
            expect_∃⨍_with_alias(:sum_squared, :sum², ::TimeSeriesData)
            expect_∃⨍(:sum_of_squares, ::TimeSeriesData)
            expect_∃⨍(:product, ::TimeSeriesData)
            expect_∃⨍(:mean_geometric, ::TimeSeriesData)
            expect_∃⨍(:mean_weighted, ::TimeSeriesData)
          end
          it 'representing operations and/or calculations' do
            expect_∃⨍(:R, ::TimeSeriesData)
            expect_∃⨍(:R², ::TimeSeriesData)
          end
        end
      end
    end
  end # end: {audits}

end

#         __    __               __               __
#        /\ \__/\ \__         __/\ \             /\ \__  __
#    __  \ \ ,_\ \ ,_\  _ __ /\_\ \ \____  __  __\ \ ,_\/\_\    ___     ___     ____  __
#  /'__`\ \ \ \/\ \ \/ /\`'__\/\ \ \ '__`\/\ \/\ \\ \ \/\/\ \  / __`\ /' _ `\  /',__\/\_\
# /\ \L\.\_\ \ \_\ \ \_\ \ \/ \ \ \ \ \L\ \ \ \_\ \\ \ \_\ \ \/\ \L\ \/\ \/\ \/\__, `\/_/_
# \ \__/.\_\\ \__\\ \__\\ \_\  \ \_\ \_,__/\ \____/ \ \__\\ \_\ \____/\ \_\ \_\/\____/ /\_\
#  \/__/\/_/ \/__/ \/__/ \/_/   \/_/\/___/  \/___/   \/__/ \/_/\/___/  \/_/\/_/\/___/  \/_/
#
# | #    | source URL                                                                                      |
# | ---- | ----------------------------------------------------------------------------------------------- |
# | 0x0  | https://www.statisticshowto.com/probability-and-statistics/correlation-coefficient-formula/      |
# | 0x2  | https://ncalculators.com/statistics/geometric-mean-calculator.htm                               |
