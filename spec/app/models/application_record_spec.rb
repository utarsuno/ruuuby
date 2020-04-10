# coding: utf-8

RSpec.describe 'application_record.rb' do

  context 'ApplicationRecord', :db do

    it 'can not be created' do
      expect{ApplicationRecord.new}.to raise_error(NotImplementedError)
    end
  end

end
