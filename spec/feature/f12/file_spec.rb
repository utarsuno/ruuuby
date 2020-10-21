# encoding: utf-8

RSpec.describe 'class/io/file.rb' do

  context 'extends class[File]' do

    context 'by adding "static" function{∃?}' do
      context 'handles needed scenarios' do
        # positive cases intentionally omitted for time being
        it 'cases: error' do
          expect{::File.∃?(nil)}.to raise_error(::ArgumentError)
        end
      end
    end

    context 'func{syntax_unix_path}' do
      it 'exists' do
        expect_syntax(::File, :syntax_unix_path, ::File::Syntax::UNIX_PATH)
      end
      context 'handles cases: positive' do
        it 'edge cases' do
          expect('/'.match?(::File.syntax_unix_path)).to eq(true)
          expect('./'.match?(::File.syntax_unix_path)).to eq(true)
          expect('../'.match?(::File.syntax_unix_path)).to eq(true)
          expect('../.'.match?(::File.syntax_unix_path)).to eq(true)
          expect('.././a'.match?(::File.syntax_unix_path)).to eq(true)
          expect('../../a'.match?(::File.syntax_unix_path)).to eq(true)
          expect('/a/a..'.match?(::File.syntax_unix_path)).to eq(true)
          expect('~/'.match?(::File.syntax_unix_path)).to eq(true)
          expect('~/a'.match?(::File.syntax_unix_path)).to eq(true)
          expect('~/a/a'.match?(::File.syntax_unix_path)).to eq(true)
          expect('~/.'.match?(::File.syntax_unix_path)).to eq(true)
          expect('~/..'.match?(::File.syntax_unix_path)).to eq(true)
        end
        it 'typical file paths' do
          expect('/hello.rb'.match?(::File.syntax_unix_path)).to eq(true)
          expect('./hello.rb'.match?(::File.syntax_unix_path)).to eq(true)
          expect('/hello.zip.rb'.match?(::File.syntax_unix_path)).to eq(true)
          expect('./hello.rb.zip'.match?(::File.syntax_unix_path)).to eq(true)
        end
      end
      it 'handles cases: negative' do
        expect('hello.rb'.match?(::File.syntax_unix_path)).to eq(false)
        expect('//'.match?(::File.syntax_unix_path)).to eq(false)
      end
    end

  end

end
