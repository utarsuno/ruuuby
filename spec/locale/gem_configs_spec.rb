# encoding: UTF-8

RSpec.describe 'gem configs' do

  context 'locale', :locale do

    context 'all gems are healthy' do

      context 'by having correct configs' do

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
          it 'has correct version{3.10.0}' do
            expect(::RSpec::Version::STRING).to eq('3.10.0')
          end
        end # end: {for gem{rspec}}

        context 'for gem{rspec-benchmark}' do
          it 'has correct version{0.6.0}' do
            expect(::RSpec::Benchmark::VERSION).to eq('0.6.0')
          end
        end # end: {for gem{rspec-benchmark}}

        context 'for gem{tty-command}' do
          it 'has correct version{0.10.0}' do
            expect_needed_version(::TTY::Command, '0.10.0', ::TTY::Command::VERSION)
          end
          context 'reports expected config values' do
            context 'for health checks' do
              it 'for func{record_separator}' do
                expect(::TTY::Command.record_separator).to eq($/)
              end
              it 'for func{windows?}' do
                expect(::TTY::Command.windows?).to eq(false)
              end
              it 'thus passing all checks' do
                expect(::TTY::Command.healthy?).to eq(true)
              end
            end
          end
        end # end: {for gem{tty-command}}

        context 'for gem{pg}' do
          it 'has correct version{1.2.3}' do
            expect(::PG::VERSION).to eq('1.2.3')
          end
        end # end: {for gem{pg}}

        context 'for gem{bunny}' do
          it 'has correct version{2.17.0}' do
            # TODO: temp solution (of loading library here)
            require 'bunny'
            expect(::Bunny::VERSION).to eq('2.17.0')
          end
        end # end: {for gem{bunny}}

        context 'for gem{finite_machine}' do
          it 'has correct version{0.14.0}' do
            expect(::FiniteMachine::VERSION).to eq('0.14.0')
          end
        end # end: {for gem{finite_machine}}

      end # end: {by having correct configs}

    end # end: {all gems are healthy}

  end

end
