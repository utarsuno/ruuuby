# coding: utf-8

RSpec.describe Ruuuby do
  let(:configs_gems){::RuuubyConfigs::GemDependencies}
  let(:configs_dev){configs_gems::EnvironmentDevelopment::ALL_GEMS}
  let(:configs_prod){configs_gems::EnvironmentRuntime::ALL_GEMS}

  context 'Ruuuby added as module' do
    it 'exists' do
      expect(∃module?(:Ruuuby)).to eq(true)
    end
    context 'and adds needed sub-modules & classes' do
      it 'module(VERSION) under module(::Ruuuby)' do
        expect(∃module?(:Version, ::Ruuuby)).to eq(true)
      end
      it 'module(Err) under module(::Ruuuby)' do
        expect(∃module?(:ParamErr, ::Ruuuby)).to eq(true)
      end
      it 'class(WrongParamType) under module(::Ruuuby::ParamErr)' do
        expect(∃class?(:WrongParamType, ::Ruuuby::ParamErr)).to eq(true)
      end
    end
  end

#                   __          ___     __
#   /\     |  |    |  \    |     |     /__`
#  /~~\    \__/    |__/    |     |     .__/

  context 'audits', :'audits' do

    context 'running with correct configs' do
      it 'ruby version is correct' do
        expect(RUBY_VERSION).to eq('2.7.0')
        expect(RUBY_PLATFORM).to eq('x86_64-darwin18')
        expect(RUBY_PATCHLEVEL).to eq(0)
        expect(RUBY_REVISION).to eq('647ee6f091eafcce70ffb75ddf7e121e192ab217')
      end
    end

    context 'has correct gem versions' do
      context 'bundler is healthy' do
        it 'by having correct configs' do
          expect(Bundler.requires_sudo?).to eq(false)
          expect(Bundler::VERSION).to eq(configs_dev[configs_gems::GEM_BUNDLER])
        end
      end

      context 'tty-command is healthy' do
        it 'by having correct configs' do
          expect(TTY::Command::VERSION).to eq(configs_dev[configs_gems::GEM_TTY_COMMAND])
        end
      end

      context 'rdoc is healthy' do
        it 'by having correct configs' do
          expect(RDoc::VERSION).to eq(configs_dev[configs_gems::GEM_RDOC])
        end
      end

      context 'rake is healthy' do
        it 'by having correct configs' do
          expect(Rake::VERSION).to eq(configs_dev[configs_gems::GEM_RAKE])
        end
      end

      context 'rspec is healthy' do
        it 'by having correct configs' do
          expect(RSpec::Version::STRING).to eq(configs_dev[configs_gems::GEM_RSPEC])
        end
      end

      context 'rspec-benchmark is healthy' do
        it 'by having correct configs' do
          expect(RSpec::Benchmark::VERSION).to eq(configs_dev[configs_gems::GEM_RSPEC_BENCHMARK])
        end
      end
    end

    context 'README.md examples' do
      it 'works as described' do
        expect(√(25) == 5).to eq(true)

        expect('b'.∈? 'abc').to eq(true)
        expect('abc'.∌? 'd').to eq(true)
        expect('d'.∈? 'abc').to eq(false)

        data = {hello: 'world', ye: 'ee'}
        expect([data.🔑?(:hello), data.🔑?(:non_existing_key)]).to eq([true, false])

        expect([1, 'a', 2, nil, [], 2].≈ [nil, 2, 2, 'a', 1, []]).to eq(true)

        expect([-5.ℕ?, 7.0.ℤ?, Complex(Float::NAN).ℝ?, Rational(2, 3).ℚ?]).to eq([false, true, false, true])

        expect([1, 2, 3].⊕ [3, 4]).to eq([1, 4, 2])

        expect([2, 3, 4].∖ [1, 2, 3]).to eq([4])
      end
    end
  end

end
