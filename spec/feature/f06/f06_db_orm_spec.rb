# coding: UTF-8

RSpec.describe 'f06_db_orm' do

  context 'db_orm', :db do
    context 'feature{f06}' do
      it 'passes ORM audit' do
        audit_feature(f06, 'f06', 4, 'enable quick type checks against any object (ex: `variable.int?`)')
      end
    end

    context 'defines behaviors' do
      it 'defines{b00}' do
        audit_feature_behavior(f06, f06_b00, 'b00', 'offer func{num?, 🛑num❓, 🛑nums❓} w/ normalizers{∈ℕ, ∈𝕎, ∈ℤ, ∈𝕌, ∈ℕ𝕊, ∈𝕎𝕊, ∈ℤ𝕊, ∈𝕌𝕊}')
      end

      it 'defines{b01}' do
        audit_feature_behavior(f06, f06_b01, 'b01', 'offer func{str?, 🛑str❓, 🛑strs❓} w/ normalizers{∉∅}')
      end

      it 'defines{b02}' do
        audit_feature_behavior(f06, f06_b02, 'b02', 'offer func{int?, 🛑int❓, 🛑ints❓} w/ normalizers{∈ℕ, ∈𝕎, ∈ℤ, ∈𝕌}')
      end

      it 'defines{b03}' do
        audit_feature_behavior(f06, f06_b03, 'b03', 'offer func{ary?, 🛑ary❓, 🛑arys❓} w/ normalizers{∉∅}')
      end
    end # end: {defines behaviors}

  end

end
