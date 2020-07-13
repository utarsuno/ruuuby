# encoding: UTF-8

RSpec.describe 'f38_db_orm' do

  context 'db_orm', :db do
    context 'defines{f38}' do
      it 'passes ORM audit' do
        audit_feature(f38, 'f38', 4, 'abstract `Tropical Algebra`; offering static math functions and `Refinements` for specific classes')
      end

      context 'defines behaviors' do

        it 'defines{b00}' do
          audit_feature_behavior(f38, f38_b00, 'b00', 'offer `Refinement` w/ module{Math::Algebra::Tropical::ContextMatrix} for class{`Matrix`}')
        end

        it 'defines{b01}' do
          audit_feature_behavior(f38, f38_b01, 'b01', 'offer `Refinement` w/ module{Math::Algebra::Tropical::ContextNumeric} for `Numerics`')
        end

        it 'defines{b02}' do
          audit_feature_behavior(f38, f38_b02, 'b02', 'support `Tropical Algebra` w/ any additionally needed methods in class{`Matrix`}')
        end

        it 'defines{b03}' do
          audit_feature_behavior(f38, f38_b03, 'b03', 'create class `CurrencyMatrix` under module{`Math::Forex`}')
        end

      end # end: {defines behaviors}
    end # end: {defines{f38}}
  end

end
