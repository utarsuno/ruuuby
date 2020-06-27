# encoding: UTF-8

RSpec.describe 'f06_b00' do

  context 'functionality' do

    context 'type checks for{Numerics}' do
      context 'func{num?}' do
        it 'added w/o effecting Class-instance{Integer, Float, Rational, Complex, BigDecimal}' do
          ::Math::Space::NumberSpace::ALL_NUMS.∀{|num_class| expect(num_class.num?).to eq(false)}
        end
        context 'handles needed scenarios' do
          context 'cases: positive' do
            context '𝕌' do
              it '∈𝕌' do
                data_∈𝕌_true.∀{|scenario| expect(scenario.num?(:∈𝕌)).to eq(true)}
              end
              it '∈𝕌𝕊' do
                data_∈𝕌𝕊_true.∀{|scenario| expect(scenario.num?(:∈𝕌𝕊)).to eq(true)}
              end
            end # end: {𝕌}
            context 'ℤ' do
              it '∈ℤ' do
                data_∈ℤ_true.∀{|scenario| expect(scenario.num?(:∈ℤ)).to eq(true)}
              end
              it '∈ℤ𝕊' do
                data_∈ℤ𝕊_true.∀{|scenario| expect(scenario.num?(:∈ℤ𝕊)).to eq(true)}
              end
            end # end: {ℤ}
            context '𝕎' do
              it '∈𝕎' do
                data_∈𝕎_true.∀{|scenario| expect(scenario.num?(:∈𝕎)).to eq(true)}
              end
              it '∈𝕎𝕊' do
                data_∈𝕎𝕊_true.∀{|scenario| expect(scenario.num?(:∈𝕎𝕊)).to eq(true)}
              end
            end # end: {𝕎}
            context 'ℕ' do
              it '∈ℕ' do
                data_∈ℕ_true.∀{|scenario| expect(scenario.num?(:∈ℕ)).to eq(true)}
              end
              it '∈ℕ𝕊' do
                data_∈ℕ𝕊_true.∀{|scenario| expect(scenario.num?(:∈ℕ𝕊)).to eq(true)}
              end
            end # end: {ℕ}
            it 'w/o normalization' do
              data_∈𝕌_true.∀{|scenario| expect(scenario.num?).to eq(true)}
            end
          end # end: {cases: positive}
          context 'cases: negative' do
            context 'relating to number of args passed' do
              it 'empty length passed' do
                expect{0.num?(nil)}.to raise_error(ArgumentError)
              end
              it 'too many normalizers passed' do
                expect{0.num?([:∈𝕌, :∈𝕎, :∈𝕎])}.to raise_error(ArgumentError)
              end
              it 'in-valid normalizer passed' do
                expect{0.num?(:fake_normalizer)}.to raise_error(ArgumentError)
              end
              it 'in-valid (type) normalizer passed' do
                expect{0.num?(1337)}.to raise_error(ArgumentError)
              end
            end
            context '𝕌' do
              it '∈𝕌' do
                data_∈𝕌_false.∀{|scenario| expect(scenario.num?(:∈𝕌)).to eq(false)}
              end
              it '∈𝕌𝕊' do
                data_∈𝕌𝕊_false.∀{|scenario| expect(scenario.num?(:∈𝕌𝕊)).to eq(false)}
              end
            end # end: {𝕌}
            context 'ℤ' do
              it '∈ℤ' do
                data_∈ℤ_false.∀{|scenario| expect(scenario.num?(:∈ℤ)).to eq(false)}
              end
              it '∈ℤ𝕊' do
                data_∈ℤ𝕊_false.∀{|scenario| expect(scenario.num?(:∈ℤ𝕊)).to eq(false)}
              end
            end # end: {ℤ}
            context '𝕎' do
              it '∈𝕎' do
                data_∈𝕎_false.∀{|scenario| expect(scenario.num?(:∈𝕎)).to eq(false)}
              end
              it '∈𝕎𝕊' do
                data_∈𝕎𝕊_false.∀{|scenario| expect(scenario.num?(:∈𝕎𝕊)).to eq(false)}
              end
            end # end: {𝕎}
            context 'ℕ' do
              it '∈ℕ' do
                data_∈ℕ_false.∀{|scenario| expect(scenario.num?(:∈ℕ)).to eq(false)}
              end
              it '∈ℕ𝕊' do
                data_∈ℕ𝕊_false.∀{|scenario| expect(scenario.num?(:∈ℕ𝕊)).to eq(false)}
              end
            end # end: {ℕ}
            it 'w/o normalizers' do
              [Integer, nil, '', '1337', {}, []].∀{|n| expect(n.num?).to eq(false)}
            end # end: {w/o: normalizers}
          end # end: {cases: negative}
          it 'exists in scope of new generic object' do
            expect(data_new_obj.respond_to?(:num?)).to eq(true)
            expect(data_new_obj.num?).to eq(false)
          end
        end

        context 'adds function{🛑nums❓}' do
          context 'handles needed input scenarios' do
            context 'cases: positive' do
              it 'w/o normalization' do
                expect{🛑nums❓(data_∈𝕌_true)}.to_not raise_error
              end
              context '𝕌' do
                it '∈𝕌' do
                  expect{🛑nums❓(data_∈𝕌_true, :∈𝕌)}.to_not raise_error
                end
                it '∈𝕌𝕊' do
                  expect{🛑nums❓(data_∈𝕌𝕊_true, :∈𝕌𝕊)}.to_not raise_error
                end
              end # end: {𝕌}
              context 'ℤ' do
                it '∈ℤ' do
                  expect{🛑nums❓(data_∈ℤ_true, :∈ℤ)}.to_not raise_error
                end
                it '∈ℤ𝕊' do
                  expect{🛑nums❓(data_∈ℤ𝕊_true, :∈ℤ𝕊)}.to_not raise_error
                end
              end # end: {ℤ}
              context '𝕎' do
                it '∈𝕎' do
                  expect{🛑nums❓(data_∈𝕎_true,:∈𝕎)}.to_not raise_error
                end
                it '∈𝕎𝕊' do
                  expect{🛑nums❓(data_∈𝕎𝕊_true,:∈𝕎𝕊)}.to_not raise_error
                end
              end # end: {𝕎}
              context 'ℕ' do
                it '∈ℕ' do
                  expect{🛑nums❓(data_∈ℕ_true, :∈ℕ)}.to_not raise_error
                end
                it '∈ℕ𝕊' do
                  expect{🛑nums❓(data_∈ℕ𝕊_true, :∈ℕ𝕊)}.to_not raise_error
                end
              end # end: {ℕ}
            end
            context 'cases: negative' do
              it 'w/o normalization' do
                expect{🛑nums❓([0, nil, 1])}.to raise_error(ArgumentError)
                expect{🛑nums❓(['', 0, 1])}.to raise_error(ArgumentError)
                expect{🛑nums❓([0, 1, []])}.to raise_error(ArgumentError)
              end
              context '𝕌' do
                it '∈𝕌' do
                  expect{🛑nums❓(data_∈𝕌_false, :∈𝕌)}.to raise_error(ArgumentError)
                  expect{🛑nums❓([0, data_float_nan, 1], :∈𝕌)}.to raise_error(ArgumentError)
                  expect{🛑nums❓([data_float_inf, 0, 1], :∈𝕌)}.to raise_error(ArgumentError)
                  expect{🛑nums❓([0, 1, ::Float::INFINITY_NEGATIVE], :∈𝕌)}.to raise_error(ArgumentError)
                end
                it '∈𝕌𝕊' do
                  expect{🛑nums❓(data_∈𝕌𝕊_false, :∈𝕌𝕊)}.to raise_error(ArgumentError)
                end
              end # end: {𝕌}
              context 'ℤ' do
                it '∈ℤ' do
                  expect{🛑nums❓(data_∈ℤ_false, :∈ℤ)}.to raise_error(ArgumentError)
                end
                it '∈ℤ𝕊' do
                  expect{🛑nums❓(data_∈ℤ𝕊_false, :∈ℤ𝕊)}.to raise_error(ArgumentError)
                end
              end # end: {ℤ}
              context '𝕎' do
                it '∈𝕎' do
                  expect{🛑nums❓(data_∈𝕎_false,:∈𝕎)}.to raise_error(ArgumentError)
                end
                it '∈𝕎𝕊' do
                  expect{🛑nums❓(data_∈𝕎𝕊_false,:∈𝕎𝕊)}.to raise_error(ArgumentError)
                end
              end # end: {𝕎}
              context 'ℕ' do
                it '∈ℕ' do
                  expect{🛑nums❓(data_∈ℕ_false, :∈ℕ)}.to raise_error(ArgumentError)
                end
                it '∈ℕ𝕊' do
                  expect{🛑nums❓(data_∈ℕ𝕊_false, :∈ℕ𝕊)}.to raise_error(ArgumentError)
                end
              end # end: {ℕ}
            end
          end
        end

        context 'adds function{🛑num❓}' do
          context 'handles needed input scenarios' do
            context 'cases: positive' do
              context '𝕌' do
                it '∈𝕌' do
                  data_∈𝕌_true.∀{|scenario| expect{🛑num❓('0', scenario, :∈𝕌)}.to_not raise_error}
                end
                it '∈𝕌𝕊' do
                  data_∈𝕌𝕊_true.∀{|scenario| expect{🛑num❓('0', scenario, :∈𝕌𝕊)}.to_not raise_error}
                end
              end # end: {𝕌}
              context 'ℤ' do
                it '∈ℤ' do
                  data_∈ℤ_true.∀{|scenario| expect{🛑num❓('0', scenario, :∈ℤ)}.to_not raise_error}
                end
                it '∈ℤ𝕊' do
                  data_∈ℤ𝕊_true.∀{|scenario| expect{🛑num❓('0', scenario, :∈ℤ𝕊)}.to_not raise_error}
                end
              end # end: {ℤ}
              context 'ℕ' do
                it '∈ℕ' do
                  data_∈ℕ_true.∀{|scenario| expect{🛑num❓('0', scenario, :∈ℕ)}.to_not raise_error}
                end
                it '∈ℕ𝕊' do
                  data_∈ℕ𝕊_true.∀{|scenario| expect{🛑num❓('0', scenario, :∈ℕ𝕊)}.to_not raise_error}
                end
              end # end: {ℕ}
              context '𝕎' do
                it '∈𝕎' do
                  data_∈𝕎_true.∀{|scenario| expect{🛑num❓('0', scenario,:∈𝕎)}.to_not raise_error}
                end
                it '∈𝕎𝕊' do
                  data_∈𝕎𝕊_true.∀{|scenario| expect{🛑num❓('0', scenario,:∈𝕎𝕊)}.to_not raise_error}
                end
              end # end: {𝕎}
              context 'w/o normalizers' do
                it 'handles numericals' do
                  expect{🛑num❓('0', 0)}.to_not raise_error
                  expect{🛑num❓('0', 1.337)}.to_not raise_error
                  expect{🛑num❓('0', Rational(3, 5))}.to_not raise_error
                  expect{🛑num❓('0', Complex(2, 3))}.to_not raise_error
                  expect{🛑num❓('0', BigDecimal('1.337'))}.to_not raise_error
                end
                it 'handles strings representing numericals' do
                  expect{🛑num❓('0', '0', :∈𝕌𝕊)}.to_not raise_error
                  expect{🛑num❓('0', '-1.337', :∈𝕌𝕊)}.to_not raise_error
                end
              end
            end
            context 'cases: negative' do
              context '𝕌' do
                it '∈𝕌' do
                  data_∈𝕌_false.∀{|scenario| expect{🛑num❓('0', scenario, :∈𝕌)}.to raise_error(ArgumentError)}
                end
                it '∈𝕌𝕊' do
                  data_∈𝕌𝕊_false.∀{|scenario| expect{🛑num❓('0', scenario, :∈𝕌𝕊)}.to raise_error(ArgumentError)}
                end
              end # end: {𝕌}
              context 'ℤ' do
                it '∈ℤ' do
                  data_∈ℤ_false.∀{|scenario| expect{🛑num❓('0', scenario, :∈ℤ)}.to raise_error(ArgumentError)}
                end
                it '∈ℤ𝕊' do
                  data_∈ℤ𝕊_false.∀{|scenario| expect{🛑num❓('0', scenario, :∈ℤ𝕊)}.to raise_error(ArgumentError)}
                end
              end # end: {ℤ}
              context 'ℕ' do
                it '∈ℕ' do
                  data_∈ℕ_false.∀{|scenario| expect{🛑num❓('0', scenario, :∈ℕ)}.to raise_error(ArgumentError)}
                end
                it '∈ℕ𝕊' do
                  data_∈ℕ𝕊_false.∀{|scenario| expect{🛑num❓('0', scenario, :∈ℕ𝕊)}.to raise_error(ArgumentError)}
                end
              end # end: {ℕ}
              context '𝕎' do
                it '∈𝕎' do
                  data_∈𝕎_false.∀{|scenario| expect{🛑num❓('0', scenario,:∈𝕎)}.to raise_error(ArgumentError)}
                end
                it '∈𝕎𝕊' do
                  data_∈𝕎𝕊_false.∀{|scenario| expect{🛑num❓('0', scenario,:∈𝕎𝕊)}.to raise_error(ArgumentError)}
                end
              end # end: {𝕎}
              context 'w/o normalizers' do
                it 'non-numerical data' do
                  expect{🛑num❓('0', nil)}.to raise_error(ArgumentError)
                  expect{🛑num❓('0', [])}.to raise_error(ArgumentError)
                  expect{🛑num❓('0', '')}.to raise_error(ArgumentError)
                end
              end
            end
          end
        end # end: {adds function{🛑num❓}}
      end # end: {func{num?}}
    end # end: {type checks for{Numerics}}
  end # end: {functionality}

  context 'audit', :audit do
    context 'feature{f06}:behavior{b00} passes audits' do
      it 'module is defined in correct location' do
        expect_∃ᵐ(:ObjectF06, ::Ruuuby::Feature::Includable)
      end
      context 'funcs provided are defined in correct location' do
        it 'for m{ObjectF06}' do
          expect_∃⨍(:🛑num❓, ::Ruuuby::Feature::Includable::ObjectF06)
          expect_∃⨍(:🛑nums❓, ::Ruuuby::Feature::Includable::ObjectF06)
        end
      end
    end
  end # end: {audit}

  #  __   ___  __   ___  __   __                   __   ___
  # |__) |__  |__) |__  /  \ |__)  |\/|  /\  |\ | /  ` |__
  # |    |___ |  \ |    \__/ |  \  |  | /~~\ | \| \__, |___
  context 'performance', :performance do
    context 'func{num?}' do
      context 'handles needed scenarios very quickly' do
        it 'for cases: positive' do
          expect{1.num?}.to perform_very_quickly
          expect{1.0.num?}.to perform_very_quickly
          expect{data_rational_one.num?}.to perform_very_quickly
          expect{data_complex_one.num?}.to perform_very_quickly
          expect{data_big_decimal_one.num?}.to perform_very_quickly
        end
        it 'for cases: negative' do
          expect{'0'.num?}.to perform_very_quickly
          expect{nil.num?}.to perform_very_quickly
          expect{::Integer.num?}.to perform_very_quickly
        end
      end
    end # end: {func{num?}}
  end # end: {performance}

end
