# coding: utf-8

RSpec.describe 'module/math.rb' do

  let(:val_a){360.0}
  let(:val_b){359.99999}
  let(:val_c){359.999}

  context 'extends module{Math}' do
    context 'by adding needed functions & aliases' do

      context 'adds function{relative_Δ}' do
        context 'handling needed scenarios' do
          it 'cases: positive' do
            expect(Math.relative_Δ(val_a, val_c)).to eq(Math.relative_Δ(val_c, val_a))

            expect(Math.relative_Δ(val_a, val_b)).to eq(Math.relative_Δ(val_b, val_a))
            expect(Math.relative_Δ(val_a, val_b) < 0.00001).to eq(true)
          end
          it 'cases: negative' do
            expect(Math.relative_Δ(val_a, val_c) < 0.00001).to eq(false)
          end
          it 'cases: bad args' do
            expect{Math.relative_Δ(nil, val_b)}.to raise_error(ArgumentError)
            expect{Math.relative_Δ(val_a, nil)}.to raise_error(ArgumentError)
            expect{Math.relative_Δ(nil, nil)}.to raise_error(ArgumentError)
          end
        end
      end

    end
  end
end
