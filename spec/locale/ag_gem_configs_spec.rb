# coding: UTF-8

# wip
RSpec.describe '[AutomaticGeneration]: gem configs' do

  context 'locale', :locale do

    context 'all gems are healthy' do

      context 'by having correct configs' do

        context 'for gem{bundler}' do
          context 'has correct version{2.2.0.rc.1}' do
            it 'as defined by {Bundler}' do
              expect(::Bundler::VERSION).to eq('2.2.0.rc.1')
            end
            it 'as defined by {Gem}' do
              expect(Gem::BundlerVersionFinder.bundler_version.to_s).to eq(::Bundler::VERSION)
            end
          end
          it 'does not requires sudo (depending on OS)' do
            if 💎.engine.os.mac?
              expect(::Bundler.requires_sudo?).to eq(false)
            elsif 💎.engine.os.unix
              # currently, only Alpine-Linux is supported/expected, which will run w/ user{`root`}
              expect(::Bundler.requires_sudo?).to eq(true)
            else
              # ¯\_(ツ)_/¯
            end
          end
        end # end: {for gem{bundler}}

        context 'for gem{rdoc}' do
          it 'has correct version{6.2.1}' do
            expect(::RDoc::VERSION).to eq('6.2.1')
          end
        end # end: {for gem{rdoc}}

        context 'for gem{rake}' do
          it 'has correct version{13.0.1}' do
            expect(::Rake::VERSION).to eq('13.0.1')
          end
        end # end: {for gem{rake}}

        context 'for gem{rspec}' do
          it 'has correct version{3.9.0}' do
            expect(::RSpec::Version::STRING).to eq('3.9.0')
          end
        end # end: {for gem{rspec}}

        context 'for gem{rspec-benchmark}' do
          it 'has correct version{0.6.0}' do
            expect(::RSpec::Benchmark::VERSION).to eq('0.6.0')
          end
        end # end: {for gem{rspec-benchmark}}

        context 'for gem{tty-command}' do
          it 'has correct version{0.9.0}' do
            expect(::TTY::Command::VERSION).to eq('0.9.0')
          end
          context 'reports expected config values' do
            it 'for func{record_separator}' do
              expect(::TTY::Command.record_separator).to eq("\n")
            end
            it 'for func{windows?}' do
              expect(::TTY::Command.windows?).to eq(false)
            end
            it 'helpful ENV_VARs are set' do
              path_to_ruby = ::File.join(::RbConfig::CONFIG['bindir'], ::RbConfig::CONFIG['ruby_install_name'] + ::RbConfig::CONFIG['EXEEXT'])
              expect(ENV['RUBY']).to eq(path_to_ruby)
              expect(::RbConfig.ruby).to eq(path_to_ruby)
            end
          end
        end # end: {for gem{tty-command}}

        context 'for gem{sqlite3}' do
          it 'has correct version{1.4.2}' do
            expect(::SQLite3::VERSION).to eq('1.4.2')
          end
        end # end: {for gem{sqlite3}}

        context 'for gem{activerecord}' do
          it 'has correct version{5.2.4.3}' do
            expect(::ActiveRecord::VERSION::STRING).to eq('5.2.4.3')
          end
        end # end: {for gem{activerecord}}

        context 'for gem{rugged}' do
          it 'has correct version{1.0.1}' do
            expect(::Rugged::VERSION).to eq('1.0.1')
          end
        end # end: {for gem{rugged}}

      end # end: {by having correct configs}

    end # end: {all gems are healthy}

  end

end
