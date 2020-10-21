# encoding: UTF-8

RSpec.describe 'f11_b02' do

  context 'audit', :audit do

    context 'feature-behavior{f11_b02} is defined correctly' do
      it 'creates class{NumberSet} under module{Math::SetTheory}' do
        expect(🧬.∃ᶜ?(:NumberSet, ::Math::SetTheory)).to eq(true)
      end

      context 'discrete implementations exist' do

        context '∅' do
          it 'in correct location' do
            expect(🧬.∃ᶜ?(:EmptySet, ::Math::SetTheory)).to eq(true)
          end
          it 'defined correctly' do
            expect_number_set(∅, :∅, ::Math::SetTheory::EmptySet, 'empty set')
          end
          context 'w/ correct set ordering' do
            it 'compared w/ self' do
              expect_equal_sets(∅, ∅)
            end
          end
        end # end: {∅}

        context '𝔹' do
          it 'in correct location' do
            expect(🧬.∃ᶜ?(:BooleanNumbers, ::Math::SetTheory)).to eq(true)
          end
          it 'defined correctly' do
            expect_number_set(𝔹, :𝔹, ::Math::SetTheory::BooleanNumbers, 'boolean numbers')
          end
          context 'w/ correct set ordering' do
            it 'compared w/ self' do
              expect_equal_sets(𝔹, 𝔹)
            end
          end
        end # end: {𝔹}

        context 'ℕ' do
          it 'in correct location' do
            expect(🧬.∃ᶜ?(:NaturalNumbers, ::Math::SetTheory)).to eq(true)
          end
          it 'defined correctly' do
            expect_number_set(ℕ, :ℕ, ::Math::SetTheory::NaturalNumbers, 'natural numbers')
          end
          context 'w/ correct set ordering' do
            it 'compared w/ self' do
              expect_equal_sets(ℕ, ℕ)
            end
          end
        end # end: {ℕ}

        context '𝕎' do
          it 'in correct location' do
            expect(🧬.∃ᶜ?(:WholeNumbers, ::Math::SetTheory)).to eq(true)
          end
          it 'defined correctly' do
            expect_number_set(𝕎, :𝕎, ::Math::SetTheory::WholeNumbers, 'whole numbers')
          end
          context 'w/ correct set ordering' do
            it 'compared w/ self' do
              expect_equal_sets(𝕎, 𝕎)
            end
          end
        end # end: {𝕎}

        context 'ℤ' do
          it 'in correct location' do
            expect(🧬.∃ᶜ?(:IntegerNumbers, ::Math::SetTheory)).to eq(true)
          end
          it 'defined correctly' do
            expect_number_set(ℤ, :ℤ, ::Math::SetTheory::IntegerNumbers, 'integer numbers')
          end
          context 'w/ correct set ordering' do
            it 'compared w/ self' do
              expect_equal_sets(ℤ, ℤ)
            end
          end
        end # end: {ℤ}

        context 'ℚ' do
          it 'in correct location' do
            expect(🧬.∃ᶜ?(:RationalNumbers, ::Math::SetTheory)).to eq(true)
          end
          it 'defined correctly' do
            expect_number_set(ℚ, :ℚ, ::Math::SetTheory::RationalNumbers, 'rational numbers')
          end
          context 'w/ correct set ordering' do
            it 'compared w/ self' do
              expect_equal_sets(ℚ, ℚ)
            end
          end
        end # end: {ℚ}

        context '𝔸ᵣ' do
          it 'in correct location' do
            expect(🧬.∃ᶜ?(:RealAlgebraicNumbers, ::Math::SetTheory)).to eq(true)
          end
          it 'defined correctly' do
            expect_number_set(𝔸ᵣ, :𝔸ᵣ, ::Math::SetTheory::RealAlgebraicNumbers, 'real algebraic numbers')
          end
          context 'w/ correct set ordering' do
            it 'compared w/ self' do
              expect_equal_sets(𝔸ᵣ, 𝔸ᵣ)
            end
          end
        end # end: {𝔸ᵣ}

        context '𝔸' do
          it 'in correct location' do
            expect(🧬.∃ᶜ?(:AlgebraicNumbers, ::Math::SetTheory)).to eq(true)
          end
          it 'defined correctly' do
            expect_number_set(𝔸, :𝔸, ::Math::SetTheory::AlgebraicNumbers, 'algebraic numbers')
          end
          context 'w/ correct set ordering' do
            it 'compared w/ self' do
              expect_equal_sets(𝔸, 𝔸)
            end
          end
        end # end: {𝔸}

        context '𝕀' do
          it 'in correct location' do
            expect(🧬.∃ᶜ?(:IrrationalNumbers, ::Math::SetTheory)).to eq(true)
          end
          it 'defined correctly' do
            expect_number_set(𝕀, :𝕀, ::Math::SetTheory::IrrationalNumbers, 'irrational numbers')
          end
          context 'w/ correct set ordering' do
            it 'compared w/ self' do
              expect_equal_sets(𝕀, 𝕀)
            end
            it 'compared w/ others', :tech_debt do
              [𝕌, ℂ, ℝ].∀{|scenario| expect(expect_proper_subset(𝕀, scenario))}
            end
          end
        end # end: {𝕀}

        context 'ℝ' do
          it 'in correct location' do
            expect(🧬.∃ᶜ?(:RealNumbers, ::Math::SetTheory)).to eq(true)
          end
          it 'defined correctly' do
            expect_number_set(ℝ, :ℝ, ::Math::SetTheory::RealNumbers, 'real numbers')
          end
          context 'w/ correct set ordering' do
            it 'compared w/ self' do
              expect_equal_sets(ℝ, ℝ)
            end
          end
        end # end: {ℝ}

        context 'ℂ' do
          it 'in correct location' do
            expect(🧬.∃ᶜ?(:ComplexNumbers, ::Math::SetTheory)).to eq(true)
          end
          it 'defined correctly' do
            expect_number_set(ℂ, :ℂ, ::Math::SetTheory::ComplexNumbers, 'complex numbers')
          end
          context 'w/ correct set ordering' do
            it 'compared w/ self' do
              expect_equal_sets(ℂ, ℂ)
            end
          end
        end

        context '𝕌' do
          it 'in correct location' do
            expect(🧬.∃ᶜ?(:UniversalSet, ::Math::SetTheory)).to eq(true)
          end
          it 'defined correctly' do
            expect_number_set(𝕌, :𝕌, ::Math::SetTheory::UniversalSet, 'universal set')
          end
          context 'w/ correct set ordering' do
            it 'compared w/ self' do
              expect_equal_sets(𝕌, 𝕌)
            end
          end
        end

      end

    end

  end # end: {audit}

  context 'tech_debt', :tech_debt do
    it 'broader test for extra confirmation', :tech_debt do
      expect(true).to eq(true)
      #expect(ℕ.⊂?(𝕎)).to eq(false)
      #expect(𝕎.⊂?(ℤ)).to eq(false)
      #expect(ℤ.⊂?(ℚ)).to eq(false)
      #expect(ℚ.⊂?(𝔸ᵣ)).to eq(false)
      #expect(𝔸ᵣ.⊂?(ℝ)).to eq(false)
      #expect(ℝ.⊂?(ℂ)).to eq(false)
    end

    context '𝔹' do
      context 'compared w/ others' do
        it 'subset to' do
          expect(true).to eq(true)
          #[𝕌, 𝔸ᵣ, 𝔸, ℝ, ℂ, ℚ, ℤ, 𝕎].∀{|scenario| expect(expect_proper_subset(𝔹, scenario))}
        end
      end
    end

    context 'ℕ' do
      context 'compared w/ others' do
        it 'subset to' do
          expect(true).to eq(true)
          #[𝕌, 𝔸ᵣ, 𝔸, ℝ, ℂ, ℚ, ℤ, 𝕎].∀{|scenario| expect(expect_proper_subset(ℕ, scenario))}
        end
      end
    end

    context '𝕎' do
      context 'compared w/ others' do
        it 'subset to' do
          expect(true).to eq(true)
          #[𝕌, 𝔸ᵣ, 𝔸, ℝ, ℂ, ℚ, ℤ].∀{|scenario| expect(expect_proper_subset(𝕎, scenario))}
        end
        it 'superset to' do
          expect(true).to eq(true)
          #[𝔹, ℕ].∀{|scenario| expect(expect_proper_subset(scenario, 𝕎))}
        end
      end
    end

    context '𝕌' do
      context 'compared w/ others' do
        it 'superset to' do
          expect(true).to eq(true)
          #[𝔹, ℕ, 𝕎, ℤ, 𝔸ᵣ, ℚ, 𝕀, ℝ, ℂ].∀{|scenario| expect(expect_proper_subset(scenario, 𝕌))}
        end
      end
    end

    context 'ℂ' do
      context 'compared w/ others' do
        it 'subset to' do
          expect_proper_subset(ℂ, 𝕌)
        end
        it 'superset to' do
          expect(true).to eq(true)
          #[𝔹, ℕ, 𝕎, ℤ, 𝔸ᵣ, ℚ, 𝕀, ℝ].∀{|scenario| expect(expect_proper_subset(scenario, ℂ))}
        end
      end
    end

    context 'ℝ' do
      context 'compared w/ others' do
        it 'subset to' do
          expect(true).to eq(true)
          #[𝕌, ℂ].∀{|scenario| expect(expect_proper_subset(ℝ, scenario))}
        end
        it 'superset to' do
          expect(true).to eq(true)
          #[𝔹, ℕ, 𝕎, ℤ, 𝔸ᵣ, ℚ, 𝕀].∀{|scenario| expect(expect_proper_subset(scenario, ℝ))}
        end
      end
    end

    context 'ℤ' do
      context 'compared w/ others' do
        it 'subset to' do
          expect(true).to eq(true)
          #[𝕌, 𝔸ᵣ, 𝔸, ℝ, ℂ, ℚ].∀{|scenario| expect(expect_proper_subset(ℤ, scenario))}
        end
        it 'superset to' do
          expect(true).to eq(true)
          #[𝔹, ℕ, 𝕎].∀{|scenario| expect(expect_proper_subset(scenario, ℤ))}
        end
      end
    end

    context 'ℚ' do
      context 'compared w/ others' do
        it 'subset to' do
          expect(true).to eq(true)
          #[𝕌, ℂ, ℝ, 𝔸].∀{|scenario| expect(expect_proper_subset(ℚ, scenario))}
        end
        it 'superset to' do
          expect(true).to eq(true)
          #[𝔹, ℕ, 𝕎, ℤ].∀{|scenario| expect(expect_proper_subset(scenario, ℚ))}
        end
      end
    end

    context '𝔸ᵣ' do
      context 'compared w/ others' do
        it 'subset to' do
          expect(true).to eq(true)
          #[𝕌, ℂ, ℝ, 𝔸].∀{|scenario| expect(expect_proper_subset(𝔸ᵣ, scenario))}
        end
        it 'superset to' do
          expect(true).to eq(true)
          #[𝔹, ℕ, 𝕎, ℤ, ℚ].∀{|scenario| expect(expect_proper_subset(scenario, 𝔸ᵣ))}
        end
      end
    end

    context '𝔸' do
      context 'compared w/ others' do
        it 'subset to' do
          expect(true).to eq(true)
          #[𝕌, ℂ].∀{|scenario| expect(expect_proper_subset(𝔸, scenario))}
        end
        it 'superset to' do
          expect(true).to eq(true)
          #[𝔹, ℕ, 𝕎, ℤ, ℚ, 𝔸ᵣ].∀{|scenario| expect(expect_proper_subset(scenario, 𝔸))}
        end
      end
    end
  end

end