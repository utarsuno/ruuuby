# encoding: UTF-8

RSpec.describe 'f39' do

  context 'can validate URLs' do
    context 'handling needed scenarios' do
      it 'cases: positive' do
        # @see https://stackoverflow.com/questions/1128168/validation-for-url-domain-using-regex-rails
        expect(🌐.syntax_url.match?('example.com')).to eq(true)
        expect(🌐.syntax_url.match?('sub.example.com')).to eq(true)
        expect(🌐.syntax_url.match?('sub.domain.my-example.com')).to eq(true)
        expect(🌐.syntax_url.match?('example.com/?stuff=true')).to eq(true)
        expect(🌐.syntax_url.match?('example.com:5000/?stuff=true')).to eq(true)
        expect(🌐.syntax_url.match?('sub.domain.my-example.com/path/to/file/hello.html')).to eq(true)
        expect(🌐.syntax_url.match?('hello.museum')).to eq(true)
        expect(🌐.syntax_url.match?('http://ruuuby.com')).to eq(true)
        expect(🌐.syntax_url.match?('https://ruuuby.com')).to eq(true)
      end
      it 'cases: negative' do
        expect(🌐.syntax_url.match?('/')).to eq(false)
        expect(🌐.syntax_url.match?('...example.com')).to eq(false)
        expect(🌐.syntax_url.match?('sub.domain...')).to eq(false)
        expect(🌐.syntax_url.match?('example.com?/??stuff=true')).to eq(false)
        expect(🌐.syntax_url.match?('example.com:13375000/?stuff=true')).to eq(false)
        expect(🌐.syntax_url.match?('1337/sub.domain.my-example.com/path/to/file/hello.html')).to eq(false)
        expect(🌐.syntax_url.match?('hello.:1337/museum')).to eq(false)
        expect(🌐.syntax_url.match?('httphttp://ruuuby.com')).to eq(false)
        expect(🌐.syntax_url.match?('https:///ruuuby.com//')).to eq(false)
      end
    end
  end

  context '{f39} passes locale config verifications', :locale do
    context 'by having correct configs' do
      it 'w/ HTTP version{1.1}' do
        expect(::Net::HTTP::HTTPVersion).to eq('1.1')
      end
      it 'is marked multi-user safe' do
        expect(::Net::HTTP::ENVIRONMENT_VARIABLE_IS_MULTIUSER_SAFE).to eq(true)
      end
    end
  end # end: {defines{f39}}

end
