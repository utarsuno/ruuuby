# coding: UTF-8

# -------------------------------------------- ⚠️ --------------------------------------------

RSpec.describe 'f28_b07' do
  context 'functionality' do
    context 'omega constant{Ω}' do
      context 'has correct value' do
        context 'Ωe^Ω = 1' do
          it 'passes w/ Ruuuby' do
            expect((Ω * (℮ ** Ω)).to_f).to eq(1)
            expect((Ω * (ₑˆΩ)).to_f).to eq(1)
          end
        end
        it 'ln(1/Ω) = Ω' do
          #expect((logₑ(Ω^⁻¹)).≈≈(Ω)).to eq(true)
          #expect((logₑ((Ω ** -1).to_s)).≈≈(Ω)).to eq(true)
          expect≈≈((logₑ(Ω ** -1)).to_f, Ω.to_f)
          expect≈≈((logₑ(1.0 / Ω)).to_f, Ω.to_f)
        end
        context 'e^(-Ω) = Ω' do
          it 'passes w/ Ruuuby' do
            expect≈≈((℮ ** (-Ω)).to_f, Ω.to_f)
            #expect(℮ ** (-Ω)).to eq(Ω)
          end
          #it 'avoiding default precision-loss' do
            #expect≈≈(℮ ** (-Ω), Ω)
            #expect(℮ ** (-Ω)).to_not eq(Ω)
          #end
        end
      end
    end # end: {omega constant{Ω}}
  end

end

# -------------------------------------------- ⚠️ --------------------------------------------
