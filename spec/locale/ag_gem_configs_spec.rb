# coding: UTF-8

# wip
RSpec.describe '[AutomaticGeneration]: gem configs' do

  context 'locale', :locale do

    context 'all gems are healthy' do

      context 'by having correct configs' do

        context 'for gem{bundler}' do
          it 'has correct version{2.1.4}' do
            expect(::Bundler::VERSION).to eq('2.1.4')
          end
          it 'does not requires sudo' do
            expect(Bundler.requires_sudo?).to eq(false)
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
          it 'has correct version{0.5.1}' do
            expect(::RSpec::Benchmark::VERSION).to eq('0.5.1')
          end
        end # end: {for gem{rspec-benchmark}}

        context 'for gem{tty-command}' do
          it 'has correct version{0.9.0}' do
            expect(::TTY::Command::VERSION).to eq('0.9.0')
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
          it 'has correct version{1.0.0}' do
            expect(::Rugged::VERSION).to eq('1.0.0')
          end
        end # end: {for gem{rugged}}

      end # end: {by having correct configs}

      context 'by having recommended configs' do

        # during 2.7.0->2.7.1 migration; 3.1.2->3.1.4
        # verifiable w/ cmd: `gem -v`
        context 'for gem{rubygems-update}' do
          it 'has correct version{3.1.4}' do
            expect(::Gem.rubygems_version.to_s).to eq('3.1.4')
          end
        end # end: {for gem{rubygems-update}}

      end # end: {by having recommended configs}

    end # end: {all gems are healthy}

  end

end
