# coding: utf-8

RSpec.describe 'ruuuby_feature.rb' do

  context 'ApplicationRecord{RuuubyFeature}' do

    context 'defines module[Syntax]' do
      it 'exists' do
        expect_∃module(:Syntax, ::RuuubyFeature)
      end
      context 'with needed constants' do
        context '::RuuubyFeature::Syntax::FEATURE_ID' do
          it 'exists' do
            expect(RuuubyFeature::Syntax::FEATURE_ID).to eq('f\d\d')
          end
          it "can't be changed" do
            expect{RuuubyFeature::Syntax::FEATURE_ID = 5}.to raise_error(FrozenError)
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
      fake_feature = RuuubyFeature.create!(id_num: 1, description: data_str_fake_name)
      expect(fake_feature.id_num).to eq(1)
      expect(fake_feature.description).to eq(data_str_fake_name)

      expect(fake_feature.uid).to eq('f01')

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
