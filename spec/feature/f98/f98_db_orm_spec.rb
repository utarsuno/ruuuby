# coding: UTF-8

RSpec.describe 'f98_db_orm' do

  context 'db_orm', :db do
    context 'feature{f98}' do
      it 'passes ORM audit' do
        audit_feature(f98, 'f98', 3, '`C-extensions`')
      end
    end
    context 'defines behaviors' do
      it 'defines{b00}' do
        audit_feature_behavior(f98, f98_b00, 'b00', 'can set the $PROGRAM_NAME')
      end

      it 'defines{b01}' do
        audit_feature_behavior(f98, f98_b01, 'b01', 'offer (to `Ruuuby`) access to `C` math functions, especially those involving higher precision')
      end

      it 'defines{b02' do
        audit_feature_behavior(f98, f98_b02, 'b02', 'simplify import/require statements & setup as much as possible')
      end
    end # end: {defines behaviors}
  end

end
