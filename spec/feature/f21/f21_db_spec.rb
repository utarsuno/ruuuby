# coding: UTF-8

RSpec.describe 'f21_db' do

  context 'db', :db do
    context 'defines f21' do
      it 'passes ORM audit' do
        audit_feature(f21, 'f21', 'enable easier textual/numerical/syntax parsing')
      end
    end
  end

end
