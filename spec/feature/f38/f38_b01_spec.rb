# encoding: UTF-8

using ::Math::Algebra::Tropical::ContextNumeric
using ::Math::Algebra::Tropical::ContextMatrix

RSpec.describe 'f38_b01' do

  context 'functionality for{f38_b01}' do

    context 'func{⨁}' do
      context 'handles needed scenarios' do
        context 'cases: positive' do
          it 'regular data' do
            expect(0.⨁(0)).to eq(0)
            expect(1337.⨁(0)).to eq(1337)
            expect(0.⨁(1337)).to eq(1337)
            expect(1.⨁(1)).to eq(1)
            expect(1337.⨁(1)).to eq(1337)
            expect(1.⨁(1337)).to eq(1337)
            expect(-1.⨁(-1)).to eq(-1)
            expect(1337.⨁(-1)).to eq(1337)
            expect(-1.⨁(1337)).to eq(1337)
            expect(0.⨁(0.0)).to eq(0)
            expect(-1337.⨁(0)).to eq(0)
            expect(0.⨁(-1337)).to eq(0)
            expect(1337.⨁(1337)).to eq(1337)
            expect(1337.⨁(-1337)).to eq(1337)
          end
          it 'w/ infs' do
            expect(0.⨁(::Float::INFINITY_NEGATIVE)).to eq(0)
            expect(::Float::INFINITY_NEGATIVE.⨁(0)).to eq(0)
            expect(0.⨁(::Float::INFINITY)).to eq(::Float::INFINITY)
            expect(::Float::INFINITY.⨁(0)).to eq(::Float::INFINITY)
          end
          it 'w/ floats' do
            expect(0.5.⨁(0.0)).to eq(0.5)
            expect(1337.5.⨁(0.0)).to eq(1337.5)
            expect(0.5.⨁(1337.5)).to eq(1337.5)
            expect(1.5.⨁(1.5)).to eq(1.5)
            expect(1337.5.⨁(1.5)).to eq(1337.5)
            expect(1.5.⨁(1337.5)).to eq(1337.5)
            expect(-1.5.⨁(-1.5)).to eq(-1.5)
            expect(1337.5.⨁(-1.5)).to eq(1337.5)
            expect(-1.5.⨁(1337.5)).to eq(1337.5)
            expect(0.5.⨁(0.0)).to eq(0.5)
            expect(-1337.5.⨁(0.5)).to eq(0.5)
            expect(0.5.⨁(-1337)).to eq(0.5)
            expect(1337.5.⨁(1337.5)).to eq(1337.5)
            expect(1337.5.⨁(-1337.5)).to eq(1337.5)
          end
        end
        it 'cases: error' do
          expect{0.⨁(nil)}.to raise_error(::ArgumentError)
        end
      end
    end # end: {func{⨁}}

    context 'func{⨂}' do
      context 'handles needed scenarios' do
        context 'cases: positive' do
          it 'regular data' do
            expect(0.⨂(0)).to eq(0)
            expect(1337.⨂(0)).to eq(1337)
            expect(0.⨂(1337)).to eq(1337)
            expect(1.⨂(1)).to eq(2)
            expect(1337.⨂(1)).to eq(1338)
            expect(1.⨂(1337)).to eq(1338)
            expect(-1.⨂(-1)).to eq(-2)
            expect(1337.⨂(-1)).to eq(1336)
            expect(-1.⨂(1337)).to eq(1336)
            expect(0.⨂(0.0)).to eq(0)
            expect(-1337.⨂(0)).to eq(-1337)
            expect(0.⨂(-1337)).to eq(-1337)
          end
          it 'w/ infs' do
            expect(0.⨂(::Float::INFINITY_NEGATIVE)).to eq(::Float::INFINITY_NEGATIVE)
            expect(::Float::INFINITY_NEGATIVE.⨂(0)).to eq(::Float::INFINITY_NEGATIVE)
            expect(0.⨂(::Float::INFINITY)).to eq(::Float::INFINITY)
            expect(::Float::INFINITY.⨂(0)).to eq(::Float::INFINITY)
          end
          it 'w/ floats' do
            expect(0.0.⨂(0.0)).to eq(0.0)
            expect(1337.5.⨂(0.5)).to eq(1338.0)
            expect(0.5.⨂(1337.5)).to eq(1338.0)
            expect(1.5.⨂(1.5)).to eq(3.0)
            expect(1337.5.⨂(1.5)).to eq(1339.0)
            expect(1.5.⨂(1337.5)).to eq(1339.0)
            expect(-1.5.⨂(-1.5)).to eq(-3.0)
            expect(1337.5.⨂(-1.5)).to eq(1336.0)
            expect(-1.5.⨂(1337.5)).to eq(1336.0)
            expect(0.5.⨂(0.0)).to eq(0.5)
            expect(-1337.5.⨂(0.0)).to eq(-1337.5)
            expect(0.5.⨂(-1337.5)).to eq(-1337.0)
          end
          context 'matrix data' do
            it 'w/ a 1x1 matrix' do
              expect(0.⨂(::Matrix[[0]])).to eq(::Matrix[[0]])
              expect(1.⨂(::Matrix[[0]])).to eq(::Matrix[[1]])
              expect(-1.⨂(::Matrix[[0]])).to eq(::Matrix[[-1]])
            end
            it 'w/ a 2x2 matrix' do
              expect(0.⨂(::Matrix[[1,2],[3,4]])).to eq(::Matrix[[1,2],[3,4]])
              expect(1.⨂(::Matrix[[1,2],[3,4]])).to eq(::Matrix[[2,3],[4,5]])
              expect(-1.⨂(::Matrix[[1,2],[3,4]])).to eq(::Matrix[[0,1],[2,3]])
            end
            it 'w/ a 3x3 matrix' do
              expect(0.⨂(::Matrix[[1,2,3],[4,5,6],[7,8,9]])).to eq(::Matrix[[1,2,3],[4,5,6],[7,8,9]])
              expect(1.⨂(::Matrix[[1,2,3],[4,5,6],[7,8,9]])).to eq(::Matrix[[2,3,4],[5,6,7],[8,9,10]])
              expect(-1.⨂(::Matrix[[1,2,3],[4,5,6],[7,8,9]])).to eq(::Matrix[[0,1,2],[3,4,5],[6,7,8]])
            end
            it 'w/ a 3x3 matrix and float data' do
              expect(0.5.⨂(::Matrix[[1,2,3],[4,5,6],[7,8,9]])).to eq(::Matrix[[1.5,2.5,3.5],[4.5,5.5,6.5],[7.5,8.5,9.5]])
              expect(1.5.⨂(::Matrix[[1,2,3],[4,5,6],[7,8,9]])).to eq(::Matrix[[2.5,3.5,4.5],[5.5,6.5,7.5],[8.5,9.5,10.5]])
              expect(-1.5.⨂(::Matrix[[1,2,3],[4,5,6],[7,8,9]])).to eq(::Matrix[[-0.5,0.5,1.5],[2.5,3.5,4.5],[5.5,6.5,7.5]])
            end
          end
        end
        it 'cases: error' do
          expect{0.⨂(nil)}.to raise_error(::ArgumentError)
        end
      end
    end

  end

end
