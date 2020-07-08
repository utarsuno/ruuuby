# coding: UTF-8

RSpec.describe 'f36_b01' do

  context 'functionality' do
    context 'class{TimeSeriesData}' do

      context 'has needed functions' do

        context 'memory related functions' do

          context 'func{mem_size}' do
            context 'handles needed scenarios' do
              it 'cases: positive' do
                a = ::TimeSeriesData.new([10, 10, 10, 10, 10, 10, 10, 10, 10, 10], 8)
                b = ::TimeSeriesData.new([10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10], 8)
                c = ::TimeSeriesData.new([10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10], 8)
                expect(b.mem_size > a.mem_size).to eq(true)
                expect(c.mem_size > b.mem_size).to eq(true)
                expect(c.mem_size > a.mem_size).to eq(true)
                expect{a.free_memory}.to_not raise_error
                expect{b.free_memory}.to_not raise_error
                expect{c.free_memory}.to_not raise_error
              end
            end
          end # end: {func{mem_size}}

          context 'func{free_memory}' do
            context 'handles needed scenarios' do
              before :each do
                @local_data = ::TimeSeriesData.new([10, 10, 10, 10, 10, 10, 10, 10, 10, 10], 8)
                @local_data2 = ::TimeSeriesData.new([10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10], 8)
              end
              after :each do
                expect{@local_data.free_memory}.to_not raise_error
                expect{@local_data2.free_memory}.to_not raise_error
                @local_data = nil
                @local_data2 = nil
              end
              it 'cases: positive' do
                og_size  = @local_data.mem_size
                og_len   = @local_data.len
                expect(@local_data.len).to_not eq(0)
                og_size2 = @local_data2.mem_size
                og_len2  = @local_data2.len
                expect(@local_data2.len).to_not eq(0)
                expect(og_size2 - og_size).to eq(8)
                expect{@local_data.free_memory}.to_not raise_error
                expect{@local_data2.free_memory}.to_not raise_error
                expect(@local_data.len).to eq(0)
                expect(@local_data.mem_size).to eq(og_size - (og_len * 8.0))
                expect(@local_data2.len).to eq(0)
                expect(@local_data2.mem_size).to eq(og_size2 - (og_len2 * 8.0))
              end
            end
          end

        end

      end # end: {has needed functions}
    end # end: {class{TimeSeriesData}}
  end

  context 'audits',:audit do
    context '{f36_b01}' do
      context 'class{TimeSeriesData} is defined as needed' do
        it 'w/ needed funcs' do
          expect_∃⨍(:mem_size, ::TimeSeriesData)
          expect_∃⨍(:free_memory, ::TimeSeriesData)
        end
      end
    end
  end


end
