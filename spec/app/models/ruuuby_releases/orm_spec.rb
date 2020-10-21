# encoding: UTF-8

RSpec.describe 'ruuuby_releases.rb' do

  context 'ApplicationRecord{RuuubyReleases}', :db do

    context 'ORM operations' do
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
        result = RuuubyRelease[1, 2, 3]
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

    context 'static-functions' do
      context 'adds func{parse_uid_str}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect(RuuubyRelease.parse_uid_str('v9.7.05')).to eq([9, 7, 5])
            expect(RuuubyRelease.parse_uid_str('v9.7.5')).to eq([9, 7, 5])
            expect(RuuubyRelease.parse_uid_str('9.7.05')).to eq([9, 7, 5])
            expect(RuuubyRelease.parse_uid_str('9.7.5')).to eq([9, 7, 5])
            expect(RuuubyRelease.parse_uid_str('v9.7.5 release')).to eq([9, 7, 5])
            expect(RuuubyRelease.parse_uid_str('v9.7.5 version')).to eq([9, 7, 5])
            expect(RuuubyRelease.parse_uid_str('v9.7.05 release')).to eq([9, 7, 5])
            expect(RuuubyRelease.parse_uid_str('v9.7.05 version')).to eq([9, 7, 5])
          end
          it 'cases: bad params' do
            expect{RuuubyRelease.parse_uid_str(nil)}.to raise_error(ArgumentError)
          end
        end
      end

      context 'defines module[Syntax]' do
        it 'exists' do
          expect_∃ᵐ(:Syntax, ::RuuubyRelease)
        end
        context 'dynamically adds needed fetch functions' do
          context 'func{syntax_uid}' do
            it 'exists as needed' do
              expect_syntax(RuuubyRelease, :syntax_uid, RuuubyRelease::Syntax::UID)
            end
          end
        end # end: {dynamically adds needed fetch functions}
        context 'with needed constants (that are not cached)' do
          context 'exist as needed' do
            it '::RuuubyRelease::Syntax::SQL_UID' do
              expect_syntax_wo_cache(RuuubyRelease, :SQL_UID, RuuubyRelease::Syntax::SQL_UID)
            end
          end
        end # end: {with needed constants (that are not cached)}
      end # end: {defines module[Syntax]}
    end # end: {static-functions}

  end

end
