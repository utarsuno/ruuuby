# coding: UTF-8

RSpec.describe 'f34' do

  context 'feature{f34} functionality' do
    let(:geo){::Math::Geometry}

    context 'hybrid tests', :integration do
      let(:a_triangle){geo::Triangle.new(3, 4, 5)}
      let(:a_square){geo::Square.new(3)}

      context 'func{sum_of_interior_angles}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect_sum_of_interior_angles(a_triangle, 3)
            expect_sum_of_interior_angles(a_square, 4)
          end
        end
      end

    end

  end
end
