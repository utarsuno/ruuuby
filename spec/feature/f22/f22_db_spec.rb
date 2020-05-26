# coding: UTF-8

RSpec.describe 'f22_db' do

  context 'db', :db do
    context 'defines f22' do
      it 'passes ORM audit' do
        audit_feature(f22, 'f22', "add a light abstraction to working w/ the built-in GC utilities")
      end
    end
  end

end
