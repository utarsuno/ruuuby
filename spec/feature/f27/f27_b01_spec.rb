# coding: UTF-8

RSpec.describe 'f27_b01' do

  context 'functionality' do

    context 'can sum to value{1} w/' do

      context 'all 4 internal formats' do

        it 'w/ 4 operations' do
          the_angle = θ°(90)
          the_angle += θʳ(π / 2.0)
          the_angle += θᵍ(100.0)
          the_angle += θ𝞽(¼)
          expect(the_angle).to eq(::Math::ANGLE_TAU)
        end

        it 'w/ 8 operations' do
          the_angle = θ°(45)
          the_angle += θʳ(π / 4.0)
          the_angle += θᵍ(50.0)
          the_angle += θ𝞽(⅛)
          the_angle += θ°(45)
          the_angle += θʳ(π / 4.0)
          the_angle += θᵍ(50.0)
          the_angle += θ𝞽(⅛)
          expect(the_angle).to eq(::Math::ANGLE_TAU)
        end

      end

    end


  end

end
