# coding: UTF-8

RSpec.describe 'f36_b04' do

  before :all do
    @data_all_same  = ::TimeSeriesData.new([-10, -10, -10, -10, -10, -10, -10, -10, -10, -10], 8)
    @data           = ::TimeSeriesData.new((0..99).to_a, 10)
    @data_leet      = ::TimeSeriesData.new([1337, 1337, 1337, 1337, 1337, 1337, 1337, 1337, 1338, 1338, 1339], 7)
    @data_simple    = ::TimeSeriesData.new([-1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 3)
    @data_predicted = [-2.1, -1.0, 1.9, 2.8, 3.7, 4.6, 5.4, 6.4, 7.3, 8.2, 9.1, 10.0]
  end

  after :all do
    expect{@data_all_same.free_memory}.to_not raise_error
    expect{@data.free_memory}.to_not raise_error
    expect{@data_leet.free_memory}.to_not raise_error
    expect{@data_simple.free_memory}.to_not raise_error
    @data_predicted = nil
  end

  context 'functionality' do
    context 'class{TimeSeriesData}' do

      context 'can be created' do
        it 'w/ regular integer data' do
          expect(@data_all_same.ⓣ).to eq(::TimeSeriesData)
          expect(@data.ⓣ).to eq(::TimeSeriesData)
          expect(@data_leet.ⓣ).to eq(::TimeSeriesData)
          expect(@data_simple.ⓣ).to eq(::TimeSeriesData)
        end
        it 'w/ needed flags' do
          the_flags = ::TimeSeriesData::BITWISE_FLAGS
          expect(@data_all_same.flags).to eq(the_flags.combined_val(*%w(has_negative? all_same? even?)))
          expect(@data.flags).to eq(the_flags.combined_val(*%w(has_zero? strictly_increasing? even?)))
          expect(@data_leet.flags).to eq(the_flags['strictly_increasing?'])
          expect(@data_simple.flags).to eq(the_flags.combined_val(*%w(has_zero? has_negative? strictly_increasing? even?)))
        end
      end

      context 'w/ extra utility funcs' do

        context 'func{has_negative?}' do
          context 'handles needed scenarios' do
            it 'cases: positive' do
              expect(@data_all_same.has_negative?).to eq(true)
              expect(@data_simple.has_negative?).to eq(true)
            end
            it 'cases: negative' do
              expect(@data.has_negative?).to eq(false)
              expect(@data_leet.has_negative?).to eq(false)
            end
          end
        end # end: {func{has_negative?}}

        context 'func{has_zero?}' do
          context 'handles needed scenarios' do
            it 'cases: positive' do
              expect(@data_simple.has_zero?).to eq(true)
              expect(@data.has_zero?).to eq(true)
            end
            it 'cases: negative' do
              expect(@data_all_same.has_zero?).to eq(false)
              expect(@data_leet.has_zero?).to eq(false)
            end
          end
        end # end: {func{has_zero?}}

        context 'func{normalized?}' do
          context 'handles needed scenarios' do
            it 'cases: positive' do
              data = ::TimeSeriesData.new((0..9).to_a, 3)
              expect(data.normalized?).to eq(false)
              data.normalize!
              expect(data.normalized?).to eq(true)
              expect{data.free_memory}.to_not raise_error
            end
            it 'cases: negative' do
              expect(@data_simple.normalized?).to eq(false)
              expect(@data.normalized?).to eq(false)
              expect(@data_all_same.normalized?).to eq(false)
              expect(@data_leet.normalized?).to eq(false)
            end
          end
        end

      end # end: {w/ extra utility funcs}
    end # end: {class{TimeSeriesData}}
  end

  context 'audits', :audit do
    context '{f36_b04}' do
      context 'class{TimeSeriesData} is defined as needed' do
        it 'w/ needed funcs' do
          expect_∃⨍(:flags, ::TimeSeriesData)
          expect_∃⨍(:has_zero?, ::TimeSeriesData)
          expect_∃⨍(:has_negative?, ::TimeSeriesData)
          expect_∃⨍(:even?, ::TimeSeriesData)
          expect_∃⨍(:strictly_increasing?, ::TimeSeriesData)
          expect_∃⨍(:strictly_decreasing?, ::TimeSeriesData)
          expect_∃⨍(:all_same?, ::TimeSeriesData)
          expect_∃⨍_with_alias(:normalized?, :η̂?, ::TimeSeriesData)
        end
      end
    end
  end

end
