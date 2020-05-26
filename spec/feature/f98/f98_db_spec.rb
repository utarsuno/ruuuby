# coding: UTF-8

RSpec.describe 'f98_db' do

  context 'db', :db do
    context 'feature{f98}' do
      it 'passes ORM audit' do
        audit_feature(f98, 'f98', '`C-extensions`')
      end
    end

    context 'defines behaviors' do
      it 'has correct number of behaviors{2}' do
        expect(f98.ruuuby_feature_behaviors.length).to eq(2)
      end

      it 'defines{b00}' do
        audit_feature_behavior(f98, f98_b00, 'b00', 'can set the $PROGRAM_NAME')
      end

      it 'defines{b01}' do
        audit_feature_behavior(f98, f98_b01, 'b01', 'offer (to `Ruuuby`) access to `C` math functions, especially those involving higher precision')
      end

    end # end: {defines behaviors}

  end

end
