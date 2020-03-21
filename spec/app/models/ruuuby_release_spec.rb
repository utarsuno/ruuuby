# coding: utf-8

RSpec.describe 'ruuuby_release.rb' do

  context 'ApplicationRecord{RuuubyRelease}' do
    it 'can be created' do
      fake_release = RuuubyRelease.create!(vmajor: 1, vminor: 2, vtiny: 3)
      expect(fake_release.vmajor).to eq(1)
      expect(fake_release.vminor).to eq(2)
      expect(fake_release.vtiny).to eq(3)

      expect(fake_release.version).to eq('v1.2.3')

      fake_release.♻️!
    end

    it 'prevents duplicate versions from being created' do
      expect{
        RuuubyRelease.spawn(1, 2, 3)
        RuuubyRelease.spawn(1, 2, 3)
      }.to raise_error(ActiveRecord::RecordNotUnique)

      result = RuuubyRelease.by_version(1, 2, 3)
      result.♻️!
    end

    it 'prevents negative values being used for version values' do
      expect{ RuuubyRelease.spawn(1, 1, -1) }.to raise_error(ActiveRecord::RecordInvalid)
      expect{ RuuubyRelease.spawn(1, -1, 1) }.to raise_error(ActiveRecord::RecordInvalid)
      expect{ RuuubyRelease.spawn(-1, 1, 1) }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'prevents non-integer values being used for version values' do
      expect{ RuuubyRelease.spawn(1.0, 1, 1) }.to raise_error(ActiveRecord::RecordInvalid)
      expect{ RuuubyRelease.spawn(1, 1, nil) }.to raise_error(ActiveRecord::RecordInvalid)
      expect{ RuuubyRelease.spawn(1.0, 1, []) }.to raise_error(ActiveRecord::RecordInvalid)
      expect{ RuuubyRelease.spawn('a', 1, 1) }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

end
