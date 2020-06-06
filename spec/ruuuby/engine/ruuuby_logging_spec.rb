
# encoding: UTF-8

RSpec.describe 'ruuuby_logging' do

  context 'functionality' do
    context 'static funcs' do
      context 'func{validate_logging_mode}' do
        context 'handles needed scenarios' do
          context 'cases: positive' do
            it 'single mode' do
              expect(💎.meta_logging.validate_logging_mode('none')).to eq(['none'])
              expect(💎.meta_logging.validate_logging_mode('stdout')).to eq(['stdout'])
              expect(💎.meta_logging.validate_logging_mode('stderr')).to eq(['stderr'])
              expect(💎.meta_logging.validate_logging_mode('file')).to eq(['file'])
            end
            it 'dual mode' do
              expect(💎.meta_logging.validate_logging_mode('file|stdout')).to eq(%w(file stdout))
              expect(💎.meta_logging.validate_logging_mode('stdout|file')).to eq(%w(file stdout))
              expect(💎.meta_logging.validate_logging_mode('file|stderr')).to eq(%w(file stderr))
              expect(💎.meta_logging.validate_logging_mode('stderr|file')).to eq(%w(file stderr))
            end
          end
          context 'cases: negative' do
            it 'single mode' do
              expect{💎.meta_logging.validate_logging_mode('')}.to raise_error(RuntimeError)
              expect{💎.meta_logging.validate_logging_mode('|')}.to raise_error(RuntimeError)
              expect{💎.meta_logging.validate_logging_mode('n')}.to raise_error(RuntimeError)
            end
            it 'dual mode' do
              expect{💎.meta_logging.validate_logging_mode('stdout|stdout')}.to raise_error(RuntimeError)
              expect{💎.meta_logging.validate_logging_mode('stdout|stderr')}.to raise_error(RuntimeError)
              expect{💎.meta_logging.validate_logging_mode('file|none')}.to raise_error(RuntimeError)
              expect{💎.meta_logging.validate_logging_mode('file|file')}.to raise_error(RuntimeError)
              expect{💎.meta_logging.validate_logging_mode('file|stdout|stderr')}.to raise_error(RuntimeError)
              expect{💎.meta_logging.validate_logging_mode('none|none')}.to raise_error(RuntimeError)
              expect{💎.meta_logging.validate_logging_mode(' file | stdout')}.to raise_error(RuntimeError)
              expect{💎.meta_logging.validate_logging_mode('file|stdout  ')}.to raise_error(RuntimeError)
            end
          end
        end
      end # end: {func{validate_logging_mode}}
    end # end: {static funcs}
  end # end: {functionality}

  context 'logging audits', :audit do

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
