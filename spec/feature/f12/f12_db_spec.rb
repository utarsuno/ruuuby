# coding: UTF-8

RSpec.describe 'f12_db' do

  context 'db', :db do
    context 'defines f12' do
      it 'passes ORM audit' do
        audit_feature(f12, 'f12', 'enable straight-forward `file/directory io` and alias Classes w/ File(`📂`) and Dir(`🗄️`)')
      end
    end
  end

end
