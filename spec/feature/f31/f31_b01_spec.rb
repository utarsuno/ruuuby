# coding: UTF-8

RSpec.describe 'f31_b01' do

  context 'locale', :locale do
    context 'feature{f31}' do
      context 'behavior{b01}' do

        context 'all health checks' do

          it 'passes health checks' do
            expect(💎.api_git.healthy?).to eq(true)
          end

          it 'has correct repo path' do
            expect(💎.api_git.repo.path).to eq("#{💎.api_git.repo.workdir}.git/")
          end

          it 'has .gitignore file' do
            expect(📁.∃?(💎.api_git.path_gitignore)).to eq(true)
          end

          context 'git config values' do
            let(:cached_configs){💎.api_git.repo.config.to_hash}

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

            context 'for{diff}' do
              it '{renames}' do
                expect(cached_configs['diff.renames']).to eq('true')
              end
              it '{algorithm}' do
                expect(cached_configs['diff.algorithm']).to eq('minimal')
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
            end

          end # end: {git config values}

        end

      end
    end
  end

end
