# encoding: UTF-8

RSpec.describe 'f00_b05' do
  let(:f00_b05){💎.engine.stats_ext['F00_B05']}

  context 'needed global funcs get added to main' do
    context 'func{📁}' do
      it 'aliases File' do
        if f00_b05
          expect(📁).to eq(::File)
        else
          expect{📁}.to raise_error(::NameError)
        end
      end
    end
    context 'func{🗄️}' do
      it 'aliases Dir' do
        if f00_b05
          expect(🗄️).to eq(::Dir)
        else
          expect{🗄️}.to raise_error(::NameError)
        end
      end
    end
  end

end
