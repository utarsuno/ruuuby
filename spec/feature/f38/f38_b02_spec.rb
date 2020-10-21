# encoding: UTF-8

unless ENV['RUUUBY_F06'].nil?
  using ::Math::Algebra::Tropical::ContextNumeric
  using ::Math::Algebra::Tropical::ContextMatrix

  RSpec.describe 'f38_b02' do

    context 'functionality for{f38_b02}' do

      context 'class{Matrix} has needed functions' do

        context 'func{↘_to_a}' do
          context 'handles needed scenarios' do
            context 'cases: positive' do
              it 'w/ a 1x1 matrix' do
                data   = ::Matrix[[1]]
                result = data.↘_to_a
                expect(result).to eq([1])
              end
              it 'w/ a 2x2 matrix' do
                data   = ::Matrix[[1,2],[3,4]]
                result = data.↘_to_a
                expect(result).to eq([1, 4])
              end
              it 'w/ a 3x3 matrix' do
                data   = ::Matrix[[1,2,3],[4,5,6],[7,8,9]]
                result = data.↘_to_a
                expect(result).to eq([1, 5, 9])
              end
              it 'w/ a 4x4 matrix' do
                data   = ::Matrix[[1,2,3,4],[5,6,7,8],[9,10,11,12],[13,14,15,16]]
                result = data.↘_to_a
                expect(result).to eq([1, 6, 11, 16])
              end
              it 'w/ a 5x5 matrix' do
                data   = ::Matrix[[1,2,3,4,5],[6,7,8,9,10],[11,12,13,14,15],[16,17,18,19,20],[21,22,23,24,25]]
                result = data.↘_to_a
                expect(result).to eq([1, 7, 13, 19, 25])
              end
            end
            it 'cases: negative' do
              data = ::Matrix[[1,2,3],[4,5,6],[7,8,9],[1337,1337,1337]]
              expect{data.↘_to_a}.to raise_error(::ExceptionForMatrix::ErrDimensionMismatch)
            end
          end
        end # end: {func{↘_to_a}}

        context 'func{∀ₓᵢ↘}' do
          context 'handles needed scenarios' do
            it 'cases: positive' do
              data              = ::Matrix[[1,2,3],[4,5,6],[7,8,9]]
              positions_visited = 0
              data.∀ₓᵢ↘ do |x,i|
                expect(x).to eq(data[i,i])
                positions_visited += 1
              end
              expect(positions_visited).to eq(3)
            end
            it 'cases: negative' do
              data = ::Matrix[[1,2,3],[4,5,6],[7,8,9],[1337,1337,1337]]
              expect{data.∀ₓᵢ↘}.to raise_error(::ExceptionForMatrix::ErrDimensionMismatch)
            end
          end
        end # end: {func{∀ₓᵢ↘}}

        context 'func{∀ₓ↘}' do
          context 'handles needed scenarios' do
            it 'cases: positive' do
              data              = ::Matrix[[1,2,3],[4,5,6],[7,8,9]]
              positions_visited = 0
              data.∀ₓ↘ do |x|
                expect(x).to eq(data[positions_visited,positions_visited])
                positions_visited += 1
              end
              expect(positions_visited).to eq(3)
            end
            it 'cases: negative' do
              data = ::Matrix[[1,2,3],[4,5,6],[7,8,9],[1337,1337,1337]]
              expect{data.∀ₓ↘}.to raise_error(::ExceptionForMatrix::ErrDimensionMismatch)
            end
          end
        end # end: {func{∀ₓ↘}}

        context 'func{∀ₓᵢⱼ}' do
          context 'handles needed scenarios' do
            context 'cases: positive' do
              it 'w/ a square matrix' do
                data              = ::Matrix[[1,2,3,4],[5,6,7,8],[9,10,11,12],[13,14,15,16]]
                positions_visited = 0
                data.∀ₓᵢⱼ do |x,i,j|
                  expect(x).to eq(data[i,j])
                  positions_visited += 1
                end
                expect(positions_visited).to eq(16)
              end
              it 'w/ a non-square matrix' do
                data              = ::Matrix[[1,2,3],[4,5,6],[7,8,9],[1337,1337,1337]]
                positions_visited = 0
                data.∀ₓᵢⱼ do |x,i,j|
                  expect(x).to eq(data[i,j])
                  positions_visited += 1
                end
                expect(positions_visited).to eq(12)
              end
            end
          end
        end # end: {func{∀ₓᵢⱼ}}

      end

    end # end: {functionality for{f38_b02}}

    context 'audits', :audit do
      context '{f38_b02} passes audits' do
        it 'by finding needed Modules and functions' do
          expect_∃⨍(:∀ₓ↘, ::Matrix)
          expect_∃⨍(:∀ₓᵢ↘, ::Matrix)
          expect_∃⨍(:∀ₓᵢⱼ, ::Matrix)
          expect_∃⨍(:↘_to_a, ::Matrix)
        end
      end
    end # end: {audit}

  end
end
