# encoding: UTF-8

RSpec.describe 'hsh' do
  let(:hsh_data_0){{a: 0, b: 1, c: 2, x: 0, y: 1, z: 2}}

  context 'extends class{Hash}' do
    context 'by adding the following' do

      context 'func{∀🔑∃_value?}' do
        context 'handles needed scenarios' do
          context 'cases: positive' do
            context 'regular data' do
              it 'w/ single key searched' do
                expect(hsh_data_0.∀🔑∃_value?([:a], 0)).to eq(true)
                expect(hsh_data_0.∀🔑∃_value?([:b], 1)).to eq(true)
                expect(hsh_data_0.∀🔑∃_value?([:c], 2)).to eq(true)

                expect(hsh_data_0.∀🔑∃_value?([:x], 0)).to eq(true)
                expect(hsh_data_0.∀🔑∃_value?([:y], 1)).to eq(true)
                expect(hsh_data_0.∀🔑∃_value?([:z], 2)).to eq(true)
              end
              it 'w/ multiple keys searched' do
                expect(hsh_data_0.∀🔑∃_value?([:a, :x], 0)).to eq(true)
                expect(hsh_data_0.∀🔑∃_value?([:b, :y], 1)).to eq(true)
                expect(hsh_data_0.∀🔑∃_value?([:c, :z], 2)).to eq(true)
              end
            end
          end
          context 'cases: negative' do
            context 'regular data' do
              it 'w/ single key searched' do
                expect(hsh_data_0.∀🔑∃_value?([:a], 2)).to eq(false)
                expect(hsh_data_0.∀🔑∃_value?([:b], 0)).to eq(false)
                expect(hsh_data_0.∀🔑∃_value?([:c], 1)).to eq(false)

                expect(hsh_data_0.∀🔑∃_value?([:r], 0)).to eq(false)
                expect(hsh_data_0.∀🔑∃_value?([:h], 1)).to eq(false)
                expect(hsh_data_0.∀🔑∃_value?([:g], 2)).to eq(false)

                expect(hsh_data_0.∀🔑∃_value?([:aa], 0)).to eq(false)
                expect(hsh_data_0.∀🔑∃_value?([:bb], 1)).to eq(false)
                expect(hsh_data_0.∀🔑∃_value?(['a'], 0)).to eq(false)
              end
              it 'w/ multiple keys searched' do
                expect(hsh_data_0.∀🔑∃_value?([:a, :y], 0)).to eq(false)
                expect(hsh_data_0.∀🔑∃_value?([:b, :z], 1)).to eq(false)
                expect(hsh_data_0.∀🔑∃_value?([:c, :x], 2)).to eq(false)

                expect(hsh_data_0.∀🔑∃_value?([:a, :x], 2)).to eq(false)
                expect(hsh_data_0.∀🔑∃_value?([:b, :y], 0)).to eq(false)
                expect(hsh_data_0.∀🔑∃_value?([:c, :z], 1)).to eq(false)

                expect(hsh_data_0.∀🔑∃_value?([:a, :c, :z], 1)).to eq(false)
              end
            end
            context 'bad args' do
              it 'bad param type' do
                expect{hsh_data_0.∀🔑∃_value?(:a, 2)}.to raise_error(::ArgumentError)
                expect{hsh_data_0.∀🔑∃_value?(nil, 2)}.to raise_error(::ArgumentError)
                expect{hsh_data_0.∀🔑∃_value?({}, 2)}.to raise_error(::ArgumentError)
                expect{hsh_data_0.∀🔑∃_value?({:a => []}, 2)}.to raise_error(::ArgumentError)
              end
            end
          end
        end
      end

      context 'func{λ𝑓∀🔑：₍🔑∉₎}' do
        context 'handles needed scenarios' do
          context 'cases: positive' do
            it 'w/ regular data' do
              data    = {a: 0, b: 1, c: 2}
              data_id = data.🆔
              expect(data.λ𝑓∀🔑：₍🔑∉₎(:a)).to eq({b: 1, c: 2})
              expect(data.λ𝑓∀🔑：₍🔑∉₎(:a, :b)).to eq({c: 2})
              expect(data.λ𝑓∀🔑：₍🔑∉₎(:a, :b, :c)).to eq({})
              expect(data.λ𝑓∀🔑：₍🔑∉₎(%w(a b c))).to eq({a: 0, b: 1, c: 2})
              expect(data.🆔).to eq(data_id)
            end
            it 'w/ new obj returned' do
              data      = {a: 0, b: 1, c: 2}
              data_id   = data.🆔
              result    = data.λ𝑓∀🔑：₍🔑∉₎(%w(a b c))
              result_id = result.🆔
              expect(data.🆔).to eq(data_id)
              expect(data_id).to_not eq(result_id)
              expect(result.ⓣ).to eq(::Hash)
            end
          end
          context 'cases: negative' do
            it 'w/ no args passed' do
              expect{{a: 0, b: 1, c: 2}.λ𝑓∀🔑：₍🔑∉₎}.to raise_error(::ArgumentError)
            end
            it 'w/ empty caller' do
              expect{{}.λ𝑓∀🔑：₍🔑∉₎}.to raise_error(::ArgumentError)
              expect{{}.λ𝑓∀🔑：₍🔑∉₎(%w(a b c))}.to raise_error(::RuntimeError)
            end
          end
        end
      end # end: {func{λ𝑓∀🔑：₍🔑∉₎}}

      context 'func{λ𝑓∀🔑：₍🔑∉₎!}' do
        context 'handles needed scenarios' do
          context 'cases: positive' do
            it 'w/ regular data' do
              data    = {a: 0, b: 1, c: 2}
              data_id = data.🆔
              expect(data.λ𝑓∀🔑：₍🔑∉₎!(:a)).to eq({b: 1, c: 2})
              expect(data.λ𝑓∀🔑：₍🔑∉₎!(:a, :b)).to eq({c: 2})
              expect(data.λ𝑓∀🔑：₍🔑∉₎!(:a, :b, :c)).to eq({})
              expect({a: 0, b: 1, c: 2}.λ𝑓∀🔑：₍🔑∉₎!(%w(a b c))).to eq({a: 0, b: 1, c: 2})
              expect(data.🆔).to eq(data_id)
            end
            it 'w/ same obj returned' do
              data      = {a: 0, b: 1, c: 2}
              data_id   = data.🆔
              result    = data.λ𝑓∀🔑：₍🔑∉₎!(:a, :b)
              result_id = result.🆔
              expect(data.🆔).to eq(data_id)
              expect(data_id).to eq(result_id)
              expect(result.ⓣ).to eq(::Hash)
              expect(data).to eq(result)
            end
          end
          context 'cases: negative' do
            it 'w/ no args passed' do
              expect{{a: 0, b: 1, c: 2}.λ𝑓∀🔑：₍🔑∉₎!}.to raise_error(::ArgumentError)
            end
            it 'w/ empty caller' do
              expect{{}.λ𝑓∀🔑：₍🔑∉₎!}.to raise_error(::ArgumentError)
              expect{{}.λ𝑓∀🔑：₍🔑∉₎!(%w(a b c))}.to raise_error(::RuntimeError)
            end
          end
        end
      end # end: {func{λ𝑓∀🔑：₍🔑∉₎!}}

    end
  end

end
