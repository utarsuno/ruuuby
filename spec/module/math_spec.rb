# coding: UTF-8

RSpec.describe 'module/math.rb' do

  let(:val_a){360.0}
  let(:val_b){359.99999}
  let(:val_c){359.999}

  context 'extends module{Math}' do

    context 'by adding needed functions & aliases' do

      context 'adds function{relative_Δ}' do
        context 'handling needed scenarios' do
          it 'cases: positive' do
            expect(Math.relative_Δ(a: val_a, b: val_c)).to eq(Math.relative_Δ(a: val_c, b: val_a))

            expect(Math.relative_Δ(a: val_a, b: val_b)).to eq(Math.relative_Δ(a: val_b, b: val_a))
            expect(Math.relative_Δ(a: val_a, b: val_b) < 0.00001).to eq(true)
          end
          it 'cases: negative' do
            expect(Math.relative_Δ(a: val_a, b: val_c) < 0.00001).to eq(false)
          end
          it 'cases: bad args' do
            expect{Math.relative_Δ(1, a: 2, b: 3)}.to raise_error(ArgumentError)
            expect{Math.relative_Δ(a: nil, b: val_b)}.to raise_error(ArgumentError)
            expect{Math.relative_Δ(a: val_a, b: nil)}.to raise_error(ArgumentError)
            expect{Math.relative_Δ(a: nil, b: nil)}.to raise_error(ArgumentError)
            expect{Math.relative_Δ(1, a: nil, b: nil)}.to raise_error(ArgumentError)
          end
        end
      end # end: adds functions{relative_Δ}

      context 'func{τ²_in_golden_ratio?}' do
        context 'handles needed scenarios' do
          context 'cases: positive' do
            it 'w/ regular data' do
              expect(::Math.τ²_in_golden_ratio?(a: 1 + √(5), b: 2)).to eq(true)
            end
            it 'w/ ThetaAngles' do
              expect(::Math.τ²_in_golden_ratio?(a: θ°(360.0) - Ⴔ, b: Ⴔ)).to eq(true)
            end
          end
          context 'cases: negative' do
            it 'bad params' do
              expect{::Math.τ²_in_golden_ratio?(1, 2, 3)}.to raise_error(ArgumentError)
              expect{::Math.τ²_in_golden_ratio?(a: 1, b: 2, c: nil)}.to raise_error(ArgumentError)
              expect{::Math.τ²_in_golden_ratio?(1, a: 1, b: 2)}.to raise_error(ArgumentError)
            end
            it 'not τ² golden-ratio tuples' do
              expect(::Math.τ²_in_golden_ratio?(a: 1, b: 2)).to eq(false)
              expect(::Math.τ²_in_golden_ratio?(a: 1, b: 2.0)).to eq(false)
            end
          end
        end
      end # end: {func{τ²_in_golden_ratio?}}

      context 'func{pythagorean??}' do
        context 'handles needed scenarios' do
          context 'cases: positive' do
            it 'w/ ints & floats' do
              expect(::Math::Trig::ℕ³.pythagorean?(a: 3, b: 4, c: 5)).to eq(true)
              expect(::Math::Trig::ℕ³.pythagorean?(a: 3.0, b: 4.0, c: 5.0)).to eq(true)
              expect(::Math::Trig::ℕ³.pythagorean?(a: 3.0, b: 4, c: 5)).to eq(true)
            end
            it 'w/ theta angles' do
              expect(::Math::Trig::ℕ³.pythagorean?(a: θ°(30), b: θ°(60), c: θ°(90))).to eq(true)
            end
          end
          context 'cases: negative' do
            it 'bad params' do
              expect{::Math::Trig::ℕ³.pythagorean?(1, 2, 3)}.to raise_error(ArgumentError)
              expect{::Math::Trig::ℕ³.pythagorean?(a: 1, b: 2, c: nil)}.to raise_error(ArgumentError)
              expect{::Math::Trig::ℕ³.pythagorean?(1, a: 1, b: 2, c: 3)}.to raise_error(ArgumentError)
            end
            it 'not pythagoras_τ³ tuples' do
              expect(::Math::Trig::ℕ³.pythagorean?(a: 1, b: 2, c: 3)).to eq(false)
            end
          end
        end
      end # end: {func{pythagorean?}}

    end
  end
end
