# coding: utf-8

RSpec.describe 'db/seed.rb' do

  context 'db', :'db' do

    context 'has historical release data' do

      context 'defines features' do

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
        end

        context 'defines f07' do
          it 'passes ORM audit' do
            audit_feature(f07, 'f07', 'enable quick clean up functions for `enumerables`')
          end
        end

        context 'defines f08' do
          it 'passes ORM audit' do
            audit_feature(f08, 'f08', 'enable quick editing functions for `enumerables` (& `String`)')
          end
        end

        context 'defines f09' do
          it 'passes ORM audit' do
            audit_feature(f09, 'f09', 'add math `set operations` (especially for `enumerables` & `String`)')
          end
        end

        context 'defines f10' do
          it 'passes ORM audit' do
            audit_feature(f10, 'f10', 'offer special character aliases for natural ease of readability')
          end
        end

        context 'defines f11' do
          it 'passes ORM audit' do
            audit_feature(f11, 'f11', 'add math `number sets` (ex: `ℕ?`, `ℤ?`, `ℚ?`, `ℂ?`, `ℝ?`, `∞?`, `♾️?`)')
          end
        end

        context 'defines f12' do
          it 'passes ORM audit' do
            audit_feature(f12, 'f12', 'enable quick `file/directory io` and alias as file(`📂`) and dir(`🗄️`)')
          end
        end

        context 'defines f15' do
          it 'passes ORM audit' do
            audit_feature(f15, 'f15', 'enable quicker tracking and auditing of features across versions')
          end
        end

        context 'defines f16' do
          it 'passes ORM audit' do
            audit_feature(f16, 'f16', "add operation: raising to exponents (`superscript`) via operator(`^`) on `Numeric`'s")
          end
        end

        context 'defines f17' do
          it 'passes ORM audit' do
            audit_feature(f17, 'f17', 'enable easier math operations')
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
            audit_feature(f23, 'f23', "gather statistics (and/or more debugging information) on `Ruuuby` {example-context: optimizing ordering of if-conditions / function-calls}")
          end
        end

        context 'defines f24' do
          it 'passes ORM audit' do
            audit_feature(f24, 'f24', "add syntax parsing for following 4 categories: {`snake_case`, `camel_case`, `snake_case_upper`, `camel_case_lower`}, aliased via: {`🐫`, `🐍`, `🐫⬇`, `🐍⬆`}")
          end
        end

        context 'defines f98' do
          it 'passes ORM audit' do
            audit_feature(f98, 'f98', '`C-extensions`')
          end
        end

      end # end{features}

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

        context 'v0.0.26' do
          it 'as expected' do
            audit_version(v0_0_26, 'v0.0.26')
          end
        end

        context 'v0.0.27' do
          it 'as expected' do
            audit_version(v0_0_27, 'v0.0.27')
          end
        end

      end # end{versions}

    end

  end

end
