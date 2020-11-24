# encoding: UTF-8

RSpec.describe 'ruby' do
  context 'locale', :preferences do

    # @see https://stackoverflow.com/questions/17980759/xcode-select-active-developer-directory-error
    context 'configs for xcode' do
      context 'xcode-select' do
        it 'has needed version' do
          expect(💻('xcode-select --version')).to eq('xcode-select version 2373.')
        end
        it 'has needed path' do
          # @see https://github.com/nodejs/node-gyp/issues/569
          # to change path after fresh xcode installation: `sudo xcode-select -s /Applications/Xcode.app/Contents/Developer`
          expect(💻('xcode-select --print-path')).to eq('/Applications/Xcode.app/Contents/Developer')
        end
      end
      context 'xcodebuild' do
        it 'has needed version' do
          expect(💻('xcodebuild -version')).to eq(["Xcode 12.1", "Build version 12A7403"])
        end
      end
    end

    context 'other coding languages' do
      context 'Python' do
        it 'has expected version{3.9.0}' do
          expect(💻('python3 --version')).to eq('Python 3.9.0')
        end
      end
      context 'Java' do
        it 'has correct version{13.0.2}' do
          expect(💻('java --version')).to eq(['openjdk 13.0.2 2020-01-14', 'OpenJDK Runtime Environment (build 13.0.2+8)', 'OpenJDK 64-Bit Server VM (build 13.0.2+8, mixed mode, sharing)'])
        end
      end
      context 'PHP' do
        it 'has expected version{7.4.12}' do
          expect(💻('php --version')).to eq(["PHP 7.4.12 (cli) (built: Oct 29 2020 18:37:21) ( NTS )", "Copyright (c) The PHP Group", "Zend Engine v3.4.0, Copyright (c) Zend Technologies", "    with Zend OPcache v7.4.12, Copyright (c), by Zend Technologies"])
        end
      end
      context 'JS' do
        it 'found expected npm version' do
          expect(💻('npm -v')).to eq('6.14.4')
        end
        it 'found expected node version' do
          expect(💻('node -v')).to eq('v15.2.1')
        end
        it 'found expected yarn version' do
          expect(💻('yarn -v')).to eq('1.22.10')
        end
      end
    end

  end
end
