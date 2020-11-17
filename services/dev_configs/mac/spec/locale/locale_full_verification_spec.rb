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

    # @see https://en.wikipedia.org/wiki/History_of_Python
    context 'other coding languages' do
      context 'python' do
        it 'has expected version{3.9.0}' do
          expect(💻('python3 --version')).to eq('Python 3.9.0')
        end
      end
      context 'java' do
        it 'has correct version{13.0.2}' do
          expect(💻('java --version')).to eq(['openjdk 13.0.2 2020-01-14', 'OpenJDK Runtime Environment (build 13.0.2+8)', 'OpenJDK 64-Bit Server VM (build 13.0.2+8, mixed mode, sharing)'])
        end
      end
    end

  end
end
