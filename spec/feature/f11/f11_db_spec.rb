# coding: UTF-8

RSpec.describe 'f11' do

  context 'db', :db do

    context 'defines f11' do

      it 'passes ORM audit' do
        audit_feature(f11, 'f11', 'add math `number sets` (ex: `ℕ?`, `ℤ?`, `ℚ?`, `ℂ?`, `ℝ?`, `∞?`, `♾️?`)')
      end

      context 'defines behaviors' do

        it 'has correct number of behaviors{3}' do
          expect(f11.ruuuby_feature_behaviors.length).to eq(3)
        end

        it 'has b00' do
          audit_feature_behavior(f11, f11_b00, 'b00', 'create module{SetTheory}')
        end

        it 'has b01' do
          audit_feature_behavior(f11, f11_b01, 'b01', 'create class{Closure}')
        end

        it 'has b02' do
          audit_feature_behavior(f11, f11_b02, 'b02', 'create class{NumberSet}')
        end

      end

    end

  end

end
