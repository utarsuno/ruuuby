# coding: UTF-8

RSpec.describe 'f32_b01' do

  context 'feature{f32} behavior{b01} functionality' do
    let(:fℕ¹){::Math::NumberTheory::ℕ¹}
    let(:num_samples_deficient){[1, 2, 3, 4, 5, 7, 8, 9, 10, 11, 13, 14, 15, 16, 17, 19, 21, 22, 23, 25, 26, 27, 29, 31, 32, 33, 34, 35, 37, 38, 39, 41, 43, 44, 45, 46, 47, 49, 50]}
    let(:num_samples_non_deficient){[6, 12, 18, 20, 24, 28, 30, 36, 42]}
    let(:num_samples_abundant){[12, 18, 20, 24, 30, 36, 40, 42, 48]}
    let(:num_samples_non_abundant){[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 13, 14, 15, 16, 17, 19, 21, 22, 23, 25, 26, 27, 28, 29, 31, 32, 33, 34, 35, 37, 38, 39, 41, 43, 44, 45, 46, 47, 49, 50]}

    context 'ℕ¹' do

      context 'func{prime_factors}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect(fℕ¹.prime_factors(100)).to eq([[2, 2], [5, 2]])
            expect(fℕ¹.prime_factors(76)).to eq([[2, 2], [19, 1]])
            expect(fℕ¹.prime_factors(50)).to eq([[2, 1], [5, 2]])
            expect(fℕ¹.prime_factors(48)).to eq([[2, 4], [3, 1]])
            expect(fℕ¹.prime_factors(36)).to eq([[2, 2], [3, 2]])
            expect(fℕ¹.prime_factors(20)).to eq([[2, 2], [5, 1]])
            expect(fℕ¹.prime_factors(10)).to eq([[2, 1], [5, 1]])
          end
          it 'cases: error' do
            fℕ¹_error_scenarios.∀{|scenario| expect{fℕ¹.prime_factors(scenario)}.to raise_error(ArgumentError)}
          end
        end
      end # end: {func{get_prime_factors}}

      context 'func{divisors}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect(fℕ¹.divisors(64)).to eq([1, 2, 4, 8, 16, 32, 64])
            expect(fℕ¹.divisors(53)).to eq([1, 53])
            expect(fℕ¹.divisors(45)).to eq([1, 3, 5, 9, 15, 45])
            expect(fℕ¹.divisors(10)).to eq([1, 2, 5, 10])
            expect(fℕ¹.divisors(4)).to eq([1, 2, 4])
            expect(fℕ¹.divisors(3)).to eq([1, 3])
            expect(fℕ¹.divisors(2)).to eq([1, 2])
            expect(fℕ¹.divisors(1)).to eq([1])
          end
          it 'cases: error' do
            fℕ¹_error_scenarios.∀{|scenario| expect{fℕ¹.divisors(scenario)}.to raise_error(ArgumentError)}
          end
        end
      end # end: {func{divisors}}

      context 'func{proper_divisors}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect(fℕ¹.proper_divisors(64)).to eq([1, 2, 4, 8, 16, 32])
            expect(fℕ¹.proper_divisors(53)).to eq([1])
            expect(fℕ¹.proper_divisors(45)).to eq([1, 3, 5, 9, 15])
            expect(fℕ¹.proper_divisors(10)).to eq([1, 2, 5])
            expect(fℕ¹.proper_divisors(4)).to eq([1, 2])
            expect(fℕ¹.proper_divisors(3)).to eq([1])
            expect(fℕ¹.proper_divisors(2)).to eq([1])
            expect(fℕ¹.proper_divisors(1)).to eq([])
          end
          it 'cases: error' do
            fℕ¹_error_scenarios.∀{|scenario| expect{fℕ¹.proper_divisors(scenario)}.to raise_error(ArgumentError)}
          end
        end
      end # end: {func{proper_divisors}}

      context 'func{deficient?}' do
        context 'handles needed scenarios (samples, there are inf scenarios)' do
          it 'cases: positive' do
            num_samples_deficient.∀{|n| expect(fℕ¹.deficient?(n)).to eq(true)}
          end
          it 'cases: negative' do
            num_samples_non_deficient.∀{|n| expect(fℕ¹.deficient?(n)).to eq(false)}
          end
        end
      end # end: {func{deficient?}}

      context 'func{deficiency}' do
        context 'handles needed scenarios (samples, there are inf scenarios)' do
          it 'cases: positive' do
            num_samples_deficient.∀{|n| expect(fℕ¹.deficiency(n)).to eq(n - fℕ¹.aliquot_sum(n))}
          end
          context 'cases: error' do
            it 'non-deficient numbers' do
              num_samples_non_deficient.∀{|scenario| expect{fℕ¹.deficiency(scenario)}.to raise_error(ArgumentError)}
            end
            it 'bad args' do
              fℕ¹_error_scenarios.∀{|scenario| expect{fℕ¹.deficiency(scenario)}.to raise_error(ArgumentError)}
            end
          end
        end
      end # end: {func{deficiency}}

      context 'func{abundant?}' do
        context 'handles needed scenarios (samples, there are inf scenarios)' do
          it 'cases: positive' do
            num_samples_abundant.∀{|n| expect(fℕ¹.abundant?(n)).to eq(true)}
          end
          it 'cases: negative' do
            num_samples_non_abundant.∀{|n| expect(fℕ¹.abundant?(n)).to eq(false)}
          end
        end
      end # end: {func{abundant?}}

      context 'func{abundance}' do
        context 'handles needed scenarios (samples, there are inf scenarios)' do
          it 'cases: positive' do
            num_samples_abundant.∀{|n| expect(fℕ¹.abundance(n)).to eq(fℕ¹.aliquot_sum(n) - n)}
          end
          context 'cases: error' do
            it 'non-abundant numbers' do
              num_samples_non_abundant.∀{|scenario| expect{fℕ¹.abundance(scenario)}.to raise_error(ArgumentError)}
            end
            it 'bad args' do
              fℕ¹_error_scenarios.∀{|scenario| expect{fℕ¹.abundance(scenario)}.to raise_error(ArgumentError)}
            end
          end
        end
      end # end: {func{abundance}}

      context 'func{abundancy_index}' do
        context 'handles needed scenarios (samples, there are inf scenarios)' do
          it 'cases: positive' do
            num_samples_abundant.∀{|n| expect(fℕ¹.abundancy_index(n)).to eq(Rational(fℕ¹.aliquot_sum(n), n))}
          end
          context 'cases: error' do
            it 'non-abundant numbers' do
              num_samples_non_abundant.∀{|scenario| expect{fℕ¹.abundancy_index(scenario)}.to raise_error(ArgumentError)}
            end
            it 'bad args' do
              fℕ¹_error_scenarios.∀{|scenario| expect{fℕ¹.abundancy_index(scenario)}.to raise_error(ArgumentError)}
            end
          end
        end
      end # end: {func{abundancy_index}}

      context 'func{composite?}' do
        context 'handles needed scenarios (samples, there are inf scenarios)' do
          it 'cases: positive' do
            [4, 6, 8, 9, 10, 12, 14, 15, 16, 18, 20, 21, 22, 24, 25, 26, 27, 28, 30].∀{|n| expect(fℕ¹.composite?(n)).to eq(true)}
          end
          it 'cases: false' do
            [2, 3, 5, 7, 11, 17, 19, 23, 29].∀{|scenario| expect(fℕ¹.composite?(scenario)).to eq(false)}
          end
          it 'cases: error' do
            fℕ¹_error_scenarios.∀{|scenario| expect{fℕ¹.composite?(scenario)}.to raise_error(ArgumentError)}
          end
        end
      end # end: {func{composite?}}

      context 'func{aliquot_sum}' do
        context 'handles needed scenarios (samples, there are inf scenarios)' do
          context 'cases: positive' do
            it 'early values equal to {1}' do
              expect(fℕ¹.aliquot_sum(2)).to eq(1)
              expect(fℕ¹.aliquot_sum(3)).to eq(1)
              expect(fℕ¹.aliquot_sum(5)).to eq(1)
              expect(fℕ¹.aliquot_sum(7)).to eq(1)
              expect(fℕ¹.aliquot_sum(11)).to eq(1)
              expect(fℕ¹.aliquot_sum(13)).to eq(1)
              expect(fℕ¹.aliquot_sum(17)).to eq(1)
              expect(fℕ¹.aliquot_sum(19)).to eq(1)
              expect(fℕ¹.aliquot_sum(23)).to eq(1)
              expect(fℕ¹.aliquot_sum(29)).to eq(1)
              expect(fℕ¹.aliquot_sum(31)).to eq(1)
              expect(fℕ¹.aliquot_sum(37)).to eq(1)
              expect(fℕ¹.aliquot_sum(41)).to eq(1)
              expect(fℕ¹.aliquot_sum(43)).to eq(1)
              expect(fℕ¹.aliquot_sum(47)).to eq(1)
            end
            it 'early values less than {10}' do
              expect(fℕ¹.aliquot_sum(1)).to eq(0)
              expect(fℕ¹.aliquot_sum(4)).to eq(3)
              expect(fℕ¹.aliquot_sum(6)).to eq(6)
              expect(fℕ¹.aliquot_sum(8)).to eq(7)
              expect(fℕ¹.aliquot_sum(9)).to eq(4)
              expect(fℕ¹.aliquot_sum(10)).to eq(8)
              expect(fℕ¹.aliquot_sum(15)).to eq(9)
              expect(fℕ¹.aliquot_sum(25)).to eq(6)
              expect(fℕ¹.aliquot_sum(49)).to eq(8)
            end
            it 'the remaining input scenarios up to {50}' do
              expect(fℕ¹.aliquot_sum(12)).to eq(16)
              expect(fℕ¹.aliquot_sum(14)).to eq(10)
              expect(fℕ¹.aliquot_sum(16)).to eq(15)
              expect(fℕ¹.aliquot_sum(18)).to eq(21)
              expect(fℕ¹.aliquot_sum(20)).to eq(22)
              expect(fℕ¹.aliquot_sum(21)).to eq(11)
              expect(fℕ¹.aliquot_sum(22)).to eq(14)
              expect(fℕ¹.aliquot_sum(24)).to eq(36)
              expect(fℕ¹.aliquot_sum(26)).to eq(16)
              expect(fℕ¹.aliquot_sum(27)).to eq(13)
              expect(fℕ¹.aliquot_sum(28)).to eq(28)
              expect(fℕ¹.aliquot_sum(30)).to eq(42)
              expect(fℕ¹.aliquot_sum(32)).to eq(31)
              expect(fℕ¹.aliquot_sum(33)).to eq(15)
              expect(fℕ¹.aliquot_sum(34)).to eq(20)
              expect(fℕ¹.aliquot_sum(35)).to eq(13)
              expect(fℕ¹.aliquot_sum(36)).to eq(55)
              expect(fℕ¹.aliquot_sum(38)).to eq(22)
              expect(fℕ¹.aliquot_sum(39)).to eq(17)
              expect(fℕ¹.aliquot_sum(40)).to eq(50)
              expect(fℕ¹.aliquot_sum(42)).to eq(54)
              expect(fℕ¹.aliquot_sum(44)).to eq(40)
              expect(fℕ¹.aliquot_sum(45)).to eq(33)
              expect(fℕ¹.aliquot_sum(46)).to eq(26)
              expect(fℕ¹.aliquot_sum(48)).to eq(76)
              expect(fℕ¹.aliquot_sum(50)).to eq(43)
            end
          end
          it 'cases: error' do
            fℕ¹_error_scenarios.∀{|scenario| expect{fℕ¹.aliquot_sum(scenario)}.to raise_error(ArgumentError)}
          end
        end
      end # end: {func{aliquot_sum}}

      context 'func{almost_perfect?}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect(fℕ¹.almost_perfect?(1)).to eq(true)
            expect(fℕ¹.almost_perfect?(2)).to eq(true)
            expect(fℕ¹.almost_perfect?(4)).to eq(true)
            expect(fℕ¹.almost_perfect?(8)).to eq(true)
            expect(fℕ¹.almost_perfect?(16)).to eq(true)
          end
          it 'cases: negative' do
            expect(fℕ¹.almost_perfect?(3)).to eq(false)
            expect(fℕ¹.almost_perfect?(5)).to eq(false)
            expect(fℕ¹.almost_perfect?(6)).to eq(false)
            expect(fℕ¹.almost_perfect?(7)).to eq(false)
            expect(fℕ¹.almost_perfect?(9)).to eq(false)
            expect(fℕ¹.almost_perfect?(10)).to eq(false)
            expect(fℕ¹.almost_perfect?(11)).to eq(false)
          end
          it 'cases: error' do
            fℕ¹_error_scenarios.∀{|scenario| expect{fℕ¹.almost_perfect?(scenario)}.to raise_error(ArgumentError)}
          end
        end
      end # end: {func{almost_perfect?}}

      context 'func{perfect?}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect(fℕ¹.perfect?(6)).to eq(true)
            expect(fℕ¹.perfect?(28)).to eq(true)
            expect(fℕ¹.perfect?(496)).to eq(true)
            expect(fℕ¹.perfect?(8128)).to eq(true)
            expect(fℕ¹.perfect?(33550336)).to eq(true)
          end
          it 'cases: negative' do
            expect(fℕ¹.perfect?(2)).to eq(false)
            expect(fℕ¹.perfect?(3)).to eq(false)
            expect(fℕ¹.perfect?(4)).to eq(false)
            expect(fℕ¹.perfect?(5)).to eq(false)
            expect(fℕ¹.perfect?(7)).to eq(false)
            expect(fℕ¹.perfect?(8)).to eq(false)
            expect(fℕ¹.perfect?(9)).to eq(false)
          end
          it 'cases: error' do
            fℕ¹_error_scenarios.∀{|scenario| expect{fℕ¹.perfect?(scenario)}.to raise_error(ArgumentError)}
          end
        end
      end # end: {func{perfect?}}

    end # end: {ℕ¹}

  end

end
