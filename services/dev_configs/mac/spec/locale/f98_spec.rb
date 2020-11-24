# encoding: UTF-8

RSpec.describe 'ruby' do
  let(:expected_compiler_version){
    [
      "Apple clang version 12.0.0 (clang-1200.0.32.21)",
      "Target: x86_64-apple-darwin19.6.0",
      "Thread model: posix",
      "InstalledDir: /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin"
    ]
  }

  context 'preferences', :preferences do
    context 'recommended settings for {compiler}' do
      it 'w/ clang' do
        expect(💻('clang --version')).to eq(expected_compiler_version)
      end

      it 'w/ cc' do
        expect(💻('cc --version')).to eq(expected_compiler_version)
      end

      it 'w/ gcc' do
        out, err = 💻('gcc --version', true)
        expect(out).to eq(expected_compiler_version)
      end
    end

  end # end: {preferences}
end
