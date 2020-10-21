# encoding: UTF-8

RSpec.describe 'f07_db_orm' do

  context 'db_orm', :db do
    context 'defines f07' do
      it 'passes ORM audit' do
        audit_feature(f07, 'f07', 1, 'offer layer of functionality to easily describe & check various meta-data on Ruby')
      end
    end

    context 'defines behaviors' do
      it 'defines{b00}' do
        audit_feature_behavior(f07, f07_b00, 'b00', 'offer a way to check for the existence of functions & aliases')
      end
    end

  end

end
