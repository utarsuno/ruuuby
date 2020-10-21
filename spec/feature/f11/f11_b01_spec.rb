# encoding: UTF-8

RSpec.describe 'f11_b01' do

  context 'audit', :audit do

    context 'feature-behavior(f11_b01) is defined correctly' do
      it 'creates class{Closure} under module{Math::SetTheory}' do
        expect_∃ᶜ(:Closure, ::Math::SetTheory)
      end

    end

  end # end: {audit}

end