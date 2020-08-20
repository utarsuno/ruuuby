# encoding: UTF-8

RSpec.describe 'f94_db_orm' do

  context 'db_orm', :db do
    context 'feature{f94}' do
      it 'passes ORM audit' do
        audit_feature(f94, 'f94', 0, 'enable a `WebAssembly` based build (for `JS`/`WebGL`)')
      end
    end

  end

end
