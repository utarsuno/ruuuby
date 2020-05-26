# coding: UTF-8

RSpec.describe 'f26_db' do

  context 'db', :db do
    context 'defines f26' do
      it 'passes ORM audit' do
        audit_feature(f26, 'f26', 'add syntax parsing for `ISO8601` as well as aliases for Date(`📅`), Time(`🕒`), and DateTime(`📅🕒`)')
      end
    end
  end

end
