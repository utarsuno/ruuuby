# coding: UTF-8

RSpec.describe 'f06_db' do

  context 'db', :db do
    context 'feature{f06}' do
      it 'passes ORM audit' do
        audit_feature(f06, 'f06', 'enable quick type checks against any object (ex: `variable.int?`)')
      end
    end

    context 'defines behaviors' do
      it 'has correct number of behaviors{2}' do
        expect(f06.ruuuby_feature_behaviors.length).to eq(2)
      end

      it 'defines{b00}' do
        audit_feature_behavior(f06, f06_b00, 'b00', 'offer func{num?} with param-check-func{🛑num❓} offering the normalizers{∈ℕ, ∈𝕎, ∈ℤ, ∈𝕌, ∈ℕ𝕊, ∈𝕎𝕊, ∈ℤ𝕊, ∈𝕌𝕊}')
      end

      it 'defines{b01}' do
        audit_feature_behavior(f06, f06_b01, 'b01', 'offer func{str?} with param-check-func{🛑num❓} offering the normalizers{!∅}')
      end
    end # end: {defines behaviors}

  end

end
