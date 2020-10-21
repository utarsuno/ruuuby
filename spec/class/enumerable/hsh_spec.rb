# encoding: UTF-8

RSpec.describe 'hsh' do

  context 'extends class{Hash}' do
    context 'by adding the following' do

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
