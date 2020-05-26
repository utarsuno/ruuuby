# coding: UTF-8

RSpec.describe 'f30_db' do

  context 'db', :db do

    context 'defines{f30}' do
      it 'passes ORM audit' do
        audit_feature(f30, 'f30', 'mimic `SetTheory` by creating data-type groupings for Ruby data')
      end

      context 'defines behaviors' do
        it 'has correct number of behaviors{5}' do
          expect(f30.ruuuby_feature_behaviors.length).to eq(5)
        end

        it 'defines{b00}' do
          audit_feature_behavior(f30, f30_b00, 'b00', 'create create singleton-Class{BooleanLikeSpace}, instanced aliased by{🅱}')
        end

        it 'defines{b01}' do
          audit_feature_behavior(f30, f30_b01, 'b01', 'support multiple data types and normalization')
        end

        it 'defines{b02}' do
          audit_feature_behavior(f30, f30_b02, 'b02', 'create create singleton-Class{NucleotideLikeSpace}, instanced aliased by{🧬}')
        end

        it 'defines{b03}' do
          audit_feature_behavior(f30, f30_b03, 'b03', 'create create singleton-Class{NumberLikeSpace}, instanced aliased by{🔢}')
        end

        it 'defines{b04}' do
          audit_feature_behavior(f30, f30_b04, 'b04', 'create create singleton-Class{SymbolicNumbersSpace}, instanced aliased by{𝕊}')
        end
      end # end: {defines behaviors}
    end # end: {defines{f30}}

  end

end
