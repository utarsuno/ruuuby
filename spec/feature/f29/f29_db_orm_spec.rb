# coding: UTF-8

RSpec.describe 'f29_db_orm' do

  context 'db_orm', :db do

    context 'defines{f29}' do

      it 'passes ORM audit' do
        audit_feature(f29, 'f29', 0, 'add new class (`Quaternion`) for easier operations involving `quaternions`')
      end

    end

  end

end
