# coding: utf-8

RSpec.describe 'numeric.rb' do
  let(:data_nan){0.0/0.0}
  let(:data_infinity){1/0.0}
  let(:data_negative_infinity){-1/0.0}

  context 'extends class[Numeric]' do

    context 'by adding functions {∞?, 𝕌?}' do
      it 'exists' do
        expect(::Numeric.∃func?(:∞?)).to eq(true)
        expect(::Numeric.∃func?(:𝕌?)).to eq(true)
        expect(::Numeric.∃func?(:𝔹?)).to eq(true)
      end
    end

    context 'by adding function{∞?}' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          expect(data_infinity.∞?).to eq(true)
          expect(data_negative_infinity.∞?).to eq(true)
        end
        it 'cases: negative' do
          expect(data_nan.∞?).to eq(false)
          expect(0.0.∞?).to eq(false)
          expect(1.0.∞?).to eq(false)
          expect(-1.0.∞?).to eq(false)
        end
      end
    end

    context 'by adding function{𝔹?}' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          expect(0.𝔹?).to eq(true)
          expect(0.0.𝔹?).to eq(true)
          expect(1.0.𝔹?).to eq(true)
          expect(1.𝔹?).to eq(true)
          expect(Rational(10, 10).𝔹?).to eq(true)
          expect(Rational(0, 1337).𝔹?).to eq(true)
          expect(Complex(0, 0).𝔹?).to eq(true)
          expect(Complex(1, 0).𝔹?).to eq(true)
          expect(BigDecimal('0.0').𝔹?).to eq(true)
          expect(BigDecimal('1.0').𝔹?).to eq(true)
        end
        it 'cases: negative' do
          expect(-1337.𝔹?).to eq(false)
          expect(-1.𝔹?).to eq(false)
          expect(-1.0.𝔹?).to eq(false)
          expect(Complex(1, 2).𝔹?).to eq(false)
          expect(Rational(Complex(-1, 2), 2).𝔹?).to eq(false)
          expect(data_nan.𝔹?).to eq(false)
          expect(data_infinity.𝔹?).to eq(false)
          expect(data_negative_infinity.𝔹?).to eq(false)
        end
      end
    end

    context 'by adding function{𝕌?}' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          expect(0.0.𝕌?).to eq(true)
          expect(1.0.𝕌?).to eq(true)
          expect(-1.0.𝕌?).to eq(true)
          expect(Complex(1, 2).𝕌?).to eq(true)
          expect(Rational(Complex(-1, 2), 2).𝕌?).to eq(true)
        end
        it 'cases: negative' do
          expect(data_nan.𝕌?).to eq(false)
          expect(data_infinity.𝕌?).to eq(false)
          expect(data_negative_infinity.𝕌?).to eq(false)
        end
      end
    end

  end

  #  __   ___  __   ___  __   __                   __   ___
  # |__) |__  |__) |__  /  \ |__)  |\/|  /\  |\ | /  ` |__
  # |    |___ |  \ |    \__/ |  \  |  | /~~\ | \| \__, |___
  context 'performance', :'performance' do
    context 'func[∞?]: performs very quickly' do
      it 'for cases: true' do
        expect{data_infinity.∞?}.to perform_very_quickly
        expect{data_negative_infinity.∞?}.to perform_very_quickly
      end
      it 'cases: negative' do
        expect{data_nan.∞?}.to perform_very_quickly
        expect{0.0.∞?}.to perform_very_quickly
        expect{1.0.∞?}.to perform_very_quickly
        expect{-1.0.∞?}.to perform_very_quickly
      end
    end
    context 'func[𝕌?]: performs extremely quickly' do
      it 'for cases: true' do
        expect{55.𝕌?}.to perform_extremely_quickly
        expect{-1.𝕌?}.to perform_extremely_quickly
      end
      it 'cases: negative' do
        expect{data_nan.𝕌?}.to perform_extremely_quickly
        expect{data_infinity.𝕌?}.to perform_extremely_quickly
        expect{data_negative_infinity.𝕌?}.to perform_extremely_quickly
      end
    end
  end

end
