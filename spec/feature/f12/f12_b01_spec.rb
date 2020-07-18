# encoding: UTF-8

RSpec.describe 'f12_b01' do

  context 'functionality' do
    context 'func{read}' do
      context 'handles needed scenarios' do
        it 'cases: negative' do
          expect{::File::CSV.read(nil)}.to raise_error(::ArgumentError)
        end
      end
    end
  end

  context 'audit', :audit do

    context 'feature(f12_b01) passes audits' do
      context 'funcs provided are defined in correct location' do
        it 'm{File::CSV} exists' do
          expect_∃ᵐ(:CSV, ::File)
        end
        it 'w/ needed funcs' do
          expect_∃⨍_static(:read, ::File::CSV)
        end
      end
    end

  end

end
