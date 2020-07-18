# encoding: UTF-8

RSpec.describe 'f12_db_orm' do

  context 'db_orm', :db do
    context 'defines f12' do
      it 'passes ORM audit' do
        audit_feature(f12, 'f12', 2, 'enable more simple `file/directory io`')
      end

      context 'defines behaviors' do
        it 'has{b00}' do
          audit_feature_behavior(f12, f12_b00, 'b00', 'offer Class aliases: {`📁` -> `File`}, {`🗄️` -> `Dir`}')
        end

        it 'has{b01}' do
          audit_feature_behavior(f12, f12_b01, 'b01', "offer a light layer over `Ruby's` loadable `CSV` data parsing")
        end

      end

    end
  end

end
