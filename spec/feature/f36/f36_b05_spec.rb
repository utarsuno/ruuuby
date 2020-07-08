# coding: UTF-8

RSpec.describe 'f36_b05' do
  let(:data_flags_ts){::TimeSeriesData::BITWISE_FLAGS}

  before :all do
    @data_all_same       = ::TimeSeriesData.new([10, 10, 10, 10, 10, 10, 10, 10, 10, 10], 8)
    @data                = ::TimeSeriesData.new((0..99).to_a, 10)
    @data_normalized     = ::TimeSeriesData.new([1, 2, 3, 4, 5], 3).η̂!
    @data_leet           = ::TimeSeriesData.new([1337, 1337, 1337, 1337, 1337, 1337, 1337, 1337, 1338, 1338, 1339], 7)
    @data_leet_alt_order = ::TimeSeriesData.new([1339, 1337, 1337, 1337, 1337, 1337, 1337, 1337, 1338, 1338, 1337], 7)
  end

  after :all do
    expect{@data_all_same.free_memory}.to_not raise_error
    expect{@data.free_memory}.to_not raise_error
    expect{@data_leet.free_memory}.to_not raise_error
    expect{@data_leet_alt_order.free_memory}.to_not raise_error
    expect{@data_normalized.free_memory}.to_not raise_error
  end

  context 'functionality' do

    context 'func{normalize!}' do
      context 'handles needed scenarios' do
        context 'cases: positive' do
          it 'w/ @data' do
            expect(@data.flags).to eq(data_flags_ts.combined_val('has_zero?', 'strictly_increasing?', 'even?'))
            expect≈≈(@data.μ, 49.5)
            expect≈≈(@data.x̃, 49.5)
            expect≈≈(@data.σ, 29.011491975882016)
            expect≈≈(@data.σ², 841.6666666666666)
            expect≈≈(@data.ρ, 1.0)
            expect≈≈(@data.sum, 4950.0)
            expect≈≈(@data.min, 0.0)
            expect≈≈(@data.max, 99.0)
            expect≈≈(@data.range, 99.0)

            @data.η̂!

            expect(@data.flags).to eq(data_flags_ts.combined_val('has_zero?', 'has_negative?', 'strictly_increasing?', 'normalized?', 'even?'))
            expect≈≈(@data.μ, 0.0)
            expect≈≈(@data.x̃, 0.0)
            expect≈≈(@data.σ, 1.0)
            expect≈≈(@data.σ², 1.0)
            expect≈≈(@data.ρ, 1.0)
            expect≈≈(@data.sum, 4.440892098500626e-15)
            expect≈≈(@data.min, -1.7062204191756356)
            expect≈≈(@data.max, 1.7062204191756356)
            expect≈≈(@data.range, 3.412440838351271)
          end
          it 'w/ @data_leet' do
            expect(@data_leet.flags).to eq(data_flags_ts['strictly_increasing?'])
            expect≈≈(@data_leet.μ, 1337.3636363636363)
            expect≈≈(@data_leet.x̃, 1337.0)
            expect≈≈(@data_leet.σ, 0.6741998624632421)
            expect≈≈(@data_leet.σ², 0.4545454545454546)
            expect≈≈(@data_leet.ρ, 0.7602631123499285)
            expect≈≈(@data_leet.sum, 14711.0)
            expect≈≈(@data_leet.min, 1337.0)
            expect≈≈(@data_leet.max, 1339.0)
            expect≈≈(@data_leet.range, 2.0)

            @data_leet.η̂!

            expect(@data_leet.flags).to eq(data_flags_ts.combined_val('strictly_increasing?', 'has_negative?', 'normalized?'))
            expect≈≈(@data_leet.μ, 0.0)
            expect≈≈(@data_leet.x̃, -0.5393598899704404)
            expect≈≈(@data_leet.σ, 1.0)
            expect≈≈(@data_leet.σ², 1.0)
            expect≈≈(@data_leet.ρ, 0.7602631123499285)
            expect≈≈(@data_leet.sum, 1.6853185513809876e-12)
            expect≈≈(@data_leet.min, -0.5393598899704404)
            expect≈≈(@data_leet.max, 2.4271195048678247)
            expect≈≈(@data_leet.range, 2.966479394838265)
          end
          it 'w/ @data_leet (alternative order, same data)' do
            expect(@data_leet_alt_order.flags).to eq(0)
            expect≈≈(@data_leet_alt_order.μ, 1337.3636363636363)
            expect≈≈(@data_leet_alt_order.x̃, 1337.0)
            expect≈≈(@data_leet_alt_order.σ, 0.6741998624632421)
            expect≈≈(@data_leet_alt_order.σ², 0.4545454545454546)
            expect≈≈(@data_leet_alt_order.ρ, -0.13416407864998736)
            expect≈≈(@data_leet_alt_order.sum, 14711.0)
            expect≈≈(@data_leet_alt_order.min, 1337.0)
            expect≈≈(@data_leet_alt_order.max, 1339.0)
            expect≈≈(@data_leet_alt_order.range, 2.0)

            @data_leet_alt_order.η̂!

            expect(@data_leet_alt_order.flags).to eq(data_flags_ts.combined_val('has_negative?', 'normalized?'))
            expect≈≈(@data_leet_alt_order.μ, 0.0)
            expect≈≈(@data_leet_alt_order.x̃, -0.5393598899704404)
            expect≈≈(@data_leet_alt_order.σ, 1.0)
            expect≈≈(@data_leet_alt_order.σ², 1.0)
            expect≈≈(@data_leet_alt_order.ρ, -0.13416407864998744)
            expect≈≈(@data_leet_alt_order.sum, 1.6859846851957627e-12)
            expect≈≈(@data_leet_alt_order.min, -0.5393598899704404)
            expect≈≈(@data_leet_alt_order.max, 2.4271195048678247)
            expect≈≈(@data_leet_alt_order.range, 2.966479394838265)
          end
        end
        context 'cases: negative' do
          it 'data w/ val{0.0}' do
            expect{@data_all_same.η̂!}.to raise_error(::RuntimeError, "| c{TimeSeriesData}-> m{normalize!} may not be performed when the field(std_dev) has val{0.0} |")
          end
          it 'w/ already normalized data' do
            expect{@data_normalized.η̂!}.to raise_error(::RuntimeError, "| c{TimeSeriesData}-> m{normalize!} may not be performed as this{TimeSeriesData} is currently normalized |")
          end
        end
      end
    end # end: {func{normalize}}

    context 'func{scale_by_addition}' do
      context 'handles needed scenarios' do
        context 'cases: positive' do
          it 'w/ fixnum' do
            data          = ::TimeSeriesData.new((0..9).to_a, 3)
            prev_range    = data.range
            prev_min      = data.min
            prev_max      = data.max
            prev_sum      = data.sum
            prev_mean     = data.mean
            prev_median   = data.median
            prev_variance = data.variance
            prev_std_dev  = data.std_dev
            prev_ρ        = data.ρ
            prev_flags     = data.flags
            prev_len      = data.len
            prev_even     = data.even?
            expect(data.flags).to eq(data_flags_ts.combined_val('has_zero?', 'strictly_increasing?', 'even?'))
            data.λ(1337)
            expect(data.len).to eq(prev_len)
            expect(data.even?).to eq(prev_even)
            expect(data.range).to eq(prev_range)
            expect(data.min).to eq(prev_min + 1337)
            expect(data.max).to eq(prev_max + 1337)
            expect(data.sum).to eq(prev_sum + data.len * 1337)
            expect(data.variance).to eq(prev_variance)
            expect(data.std_dev).to eq(prev_std_dev)
            expect(data.ρ).to eq(prev_ρ)
            expect(data.flags).to eq(prev_flags)

            expect(data.mean).to_not eq(prev_mean)
            expect(data.median).to_not eq(prev_median)
            expect{data.free_memory}.to_not raise_error
          end
          it 'w/ float' do
            data          = ::TimeSeriesData.new((0..9).to_a, 3)
            prev_range    = data.range
            prev_min      = data.min
            prev_max      = data.max
            prev_sum      = data.sum
            prev_mean     = data.mean
            prev_median   = data.median
            prev_variance = data.variance
            prev_std_dev  = data.std_dev
            prev_ρ        = data.ρ
            prev_flags     = data.flags
            prev_len      = data.len
            prev_even     = data.even?
            expect(data.flags).to eq(data_flags_ts.combined_val('has_zero?', 'strictly_increasing?', 'even?'))
            data.λ(1337.0)
            expect(data.len).to eq(prev_len)
            expect(data.even?).to eq(prev_even)
            expect(data.range).to eq(prev_range)
            expect(data.min).to eq(prev_min + 1337)
            expect(data.max).to eq(prev_max + 1337)
            expect(data.sum).to eq(prev_sum + data.len * 1337)
            expect(data.variance).to eq(prev_variance)
            expect(data.std_dev).to eq(prev_std_dev)
            expect(data.ρ).to eq(prev_ρ)
            expect(data.flags).to eq(prev_flags)

            expect(data.mean).to_not eq(prev_mean)
            expect(data.median).to_not eq(prev_median)
            expect{data.free_memory}.to_not raise_error
          end
        end
        context 'cases: negative' do
          it 'w/ non-numeric arg' do
            expect{@data_leet.λ(nil)}.to raise_error(::ArgumentError)
            expect{@data_leet.λ([])}.to raise_error(::ArgumentError)
            expect{@data_leet.λ(Rational(1337))}.to raise_error(::ArgumentError)
          end
          it 'w/ invalid float' do
            expect{@data_leet.λ(::Float::INFINITY)}.to raise_error(::ArgumentError)
            expect{@data_leet.λ(::Float::INFINITY_NEGATIVE)}.to raise_error(::ArgumentError)
            expect{@data_leet.λ(::Float::INFINITY_COMPLEX)}.to raise_error(::ArgumentError)
          end
        end
      end
    end # end: {func{scale_by_addition}}

    context 'func{scale_by_multiplication}' do
      context 'handles needed scenarios' do
        context 'cases: positive' do
          it 'w/ fixnum' do
            data          = ::TimeSeriesData.new((0..9).to_a, 3)
            prev_range    = data.range
            prev_min      = data.min
            prev_max      = data.max
            prev_mean     = data.mean
            prev_median   = data.median
            prev_variance = data.variance
            prev_std_dev  = data.std_dev
            prev_ρ        = data.ρ
            prev_len      = data.len
            prev_even     = data.even?
            prev_flags     = data.flags
            expect(data.flags).to eq(data_flags_ts.combined_val('has_zero?', 'strictly_increasing?', 'even?'))
            data.Λ(2)
            expect(data.len).to eq(prev_len)
            expect(data.even?).to eq(prev_even)
            expect(data.min).to eq(prev_min)
            expect(data.max).to eq(prev_max * 2)
            expect(data.std_dev).to eq(prev_std_dev * 2)
            expect(data.ρ).to eq(prev_ρ)
            expect(data.flags).to eq(prev_flags)
            expect(data.variance).to_not eq(prev_variance)
            expect(data.range).to_not eq(prev_range)
            expect(data.mean).to_not eq(prev_mean)
            expect(data.median).to_not eq(prev_median)
            expect{data.free_memory}.to_not raise_error
          end
          it 'w/ float' do
            data          = ::TimeSeriesData.new((0..9).to_a, 3)
            prev_range    = data.range
            prev_min      = data.min
            prev_max      = data.max
            prev_mean     = data.mean
            prev_median   = data.median
            prev_variance = data.variance
            prev_std_dev  = data.std_dev
            prev_ρ        = data.ρ
            prev_flags     = data.flags
            prev_len      = data.len
            prev_even     = data.even?
            expect(data.flags).to eq(data_flags_ts.combined_val('has_zero?', 'strictly_increasing?', 'even?'))
            data.Λ(2.0)
            expect(data.len).to eq(prev_len)
            expect(data.even?).to eq(prev_even)
            expect(data.min).to eq(prev_min)
            expect(data.max).to eq(prev_max * 2)
            expect(data.std_dev).to eq(prev_std_dev * 2)
            expect(data.ρ).to eq(prev_ρ)
            expect(data.flags).to eq(prev_flags)

            expect(data.variance).to_not eq(prev_variance)
            expect(data.range).to_not eq(prev_range)
            expect(data.mean).to_not eq(prev_mean)
            expect(data.median).to_not eq(prev_median)
            expect{data.free_memory}.to_not raise_error
          end
        end
        context 'cases: negative' do
          it 'w/ non-numeric arg' do
            expect{@data_leet.Λ(nil)}.to raise_error(::ArgumentError)
            expect{@data_leet.Λ([])}.to raise_error(::ArgumentError)
            expect{@data_leet.Λ(Rational(1337))}.to raise_error(::ArgumentError)
          end
          it 'w/ invalid float' do
            expect{@data_leet.Λ(::Float::INFINITY)}.to raise_error(::ArgumentError)
            expect{@data_leet.Λ(::Float::INFINITY_NEGATIVE)}.to raise_error(::ArgumentError)
            expect{@data_leet.Λ(::Float::INFINITY_COMPLEX)}.to raise_error(::ArgumentError)
          end
        end
      end
    end # end: {func{scale_by_multiplication}}

  end

  context 'audits',:audit do
    context '{f36_b05}' do
      context 'class{TimeSeriesData} is defined as needed' do
        it 'w/ needed funcs' do
          expect_∃⨍_with_alias(:normalize!, :η̂!, ::TimeSeriesData)
          expect_∃⨍_with_alias(:scale_by_addition, :λ, ::TimeSeriesData)
          expect_∃⨍_with_alias(:scale_by_multiplication, :Λ, ::TimeSeriesData)
        end
      end
    end
  end

end
