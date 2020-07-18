# encoding: UTF-8

RSpec.describe 'f36_db_orm' do
  context 'db_orm', :db do
    context 'defines{f36}' do
      it 'passes ORM audit' do
        audit_feature(f36, 'f36', 8, 'add new class (`TimeSeriesData`) for easier operations involving multi-sample based stats')
      end

      context 'defines behaviors' do
        it 'defines{b00}' do
          audit_feature_behavior(f36, f36_b00, 'b00', 'offer functionality for array-like data access')
        end
        it 'defines{b01}' do
          audit_feature_behavior(f36, f36_b01, 'b01', 'offer functionality for controlling and monitoring memory usage')
        end
        it 'defines{b02}' do
          audit_feature_behavior(f36, f36_b02, 'b02', 'offer functionality for providing cached values for any simple stats')
        end
        it 'defines{b03}' do
          audit_feature_behavior(f36, f36_b03, 'b03', 'offer functionality for time-series calculations')
        end
        it 'defines{b04}' do
          audit_feature_behavior(f36, f36_b04, 'b04', 'offer functionality for health-checks w/ `bitwise meta-data flags`')
        end
        it 'define{b05}' do
          audit_feature_behavior(f36, f36_b05, 'b05', 'offer functionality for various styles of `normalization`')
        end
        it 'define{b06}' do
          audit_feature_behavior(f36, f36_b06, 'b06', 'offer functionality for `IQR`/`quartile` based calculations, such as one of the many equations utilized to find `outliers`')
        end
        it 'define{b07}' do
          audit_feature_behavior(f36, f36_b07, 'b07', 'detect if data consists of only `Integers` which thus allows for various optimizations')
        end
      end # end: {defines behaviors}
    end # end: {defines{f36}}
  end
end
