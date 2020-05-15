# encoding: UTF-8

RSpec.describe 'f06' do

  context 'functionality' do
    context 'type checks for{Numerics}' do
      context 'func{num?}' do
        it 'added w/o effecting Class-instance{Integer, Float, Rational, Complex, BigDecimal}' do
          ::Ruuuby::VirtualTypes::NUMS.∀{|num_class| expect(num_class.num?).to eq(false)}
        end
        context 'handles needed scenarios' do
          context 'cases: positive' do
            context '𝕌' do
              it 'w/ normalization{∈𝕌}' do
                [0, 0.0, -1, -1.0, 1, 1.0, Rational(3, 5), Complex(2, 3), BigDecimal('1.337')].∀ do |scenario|
                  expect(scenario.num?(:∈𝕌)).to eq(true)
                end
              end
              it 'w/ normalization{∈𝕌𝕊}' do
                ['0', 0, '0.0', 0.0, '-1', -1, '-1.0', -1.0, '1', 1, '1.0', BigDecimal('1.337'), '1.337'].∀ do |scenario|
                  expect(scenario.num?(:∈𝕌𝕊)).to eq(true)
                end
                %w(0 0.0 -1 -1.0 1 1.0).∀{|scenario| expect(scenario.num?(:∈𝕌𝕊)).to eq(true)}
              end
            end # end: {𝕌}
            context 'ℕ' do
              it 'w/ normalization{∈ℕ}' do
                [1, 1.0, 1337, 1337.0, Rational(1337), Complex(1337), BigDecimal('1337.0')].∀ do |scenario|
                  expect(scenario.num?(:∈ℕ)).to eq(true)
                end
              end
              it 'w/ normalization{∈ℕ𝕊}' do
                ['1', 1, '1.0', 1.0, '1337', 1337, '1337.0', 1337.0, Rational(1337), Complex(1337), BigDecimal('1337.0')].∀ do |scenario|
                  expect(scenario.num?(:∈ℕ𝕊)).to eq(true)
                end
              end
            end # end: {ℕ}
            context '𝕎' do
              it 'w/ normalization{∈𝕎}' do
                [0, 0.0, 1, 1.0, Rational(1337), Complex(1337), BigDecimal('1337.0')].∀ do |scenario|
                  expect(scenario.num?(:∈𝕎)).to eq(true)
                end
              end
              it 'w/ normalization{∈𝕎𝕊}' do
                ['0', 0, '0.0', 0.0, '1', 1, '1.0', 1.0, Rational(1337), Complex(1337), BigDecimal('1337.0')].∀ do |scenario|
                  expect(scenario.num?(:∈𝕎𝕊)).to eq(true)
                end
              end
            end # end: {𝕎}
            context 'ℤ' do
              it 'w/ normalization{∈ℤ}' do
                [0, 0.0, -1, -1.0, 1, 1.0, Rational(1337), Complex(1337), BigDecimal('1337.0')].∀ do |scenario|
                  expect(scenario.num?(:∈ℤ)).to eq(true)
                end
              end
              it 'w/ normalization{∈ℤ𝕊}' do
                ['0', 0, '0.0', 0.0, '-1', -1, '-1.0', -1.0, '1', 1, '1.0', 1.0, Rational(1337), Complex(1337), BigDecimal('1337.0')].∀ do |scenario|
                  expect(scenario.num?(:∈ℤ𝕊)).to eq(true)
                end
              end
            end # end: {ℤ}
            it 'w/o normalization' do
              [0, 0.0, -1, -1.0, 1, 1.0, Rational(3, 5), Complex(2, 3), BigDecimal('1.337')].∀ do |scenario|
                expect(scenario.num?).to eq(true)
              end
            end
          end # end: {cases: positive}
          context 'cases: negative' do
            context 'w/ normalization{∈𝕌}' do
              it 'for numerics' do
                expect(::Float::INFINITY.num?(:∈𝕌)).to eq(false)
                expect(::Float::INFINITY_NEGATIVE.num?(:∈𝕌)).to eq(false)
                expect(::Float::NAN.num?(:∈𝕌)).to eq(false)
              end
              context 'w/ many normalizers' do
                it 'empty length passed' do
                  expect{0.num?([])}.to raise_error(ArgumentError)
                end
                it 'too many normalizers passed' do
                  expect{0.num?([:∈𝕌, :∈𝕎, :∈𝕎])}.to raise_error(ArgumentError)
                end
                it 'in-valid normalizer passed' do
                  expect{0.num?([:fake_normalizer])}.to raise_error(ArgumentError)
                end
                it 'in-valid (type) normalizer passed' do
                  expect{0.num?([1337])}.to raise_error(ArgumentError)
                end
                it ':∈𝕌𝕊' do
                  expect('∞'.num?(:∈𝕌𝕊)).to eq(false)
                end
              end
            end # end: {w/ normalization{∈𝕌}}
            context 'w/o normalizers' do
              it 'for numerics' do
                [Integer, nil, '', '1337', {}, []].∀{|n| expect(n.num?).to eq(false)}
              end
            end
          end # end: {cases: negative}
          it 'exists in scope of new generic object' do
            expect(data_new_obj.respond_to?(:num?)).to eq(true)
            expect(data_new_obj.num?).to eq(false)
          end
        end

        context 'adds function{🛑num❓}' do
          context 'handles needed input scenarios' do
            context 'cases: positive' do
              context 'w/ single param' do
                it 'handles numericals' do
                  expect{🛑num❓('0', 0)}.to_not raise_error
                  expect{🛑num❓('0', 1.337)}.to_not raise_error
                  expect{🛑num❓('0', Rational(3, 5))}.to_not raise_error
                  expect{🛑num❓('0', Complex(2, 3))}.to_not raise_error
                  expect{🛑num❓('0', BigDecimal('1.337'))}.to_not raise_error
                end
                it 'handles strings representing numericals' do
                  #expect{🛑num❓('0', '0', )}.to_not raise_error
                  #expect{🛑num❓('0', '-1.337')}.to_not raise_error
                end
              end
              context 'w/ many params' do
                it 'handles numericals' do
                  expect{🛑num❓($PRM_MANY, [0, 3, 3.0, Rational(3, 1), Complex(3, 0), BigDecimal('3.0')])}.to_not raise_error
                end
                it 'handles strings representing numericals' do
                  expect{🛑num❓($PRM_MANY, [-1, 0, 1, 2])}.to_not raise_error
                end
              end
            end
            context 'cases: negative' do
              context 'w/ single param' do
                it 'handles numericals not falling within 𝕌' do
                  expect{🛑num❓('0', data_float_nan, :∈𝕌)}.to raise_error(ArgumentError)
                  expect{🛑num❓('0', data_float_inf, :∈𝕌)}.to raise_error(ArgumentError)
                  expect{🛑num❓('0', data_float_negative_inf, :∈𝕌)}.to raise_error(ArgumentError)
                end
                it 'handles non-numericals' do
                  expect{🛑num❓('0', nil)}.to raise_error(ArgumentError)
                  expect{🛑num❓('0', [])}.to raise_error(ArgumentError)
                  expect{🛑num❓('0', '')}.to raise_error(ArgumentError)
                end
              end
              context 'w/ many params' do
                it 'handles numericals not falling within 𝕌' do
                  expect{🛑num❓($PRM_MANY, [0, data_float_nan, 1], :∈𝕌)}.to raise_error(ArgumentError)
                  expect{🛑num❓($PRM_MANY, [data_float_inf, 0, 1], :∈𝕌)}.to raise_error(ArgumentError)
                  expect{🛑num❓($PRM_MANY, [0, 1, data_float_negative_inf], :∈𝕌)}.to raise_error(ArgumentError)
                end
                it 'handles non-numerical types' do
                  expect{🛑num❓($PRM_MANY, [0, nil, 1])}.to raise_error(ArgumentError)
                  expect{🛑num❓($PRM_MANY, ['', 0, 1])}.to raise_error(ArgumentError)
                  expect{🛑num❓($PRM_MANY, [0, 1, []])}.to raise_error(ArgumentError)
                end
              end
            end
          end
        end # end: {adds function{🛑num❓}}
      end # end: {func{num?}}
    end # end: {type checks for{Numerics}}
  end # end: {functionality}

  context 'audits', :audits do
    context 'feature{f06}:behavior{b00} passes audits' do
      it 'module is defined in correct location' do
        expect_∃module(:ObjectF06, ::Ruuuby::Feature::Includable)
      end
      context 'funcs provided are defined in correct location' do
        it 'for m{ObjectF06}' do
          expect_∃⨍(:🛑num❓, ::Ruuuby::Feature::Includable::ObjectF06)
        end
      end
    end
  end # end: {audits}

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
