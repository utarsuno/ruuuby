# encoding: utf-8

RSpec.describe 'class/io/file.rb' do
  context 'extends class[File]' do

    context 'by adding "static" function{∃?}' do
      context 'handles needed scenarios' do
        # positive cases intentionally omitted for time being
        it 'cases: error' do
          expect{::File.∃?(nil)}.to raise_error(ArgumentError)
        end
      end
    end

  end
end
