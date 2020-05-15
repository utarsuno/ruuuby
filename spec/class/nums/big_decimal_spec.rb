# coding: UTF-8

RSpec.describe 'big_decimal.rb' do

  context 'extends class[BigDecimal]' do

    context 'func{one?}' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          expect(BigDecimal('1').one?).to eq(true)
          expect(BigDecimal('1.0').one?).to eq(true)
        end
        it 'cases: negative' do
          expect(BigDecimal('10').one?).to eq(false)
          expect(BigDecimal('0').one?).to eq(false)
          expect(BigDecimal('-1').one?).to eq(false)
          expect(BigDecimal('1.1').one?).to eq(false)
          expect(BigDecimal('-1').one?).to eq(false)
          expect(BigDecimal('2').one?).to eq(false)
        end
      end
    end # end: {func{one?}}

    context 'func{smells_like_int?}' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          expect(BigDecimal('1').smells_like_int?).to eq(true)
          expect(BigDecimal('1.0').smells_like_int?).to eq(true)
          expect(BigDecimal('0.0').smells_like_int?).to eq(true)
          expect(BigDecimal('1337.0').smells_like_int?).to eq(true)
          expect(BigDecimal('-1337.0').smells_like_int?).to eq(true)
        end
        it 'cases: negative' do
          expect(BigDecimal('1.1').smells_like_int?).to eq(false)
          expect(BigDecimal('1.5').smells_like_int?).to eq(false)
          expect(BigDecimal('0.9999999').smells_like_int?).to eq(false)
          expect(BigDecimal('1337.25').smells_like_int?).to eq(false)
          expect(BigDecimal('-1337.5').smells_like_int?).to eq(false)
        end
      end
    end # end: {func{one?}}

  end

  #  __   ___  __   ___  __   __                   __   ___
  # |__) |__  |__) |__  /  \ |__)  |\/|  /\  |\ | /  ` |__
  # |    |___ |  \ |    \__/ |  \  |  | /~~\ | \| \__, |___
  context 'performance', :performance do
  end

end
