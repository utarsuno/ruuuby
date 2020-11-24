# encoding: UTF-8

=begin
RSpec.describe 'f31_b01' do

  context 'locale', :locale do

    context 'feature{f31}' do
      context 'behavior{b01}' do
        context 'all health checks' do

          context 'passes health checks' do
            it 'standard' do
              expect($git.healthy?).to eq(true)
            end
            it 'full' do
              expect($git.healthy?(true)).to eq(true)
              expect($git.∃fixable_syntax_errors?).to eq(false)
              expect($git.∃index_conflicts?).to eq(false)
              expect(::Rugged.libgit2_version).to eq([1, 0, 1])
              expect(::Rugged::VERSION).to eq('1.0.1')
            end
          end

          context 'needed local paths are found' do
            it 'for repo' do
              expect($git.repo.path).to eq("#{💎.engine.path_base}.git/")
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
            expect($git.repo.path).to eq("#{💎.engine.path_base}.git/")
          end

          context 'git config values' do
            let(:cached_configs){$git.repo.config.to_hash}

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
                # @see https://git.furworks.de/opensourcemirror/git/commit/e92d62253
                expect(cached_configs['core.checkroundtripencoding']).to eq('SHIFT-JIS')
                expect(cached_configs['core.precomposeunicode']).to eq('true')
                expect(cached_configs['core.warnambiguousrefs']).to eq('true')
                expect(cached_configs['core.filemode']).to eq('true')
                expect(cached_configs['core.protecthfs']).to eq('true')
                expect(cached_configs['core.checkstat']).to eq('default')
                expect(cached_configs['core.eol']).to eq('lf')
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

            context 'for{branch}' do
              it '{autosetuprebase}' do
                # @see https://stevenharman.net/git-pull-with-automatic-rebase
                expect(cached_configs['branch.autosetuprebase']).to eq('always')
              end
            end

            context 'for{diff}' do
              it '{renames}' do
                expect(cached_configs['diff.renames']).to eq('copies')
              end
              it '{algorithm}' do
                expect(cached_configs['diff.algorithm']).to eq('histogram')
              end

              context 'with custom config{image}' do
                it 'has needed settings' do
                  expect(cached_configs['diff.image.textconv']).to eq('exif')
                  expect(cached_configs['diff.image.cachetextconv']).to eq('true')
                end
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
=end
