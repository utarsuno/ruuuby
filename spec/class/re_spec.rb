# encoding: UTF-8

RSpec.describe 're.rb' do

  context 'extends class{Regexp}' do

    context 'adding needed functions' do
      context 'static-function{closed_match} handles needed scenarios' do
        it 'cases: positive' do
          result = ::Regexp.closed_match('abc')
          expect(result.ⓣ).to eq(::Regexp)
          expect(result.source).to eq('\Aabc\z')
        end
        it 'cases: positive (w/ only partial modifications)' do
          result = ::Regexp.closed_match('\Aabc')
          expect(result.ⓣ).to eq(::Regexp)
          expect(result.source).to eq('\Aabc\z')

          result2 = ::Regexp.closed_match('abc\z')
          expect(result2.ⓣ).to eq(::Regexp)
          expect(result2.source).to eq('\Aabc\z')

          result3 = ::Regexp.closed_match('\Aabc\z')
          expect(result3.ⓣ).to eq(::Regexp)
          expect(result3.source).to eq('\Aabc\z')
        end
        it 'cases: error' do
          expect{::Regexp.closed_match(nil)}.to raise_error(::ArgumentError)
          expect{::Regexp.closed_match([])}.to raise_error(::ArgumentError)
          expect{::Regexp.closed_match(5)}.to raise_error(::ArgumentError)
        end
      end
    end

  end

  #  __   ___  __   ___  __   __                   __   ___
  # |__) |__  |__) |__  /  \ |__)  |\/|  /\  |\ | /  ` |__
  # |    |___ |  \ |    \__/ |  \  |  | /~~\ | \| \__, |___
  context 'performance', :performance do

    context 'the following performs very quickly' do
      it 'static-func{closed_match}' do
        expect{::Regexp.closed_match('abc')}.to perform_very_quickly
      end
    end

  end

end
