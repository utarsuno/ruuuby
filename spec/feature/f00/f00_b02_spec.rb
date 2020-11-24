# encoding: UTF-8

RSpec.describe 'f00_b02' do

  context 'functionality' do
  end # end: {functionality}

  context 'audit', :audit do
    context 'funcs provided are defined in correct location' do
      it 'for ENV' do
        expect_∃⨍(:∃?, ENV)
        expect_∃⨍(:∄?, ENV)
      end
      it 'for IO classes' do
        expect(::Dir.respond_to?(:∃?)).to eq(true)
        expect(::File.respond_to?(:∃?)).to eq(true)
        expect(::Dir.respond_to?(:∄?)).to eq(true)
        expect(::File.respond_to?(:∄?)).to eq(true)
      end
    end
  end # end: {audit}

  context 'performance', :performance do
  end # end: {performance}

end
