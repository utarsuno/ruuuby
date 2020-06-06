# coding: UTF-8

RSpec.describe 'f17_db' do

  context 'db', :db do
    context 'defines f17' do
      it 'passes ORM audit' do
        audit_feature(f17, 'f17', 'abstract `Trigonometry`; offering static math functions')
      end
    end
  end

end
