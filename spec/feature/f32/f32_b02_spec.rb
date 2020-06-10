# coding: UTF-8

RSpec.describe 'f32_b02' do

  context 'feature{f32} behavior{b02} functionality' do
    let(:fℕ²){::Math::NumberTheory::ℕ²}

    context 'ℕ²' do

      context 'func{coprime?}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect(fℕ².coprime?(14, 15)).to eq(true)
            expect(fℕ².coprime?(15, 14)).to eq(true)
          end
          it 'cases: negative' do
            expect(fℕ².coprime?(8, 4)).to eq(false)
            expect(fℕ².coprime?(4, 8)).to eq(false)
          end
          it 'cases: error' do
            expect{fℕ².coprime?(18, 30.1)}.to raise_error(ArgumentError)
            expect{fℕ².coprime?(18.2, 30)}.to raise_error(ArgumentError)
            expect{fℕ².coprime?(nil, nil)}.to raise_error(ArgumentError)
          end
        end
      end # end: {func{coprime?}}

      context 'func{friendly?}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect(fℕ².friendly?(30, 140)).to eq(true)
            expect(fℕ².friendly?(30, 2480)).to eq(true)
            expect(fℕ².friendly?(30, 6200)).to eq(true)
            expect(fℕ².friendly?(30, 40640)).to eq(true)
            expect(fℕ².friendly?(2480, 30)).to eq(true)
            expect(fℕ².friendly?(6200, 2480)).to eq(true)
            expect(fℕ².friendly?(40640, 2480)).to eq(true)
          end
          it 'cases: negative' do
            expect(fℕ².friendly?(42, 2400)).to eq(false)
          end
          context 'cases: error' do
            it 'args w/ valid type but non-abundant values' do
              expect{fℕ².friendly?(31, 139)}.to raise_error(ArgumentError)
            end
            it 'args w/ bad type' do
              expect{fℕ².friendly?(18, 30.1)}.to raise_error(ArgumentError)
              expect{fℕ².friendly?(18.2, 30)}.to raise_error(ArgumentError)
              expect{fℕ².friendly?(-18, 30)}.to raise_error(ArgumentError)
              expect{fℕ².friendly?(nil, nil)}.to raise_error(ArgumentError)
            end
          end
        end
      end # end: {func{friendly?}}

    end # end: {ℕ²}
  end

end
