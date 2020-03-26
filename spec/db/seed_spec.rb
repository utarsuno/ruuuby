# coding: utf-8

RSpec.describe 'db/seed.rb' do
  before :all do
    require_relative '../../db/seed'
  end

  let(:v0_0_0){RuuubyRelease.all[0]}
  let(:v0_0_1){RuuubyRelease.all[1]}
  let(:v0_0_2){RuuubyRelease.all[2]}
  let(:v0_0_3){RuuubyRelease.all[3]}
  #let(:v0_0_4){RuuubyRelease.all[4]}
  #let(:v0_0_18){RuuubyRelease.by_version(0, 0, 18)}
  #let(:v0_0_18){RuuubyRelease.find_by_uid(0, 0, 18)}
  let(:v0_0_18){RuuubyRelease.find_by_uid('v0.0.18')}
  let(:v0_0_19){RuuubyRelease.find_by_uid(0, 0, 19)}
  let(:v0_0_20){RuuubyRelease.find_by_uid(0, 0, 20)}
  let(:v0_0_21){RuuubyRelease.find_by_uid(0, 0, 21)}

  let(:f04){RuuubyFeature.by_id_num(4)}
  let(:f06){RuuubyFeature.by_id_num(6)}
  let(:f07){RuuubyFeature.by_id_num(7)}
  let(:f10){RuuubyFeature.by_id_num(10)}
  let(:f11){RuuubyFeature.by_id_num(11)}
  let(:f12){RuuubyFeature.by_id_num(12)}
  let(:f15){RuuubyFeature.by_id_num(15)}
  let(:f16){RuuubyFeature.by_id_num(16)}
  let(:f17){RuuubyFeature.by_id_num(17)}
  let(:f18){RuuubyFeature.by_id_num(18)}
  let(:f19){RuuubyFeature.by_id_num(19)}

  context 'static functions work' do
    context 'func{find_by_uid} handles needed scenarios' do
      it 'positive' do
        expect(RuuubyRelease.find_by_uid('v0.0.18')).to eq(RuuubyRelease.find_by_uid(0, 0, 18))
      end
      it 'negative' do
        # version DNE
        expect{RuuubyRelease.find_by_uid(0, 0, 200)}.to raise_error(RuntimeError)
      end
    end
  end

  context 'has historical release data', :audits do

    context 'defines features' do

      it 'defines f04' do
        audit_feature(f04, 'f04', '`∅` to alias concept of `empty`')
      end
      it 'defines f06' do
        audit_feature(f06, 'f06', 'enable quick type checks against any object (ex: `variable.int?`)')
      end
      it 'defines f07' do
        audit_feature(f07, 'f07', 'enable quick clean up functions for `enumerables`')
      end
      it 'defines f10' do
        audit_feature(f10, 'f10', 'offer special character aliases for natural ease of readability')
      end
      it 'defines f11' do
        audit_feature(f11, 'f11', 'add math `number sets` (ex: `ℕ?`, `ℤ?`, `ℚ?`, `ℂ?`, `ℝ?`, `∞?`, `♾️?`)')
      end
      it 'defines f12' do
        audit_feature(f12, 'f12', 'enable quick `file/directory io` and alias as file(`📂`) and dir(`🗄️`)')
      end
      it 'defines f15' do
        audit_feature(f15, 'f15', 'enable quicker tracking and auditing of features across versions')
      end
      it 'defines f16' do
        audit_feature(f16, 'f16', "add operation: raising to exponents (`superscript`) via operator(`^`) on `Numeric`'s")
      end
      it 'defines f17' do
        audit_feature(f17, 'f17', 'enable easier math operations')
      end
      it 'defines f18' do
        audit_feature(f18, 'f18', 'simplify import/require statements')
      end
      it 'defines f19' do
        audit_feature(f19, 'f19', 'add support for automatic-differentiation')
      end
    end # end: features

    context 'defines versions' do
      context 'v0.0.0' do
        it 'as expected' do
          audit_version(v0_0_0, 'v0.0.0')
        end
      end

      context 'v0.0.1' do
        it 'as expected' do
          audit_version(v0_0_1, 'v0.0.1')
          expect(v0_0_1.id).to_not eq(v0_0_0.id)
        end
      end

      context 'v0.0.1' do
        it 'as expected' do
          audit_version(v0_0_2, 'v0.0.2')
          expect(v0_0_2.id).to_not eq(v0_0_0.id)
          expect(v0_0_2.id).to_not eq(v0_0_1.id)
        end
      end

      context 'v0.0.3' do
        it 'as expected' do
          audit_version(v0_0_3, 'v0.0.3')
        end
      end

      #context 'v0.0.4' do
      #  it 'as expected' do
      #    audit_version(v0_0_4, 'v0.0.4')
      #  end
      #end

      context 'v0.0.18' do
        it 'as expected' do
          audit_version(v0_0_18, 'v0.0.18')
        end
      end

      context 'v0.0.19' do
        it 'as expected' do
          audit_version(v0_0_19, 'v0.0.19')
        end
      end

      context 'v0.0.20' do
        it 'as expected' do
          audit_version(v0_0_20, 'v0.0.20')
        end
      end

      context 'v0.0.21' do
        it 'as expected' do
          audit_version(v0_0_21, 'v0.0.21')
        end
      end
    end
  end
end

