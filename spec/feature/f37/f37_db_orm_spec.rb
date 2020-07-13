# encoding: UTF-8

RSpec.describe 'f37_db_orm' do

  context 'db_orm', :db do

    context 'defines{f37}' do
      it 'passes ORM audit' do
        audit_feature(f37, 'f37', 2, 'abstract `GraphTheory`; offering static math functions and custom `Graph classes`')
      end

      context 'defines behaviors' do
        it 'defines{b00}' do
          audit_feature_behavior(f37, f37_b00, 'b00', 'create class `PseudoGraph`')
        end
        it 'defines{b01}' do
          audit_feature_behavior(f37, f37_b01, 'b01', 'offer `Graph` classes the ability to transform to/from a `Matrix` representations')
        end
      end

    end # end: {defines{f37}}

  end

end
