# encoding: UTF-8

RSpec.describe 'f31_b01' do
  let(:git_api){💎.engine.api_locale.api_git}

  context 'locale', :locale do

    context 'feature{f31}' do
      context 'behavior{b01}' do
        context 'all health checks' do

          context 'passes health checks' do
            it 'standard' do
              expect(git_api.healthy?).to eq(true)
            end
            it 'full' do
              expect(git_api.healthy?(true)).to eq(true)
              expect(git_api.∃fixable_syntax_errors?).to eq(false)
              expect(git_api.∃index_conflicts?).to eq(false)
              expect(git_api.version_libgit2).to eq([1, 0, 1])
              expect(::Rugged::VERSION).to eq('1.0.1')
            end
          end

          context 'needed local paths are found' do
            it 'for repo' do
              expect(git_api.repo.path).to eq("#{💎.engine.path_base}.git/")
            end
            it 'for .gitignore' do
              expect(::File.∃?('.gitignore')).to eq(true)
              expect(::File.∃?("#{💎.engine.path_base}.gitignore")).to eq(true)
              expect(::Rugged.dotgit_ignore?('.gitignore')).to eq(true)
              expect(::Rugged.dotgit_ignore?('.gitattributes')).to eq(false)
            end
            it 'for .gitattributes' do
              expect(::File.∃?('.gitattributes')).to eq(true)
              expect(::File.∃?("#{💎.engine.path_base}.gitattributes")).to eq(true)
              expect(::Rugged.dotgit_attributes?('.gitignore')).to eq(false)
              expect(::Rugged.dotgit_attributes?('.gitattributes')).to eq(true)
            end
          end

          it 'has correct repo path' do
            expect(git_api.repo.path).to eq("#{💎.engine.path_base}.git/")
          end

          context 'git config values' do
            let(:cached_configs){git_api.repo.config.to_hash}

            context 'for{protocol}' do
              it '{version}' do
                expect(cached_configs['protocol.version']).to eq('2')
              end
            end

            context 'for{i18n}' do
              it '{commitEncoding}' do
                expect(cached_configs['i18n.commitencoding']).to eq('utf-8')
              end
              it '{logOutputEncoding}' do
                expect(cached_configs['i18n.logoutputencoding']).to eq('utf-8')
              end
            end

            context 'for{core}' do
              it 'cases: true' do
                expect(cached_configs['core.precomposeunicode']).to eq('true')
                expect(cached_configs['core.warnambiguousrefs']).to eq('true')
                expect(cached_configs['core.filemode']).to eq('true')
              end
              it 'cases: false' do
                expect(cached_configs['core.autocrlf']).to eq('false')
                expect(cached_configs['core.bare']).to eq('false')
                expect(cached_configs['core.ignorecase']).to eq('false')
              end
            end

            context 'for{advice}' do
              it 'w/ git status' do
                expect(cached_configs['advice.statushints']).to eq('false')
                expect(cached_configs['advice.statusuoption']).to eq('true')
              end
            end

            context 'for{diff}' do
              it '{renames}' do
                expect(cached_configs['diff.renames']).to eq('true')
              end
              it '{algorithm}' do
                # mini-changelog
                # | version | value     |
                # | ------- | --------- |
                # | 0.0.48  | minimal   |
                # | 0.0.49+ | histogram |
                expect(cached_configs['diff.algorithm']).to eq('histogram')
              end
            end

            context 'for{push}' do
              it '{default}' do
                expect(cached_configs['push.default']).to eq('simple')
              end
            end

            context 'for{color}' do
              it '{ui}' do
                expect(cached_configs['color.ui']).to eq('auto')
              end
              it '{status}' do
                expect(cached_configs['color.status.added']).to eq('cyan')
                expect(cached_configs['color.status.changed']).to eq('yellow')
                expect(cached_configs['color.status.untracked']).to eq('red')
              end
            end

          end # end: {git config values}
        end # end: {all health checks}
      end # end: {f31_b01}
    end
  end # end: {locale}

end
