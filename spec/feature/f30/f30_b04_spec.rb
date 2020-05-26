# coding: UTF-8

RSpec.describe 'f30_b04' do

  context 'feature{f34} functionality for' do
    context 'behavior{b04}' do
      it 'exists as needed' do
        expect_feature_behavior_as_needed(𝕊, ::Math::Space::SymbolicNumbersSpace)
      end

      context 'handles all needed scenarios' do

        context 'cases: positive' do

          it 'handles all cases in feature{f28}' do
            expect(𝕊.∋?('𝚽')).to eq(true)
            expect(𝕊.∋?('Ψ')).to eq(true)
            expect(𝕊.∋?('℮')).to eq(true)
            expect(𝕊.∋?('π')).to eq(true)
            expect(𝕊.∋?('∞')).to eq(true)
            expect(𝕊.∋?('δ')).to eq(true)
            expect(𝕊.∋?('ρ')).to eq(true)
            expect(𝕊.∋?('Ω')).to eq(true)
            expect(𝕊.∋?('γ')).to eq(true)
            expect(𝕊.∋?('τ')).to eq(true)
            expect(𝕊.∋?('Ⴔ')).to eq(true)
          end

        end

      end

    end
  end

end
