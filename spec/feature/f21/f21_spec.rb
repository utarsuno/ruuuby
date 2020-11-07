# encoding: UTF-8

RSpec.describe 'f21' do

  context 'audit', :audit do

    context 'feature(f21) passes audits' do
      context 'funcs provided are' do
        it 'defined in correct location' do
          expect_∃⨍(:digit?, String)
          expect_∃⨍(:to_num?, String)
          expect_∃⨍(:to_num, String)
        end
      end
    end

  end

end
