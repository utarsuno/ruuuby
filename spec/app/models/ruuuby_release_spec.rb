# coding: utf-8

RSpec.describe 'ruuuby_release.rb' do

  context 'ApplicationRecord{RuuubyRelease}' do
    it 'can be created' do
      fake_release = RuuubyRelease.create!(version_major: 1, version_minor: 2, version_tiny: 3)
      expect(fake_release.version_major).to eq(1)
      expect(fake_release.version_minor).to eq(2)
      expect(fake_release.version_tiny).to eq(3)

      expect(fake_release.version).to eq('v1.2.3')

      fake_release.destroy!
    end
  end

end
