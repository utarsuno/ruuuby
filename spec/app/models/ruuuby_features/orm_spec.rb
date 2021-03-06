# encoding: UTF-8

RSpec.describe 'ruuuby_features.rb' do
  context 'ApplicationRecord{RuuubyFeature}', :db do

    context 'ORM operations' do

      it 'can be created' do
        fake_feature = RuuubyFeature.create!(id_num: 1337, description: data_str_fake_name)

        expect(fake_feature.id_num).to eq(1337)
        expect(fake_feature.description).to eq(data_str_fake_name)
        expect(fake_feature.ruuuby_feature_behaviors.length).to eq(0)
        expect(fake_feature.uid).to eq('f1337')

        fake_feature.♻️!
      end

      it 'prevents duplicate id_nums from being created' do
        expect{
          RuuubyFeature.spawn(1337, '1337')
          RuuubyFeature.spawn(1337, '1337')
        }.to raise_error(ActiveRecord::RecordNotUnique)

        result = RuuubyFeature[1337]
        expect(result.is_a?(::RuuubyFeature)).to eq(true)
        result.♻️!
      end

      it 'prevents negative values being used for version values' do
        expect{ RuuubyFeature.spawn(-1, '1337') }.to raise_error(ActiveRecord::RecordInvalid)
      end

    end # end: {ORM operations}

    context 'static-functions' do

      context 'adds func{parse_uid_str}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect(RuuubyFeature.parse_uid_str('f0')).to eq([0])
            expect(RuuubyFeature.parse_uid_str('f00')).to eq([0])
            expect(RuuubyFeature.parse_uid_str('f01')).to eq([1])
            expect(RuuubyFeature.parse_uid_str('f14')).to eq([14])
          end
          it 'cases: bad params' do
            expect{RuuubyFeature.parse_uid_str(nil)}.to raise_error(ArgumentError)
          end
        end
      end

    end

    context 'defines module[Syntax]' do
      it 'exists' do
        expect_∃ᵐ(:Syntax, ::RuuubyFeature)
      end

      context 'dynamically adds needed fetch functions' do
        context 'func{syntax_uid}' do
          it 'exists as needed' do
            expect(RuuubyFeature.respond_to?(:syntax_uid)).to eq(true)
            expect(RuuubyFeature.syntax_uid.ⓣ).to eq(Regexp)
            expect(RuuubyFeature.syntax_uid.source).to eq(RuuubyFeature::Syntax::UID)
          end
        end
      end

      context 'with needed constants' do
        context '::RuuubyFeature::Syntax::UID' do
          it 'exists' do
            expect(RuuubyFeature::Syntax::UID).to eq('\A(f?)\d\d\z')
          end
        end
        context '::RuuubyFeature::Syntax::SQL_UID' do
          it 'exists' do
            expect(RuuubyFeature::Syntax::SQL_UID).to eq('id_num = ?')
          end
        end
        context '::RuuubyFeature::Syntax::DOCS_FEATURE_MAPPING' do
          it 'exists' do
            expect(RuuubyFeature::Syntax::DOCS_FEATURE_MAPPING).to eq('| f\d\d | (.*)? |')
          end
        end
      end
    end
  end
end
