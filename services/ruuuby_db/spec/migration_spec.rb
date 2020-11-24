# encoding: UTF-8

RSpec.describe 'db/db.rb' do
  let(:api){Ruuuby::MetaData.engine.orm.db_orm}
  let(:table_name){'mock_data'}

  context 'db_new', :db_new do

    before :all do
      @mock = CreateMockData.new
      @mock.down
    end

    context 'has utility funcs from{init.sql}' do

      context 'func{does_func_exit}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect(api.∃⨍?('does_func_exist')).to eq(true)
            expect(api.∃⨍?('get_all_funcs')).to eq(true)
            expect(api.∃⨍?('does_func_schema_match')).to eq(true)
            expect(api.∃⨍?('does_table_exist')).to eq(true)
            expect(api.∃⨍?('get_all_table_names')).to eq(true)
            expect(api.∃⨍?('get_all_table_name_schema_pairs')).to eq(true)
            expect(api.∃⨍?('table_size_stats')).to eq(true)
            expect(api.∃⨍?('db_size_stats')).to eq(true)
            expect(api.∃⨍?('db_active_connections')).to eq(true)
          end
          it 'cases: negative' do
            expect(api.∃⨍?('does_func_existdoes_func_exist')).to eq(false)
            expect(api.∃⨍?('')).to eq(false)
            expect(api.∃⨍?('1')).to eq(false)
            expect(api.∃⨍?(' ')).to eq(false)
            expect(api.∃⨍?('fake_func_name')).to eq(false)
          end
        end
      end

      context 'func{does_func_schema_match}' do
        context 'handles needed scenario' do
          it 'cases: positive' do
            expect(api.sql("SELECT does_func_schema_match(
'does_func_schema_match',
'_func_name text, _func_args text, _func_return_type name',
'bool');
").rows[0][0]).to eq(true)
          end
          it 'cases: negative' do
            expect(api.sql("SELECT does_func_schema_match(
'does_func_schema_match',
'_fake_param text, _func_arg name, _func_return_type text',
'bigint');
").rows[0][0]).to eq(false)
          end
        end
      end

    end

    context 'can create tables w/ migrations' do
      it 'can be created' do
        expect(@mock.∃table?(table_name)).to eq(false)
        @mock.up
        expect(@mock.∃table?(table_name)).to eq(true)
      end
      it 'and populate data' do
        a = MockData.new({mock_data: 'hello world'})
        a.💾!
        b = MockData.find(1)
        expect(b.ⓣ).to eq(::MockData)
        expect(b.mock_data).to eq('hello world')
        a.♻️!
      end
      it 'throwing error for unique constraint' do
        a = MockData.new({mock_data: 'hello world'})
        b = MockData.new({mock_data: 'hello world'})
        a.💾!
        expect{b.💾!}.to raise_error(::ActiveRecord::RecordNotUnique)
        a.♻️!
      end
      it 'correctly counting number of rows' do
        rows_before = api.num_rows(table_name, true)
        expect(rows_before).to eq(0)
        a = MockData.new({mock_data: 'hello world0'})
        b = MockData.new({mock_data: 'hello world1'})
        a.💾!
        b.💾!
        rows_after = api.num_rows(table_name, true)
        expect(rows_after > rows_before).to eq(true)
        a.♻️!
        b.♻️!
        expect(api.num_rows(table_name, true)).to eq(0)
      end
    end

    context 'can drop tables w/ migrations' do
      it 'can be removed' do
        @mock.down
        expect(@mock.∃table?(table_name)).to eq(false)
      end
    end

    after :all do

    end

  end

end
