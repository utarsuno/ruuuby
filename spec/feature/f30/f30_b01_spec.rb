# coding: UTF-8

RSpec.describe 'f30_b01' do

  context 'feature{f30} functionality for' do
    context 'behavior{b01}' do
      context 'supports operation: 🅱.∋?(arg)' do
        context 'handling needed scenarios' do
          context 'cases: positive' do
            it 'w/ int' do
              expect(🅱.∋?(1)).to eq(true)
              expect(🅱.∋?(0)).to eq(true)
            end
            it 'w/ flt' do
              expect(🅱.∋?(1.0)).to eq(true)
              expect(🅱.∋?(0.0)).to eq(true)
              expect(🅱.∋?(-0.0)).to eq(true)
            end
            it 'w/ nil' do
              expect(🅱.∋?(nil)).to eq(true)
            end
            it 'w/ bool' do
              expect(🅱.∋?(true)).to eq(true)
              expect(🅱.∋?(false)).to eq(true)
              expect(🅱.∋?(1 == 1)).to eq(true)
              expect(🅱.∋?(1 != 1)).to eq(true)
            end
            it 'w/ str' do
              %w(0 0.0 f F false False FALSE n no No NO 1 1.0 t T true True TRUE y Y yes Yes YES).∀{|scenario| expect(🅱.∋?(scenario)).to eq(true)}
            end
          end # end: {cases: positive}
          context 'cases: negative' do
            it 'w/ int' do
              expect(🅱.∋?(2)).to eq(false)
              expect(🅱.∋?(-1)).to eq(false)
            end
            it 'w/ flt' do
              [-2.0, 0.1, 1.1, ::Float::INFINITY, ::Float::INFINITY_NEGATIVE].∀{|scenario| expect(🅱.∋?(scenario)).to eq(false)}
            end
            it 'w/ str' do
              %w(2 -3 0.1 ff fAlse FAlse FALSe nn noo Noo NOo 1.2 1.01337 Tt Trrue TRuE yY yES YYes yES).∀{|scenario| expect(🅱.∋?(scenario)).to eq(false)}
            end
          end # end: {cases: negative}
        end
      end
    end
  end

end
