# encoding: UTF-8

RSpec.describe 'f36_b06' do

  before :all do
    @data_all_same               = ::TimeSeriesData.new([10, 10, 10, 10, 10, 10, 10, 10, 10, 10], 8)
    @data_same_base_w_fake_noise = ::TimeSeriesData.new([10 + 3, 10 - 3, 10 + 3, 10 - 3, 10 + 3, 10 - 3, 10 + 3, 10 - 3, 10 + 3, 10 - 3], 8)
    @data                        = ::TimeSeriesData.new((0..99).to_a, 10)
    @data_leet                   = ::TimeSeriesData.new([1337, 1337, 1337, 1337, 1337, 1337, 1337, 1337, 1338, 1338, 1339], 7)

    @data_noise                  = ::TimeSeriesData.new([137, 152, 124, 140, 139, 144, 138, 125, 150], 4)
    @data_negative_linear        = ::TimeSeriesData.new([1337, 1330, 1300, 1000, 300, 30, 3], 4)
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
      context 'verifies against external examples' do
        context 'source{0x0}' do
          context 'produces same results' do
            it 'w/ data of even length' do
              data = ::TimeSeriesData.new([3.0,10.0,14.0,19.0,22.0,29.0,32.0,36.0,49.0,70.0], 3)
              expect(data.Q₁).to eq(15.25)
              expect(data.median).to eq(25.5)
              expect(data.Q₃).to eq(35.0)
              expect(data.IQR).to eq(data.Q₃ - data.Q₁)

              expect(data.outliers_lower).to eq([3.0])
              expect(data.outliers_upper).to eq([70.0])
              expect(data.boundary_outliers_max).to eq(64.625)
              expect(data.boundary_outliers_min).to eq(5.375)

              expect{data.♻️}.to_not raise_error
            end
            it 'w/ data of odd length' do
              data = ::TimeSeriesData.new([1.0,2.0,5.0,6.0,7.0,9.0,12.0,15.0,18.0,19.0,38.0], 3)
              expect(data.Q₁).to eq(5.5)
              expect(data.median).to eq(9.0)
              expect(data.Q₃).to eq(16.5)
              expect(data.IQR).to eq(data.Q₃ - data.Q₁)

              expect(data.outliers_lower.∅?).to eq(true)
              expect(data.outliers_upper).to eq([38.0])
              expect(data.boundary_outliers_max).to eq(33.0)
              expect(data.boundary_outliers_min).to eq(0.0)

              expect{data.♻️}.to_not raise_error
            end
          end
        end # end: {source{0x0}}
      end # end: {verifies against external examples}
    end # end: {class{TimeSeriesData}}
  end

  context 'audits', :audit do
    context '{f36_b06}' do
      it 'creates class{`TimeSeriesData`}' do
        expect_∃ᶜ(:TimeSeriesData)
      end
      context 'class{TimeSeriesData} is defined as needed' do
        context 'w/ needed funcs' do
          it 'representing IQR fields' do
            expect_∃⨍_with_alias(:q1, :Q₁, ::TimeSeriesData)
            expect_∃⨍_with_alias(:median, :Q₂, ::TimeSeriesData)
            expect_∃⨍_with_alias(:q2, :Q₂, ::TimeSeriesData)
            expect_∃⨍_with_alias(:q3, :Q₃, ::TimeSeriesData)
            expect_∃⨍(:IQR, ::TimeSeriesData)
          end
          it 'for detecting outliers' do
            expect_∃⨍(:outliers_lower, ::TimeSeriesData)
            expect_∃⨍(:outliers_upper, ::TimeSeriesData)
            expect_∃⨍(:boundary_outliers_max, ::TimeSeriesData)
            expect_∃⨍(:boundary_outliers_min, ::TimeSeriesData)
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
# | 0x0  | https://www.statisticshowto.com/find-outliers/                                                   |

