# coding: utf-8

RSpec.describe 'ruuuby_feature.rb' do

  context 'ApplicationRecord{RuuubyFeature}' do
    it 'can be created' do
      fake_feature = RuuubyFeature.create!(id_num: 1, description: data_str_fake_name)
      expect(fake_feature.id_num).to eq(1)
      expect(fake_feature.description).to eq(data_str_fake_name)

      expect(fake_feature.feature_id).to eq('f01')

      fake_feature.destroy!
    end
  end

end
