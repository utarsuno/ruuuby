# coding: utf-8

RSpec.describe 'class/io/dir.rb' do
  context 'extends class[Dir]' do

    it 'has needed aliases' do
      RuuubyTestHelper::IO::CONFIG_DIR[:ruby].∀{|f| expect(::Dir.respond_to?(f)).to eq(true)}
    end

    context 'by adding "static" function{∃?}' do
      context 'handles needed scenarios' do
        # positive cases intentionally omitted for time being
        it 'cases: error' do
          expect{::Dir.∃?(nil)}.to raise_error(ArgumentError)
        end
      end
    end

  end
end
