# coding: UTF-8

RSpec.describe 'f31_db' do

  context 'db', :db do

    context 'defines{f31}' do
      it 'passes ORM audit' do
        audit_feature(f31, 'f31', 'provide a `GIT API`')
      end

      context 'defines behaviors' do
        it 'has correct number of behaviors{2}' do
          expect(f31.ruuuby_feature_behaviors.length).to eq(2)
        end

        context '{b00}' do
          it 'w/ passing audits' do
            audit_feature_behavior(f31, f31_b00, 'b00', 'offers an abstraction over the `Rugged` gem')
          end
          it 'provides correct value for latest commit hash' do
            expect(💎.api_git.repo.last_commit.oid).to eq(GitCommit.get_latest.commit_hash)
          end
        end

        it 'defines{b01}' do
          audit_feature_behavior(f31, f31_b01, 'b01', 'offers health checks for current local dev state')
        end

      end # end: {defines behaviors}

    end # end: {defines{f31}}

  end

end
