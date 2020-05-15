# coding: UTF-8

RSpec.describe 'ruuuby_release.rb' do

  context 'db', :db do
    context 'ApplicationRecord{RuuubyRelease}' do
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

        context 'adds func{find_by_uid}' do
          context 'handles needed scenarios' do
            it 'cases: positive' do
              expect(RuuubyRelease.find_by_uid('v0.0.26')).to eq(RuuubyRelease.find_by_uid(0, 0, 26))
              expect(RuuubyRelease.find_by_uid('0.0.26')).to eq(RuuubyRelease.find_by_uid(0, 0, 26))
            end
            it 'cases: negative' do
              expect{RuuubyRelease.find_by_uid(0, 0, 1337)}.to raise_error(RuntimeError)
            end
          end
        end

        context 'adds func{get_version_prev}' do
          it 'works' do
            expect(RuuubyRelease.get_version_prev).to eq(v0_0_32)
          end
        end

        context 'adds func{get_version_curr}' do
          it 'works' do
            expect(RuuubyRelease.get_version_curr).to eq(v0_0_33)
          end
          it 'matches `GitCommit`\'s func{get_latest} return value' do
            expect(RuuubyRelease.get_version_curr.git_commits.last).to eq(GitCommit.get_latest)
          end
        end

        context 'adds func{get_version_next}' do
          it 'works' do
            expect(RuuubyRelease.get_version_next).to eq(v0_0_34)
          end
        end

        context 'defines module[Syntax]' do
          it 'exists' do
            expect_∃module(:Syntax, ::RuuubyRelease)
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

      context 'instance-functions' do
        context 'adds func{released!}' do

          before :all do
            @fake_release           = RuuubyRelease.spawn(1, 2, 3)
            @fake_release_w_commits = RuuubyRelease.spawn(3, 2, 1)
            expect(@fake_release_w_commits.num_commits).to eq(0)
            @fake_release_w_commits.spawn_git_commit('fake_str', '2019-12-31T18:03:39-0600', '0123456789012345678901234567890123456789')
            expect(@fake_release_w_commits.num_commits).to eq(1)
          end

          after :all do
            @fake_release.♻️!
            @fake_release_w_commits.♻️!
          end

          context 'handles needed scenarios' do
            it 'cases: positive' do
              expect(@fake_release_w_commits.released).to eq(false)
              @fake_release_w_commits.released!
              expect(@fake_release_w_commits.released).to eq(true)
              @fake_release_w_commits.released!(false)
              expect(@fake_release_w_commits.released).to eq(false)
              @fake_release_w_commits.released!(true)
              expect(@fake_release_w_commits.released).to eq(true)
            end
            context 'cases: error' do
              it 'bad args' do
                expect{@fake_release.released!(nil)}.to raise_error(ArgumentError)
              end
              it 'no git-commits attached, can\'t set to released' do
                expect{@fake_release.released!}.to raise_error(RuntimeError)
                expect{@fake_release_w_commits.released!}.to_not raise_error
              end
            end
          end
        end
        context 'adds func{<}' do
          context 'handles needed cases' do
            it 'RuuubyRelease ORM objects index order is sorted' do
              RuuubyRelease.all.∀τ²∈λ𝑓₍ᵢ،ᵢ₊₁₎{|prev, curr| expect(prev < curr && curr > prev).to eq(true)}
            end
            it 'cases: positive' do
              expect(v0_0_24.<(v0_0_25)).to eq(true)
            end
            it 'cases: negative' do
              expect(v0_0_25.<(v0_0_24)).to eq(false)
            end
            it 'cases: error' do
              expect{v0_0_24.<(nil)}.to raise_error(ArgumentError)
            end
          end
        end
        context 'adds func{>}' do
          context 'handles needed cases' do
            it 'cases: positive' do
              expect(v0_0_25.>(v0_0_24)).to eq(true)
            end
            it 'cases: negative' do
              expect(v0_0_24.>(v0_0_25)).to eq(false)
            end
            it 'cases: error' do
              expect{v0_0_24.>(nil)}.to raise_error(ArgumentError)
            end
          end
        end
      end # end: {instance-functions}
    end # end: {RuuubyRelease}
  end # end: {db}
end
