# coding: UTF-8

RSpec.describe 'f27_db' do

  context 'db', :db do

    context 'defines f27' do

      it 'passes ORM audit' do
        audit_feature(f27, 'f27', 'add new class (`ThetaAngle`) for easier operations involving angles')
      end

      context 'defines behaviors' do
        it 'has correct number of behaviors{1}' do
          expect(f27.ruuuby_feature_behaviors.length).to eq(1)
        end

        it 'has b00' do
          audit_feature_behavior(f27, f27_b00, 'b00', 'has additive identity{0} and multiplicative identity{1}')
        end

      end

    end

  end

end
