# encoding: UTF-8

RSpec.describe 'application_record.rb' do
  let(:data_orm_all_classes){[::RuuubyFeature, ::RuuubyRelease, ::RuuubyFeatureBehavior, ::RuuubyGem, ::RuuubyFile, ::RuuubyDir, ::RuuubyChangelog]}

  context 'class{ApplicationRecord}', :db do

    context 'is defined as needed' do
      it 'w/o ability to be instantiated' do
        expect{::ApplicationRecord.new}.to raise_error(::NotImplementedError)
      end
      context 'w/ needed funcs' do
        it 'for runtime' do
          data_orm_all_classes.∀{|scenario| expect(scenario.respond_to?(:empty?)).to eq(true)}
          data_orm_all_classes.∀{|scenario| expect(scenario.respond_to?(:∅?)).to eq(true)}
          data_orm_all_classes.∀{|scenario| expect(scenario.respond_to?(:orm_Ⓣ_🐍)).to eq(true)}
          data_orm_all_classes.∀{|scenario| expect(scenario.respond_to?(:num_where)).to eq(true)}
        end
        it 'for development' do
          data_orm_all_classes.∀{|scenario| expect(scenario.respond_to?(:orm_class)).to eq(true)}
          data_orm_all_classes.∀{|scenario| expect(scenario.respond_to?(:str2ormⓣ?)).to eq(true)}
        end
      end
    end

    context 'adds static functions' do

      context 'func{orm_class}' do
        context 'handles needed scenarios' do
          it 'cases: all' do
            data_orm_all_classes.∀{|scenario| expect(scenario.orm_class).to eq(scenario)}
          end
        end
      end # end: {func{orm_class}}

      context 'func{orm_Ⓣ_🐍}' do
        context 'handles needed scenarios' do
          it 'cases: all' do
            expect(::RuuubyFeature.orm_Ⓣ_🐍).to eq('ruuuby_feature')
            expect(::RuuubyFeatureBehavior.orm_Ⓣ_🐍).to eq('ruuuby_feature_behavior')
            expect(::RuuubyGem.orm_Ⓣ_🐍).to eq('ruuuby_gem')
            expect(::RuuubyDir.orm_Ⓣ_🐍).to eq('ruuuby_dir')
            expect(::RuuubyFile.orm_Ⓣ_🐍).to eq('ruuuby_file')
            expect(::RuuubyChangelog.orm_Ⓣ_🐍).to eq('ruuuby_changelog')
          end
        end
      end # end: {func{orm_Ⓣ_🐍}}

      context 'func{empty?}' do
        context 'handles needed scenarios' do
          it 'cases: all' do
            data_orm_all_classes.∀{|scenario| expect(scenario.empty?).to eq(scenario.count == 0); expect(scenario.∅?).to eq(scenario.empty?)}
          end
        end
      end # end: {func{empty?}}

    end # end: {adds static functions}

  end # end: {db}

end
