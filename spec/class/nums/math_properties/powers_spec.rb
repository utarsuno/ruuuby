
RSpec.describe 'math-operations: raise to subscript powers' do

  context 'preserves: properties-of-exponents' do
    it 'xᵃ⋅xᵇ = xᵃ⁺ᵇ' do
      expect((3^²) * (3^³)).to eq(3^⁵)
    end
    it 'xᵃ/xᵇ = xᵃ⁻ᵇ' do
      expect((3^⁴) / (3^¹)).to eq(3^³)
    end
    it '(xᵃ)ᵇ = xᵃᵇ' do
      expect((3^²)^⁴).to eq(3^⁸)
    end
    it '(x⋅y)ᵃ = xᵃ⋅xᵇ' do
      expect((3*6)^⁴).to eq((3^⁴) * (6^⁴))
      expect((3*6)^⁴).to eq(3 ** 4 * 6 ** 4)
      expect((3*6)^⁴).to eq((3 ** 4) * (6 ** 4))
    end
    it '(x/y)ᵃ = xᵃ/yᵃ' do
      expect((3/4)^⁴).to eq((3^⁴) / (4^⁴))
      expect((3/4)^⁴).to eq(3 ** 4 / 4 ** 4)
      expect((3/4)^⁴).to eq((3 ** 4) / (4 ** 4))
    end
  end

  context 'handles raising to +∞, -∞, and ∞ℂ' do

    context 'for integers' do
      it 'handles vals > 1' do
        expect(2^(:∞)).to eq(∞)
        expect(2^(:'-∞')).to eq(0)
        expect((2^(:∞ℂ)).¿?).to eq(true)
      end
      it 'handles val 1' do
        expect((1^(:∞)).¿?).to eq(true)
        expect((1^(:'-∞')).¿?).to eq(true)
        expect((1^(:∞ℂ)).¿?).to eq(true)
      end
      it 'handles val 0' do
        expect(0^(:∞)).to eq(0)
        expect(0^(:'-∞')).to eq(::Float::INFINITY_COMPLEX)
        expect(0^(:∞ℂ)).to eq(0)
      end
      it 'handles val -1' do
        expect((-1^(:∞)).¿?).to eq(true)
        expect((-1^(:'-∞')).¿?).to eq(true)
        expect((-1^(:∞ℂ)).¿?).to eq(true)
      end
      it 'handles val < 1' do
        expect(-2^(:∞)).to eq(data_float_negative_inf)
        expect(-2^(:'-∞')).to eq(0)
        expect((-2^(:∞ℂ)).¿?).to eq(true)
      end

      context 'handles bad args' do
        it 'invalid symbols' do
          expect{2^(:∞∞∞)}.to raise_error(RuntimeError)
          expect{0^(9.9)}.to raise_error(RuntimeError)
          expect{0^(nil)}.to raise_error(RuntimeError)
        end
        it 'un-supported dynamic evaluation' do
          expect{0^⁻⁹⁹}.to raise_error(NameError)
          expect{0^⁻}.to raise_error(NameError)
        end
      end
    end

    context 'for floats' do

      it 'handles vals > 1' do
        expect(2.0^(:∞)).to eq(∞)
        expect(2.0^(:'-∞')).to eq(0)
        expect((2.0^(:∞ℂ)).¿?).to eq(true)
      end
      it 'handles val 1' do
        expect((1.0^(:∞)).¿?).to eq(true)
        expect((1.0^(:'-∞')).¿?).to eq(true)
        expect((1.0^(:∞ℂ)).¿?).to eq(true)
      end
      it 'handles val < 1 && val > 0' do
        expect((0.5)^(:∞)).to eq(0.0)
        expect((0.5)^(:'-∞')).to eq(∞)
        expect((0.5^(:∞ℂ)).¿?).to eq(true)
      end
      it 'handles val 0' do
        expect(0.0^(:∞)).to eq(0)
        expect(0.0^(:'-∞')).to eq(::Float::INFINITY_COMPLEX)
        expect(0.0^(:∞ℂ)).to eq(0)
      end
      it 'handles val < 0 && val > -1' do
        expect((-0.5)^(:∞)).to eq(0.0)
        expect((-0.5)^(:'-∞')).to eq(data_float_negative_inf)
        expect((-0.5^(:∞ℂ)).¿?).to eq(true)
      end
      it 'handles val -1' do
        expect((-1.0^(:∞)).¿?).to eq(true)
        expect((-1.0^(:'-∞')).¿?).to eq(true)
        expect((-1.0^(:∞ℂ)).¿?).to eq(true)
      end
      it 'handles val < 1' do
        expect(-2.0^(:∞)).to eq(data_float_negative_inf)
        expect(-2.0^(:'-∞')).to eq(0.0)
        expect((-2.0^(:∞ℂ)).¿?).to eq(true)
      end

      context 'handles bad args' do
        it 'invalid symbols' do
          expect{2.0^(:∞∞∞)}.to raise_error(RuntimeError)
          expect{0.0^(9.9)}.to raise_error(RuntimeError)
          expect{0.0^(nil)}.to raise_error(RuntimeError)
        end
        it 'un-supported dynamic evaluation' do
          expect{0.0^⁻⁹⁹}.to raise_error(NameError)
          expect{0.0^⁻}.to raise_error(NameError)
        end
      end
    end

    context 'for rationals' do

      it 'handles vals > 1' do
        expect(data_rational_3^(:∞)).to eq(∞)
        expect(data_rational_3^(:'-∞')).to eq(0)
        expect((data_rational_3^(:∞ℂ)).¿?).to eq(true)
      end
      it 'handles val 1' do
        expect((data_rational_one^(:∞)).¿?).to eq(true)
        expect((data_rational_one^(:'-∞')).¿?).to eq(true)
        expect((data_rational_one^(:∞ℂ)).¿?).to eq(true)
      end
      it 'handles val < 1 && val > 0' do
        expect((Rational(1, 2))^(:∞)).to eq(0.0)
        expect((Rational(1, 2))^(:'-∞')).to eq(∞)
        expect((Rational(1, 2)^(:∞ℂ)).¿?).to eq(true)
      end
      it 'handles val 0' do
        expect(data_rational_zero^(:∞)).to eq(0)
        expect(data_rational_zero^(:'-∞')).to eq(::Float::INFINITY_COMPLEX)
        expect(data_rational_zero^(:∞ℂ)).to eq(0)
      end
      it 'handles val < 0 && val > -1' do
        expect((Rational(-1, 2))^(:∞)).to eq(0.0)
        expect((Rational(-1, 2))^(:'-∞')).to eq(::Float::INFINITY_COMPLEX)
        expect((Rational(-1, 2)^(:∞ℂ)).¿?).to eq(true)
      end
      it 'handles val -1' do
        expect((data_rational_negative_one^(:∞)).¿?).to eq(true)
        expect((data_rational_negative_one^(:'-∞')).¿?).to eq(true)
        expect((data_rational_negative_one^(:∞ℂ)).¿?).to eq(true)
      end
      it 'handles val < 1' do
        expect(data_rational_negative_3^(:∞)).to eq(::Float::INFINITY_COMPLEX)
        expect(data_rational_negative_3^(:'-∞')).to eq(0.0)
        expect((data_rational_negative_3^(:∞ℂ)).¿?).to eq(true)
      end

      context 'handles bad args' do
        it 'invalid symbols' do
          expect{data_rational_negative_3^(:∞∞∞)}.to raise_error(RuntimeError)
          expect{data_rational_zero^(9.9)}.to raise_error(RuntimeError)
          expect{data_rational_zero^(nil)}.to raise_error(RuntimeError)
        end
        it 'un-supported dynamic evaluation' do
          expect{data_rational_zero^⁻⁹⁹}.to raise_error(NameError)
          expect{data_rational_zero^⁻}.to raise_error(NameError)
        end
      end
    end

  end

end