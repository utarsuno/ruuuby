# encoding: UTF-8

RSpec.describe 'f04' do

  context 'audit', :audit do
    context 'feature(f04) passes audits' do
      context 'funcs provided are defined in correct location' do
        it 'for c{Dir}' do
          expect_∃⨍(:∅?, ::Dir)
        end
        it 'for c{File}' do
          expect_∃⨍(:∅?, ::File)
        end
      end
    end
  end # end: {audit}

end
