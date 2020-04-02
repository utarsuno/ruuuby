# coding: utf-8

RSpec.describe 'db/seed.rb' do
  before :all do
    require_relative '../../db/seed'
  end


  let(:v0_0_0){RuuubyRelease.all[0]}
  let(:v0_0_1){RuuubyRelease.all[1]}
  let(:v0_0_2){RuuubyRelease.all[2]}
  let(:v0_0_3){RuuubyRelease.all[3]}
  let(:v0_0_18){RuuubyRelease.find_by_uid(0, 0, 18)}
  let(:v0_0_19){RuuubyRelease.find_by_uid(0, 0, 19)}
  let(:v0_0_20){RuuubyRelease.find_by_uid(0, 0, 20)}
  let(:v0_0_21){RuuubyRelease.find_by_uid(0, 0, 21)}
  let(:v0_0_22){RuuubyRelease.find_by_uid(0, 0, 22)}
  let(:v0_0_23){RuuubyRelease.find_by_uid(0, 0, 23)}
  let(:v0_0_24){RuuubyRelease.find_by_uid(0, 0, 24)}
  let(:v0_0_25){RuuubyRelease.find_by_uid(0, 0, 25)}

  let(:f00){RuuubyFeature.by_id_num(0)}
  let(:f01){RuuubyFeature.by_id_num(1)}
  let(:f02){RuuubyFeature.by_id_num(2)}
  let(:f03){RuuubyFeature.by_id_num(3)}
  let(:f04){RuuubyFeature.by_id_num(4)}
  let(:f06){RuuubyFeature.by_id_num(6)}
  let(:f07){RuuubyFeature.by_id_num(7)}
  let(:f08){RuuubyFeature.by_id_num(8)}
  let(:f09){RuuubyFeature.by_id_num(9)}
  let(:f10){RuuubyFeature.by_id_num(10)}
  let(:f11){RuuubyFeature.by_id_num(11)}
  let(:f12){RuuubyFeature.by_id_num(12)}
  let(:f15){RuuubyFeature.by_id_num(15)}
  let(:f16){RuuubyFeature.by_id_num(16)}
  let(:f17){RuuubyFeature.by_id_num(17)}
  let(:f18){RuuubyFeature.by_id_num(18)}
  let(:f19){RuuubyFeature.by_id_num(19)}
  let(:f20){RuuubyFeature.by_id_num(20)}
  let(:f21){RuuubyFeature.by_id_num(21)}
  let(:f22){RuuubyFeature.by_id_num(22)}
  let(:f23){RuuubyFeature.by_id_num(23)}
  let(:f98){RuuubyFeature.by_id_num(98)}

  context 'static functions work' do
    context 'func{find_by_uid} handles needed scenarios' do
      it 'positive' do
        expect(RuuubyRelease.find_by_uid('v0.0.25')).to eq(RuuubyRelease.find_by_uid(0, 0, 25))
        expect(RuuubyRelease.find_by_uid('0.0.25')).to eq(RuuubyRelease.find_by_uid(0, 0, 25))
      end
      it 'negative (version DNE)' do
        expect{RuuubyRelease.find_by_uid(0, 0, 1337)}.to raise_error(RuntimeError)
      end
    end
  end

  context 'has historical release data', :audits do

    context 'defines features' do

      before :all do
        expect_∃module(:Feature, ::Ruuuby)
        expect_∃module(:Extendable, ::Ruuuby::Feature)
        expect_∃module(:Includable, ::Ruuuby::Feature)
      end

      context 'defines f00' do
        it 'passes ORM audit' do
          audit_feature(f00, 'f00', "`η̂` to alias concept of `normalization` (any be offered in any applicable context)")
        end
      end

      context 'defines f01' do
        it 'passes ORM audit' do
          audit_feature(f01, 'f01', "`🙈` to alias `private`")
        end
      end

      context 'defines f02' do
        it 'passes ORM audit' do
          audit_feature(f02, 'f02', "`🛡️` to alias `protected`")
        end
      end

      context 'defines f03' do
        it 'passes ORM audit' do
          audit_feature(f03, 'f03', "`𝔠` to alias concept of `cardinality` (offered in both styles of `OOP` & `'functional'`)")
        end
      end

      context 'defines f04' do
        it 'passes ORM audit' do
          audit_feature(f04, 'f04', '`∅` to alias concept of `empty`')
        end
      end

      context 'defines f06' do
        it 'passes ORM audit' do
          audit_feature(f06, 'f06', 'enable quick type checks against any object (ex: `variable.int?`)')
        end
        context 'feature(f06) passes audits (tests not relating to observed functionality)' do
          it 'module is defined in correct location' do
            expect_∃module(:ObjectF06, ::Ruuuby::Feature::Includable)
          end
          context 'funcs provided are defined in correct location' do
            it 'for m{ObjectF06}' do
              expect_∃⨍(:class?, ::Ruuuby::Feature::Includable::ObjectF06)
              expect_∃⨍(:module?, ::Ruuuby::Feature::Includable::ObjectF06)
              expect_∃⨍(:nucleotide?, ::Ruuuby::Feature::Includable::ObjectF06)
              expect_∃⨍(:🛑bool❓, ::Ruuuby::Feature::Includable::ObjectF06)
              expect_∃⨍(:🛑int❓, ::Ruuuby::Feature::Includable::ObjectF06)
              expect_∃⨍(:🛑ℤ❓, ::Ruuuby::Feature::Includable::ObjectF06)
              expect_∃⨍(:🛑𝕌❓, ::Ruuuby::Feature::Includable::ObjectF06)
              expect_∃⨍(:🛑flt❓, ::Ruuuby::Feature::Includable::ObjectF06)
              expect_∃⨍(:🛑num❓, ::Ruuuby::Feature::Includable::ObjectF06)
              expect_∃⨍(:🛑ary❓, ::Ruuuby::Feature::Includable::ObjectF06)
              expect_∃⨍(:🛑str❓, ::Ruuuby::Feature::Includable::ObjectF06)
              expect_∃⨍(:🛑stry❓, ::Ruuuby::Feature::Includable::ObjectF06)
              expect_∃⨍(:🛑countable❓, ::Ruuuby::Feature::Includable::ObjectF06)
            end
          end
        end
      end

      it 'defines f07' do
        audit_feature(f07, 'f07', 'enable quick clean up functions for `enumerables`')
      end

      context 'defines f08' do
        it 'passes ORM audit' do
          audit_feature(f08, 'f08', 'enable quick editing functions for `enumerables` (& `String`)')
        end
        context 'feature(f08) passes audits (tests not relating to observed functionality)' do
          it 'module is defined in correct location' do
            expect_∃module(:StringF08, ::Ruuuby::Feature::Includable)
          end
        end
      end

      context 'defines f09' do
        it 'passes ORM audit' do
          audit_feature(f09, 'f09', 'add math `set operations` (especially for `enumerables` & `String`)')
        end
        context 'feature(f09) passes audits (tests not relating to observed functionality)' do
          it 'module is defined in correct location' do
            expect_∃module(:ArrayF08, ::Ruuuby::Feature::Includable)
            expect_∃module(:ArrayF09, ::Ruuuby::Feature::Includable)
          end
        end
      end

      it 'defines f10' do
        audit_feature(f10, 'f10', 'offer special character aliases for natural ease of readability')
      end

      it 'defines f11' do
        audit_feature(f11, 'f11', 'add math `number sets` (ex: `ℕ?`, `ℤ?`, `ℚ?`, `ℂ?`, `ℝ?`, `∞?`, `♾️?`)')
      end

      context 'defines f12' do
        it 'passes ORM audit' do
          audit_feature(f12, 'f12', 'enable quick `file/directory io` and alias as file(`📂`) and dir(`🗄️`)')
        end
        context 'feature(f12) passes audits (tests not relating to observed functionality)' do
          it 'module is defined in correct location' do
            expect_∃module(:MainF12, ::Ruuuby::Feature::Extendable)
          end
          context 'funcs provided are defined in correct location' do
            it 'for m{MainF12}' do
              expect_∃⨍(:📁, ::Ruuuby::Feature::Extendable::MainF12)
              expect_∃⨍(:📂, ::Ruuuby::Feature::Extendable::MainF12)
              expect_∃⨍(:🗄️, ::Ruuuby::Feature::Extendable::MainF12)
            end
          end
        end
      end

      it 'defines f15' do
        audit_feature(f15, 'f15', 'enable quicker tracking and auditing of features across versions')
      end

      context 'defines f16' do
        it 'passes ORM audit' do
          audit_feature(f16, 'f16', "add operation: raising to exponents (`superscript`) via operator(`^`) on `Numeric`'s")
        end
        context 'feature(16) passes audits (tests not relating to observed functionality)' do
          it 'module is defined in correct location' do
            expect_∃module(:ObjectF16, ::Ruuuby::Feature::Includable)
            expect_∃module(:SymbolF16, ::Ruuuby::Feature::Includable)
          end
          context 'funcs provided are defined in correct location' do
            it 'for m{SymbolF16}' do
              expect_∃⨍(:power?, ::Ruuuby::Feature::Includable::SymbolF16)
              expect_∃⨍(:pow_to_i, ::Ruuuby::Feature::Includable::SymbolF16)
            end
            it 'for m{ObjectF16}' do
              expect_∃⨍(:⁻⁹, ::Ruuuby::Feature::Includable::ObjectF16)
              expect_∃⨍(:⁻⁸, ::Ruuuby::Feature::Includable::ObjectF16)
              expect_∃⨍(:⁻⁷, ::Ruuuby::Feature::Includable::ObjectF16)
              expect_∃⨍(:⁻⁶, ::Ruuuby::Feature::Includable::ObjectF16)
              expect_∃⨍(:⁻⁵, ::Ruuuby::Feature::Includable::ObjectF16)
              expect_∃⨍(:⁻⁴, ::Ruuuby::Feature::Includable::ObjectF16)
              expect_∃⨍(:⁻³, ::Ruuuby::Feature::Includable::ObjectF16)
              expect_∃⨍(:⁻², ::Ruuuby::Feature::Includable::ObjectF16)
              expect_∃⨍(:⁻¹, ::Ruuuby::Feature::Includable::ObjectF16)
              expect_∃⨍(:⁰, ::Ruuuby::Feature::Includable::ObjectF16)
              expect_∃⨍(:⁹, ::Ruuuby::Feature::Includable::ObjectF16)
              expect_∃⨍(:⁸, ::Ruuuby::Feature::Includable::ObjectF16)
              expect_∃⨍(:⁷, ::Ruuuby::Feature::Includable::ObjectF16)
              expect_∃⨍(:⁶, ::Ruuuby::Feature::Includable::ObjectF16)
              expect_∃⨍(:⁵, ::Ruuuby::Feature::Includable::ObjectF16)
              expect_∃⨍(:⁴, ::Ruuuby::Feature::Includable::ObjectF16)
              expect_∃⨍(:³, ::Ruuuby::Feature::Includable::ObjectF16)
              expect_∃⨍(:², ::Ruuuby::Feature::Includable::ObjectF16)
              expect_∃⨍(:¹, ::Ruuuby::Feature::Includable::ObjectF16)
            end
          end
        end
      end

      context 'defines f17' do
        it 'passes ORM audit' do
          audit_feature(f17, 'f17', 'enable easier math operations')
        end
        context 'feature(f17) passes audits (tests not relating to observed functionality)' do
          it 'module is defined in correct location' do
            expect_∃module(:MainF17, ::Ruuuby::Feature::Extendable)
            expect_∃module(:MathAliases, ::Ruuuby::Feature::Extendable::MainF17)
            expect_∃module(:FloatAliases, ::Ruuuby::Feature::Extendable::MainF17)
            expect_∃module(:Trigonometry, ::Ruuuby::Feature::Extendable::MainF17)
          end
          context 'funcs provided are defined in correct location' do
            it 'for m{FloatAliases}' do
              expect_∃⨍(:∞, ::Ruuuby::Feature::Extendable::MainF17::FloatAliases)
              expect_∃⨍(:¿, ::Ruuuby::Feature::Extendable::MainF17::FloatAliases)
              expect_∃⨍(:∞ℂ, ::Ruuuby::Feature::Extendable::MainF17::FloatAliases)
              expect_∃⨍(:φ, ::Ruuuby::Feature::Extendable::MainF17::FloatAliases)
              expect_∃⨍(:γ, ::Ruuuby::Feature::Extendable::MainF17::FloatAliases)
            end
            it 'for m{MathAliases}' do
              expect_∃⨍(:√, ::Ruuuby::Feature::Extendable::MainF17::MathAliases)
              expect_∃⨍(:∛, ::Ruuuby::Feature::Extendable::MainF17::MathAliases)
              expect_∃⨍(:π, ::Ruuuby::Feature::Extendable::MainF17::MathAliases)
            end
            it 'for m{Trigonometry}' do
              expect_∃⨍(:∠ᶜ, ::Ruuuby::Feature::Extendable::MainF17::Trigonometry)
              expect_∃⨍(:∠°, ::Ruuuby::Feature::Extendable::MainF17::Trigonometry)
              expect_∃⨍(:sin, ::Ruuuby::Feature::Extendable::MainF17::Trigonometry)
              expect_∃⨍(:sin°, ::Ruuuby::Feature::Extendable::MainF17::Trigonometry)
              expect_∃⨍(:cos, ::Ruuuby::Feature::Extendable::MainF17::Trigonometry)
              expect_∃⨍(:cos°, ::Ruuuby::Feature::Extendable::MainF17::Trigonometry)
              expect_∃⨍(:tan, ::Ruuuby::Feature::Extendable::MainF17::Trigonometry)
              expect_∃⨍(:tan°, ::Ruuuby::Feature::Extendable::MainF17::Trigonometry)
            end
          end
        end
      end

      context 'defines f18' do
        it 'passes ORM audit' do
          audit_feature(f18, 'f18', 'simplify import/require statements')
        end
      end

      context 'defines f19' do
        it 'passes ORM audit' do
          audit_feature(f19, 'f19', 'add support for automatic-differentiation')
        end
      end

      context 'defines f20' do
        it 'passes ORM audit' do
          audit_feature(f20, 'f20', 'enable easier (general) syntax & pattern parsing')
        end
      end

      context 'defines f21' do
        it 'passes ORM audit' do
          audit_feature(f21, 'f21', 'enable easier textual/numerical/syntax parsing')
        end
      end

      context 'defines f22' do
        it 'passes ORM audit' do
          audit_feature(f22, 'f22', "create or extend a `numeric` in order to properly support `Complex Infinity`")
        end
      end

      context 'defines f23' do
        it 'passes ORM audit' do
          audit_feature(f23, 'f23', 'gather statistics (and/or more debugging information) on `Ruuuby`')
        end
      end

      context 'defines f98' do
        it 'passes ORM audit' do
          audit_feature(f98, 'f98', '`C-extensions`')
        end
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

      # TODO: add missing versions

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

      context 'v0.0.22' do
        it 'as expected' do
          audit_version(v0_0_22, 'v0.0.22')
        end
      end

      context 'v0.0.23' do
        it 'as expected' do
          audit_version(v0_0_23, 'v0.0.23')
        end
      end

      context 'v0.0.24' do
        it 'as expected' do
          audit_version(v0_0_24, 'v0.0.24')
        end
      end

      context 'v0.0.25' do
        it 'as expected' do
          audit_version(v0_0_25, 'v0.0.25')
        end
      end
    end
  end
end

