# encoding: UTF-8

RSpec.describe 'ruby' do
  context 'locale', :preferences do

    context 'recommended settings for {f93_b00}' do

      context 'for gem{activerecord}' do
        it 'has correct version{5.2.4.3}' do
          expect(::ActiveRecord::VERSION::STRING).to eq('6.0.3.4')
        end
      end

    end

  end
end
