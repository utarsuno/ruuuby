# coding: UTF-8

RSpec.describe 'f03' do

  context 'functionality' do
    context 'includable attribute{Cardinality}' do
      it 'adds func{𝔠} upon being included' do
        class MockCardinality
          def length; return 1337; end
          include ::Ruuuby::Attribute::Includable::Cardinality
        end
        expect_∃⨍(:𝔠, MockCardinality)
        obj = MockCardinality.new
        expect(obj.length).to eq(obj.𝔠)
      end
      it 'throws NameError when includer does not have the func{length}' do
        expect{
          module FakeModuleError
            include ::Ruuuby::Attribute::Includable::Cardinality
          end
        }.to raise_error(NameError)
      end
    end
  end

  context 'audit', :audit do
    context 'feature(f03) passes audits (tests not relating to observed functionality)' do
      context 'funcs provided are defined in correct location' do
        it 'for c{Proc}' do
          expect_∃⨍(:𝔠, ::Proc)
        end
        it 'for ENV' do
          expect(ENV.respond_to?(:𝔠)).to eq(true)
          expect(ENV.𝔠).to eq(ENV.length)
        end
        it 'for Enumerables' do
          expect_∃⨍(:𝔠, ::Hash)
          expect_∃⨍(:𝔠, ::Array)
          expect_∃⨍(:𝔠, ::Set)
          expect_∃⨍(:𝔠, ::String)
        end
      end
    end
  end
end
