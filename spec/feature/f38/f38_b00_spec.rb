# encoding: UTF-8

using ::Math::Algebra::Tropical::ContextNumeric
using ::Math::Algebra::Tropical::ContextMatrix

RSpec.describe 'f38_b00' do

  context 'functionality for{f38_b00}' do

    context 'func{⨁}' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          m0     = ::Matrix[[2,4],[1,0]]
          m0_id  = m0.🆔
          m1     = ::Matrix[[5,::Float::INFINITY_NEGATIVE],[6,-3]]
          result = m0.⨁(m1)
          expect(result).to eq(::Matrix[[5,4],[6,0]])
          expect(m0.🆔).to eq(m0_id)
          expect(result.🆔).to_not eq(m0_id)
        end
        it 'cases: error' do
          expect{::Matrix[[2,4],[1,0]].⨁(nil)}.to raise_error(::ArgumentError)
        end
      end
    end # end: {func{⨁}}

    context 'func{⨁!}' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          m0     = ::Matrix[[2,4],[1,0]]
          m0_id  = m0.🆔
          m1     = ::Matrix[[5,::Float::INFINITY_NEGATIVE],[6,-3]]
          result = m0.⨁!(m1)
          expect(m0).to eq(::Matrix[[5,4],[6,0]])
          expect(m0.🆔).to eq(m0_id)
          expect(result.🆔).to eq(m0_id)
        end
        it 'cases: error' do
          expect{::Matrix[[2,4],[1,0]].⨁(nil)}.to raise_error(::ArgumentError)
        end
      end
    end # end: {func{⨁!}}

    context 'func{⨂ⁿ}' do
      context 'handles needed scenarios' do
        context 'cases: positive' do
          it 'w/ pow 2' do
            data       = ::Matrix[[2,4],[1,0]]
            result_alt = data.⨂(data)
            result_pow = data.⨂ⁿ(2)
            expect(result_alt).to eq(::Matrix[[5,6],[3,5]])
            expect(result_pow).to eq(::Matrix[[5,6],[3,5]])
            expect(data.🆔).to_not eq(result_alt.🆔)
            expect(data.🆔).to_not eq(result_pow.🆔)
            expect(result_alt.🆔).to_not eq(result_pow.🆔)
          end
          it 'w/ pow 3' do
            data   = ::Matrix[[2,4],[1,0]]
            result = data.⨂ⁿ(3)
            expect(result).to eq(::Matrix[[7,9],[6,7]])
            expect(data.🆔).to_not eq(result.🆔)
          end
        end
      end
    end # end: {func{⨂ⁿ}}

    context 'func{⨂}' do
      context 'handles needed scenarios' do
        context 'cases: positive' do
          it 'first scenario' do
            m0     = ::Matrix[[2,4],[1,0]]
            m1     = ::Matrix[[5,::Float::INFINITY_NEGATIVE],[6,-3]]
            result = m0.⨂(m1)
            expect(result).to eq(::Matrix[[10,1],[6,-3]])
          end
        end
        it 'cases: error' do
          expect{::Matrix[[2,4],[1,0]].⨂(nil)}.to raise_error(::ArgumentError)
        end
      end
    end # end: {func{⨂}}

  end

end
