# coding: UTF-8

RSpec.describe 'f05_db' do

  context 'db', :db do
    context 'defines{f05}' do
      it 'passes ORM audit' do
        audit_feature(f05, 'f05', '`>>` to offer reverse functionality of `<<`')
      end

      context 'defines behaviors' do
        it 'has correct number of behaviors{2}' do
          expect(f05.ruuuby_feature_behaviors.length).to eq(2)
        end

        it 'defines{b00}' do
          audit_feature_behavior(f05, f05_b00, 'b00', 'offer func{>>} to class(`Array`)')
        end

        it 'defines{b01}' do
          audit_feature_behavior(f05, f05_b01, 'b01', 'offer func{>>} to class(`String`)')
        end
      end # end: {defines behaviors}
    end
  end

end
