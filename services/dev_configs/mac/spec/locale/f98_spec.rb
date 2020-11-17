# encoding: UTF-8

RSpec.describe 'ruby' do
  context 'locale', :preferences do

    context 'recommended settings for {compiler}' do

      it '${clang --version} matches ${cc --version}' do
        expect(💻('clang --version')).to eq(💻('cc --version'))
      end

      it '${gcc --version} has correct version' do
        out, err = 💻('gcc --version', true)

        expect(out[0]).to eq("Apple clang version 12.0.0 (clang-1200.0.32.21)")
        expect(out[1]).to eq("Target: x86_64-apple-darwin19.6.0")
        expect(out[2]).to eq("Thread model: posix")
        expect(out[3]).to eq("InstalledDir: /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin")
      end

    end

  end
end
