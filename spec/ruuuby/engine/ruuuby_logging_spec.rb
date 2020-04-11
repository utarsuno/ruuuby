
# encoding: UTF-8

RSpec.describe 'ruuuby_logging' do

  context 'logging audits', :audits do

    context 'w/ file', :logging_mode => 💎::RuuubyEngine::RuuubyLogging::MODE_FILE.to_s do
      specify { expect { 💎.debug('oof') }.to_not output.to_stdout }
    end

    context 'w/ STDOUT', :logging_mode => 💎::RuuubyEngine::RuuubyLogging::MODE_STDOUT.to_s do
      specify { expect { 💎.debug('oof') }.to output.to_stdout }
    end

    #context 'w/ STDERR', :logging_mode => 💎::RuuubyEngine::RuuubyLogging::MODE_NONE.to_s do
    #  specify { expect { 💎.debug('oof') }.to_not output.to_stdout }
    #end

  end

end
