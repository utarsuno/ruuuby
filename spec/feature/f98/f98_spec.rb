# coding: UTF-8

RSpec.describe 'f98' do

  context 'feature{f98} functionality' do

    context 'C-extensions' do
      context 'defines needed globals' do
        context 'readonly_global{$PRM_MANY}' do
          it 'exists' do
            expect($PRM_MANY).to eq(:'*args')
          end
          it "can't be changed" do
            expect{$PRM_MANY = 5}.to raise_error(NameError)
          end
        end
      end
    end

  end

end
