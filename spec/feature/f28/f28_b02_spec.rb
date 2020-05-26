# coding: UTF-8

RSpec.describe 'f28_b02' do
  context 'functionality' do
    context '℮' do
      context 'has correct value' do
        it '℮ == Math::E' do
          expect(℮).to eq(::Math::E)
          expect(℮.ⓣ).to eq(::Float)
          expect(℮ < 3).to eq(true)
          expect(℮ > 2).to eq(true)
        end

        it 'parses{℮^⁰} correctly' do
          expect(℮ ** 0).to eq(1)
          expect(℮^⁰).to eq(1)
        end

        context 'works w/ needed relating equations' do

          it "Euler's Identity" do
            expect((℮ ** (1i * π)) + 1.0).to eq(0)
          end

          it "Euler's Formula" do
            expect(℮ ** (1i * 1)).to eq(cos(θʳ(1)) + 1i * sin(θʳ(1)))
          end

        end

      end
    end # end: {angle tau}
  end
end
