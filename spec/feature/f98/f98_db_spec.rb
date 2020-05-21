# coding: UTF-8

RSpec.describe 'f98_db' do

  context 'db', :db do
    context 'feature{f98}' do
      it 'passes ORM audit' do
        audit_feature(f98, 'f98', '`C-extensions`')
      end
    end

    context 'defines behaviors' do
      it 'has correct number of behaviors{1}' do
        expect(f98.ruuuby_feature_behaviors.length).to eq(1)
      end

      it 'defines{b00}' do
        audit_feature_behavior(f98, f98_b00, 'b00', 'can set the $PROGRAM_NAME')
      end

    end # end: {defines behaviors}

  end

end
