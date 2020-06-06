# coding: UTF-8

RSpec.describe 'f12_db' do

  context 'db', :db do
    context 'defines f12' do
      it 'passes ORM audit' do
        audit_feature(f12, 'f12', 'enable more simple `file/directory io`')
      end

      context 'defines behaviors' do
        it 'has correct number of behaviors{1}' do
          expect(f12.ruuuby_feature_behaviors.length).to eq(1)
        end

        it 'has{b00}' do
          audit_feature_behavior(f12, f12_b00, 'b00', 'offer Class aliases: {`📁` -> `File`}, {`🗄️` -> `Dir`}')
        end

      end

    end
  end

end
