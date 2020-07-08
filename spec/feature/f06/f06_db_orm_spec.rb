# coding: UTF-8

RSpec.describe 'f06_db_orm' do

  context 'db_orm', :db do
    context 'feature{f06}' do
      it 'passes ORM audit' do
        audit_feature(f06, 'f06', 8, 'enable quick type checks against any object (ex: `variable.int?`)')
      end
    end

    context 'defines behaviors' do
      it 'defines{b00}' do
        audit_feature_behavior(f06, f06_b00, 'b00', 'offer funcs{num?, 🛑num❓, 🛑nums❓} w/ normalizers{∈ℕ, ∈𝕎, ∈ℤ, ∈𝕌, ∈ℕ𝕊, ∈𝕎𝕊, ∈ℤ𝕊, ∈𝕌𝕊}')
      end

      it 'defines{b01}' do
        audit_feature_behavior(f06, f06_b01, 'b01', 'offer funcs{str?, 🛑str❓, 🛑strs❓} w/ normalizers{∉∅}')
      end

      it 'defines{b02}' do
        audit_feature_behavior(f06, f06_b02, 'b02', 'offer funcs{int?, 🛑int❓, 🛑ints❓} w/ normalizers{∈ℕ, ∈𝕎, ∈ℤ, ∈𝕌}')
      end

      it 'defines{b03}' do
        audit_feature_behavior(f06, f06_b03, 'b03', 'offer funcs{ary?, 🛑ary❓, 🛑arys❓} w/ normalizers{∉∅}')
      end

      it 'defines{b04}' do
        audit_feature_behavior(f06, f06_b04, 'b04', 'offer funcs{flt?, 🛑flt❓, 🛑flts❓} w/ normalizers{∈𝕌}')
      end

      it 'defines{b05}' do
        audit_feature_behavior(f06, f06_b05, 'b05', 'offer funcs{bool?, 🛑bool❓, 🛑bools❓}')
      end

      it 'defines{b06}' do
        audit_feature_behavior(f06, f06_b06, 'b06', 'offer funcs{sym?, 🛑sym❓, 🛑syms❓}')
      end

      it 'defines{b07}' do
        audit_feature_behavior(f06, f06_b07, 'b07', 'offer funcs{hsh?, 🛑hsh❓, 🛑hshs❓')
      end
    end # end: {defines behaviors}

  end

end
