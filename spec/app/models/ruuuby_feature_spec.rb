# coding: utf-8

RSpec.describe 'ruuuby_feature.rb' do

  context 'ApplicationRecord{RuuubyFeature}' do
    it 'can be created' do
      fake_feature = RuuubyFeature.create!(id_num: 1, description: data_str_fake_name)
      expect(fake_feature.id_num).to eq(1)
      expect(fake_feature.description).to eq(data_str_fake_name)

      expect(fake_feature.feature_id).to eq('f01')

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
