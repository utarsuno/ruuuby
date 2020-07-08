# encoding: UTF-8

RSpec.describe 'f06_b04' do

  context 'functionality' do

    context 'by adding function{flt?}' do
      context 'handling needed scenarios' do
        context 'cases: positive' do
          it 'w/ normalization{∈𝕌}' do
            data_range_floats_boolean.∀{|n| expect(n.flt?(:∈𝕌)).to eq(true)}
          end
          it 'w/o normalization' do
            data_range_floats_boolean.∀{|n| expect(n.flt?).to eq(true)}
            expect(::Float::INFINITY.flt?).to eq(true)
            expect(::Float::INFINITY_NEGATIVE.flt?).to eq(true)
          end
        end
        context 'cases: negative' do
          it 'w/o effecting Class-instance{Float}' do
            expect(::Float.flt?).to eq(false)
            expect(::Float.flt?(:∈𝕌)).to eq(false)
          end
          context 'data-based' do
            it 'w/ normalization{∈𝕌}' do
              [nil, '', '1337', {}, [], 1337, BigDecimal('1337'), Rational(1337), Complex(1337)].∀{|n| expect(n.flt?(:∈𝕌)).to eq(false)}
              expect(::Float::INFINITY.flt?(:∈𝕌)).to eq(false)
              expect(::Float::INFINITY_NEGATIVE.flt?(:∈𝕌)).to eq(false)
              expect(::Float::INFINITY_COMPLEX.flt?(:∈𝕌)).to eq(false)
            end
            it 'w/o normalization' do
              [nil, '', '1337', {}, [], 1337, BigDecimal('1337'), Rational(1337), Complex(1337)].∀{|n| expect(n.flt?).to eq(false)}
            end
          end
        end
      end
    end

    context 'by adding function{🛑flt❓}' do
      context 'handles needed input scenarios' do
        context 'cases: positive' do
          it 'w/ normalization{∈𝕌}' do
            expect{🛑flt❓(:arg, 1337.1337, :∈𝕌)}.to_not raise_error
            expect{🛑flt❓(:arg, -0.0, :∈𝕌)}.to_not raise_error
            expect{🛑flt❓(:arg, -1337.1337, :∈𝕌)}.to_not raise_error
          end
          it 'w/o extra normalization' do
            expect{🛑flt❓(:arg, 1337.1337)}.to_not raise_error
            expect{🛑flt❓(:arg, 0.0)}.to_not raise_error
            expect{🛑flt❓(:arg, -1337.1337)}.to_not raise_error
          end
        end
        context 'cases: negative' do
          context 'w/ bad normalizer' do
            it 'w/ single param' do
              expect{🛑flt❓(:arg, '', nil)}.to raise_error(ArgumentError)
            end
          end
          context 'w/ normalization{∈𝕌}' do
            it 'w/ single param' do
              expect{🛑flt❓(:arg, ::Float::INFINITY, :∈𝕌)}.to raise_error(ArgumentError)
              expect{🛑flt❓(:arg, ::Float::INFINITY_NEGATIVE, :∈𝕌)}.to raise_error(ArgumentError)
              expect{🛑flt❓(:arg, ::Float::INFINITY_COMPLEX, :∈𝕌)}.to raise_error(ArgumentError)
            end
          end
          context 'w/o extra normalization' do
            it 'w/ single param' do
              expect{🛑flt❓(:arg, nil)}.to raise_error(ArgumentError)
            end
          end
        end
      end
    end

  end # end: {functionality}

  context 'audit', :audit do
    context 'feature{f06}:behavior{b04} passes audits' do
      context 'funcs provided are defined in correct location' do
        it 'for m{ObjectF06}' do
          expect_∃⨍(:🛑flt❓, ::Ruuuby::Feature::Includable::ObjectF06)
        end
      end
    end
  end # end: {audit}

  #  __   ___  __   ___  __   __                   __   ___
  # |__) |__  |__) |__  /  \ |__)  |\/|  /\  |\ | /  ` |__
  # |    |___ |  \ |    \__/ |  \  |  | /~~\ | \| \__, |___
  context 'performance', :performance do

    context 'func{flt?}: performs extremely quickly' do
      context 'for needed scenarios' do
        context 'cases: positive' do
          it 'w/o normalizer' do
            expect{1337.0.flt?}.to perform_extremely_quickly
            expect{::Float::INFINITY.flt?}.to perform_extremely_quickly
            expect{::Float::INFINITY_NEGATIVE.flt?}.to perform_extremely_quickly
          end
          it 'w/ normalizer{∈𝕌}' do
            expect{1337.0.flt?(:∈𝕌)}.to perform_extremely_quickly
          end
        end
        context 'cases: negative' do
          it 'w/o normalizer' do
            expect{'0'.flt?}.to perform_extremely_quickly
            expect{::Float::INFINITY.flt?}.to perform_extremely_quickly
            expect{::Float::INFINITY_NEGATIVE.flt?}.to perform_extremely_quickly
          end
          it 'w/ normalizer{∈𝕌}' do
            expect{'0'.flt?(:∈𝕌)}.to perform_extremely_quickly
            expect{::Float::INFINITY.flt?(:∈𝕌)}.to perform_extremely_quickly
            expect{::Float::INFINITY_NEGATIVE.flt?(:∈𝕌)}.to perform_extremely_quickly
          end
        end
      end
    end

    context 'func{🛑flt❓}: performs extremely quickly' do
      context 'cases: positive' do
        it 'w/o normalizer' do
          expect{🛑flt❓(:arg, 1337.1337)}.to perform_extremely_quickly
          expect{🛑flt❓(:arg, ::Float::INFINITY)}.to perform_extremely_quickly
          expect{🛑flt❓(:arg, ::Float::INFINITY_NEGATIVE)}.to perform_extremely_quickly
        end
        it 'w/ normalizer' do
          expect{🛑flt❓(:arg, 1337.1337, :∈𝕌)}.to perform_extremely_quickly
        end
      end
    end
  end # end: {performance}

end
