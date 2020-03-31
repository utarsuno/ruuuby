# coding: utf-8

RSpec.describe 'class/sym.rb' do

  context 'extends class[Symbol]' do

    it 'by creating needed aliases' do
      expect_added_method_aliases(::Symbol, cΔ_Symbol)
    end

    context 'adds needed functions' do

      context 'func{pow_to_i}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect(:⁻¹.pow_to_i).to eq(-1)
            expect(:⁻².pow_to_i).to eq(-2)
            expect(:⁻³.pow_to_i).to eq(-3)
            expect(:⁻⁴.pow_to_i).to eq(-4)
            expect(:⁻⁵.pow_to_i).to eq(-5)
            expect(:⁻⁶.pow_to_i).to eq(-6)
            expect(:⁻⁷.pow_to_i).to eq(-7)
            expect(:⁻⁸.pow_to_i).to eq(-8)
            expect(:⁻⁹.pow_to_i).to eq(-9)

            expect(:⁰.pow_to_i).to eq(0)
            expect(:¹.pow_to_i).to eq(1)
            expect(:².pow_to_i).to eq(2)
            expect(:³.pow_to_i).to eq(3)
            expect(:⁴.pow_to_i).to eq(4)
            expect(:⁵.pow_to_i).to eq(5)
            expect(:⁶.pow_to_i).to eq(6)
            expect(:⁷.pow_to_i).to eq(7)
            expect(:⁸.pow_to_i).to eq(8)
            expect(:⁹.pow_to_i).to eq(9)
          end
          it 'cases: negative' do
            expect{:⁻.pow_to_i}.to raise_error(RuntimeError)
            expect{:¹¹.pow_to_i}.to raise_error(RuntimeError)
            expect{:⁻⁻.pow_to_i}.to raise_error(RuntimeError)
            expect{:¹⁻.pow_to_i}.to raise_error(RuntimeError)
          end
        end
      end

      context 'func{power?}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect(:⁻¹.power?).to eq(true)
            expect(:⁻².power?).to eq(true)
            expect(:⁻³.power?).to eq(true)
            expect(:⁻⁴.power?).to eq(true)
            expect(:⁻⁵.power?).to eq(true)
            expect(:⁻⁶.power?).to eq(true)
            expect(:⁻⁷.power?).to eq(true)
            expect(:⁻⁸.power?).to eq(true)
            expect(:⁻⁹.power?).to eq(true)

            expect(:⁰.power?).to eq(true)
            expect(:¹.power?).to eq(true)
            expect(:².power?).to eq(true)
            expect(:³.power?).to eq(true)
            expect(:⁴.power?).to eq(true)
            expect(:⁵.power?).to eq(true)
            expect(:⁶.power?).to eq(true)
            expect(:⁷.power?).to eq(true)
            expect(:⁸.power?).to eq(true)
            expect(:⁹.power?).to eq(true)
          end
          it 'cases: negative' do
            expect(:⁻.power?).to eq(false)
            expect(:¹¹.power?).to eq(false)
            expect(:⁻⁻.power?).to eq(false)
            expect(:¹⁻.power?).to eq(false)
          end
        end
      end

    end

  end

  #  __   ___  __   ___  __   __                   __   ___
  # |__) |__  |__) |__  /  \ |__)  |\/|  /\  |\ | /  ` |__
  # |    |___ |  \ |    \__/ |  \  |  | /~~\ | \| \__, |___
  context 'performance', :'performance' do
    context 'funcs extremely quickly' do

      context 'func{power?}' do
        it 'for cases: true' do
          expect{:⁶.pow_to_i}.to perform_very_quickly
          expect{:⁻⁶.pow_to_i}.to perform_very_quickly
        end
      end

      context 'func{power?}' do
        it 'for cases: true' do
          expect{:⁶.power?}.to perform_very_quickly
          expect{:⁻⁶.power?}.to perform_very_quickly
        end
        it 'for cases: negative' do
          expect{:⁻.power?}.to perform_very_quickly
        end
      end
    end
  end

end
