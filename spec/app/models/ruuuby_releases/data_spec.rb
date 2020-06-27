# coding: UTF-8

RSpec.describe 'ruuuby_releases.rb' do

  context 'ApplicationRecord{RuuubyRelease}', :db do

    context 'static-functions' do

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
          expect(RuuubyRelease.get_version_prev.uid_components).to eq(💎.engine.api_git.remote_release_previous[0])
        end
        it 'correctly matching against the get_release_commit' do
          expect(RuuubyRelease.get_version_prev.get_release_commit.commit_hash).to eq(💎.engine.api_git.remote_release_previous[1])
        end
      end

      context 'adds func{get_version_curr}' do
        it 'works' do
          expect(RuuubyRelease.get_version_curr.uid_components).to eq(💎.engine.api_git.remote_release_current[0])
        end
        it 'correctly matching against the get_release_commit' do
          expect(RuuubyRelease.get_version_curr.get_release_commit.commit_hash).to eq(💎.engine.api_git.remote_release_current[1])
        end
      end

      context 'adds func{get_version_next}' do
        it 'works' do
          expect(RuuubyRelease.get_version_next).to eq(v0_0_44)
        end
      end

    end # end: {static-functions}

    context 'instance-functions' do
      context 'RuuubyRelease ORM objects index order is sorted' do
        it 'ascending' do
          RuuubyRelease.all.∀τ²∈λ𝑓₍ᵢ،ᵢ₊₁₎{|prev, curr| expect(prev < curr && curr > prev).to eq(true)}
        end
      end
      context 'adds func{<}' do
        context 'handles needed cases' do
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

end
