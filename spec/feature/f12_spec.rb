# encoding: UTF-8

RSpec.describe 'f12' do

  context 'needed global funcs get added to main' do

    context 'func{📁}' do
      it 'aliases ::File' do
        expect(📁).to eq(::File)
      end
    end

    context 'func{📂}' do
      it 'aliases ::File' do
        expect(📂).to eq(::File)
      end
    end

    context 'func{🗄️}' do
      it 'aliases ::Dir' do
        expect(🗄️).to eq(::Dir)
      end
    end

  end

end
