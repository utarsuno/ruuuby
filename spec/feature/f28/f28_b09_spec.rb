# coding: UTF-8

RSpec.describe 'f28_b09' do
  context 'functionality' do
    context 'unicode characters representing fractions' do
      context 'has correct values' do
        it 'for all' do
          expect(½).to eq(0.5)
          expect(⅓).to eq(1.0/3)
          expect(⅔).to eq(2.0/3)
          expect(¼).to eq(1.0/4)
          expect(¾).to eq(3.0/4)
          expect(⅕).to eq(1.0/5)
          expect(⅖).to eq(2.0/5)
          expect(⅗).to eq(3.0/5)
          expect(⅘).to eq(4.0/5)
          expect(⅙).to eq(1.0/6)
          expect(⅐).to eq(1.0/7)
          expect(⅛).to eq(1.0/8)
          expect(⅜).to eq(3.0/8)
          expect(⅝).to eq(5.0/8)
          expect(⅞).to eq(7.0/8)
          expect(⅑).to eq(1.0/9)
          expect(⅒).to eq(1.0/10)
        end
      end
    end
  end
end
