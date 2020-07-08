# coding: UTF-8

RSpec.describe 'f36_b02' do

  before :all do
    @data_all_same        = ::TimeSeriesData.new([10, 10, 10, 10, 10, 10, 10, 10, 10, 10], 8)
    @data                 = ::TimeSeriesData.new((0..99).to_a, 10)
    @data_leet            = ::TimeSeriesData.new([1337, 1337, 1337, 1337, 1337, 1337, 1337, 1337, 1338, 1338, 1339], 7)

    @data_noise           = ::TimeSeriesData.new([137, 152, 124, 140, 139, 144, 138, 125, 150], 4)
    @data_negative_linear = ::TimeSeriesData.new([1337, 1330, 1300, 1000, 300, 30, 3], 4)

    # TODO: utility function for generating the initial data-set
    #@data_random  = ::TimeSeriesData.new(...)
  end

  after :all do
    expect{@data_all_same.free_memory}.to_not raise_error
    expect{@data.free_memory}.to_not raise_error
    expect{@data_leet.free_memory}.to_not raise_error
    expect{@data_noise.free_memory}.to_not raise_error
    expect{@data_negative_linear.free_memory}.to_not raise_error
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
                expect(@data_noise.ρ).to eq(0.014222429284611286)
                expect(@data_negative_linear.ρ).to eq(-0.9422846706213913)
              end
            end
          end # end: {pearson_correlation_coefficient}

        end # end: {relating to stats/math}

      end # end: {has needed functions}
    end # end: {class{TimeSeriesData}}
  end

  context 'audits', :audit do
    context '{f36_b02}' do
      it 'creates class{`TimeSeriesData`}' do
        expect_∃ᶜ(:TimeSeriesData)
      end
      context 'class{TimeSeriesData} is defined as needed' do
        it 'w/ needed funcs' do
          expect_∃⨍_with_alias(:mean, :μ, ::TimeSeriesData)
          expect_∃⨍_with_alias(:median, :x̃, ::TimeSeriesData)
          expect_∃⨍_with_alias(:variance, :σ², ::TimeSeriesData)
          expect_∃⨍_with_alias(:std_dev, :σ, ::TimeSeriesData)
          expect_∃⨍_with_alias(:pearson_correlation_coefficient, :ρ, ::TimeSeriesData)
          expect_∃⨍(:range, ::TimeSeriesData)
          expect_∃⨍(:max, ::TimeSeriesData)
          expect_∃⨍(:min, ::TimeSeriesData)
        end
      end
    end
  end # end: {audits}

end
