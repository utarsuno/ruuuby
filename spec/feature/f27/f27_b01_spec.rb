# encoding: UTF-8

using ::ThetaAngle::ContextRuuuby

RSpec.describe 'f27_b01' do

  context 'functionality' do

    context 'can sum to value{1} w/' do

      context 'all 4 internal formats' do

        it 'w/ 4 operations' do
          the_angle = θ°(90)
          the_angle += θʳ(π / 2.0)
          the_angle += θᵍ(100.0)
          the_angle += θ𝞽(0.25)
          expect(the_angle).to eq(::Math::ANGLE_TAU)
        end

        it 'w/ 8 operations' do
          the_angle = θ°(0)
          (0..1).each do |index|
            the_angle += θ°(45)
            the_angle += θʳ(π / 4.0)
            the_angle += θᵍ(50.0)
            the_angle += θ𝞽(1.0 / 8.0)
          end
          expect(the_angle).to eq(::Math::ANGLE_TAU)
        end

        it 'w/ 16 operations' do
          the_angle = θ°(0)
          (0..3).each do |index|
            the_angle += θ°(22.5)
            the_angle += θʳ(π / 8.0)
            the_angle += θᵍ(25.0)
            the_angle += θ𝞽(1.0 / 16)
          end
          expect(the_angle).to eq(::Math::ANGLE_TAU)
        end

        it 'w/ 32 operations' do
          the_angle = θ°(0)
          (0..7).each do |index|
            the_angle += θ°(11.25)
            the_angle += θʳ(π / 16.0)
            the_angle += θᵍ(12.5)
            the_angle += θ𝞽(1.0 / 32)
          end
          expect(the_angle).to eq(::Math::ANGLE_TAU)
        end

        it 'w/ 64 operations' do
          the_angle = θ°(0)
          (0..15).each do |index|
            the_angle += θ°(5.625)
            the_angle += θʳ(π / 32.0)
            the_angle += θᵍ(6.25)
            the_angle += θ𝞽(1.0 / 64)
          end
          expect(the_angle).to eq(::Math::ANGLE_TAU)
        end

        it 'w/ 128 operations' do
          the_angle = θ°(0)
          (0..31).each do |index|
            the_angle += θ°(2.8125)
            the_angle += θʳ(π / 64.0)
            the_angle += θᵍ(3.125)
            the_angle += θ𝞽(1.0 / 128)
          end
          expect(the_angle).to eq(::Math::ANGLE_TAU)
        end

        it 'w/ 256 operations' do
          the_angle = θ°(0)
          (0..63).each do |index|
            the_angle += θ°(1.40625)
            the_angle += θʳ(π / 128.0)
            the_angle += θᵍ(1.5625)
            the_angle += θ𝞽(1.0 / 256)
          end
          expect(the_angle).to eq(::Math::ANGLE_TAU)
        end

        it 'w/ 512 operations' do
          the_angle = θ°(0)
          (0..127).each do |index|
            the_angle += θ°(0.703125)
            the_angle += θʳ(π / 256.0)
            the_angle += θᵍ(0.78125)
            the_angle += θ𝞽(1.0 / 512)
          end
          expect(the_angle).to eq(::Math::ANGLE_TAU)
        end

        it 'w/ 1024 operations' do
          the_angle = θ°(0)
          (0..255).each do |index|
            the_angle += θ°(0.3515625)
            the_angle += θʳ(π / 512.0)
            the_angle += θᵍ(0.390625)
            the_angle += θ𝞽(1.0 / 1024)
          end
          expect(the_angle).to eq(::Math::ANGLE_TAU)
        end

        it 'w/ 2048 operations' do
          the_angle = θ°(0)
          (0..511).each do |index|
            the_angle += θ°(0.17578125)
            the_angle += θʳ(π / 1024.0)
            the_angle += θᵍ(0.1953125)
            the_angle += θ𝞽(1.0 / 2048)
          end
          expect(the_angle).to eq(::Math::ANGLE_TAU)
        end

        it 'w/ 4096 operations' do
          the_angle = θ°(0)
          (0..1023).each do |index|
            the_angle += θ°(0.087890625)
            the_angle += θʳ(π / 2048.0)
            the_angle += θᵍ(0.09765625)
            the_angle += θ𝞽(1.0 / 4096)
          end
          expect(the_angle).to eq(::Math::ANGLE_TAU)
        end

        it 'w/ 8192 operations' do
          the_angle = θ°(0)
          (0..2047).each do |index|
            the_angle += θ°(0.0439453125)
            the_angle += θʳ(π / 4096.0)
            the_angle += θᵍ(0.048828125)
            the_angle += θ𝞽(1.0 / 8192)
          end
          expect(the_angle).to eq(::Math::ANGLE_TAU)
        end

      end

    end

  end

end
