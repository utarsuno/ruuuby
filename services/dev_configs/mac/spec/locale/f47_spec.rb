# encoding: UTF-8

RSpec.describe 'ruby' do
  context 'preferences', :preferences do

    context 'for gem{rubygems-update}' do
      it 'has correct version' do
        expect_needed_version(::Gem, '3.2.0.rc.2', ::Gem.rubygems_version.to_s)
      end
      it 'matching output of cmd{gem -v}' do
        expect(::Gem.version_current).to eq(💻('gem -v'))
      end
    end

  end
end
