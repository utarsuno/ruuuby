# encoding: UTF-8

class CreateMockData < RuuubyDBMigration

  def self.up
    create_table :mock_data do |t|
      t.string :mock_data, :null => false
    end

    add_index :mock_data, :mock_data, unique: true
  end

  def self.down
    ♻️index(:mock_data, :mock_data)
    ♻️table(:mock_data)
  end
end

class MockData < ApplicationRecord

end

RSpec.describe 'db/db.rb' do
  let(:api){Ruuuby::MetaData.engine.orm.db_orm}

  context 'db_new', :db_new do

    before :all do
      @mock = CreateMockData.new
      @mock.down
    end

    context 'has utility funcs from{init.sql}' do

      context 'func{does_func_exit}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect(api.sql("SELECT does_func_exist('does_func_exist');").values[0][0]).to eq(true)
            expect(api.sql("SELECT does_func_exist('get_all_funcs');").values[0][0]).to eq(true)
            expect(api.sql("SELECT does_func_exist('does_func_schema_match');").values[0][0]).to eq(true)
            expect(api.sql("SELECT does_func_exist('does_table_exist');").values[0][0]).to eq(true)
            expect(api.sql("SELECT does_func_exist('get_all_table_names');").values[0][0]).to eq(true)
            expect(api.sql("SELECT does_func_exist('get_all_table_name_schema_pairs');").values[0][0]).to eq(true)
            expect(api.sql("SELECT does_func_exist('table_size_stats');").values[0][0]).to eq(true)
            expect(api.sql("SELECT does_func_exist('db_size_stats');").values[0][0]).to eq(true)
          end
          it 'cases: negative' do
            expect(api.sql("SELECT does_func_exist('does_func_existdoes_func_exist');").values[0][0]).to eq(false)
            expect(api.sql("SELECT does_func_exist('');").values[0][0]).to eq(false)
            expect(api.sql("SELECT does_func_exist('1');").values[0][0]).to eq(false)
            expect(api.sql("SELECT does_func_exist(' ');").values[0][0]).to eq(false)
            expect(api.sql("SELECT does_func_exist('fake_func_name');").values[0][0]).to eq(false)
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
").values[0][0]).to eq(true)
          end
          it 'cases: negative' do
            expect(api.sql("SELECT does_func_schema_match(
'does_func_schema_match',
'_fake_param text, _func_arg name, _func_return_type text',
'bigint');
").values[0][0]).to eq(false)
          end
        end
      end

    end

    context 'can create tables w/ migrations' do
      it 'can be created' do
        expect(@mock.∃table?('mock_data')).to eq(false)
        @mock.up
        expect(@mock.∃table?('mock_data')).to eq(true)
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
    end

    context 'can drop tables w/ migrations' do
      it 'can be removed' do
        @mock.down
        expect(@mock.∃table?('mock_data')).to eq(false)
      end
    end

    after :all do

    end

  end

end
