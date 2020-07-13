# encoding: UTF-8

RSpec.describe 'f39_db_orm' do

  context 'db_orm', :db do
    context 'defines{f38}' do
      it 'passes ORM audit' do
        audit_feature(f39, 'f39', 0, "offer a light wrapper over `Ruby's` default web-based-protocol requests")
      end
    end # end: {defines{f39}}
  end

end
