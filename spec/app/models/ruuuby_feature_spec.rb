# coding: utf-8

RSpec.describe 'ruuuby_feature.rb' do

  context 'ApplicationRecord{RuuubyFeature}' do

    context 'defines module[Syntax]' do
      it 'exists' do
        expect_∃module(:Syntax, ::RuuubyFeature)
      end

      context 'dynamically adds needed fetch functions' do
        context 'func{syntax_uid}' do
          it 'exists as needed' do
            expect(RuuubyFeature.respond_to?(:syntax_uid)).to eq(true)
            expect(RuuubyFeature.syntax_uid.class).to eq(Regexp)
            expect(RuuubyFeature.syntax_uid.source).to eq("\\A#{RuuubyFeature::Syntax::UID}\\z")
          end
        end
        context 'func{syntax_docs_feature_mapping}' do
          it 'exists as needed' do
            expect(RuuubyFeature.respond_to?(:syntax_docs_feature_mapping)).to eq(true)
            expect(RuuubyFeature.syntax_docs_feature_mapping.class).to eq(Regexp)
            expect(RuuubyFeature.syntax_docs_feature_mapping.source).to eq("\\A#{RuuubyFeature::Syntax::DOCS_FEATURE_MAPPING}\\z")
          end
        end
      end

      context 'with needed constants' do
        context '::RuuubyFeature::Syntax::UID' do
          it 'exists' do
            expect(RuuubyFeature::Syntax::UID).to eq('f\d\d')
          end
          it "can't be changed" do
            expect{RuuubyFeature::Syntax::UID = 5}.to raise_error(FrozenError)
          end
        end
        context '::RuuubyFeature::Syntax::DOCS_FEATURE_MAPPING' do
          it 'exists' do
            expect(RuuubyFeature::Syntax::DOCS_FEATURE_MAPPING).to eq('| f\d\d | (.*)? |')
          end
          it "can't be changed" do
            expect{RuuubyFeature::Syntax::DOCS_FEATURE_MAPPING = 5}.to raise_error(FrozenError)
          end
        end
      end
    end

    it 'can be created' do
      fake_feature = RuuubyFeature.create!(id_num: 1337, description: data_str_fake_name)
      expect(fake_feature.id_num).to eq(1337)
      expect(fake_feature.description).to eq(data_str_fake_name)

      expect(fake_feature.uid).to eq('f1337')

      fake_feature.♻️!
    end

    it 'prevents duplicate id_nums from being created' do
      expect{
        RuuubyFeature.spawn(1337, '1337')
        RuuubyFeature.spawn(1337, '1337')
      }.to raise_error(ActiveRecord::RecordNotUnique)

      result = RuuubyFeature.by_id_num(1337)
      result.♻️!
    end
  end

end
