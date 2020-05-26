# coding: UTF-8

RSpec.describe 'f25_db' do

  context 'db', :db do
    context 'defines f25' do
      it 'passes ORM audit' do
        audit_feature(f25, 'f25', 'bundle `Ruuuby` meta-data related functionality w/ base alias(`💎`)')
      end
    end
  end

end
