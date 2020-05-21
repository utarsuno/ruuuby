# coding: UTF-8

RSpec.describe 'f11_b00' do

  context 'audits', :audits do

    context 'feature-behavior(f11_b00) is defined correctly' do
      it 'creates module{SetTheory} under module{Math}' do
        expect(🧬.∃ᵐ?(:SetTheory, ::Math)).to eq(true)
      end

      context 'creates inner-module{AlephNumbers}' do
        it 'as expected' do
          expect(🧬.∃ᵐ?(:AlephNumbers, ::Math::SetTheory::NumberSet)).to eq(true)
        end
        it 'w/ needed constants' do
          expect_∃const_w_type(:ZERO, Symbol, ::Math::SetTheory::NumberSet::AlephNumbers)
          expect_∃const_w_type(:ONE, Symbol, ::Math::SetTheory::NumberSet::AlephNumbers)
        end
      end
    end

  end # end: {audits}

end
