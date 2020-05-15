# coding: UTF-8

RSpec.describe 'f27' do

  context 'db', :db do

    context 'defines f27' do

      it 'passes ORM audit' do
        audit_feature(f27, 'f27', 'add new class (`ThetaAngle`) for easier operations involving angles')
      end

    end

  end

end
