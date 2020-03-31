# coding: utf-8

RSpec.describe 'indeterminate' do

  context 'preserving operations involving infinities' do

    context 'resolves the following indeterminate forms' do

      it '0 / 0' do
        expect((0.0 / 0.0).¿?).to eq(true)
      end

      it '∞ / ∞' do
        expect((∞ / ∞).¿?).to eq(true)
      end

      it '∞ * 0' do
        expect((∞ * 0.0).¿?).to eq(true)
      end

      it '∞ - ∞' do
        expect((∞ - ∞).¿?).to eq(true)
      end

      it '0 ^ 0' do
        # base rule
        expect((0 ** 0)).to eq(1)
        # ensure alternative versions work
        expect((0^⁰)).to eq(1)
        expect(((-0)^⁰)).to eq(1)
        expect((0.0^⁰)).to eq(1)
        expect(((-0.0)^⁰)).to eq(1)
      end

      it '1 ^ ∞' do
        expect((1^(:∞)).¿?).to eq(true)
      end

      it '∞ ^ 0' do
        expect((∞^⁰).¿?).to eq(true)
      end
    end


    context 'addition' do

      context 'works for needed scenarios' do

        it 'for 1'do
          expect(1 + 1).to eq(2)
          expect(1 + 0).to eq(1)
          expect(1 + ∞).to eq(∞)
          expect(1 - ∞).to eq(-∞)
          # TODO: complex inf
          expect((1 + ¿).¿?).to eq(true)
        end

        it 'for 0' do
          expect(0 + 1).to eq(1)
          expect(0 + 0).to eq(0)
          expect(0 + ∞).to eq(∞)
          expect(0 - ∞).to eq(::Float::INFINITY_NEGATIVE)
          # TODO: complex inf
          expect((0 + ¿).¿?).to eq(true)
        end

        it 'for ∞' do
          expect(∞ + 1).to eq(∞)
          expect(∞ + 0).to eq(∞)
          expect(∞ + ∞).to eq(∞)
          # TODO: complex inf
          expect((∞ - ∞).¿?).to eq(true)
        end

        it 'for -∞' do
          expect(::Float::INFINITY_NEGATIVE + 1).to eq(::Float::INFINITY_NEGATIVE)
          expect(::Float::INFINITY_NEGATIVE + 0).to eq(::Float::INFINITY_NEGATIVE)
          expect((::Float::INFINITY_NEGATIVE + ∞).¿?).to eq(true)
          expect(::Float::INFINITY_NEGATIVE + ::Float::INFINITY_NEGATIVE).to eq(::Float::INFINITY_NEGATIVE)
          # TODO: complex inf
          expect((::Float::INFINITY_NEGATIVE + ¿).¿?).to eq(true)
        end

        # TODO: complex inf

        it 'for ¿' do
          expect((¿ + 1).¿?).to eq(true)
          expect((¿ + 0).¿?).to eq(true)
          expect((¿ + ∞).¿?).to eq(true)
          expect((¿ - ∞).¿?).to eq(true)
          # TODO: complex inf
          expect((¿ + ¿).¿?).to eq(true)
        end

      end

    end

    context 'subtraction' do

      it 'for 1' do
        expect(1 - 1).to eq(0)
        expect(1 - 0).to eq(1)
        expect(1 - ∞).to eq(::Float::INFINITY_NEGATIVE)
        expect(1 - ::Float::INFINITY_NEGATIVE).to eq(∞)
        # TODO: complex inf
        expect((1 - ¿).¿?).to eq(true)
      end

      it 'for 0' do
        expect(0 - 1).to eq(-1)
        expect(0 - 0).to eq(0)
        expect(0 - ∞).to eq(::Float::INFINITY_NEGATIVE)
        expect(0 - ::Float::INFINITY_NEGATIVE).to eq(∞)
        # TODO: complex inf
        expect((0 - ¿).¿?).to eq(true)
      end

      it 'for ∞' do
        expect(∞ - 1).to eq(∞)
        expect(∞ - 0).to eq(∞)
        expect((∞ - ∞).¿?).to eq(true)
        expect(∞ - ::Float::INFINITY_NEGATIVE).to eq(∞)
        # TODO: complex inf
        expect((∞ - ¿).¿?).to eq(true)
      end

      it 'for -∞' do
        expect(::Float::INFINITY_NEGATIVE - 1).to eq(::Float::INFINITY_NEGATIVE)
        expect(::Float::INFINITY_NEGATIVE - 0).to eq(::Float::INFINITY_NEGATIVE)
        expect(::Float::INFINITY_NEGATIVE - ∞).to eq(::Float::INFINITY_NEGATIVE)
        expect((::Float::INFINITY_NEGATIVE - ::Float::INFINITY_NEGATIVE).¿?).to eq(true)
        # TODO: complex inf
        expect((::Float::INFINITY_NEGATIVE - ¿).¿?).to eq(true)
      end

    end

    context 'multiplication' do

      it 'for 1' do
        expect(1 * 1).to eq(1)
        expect(1 * 0).to eq(0)
        expect(1 * ∞).to eq(∞)
        expect(1 * ::Float::INFINITY_NEGATIVE).to eq(::Float::INFINITY_NEGATIVE)
        # TODO: complex inf
        expect((1 * ¿).¿?).to eq(true)
      end

      it 'for 0' do
        expect(0 * 1).to eq(0)
        expect(0 * 0).to eq(0)
        expect((0 * ∞).¿?).to eq(true)
        expect((0 * ::Float::INFINITY_NEGATIVE).¿?).to eq(true)
        # TODO: complex inf
        expect((0 * ¿).¿?).to eq(true)
      end

      it 'for ∞' do
        expect(∞ * 1).to eq(∞)
        expect((∞ * 0).¿?).to eq(true)
        expect(∞ * ∞).to eq(∞)
        expect(∞ * ::Float::INFINITY_NEGATIVE).to eq(::Float::INFINITY_NEGATIVE)
        # TODO: complex inf
        expect((∞ * ¿).¿?).to eq(true)
      end

      it 'for -∞' do
        expect(::Float::INFINITY_NEGATIVE * 1).to eq(::Float::INFINITY_NEGATIVE)
        expect((::Float::INFINITY_NEGATIVE * 0).¿?).to eq(true)
        expect(::Float::INFINITY_NEGATIVE * ∞).to eq(::Float::INFINITY_NEGATIVE)
        expect(::Float::INFINITY_NEGATIVE * ::Float::INFINITY_NEGATIVE).to eq(∞)
        # TODO: complex inf
        expect((∞ * ¿).¿?).to eq(true)
      end

    end

    context 'division' do

      it 'for 1' do
        expect(1 / 1).to eq(1)
        expect(1 / ∞).to eq(0)
        expect(1 / ::Float::INFINITY_NEGATIVE).to eq(0)
        # TODO: complex inf
        expect((1 / ¿).¿?).to eq(true)
      end

      it 'for 1 "un-supported" (for now)' do
        #expect(1 / 0).to eq(::Float::INFINITY_COMPLEX)
        expect{1 / 0}.to raise_error(ZeroDivisionError)
      end

      it 'for 0' do
        expect(0 / 1).to eq(0)
        expect(0 / ∞).to eq(0)
        expect(0 / ::Float::INFINITY_NEGATIVE).to eq(0)
        # TODO: complex inf
        expect((0 / ¿).¿?).to eq(true)
      end

      it 'for 0 "un-supported" (for now)' do
        #expect((0 / 0).¿?).to eq(true)
        expect{(0 / 0)}.to raise_error(ZeroDivisionError)
      end

      it 'for ∞' do
        expect(∞ / 1).to eq(∞)
        expect((∞ / ∞).¿?).to eq(true)
        expect((∞ / ::Float::INFINITY_NEGATIVE).¿?).to eq(true)
        # TODO: complex inf
        expect((∞ / ¿).¿?).to eq(true)
      end

      it 'for ∞ "un-supported" (for now)' do
        #expect(∞ / 0).to eq(::Float::INFINITY_COMPLEX) # currently outputs Infinity
      end

      it 'for -∞' do
        expect(::Float::INFINITY_NEGATIVE / 1).to eq(::Float::INFINITY_NEGATIVE)
        expect((∞ / ∞).¿?).to eq(true)
        expect((∞ / ::Float::INFINITY_NEGATIVE).¿?).to eq(true)
        # TODO: complex inf
        expect((∞ / ¿).¿?).to eq(true)
      end

      it 'for -∞ "un-supported" (for now)' do
        #expect(::Float::INFINITY_NEGATIVE / 0).to eq(::Float::INFINITY_COMPLEX)
        #expect(::Float::INFINITY_NEGATIVE / 0).to eq(::Float::INFINITY_COMPLEX) #outputs -Infinity
      end

    end

    context 'powers' do

      it 'for 1' do
        expect(1^¹).to eq(1)
        expect(1 ** 1).to eq(1)
        expect(1^⁰).to eq(1)
        expect(1 ** 0).to eq(1)

        expect((1^(:∞)).¿?).to eq(true)
        # notice difference compared to default operator
        expect((1 ** Float::INFINITY).¿?).to eq(false)

        expect((1^(:'-∞')).¿?).to eq(true)
        expect((1 ** Float::INFINITY_NEGATIVE).¿?).to eq(false)

        expect((1^(Float::INFINITY_COMPLEX)).¿?).to eq(true)

        # TODO: complex inf
        # TODO: NAN
      end

      it 'for 0' do
        expect(0^¹).to eq(0)
        expect(0 ** 1).to eq(0)

        expect((0^⁰)).to eq(1)
        expect((0 ** 0)).to eq(1)

        expect((0^(:∞))).to eq(0)
        expect(0 ** ∞).to eq(0)

        expect((0^(:'-∞'))).to eq(::Float::INFINITY_COMPLEX)

        # TODO: complex inf
        # TODO: NAN
      end

      it 'for 0 "un-supported" (for now)' do
        # ???
        #expect((0^⁰).¿?).to eq(true)
        #expect((0 ** 0).¿?).to eq(true)
        #expect((0^(::Float::INFINITY_COMPLEX)).¿?).to eq(true)
      end

      it 'for ∞' do
        expect(∞^¹).to eq(∞)
        expect((∞^⁰).¿?).to eq(true)
        expect(∞^(:∞)).to eq(::Float::INFINITY_COMPLEX)
        expect(∞^(:'-∞')).to eq(0)
        expect((∞^(Float::INFINITY_COMPLEX)).¿?).to eq(true)

        # TODO: NAN
      end

      it 'for -∞' do
        expect(Float::INFINITY_NEGATIVE^¹).to eq(Float::INFINITY_NEGATIVE)
        expect((Float::INFINITY_NEGATIVE^⁰).¿?).to eq(true)
        expect(Float::INFINITY_NEGATIVE^(:∞)).to eq(::Float::INFINITY_COMPLEX)
        expect(Float::INFINITY_NEGATIVE^(:'-∞')).to eq(0)
        expect((Float::INFINITY_NEGATIVE^(Float::INFINITY_COMPLEX)).¿?).to eq(true)

        # TODO: NAN
      end

      it 'for ∞ℂ' do

        # TODO: these scenarios can tested once an Object representation for Infinity complex exists

        #expect(Float::INFINITY_COMPLEX^¹).to eq(Float::INFINITY_COMPLEX)
        #expect((Float::INFINITY_COMPLEX^⁰).¿?).to eq(true)
        #expect(Float::INFINITY_COMPLEX^(:∞)).to eq(::Float::INFINITY_COMPLEX)
        #expect(Float::INFINITY_COMPLEX^(:'-∞')).to eq(0)
        #expect((Float::INFINITY_COMPLEX^(Float::INFINITY_COMPLEX)).¿?).to eq(true)

        # TODO: NAN
      end

    end

  end

end
