# coding: utf-8

RSpec.describe 'ruuuby_release.rb' do

  context 'ApplicationRecord{RuuubyRelease}' do

    context 'static-functions' do
      context 'adds func{parse_version_str}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            representation_a = 'v9.7.05'
            representation_b = 'v9.7.5'
            representation_c = '9.7.05'
            representation_d = '9.7.5'

            expect(RuuubyRelease.send(:parse_version_str, representation_a)).to eq([9, 7, 5])
            expect(RuuubyRelease.send(:parse_version_str, representation_b)).to eq([9, 7, 5])
            expect(RuuubyRelease.send(:parse_version_str, representation_c)).to eq([9, 7, 5])
            expect(RuuubyRelease.send(:parse_version_str, representation_d)).to eq([9, 7, 5])
          end
          it 'cases: bad params' do
            expect{RuuubyRelease.send(:parse_version_str, nil)}.to raise_error(ArgumentError)
          end
        end
      end
    end

    context 'defines module[Syntax]' do
      it 'exists' do
        expect_∃module(:Syntax, ::RuuubyRelease)
      end

      context 'dynamically adds needed fetch functions' do
        context 'func{syntax_uid}' do
          it 'exists as needed' do
            expect(RuuubyRelease.respond_to?(:syntax_uid)).to eq(true)
            expect(RuuubyRelease.syntax_uid.class).to eq(Regexp)
            expect(RuuubyRelease.syntax_uid.source).to eq("\\A#{RuuubyRelease::Syntax::UID}\\z")
          end
        end
        # TODO: devise design to mark and exclude certain types of patterns (sub-modules likely)
        #context 'func{syntax_sql_uid}' do
        #  it 'exists as needed' do
        #    expect(RuuubyRelease.respond_to?(:syntax_sql_uid)).to eq(true)
        #    expect(RuuubyRelease.syntax_sql_uid.class).to eq(Regexp)
        #    expect(RuuubyRelease.syntax_sql_uid.source).to eq("\\A#{RuuubyRelease::Syntax::SQL_UID}\\z")
        #  end
        #end
      end

      context 'with needed constants' do
        context '::RuuubyRelease::Syntax::UID' do
          it 'exists' do
            expect(RuuubyRelease::Syntax::UID).to eq('(v?)\d.\d.\d(\d?)')
          end
          it "can't be changed" do
            expect{RuuubyRelease::Syntax::UID = 5}.to raise_error(FrozenError)
          end
        end
        context '::RuuubyRelease::Syntax::SQL_UID' do
          it 'exists' do
            expect(RuuubyRelease::Syntax::SQL_UID).to eq('vmajor = ? AND vminor = ? AND vtiny = ?')
          end
          it "can't be changed" do
            expect{RuuubyRelease::Syntax::SQL_UID = 5}.to raise_error(FrozenError)
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
