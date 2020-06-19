# coding: utf-8

RSpec.describe 'application_record.rb' do

  context 'ApplicationRecord', :db do

    it 'can not be instantiated' do
      expect{ApplicationRecord.new}.to raise_error(NotImplementedError)
    end

    context 'adds static functions' do

      context 'func{orm_class}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            [::RuuubyFeature, ::RuuubyRelease, ::RuuubyFeatureBehavior, ::RuuubyGem, ::RuuubyFile, ::RuuubyDir].each do |scenario|
              expect(scenario.orm_class).to eq(scenario)
            end
          end
        end
      end # end: {func{orm_class}}

    end # end: {adds static functions}

  end

end
