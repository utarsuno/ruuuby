# coding: utf-8

RSpec.describe 'ruuuby_release.rb' do

  context 'ApplicationRecord{RuuubyRelease}' do

    context 'defines module[Syntax]' do
      it 'exists' do
        expect_∃module(:Syntax, ::RuuubyRelease)
      end
      context 'with needed constants' do
        context '::RuuubyRelease::Syntax::VERSION' do
          it 'exists' do
            expect(RuuubyRelease::Syntax::VERSION).to eq('v\d.\d.\d(\d?)')
          end
          it "can't be changed" do
            expect{RuuubyRelease::Syntax::VERSION = 5}.to raise_error(FrozenError)
          end
        end
        context '::RuuubyRelease::Syntax::FIND_UID' do
          it 'exists' do
            expect(RuuubyRelease::Syntax::FIND_UID).to eq('vmajor = ? AND vminor = ? AND vtiny = ?')
          end
          it "can't be changed" do
            expect{RuuubyRelease::Syntax::FIND_UID = 5}.to raise_error(FrozenError)
          end
        end
      end
    end

    it 'can be created' do
      fake_release = RuuubyRelease.create!(vmajor: 1, vminor: 2, vtiny: 3)
      expect(fake_release.vmajor).to eq(1)
      expect(fake_release.vminor).to eq(2)
      expect(fake_release.vtiny).to eq(3)

      expect(fake_release.uid).to eq('v1.2.3')

      fake_release.♻️!
    end

    it 'prevents duplicate versions from being created' do
      expect{
        RuuubyRelease.spawn(1, 2, 3)
        RuuubyRelease.spawn(1, 2, 3)
      }.to raise_error(ActiveRecord::RecordNotUnique)

      result = RuuubyRelease.find_by_uid(1, 2, 3)
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
