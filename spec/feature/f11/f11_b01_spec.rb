# coding: UTF-8

RSpec.describe 'f11_b01' do

  context 'audits', :audits do

    context 'feature-behavior(f11_b01) is defined correctly' do
      it 'creates class{Closure} under module{Math::SetTheory}' do
        expect(🧬.∃ᶜ?(:Closure, ::Math::SetTheory)).to eq(true)
      end

      context 'creates inner-module{Axioms}' do
        it 'as expected' do
          expect(🧬.∃ᵐ?(:Axioms, ::Math::SetTheory::Closure)).to eq(true)
        end
        it 'w/ needed constants' do
          expect_∃const_w_type(:CLOSED_UNDER_ADDITION, Symbol, ::Math::SetTheory::Closure::Axioms)
          expect_∃const_w_type(:CLOSED_UNDER_SUBTRACTION, Symbol, ::Math::SetTheory::Closure::Axioms)
          expect_∃const_w_type(:CLOSED_UNDER_MULTIPLICATION, Symbol, ::Math::SetTheory::Closure::Axioms)
          expect_∃const_w_type(:CLOSED_UNDER_DIVISION, Symbol, ::Math::SetTheory::Closure::Axioms)
          expect_∃const_w_type(:DENSE, Symbol, ::Math::SetTheory::Closure::Axioms)
          expect_∃const_w_type(:CONTINUOUS, Symbol, ::Math::SetTheory::Closure::Axioms)
          expect_∃const_w_type(:ALGEBRAICALLY_CLOSED, Symbol, ::Math::SetTheory::Closure::Axioms)
        end
      end

    end

  end # end: {audits}

end