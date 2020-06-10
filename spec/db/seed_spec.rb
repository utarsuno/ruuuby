# encoding: UTF-8

RSpec.describe 'db/seed.rb' do

  context 'db', :db do

    context 'has historical release data' do

      context 'has needed gem information' do
        it 'there exists a gem for{rubygems-update}' do
          the_gem = ::RuuubyGem.find_by_name('rubygems-update')
          expect(the_gem.ⓣ).to eq(::RuuubyGem)
          expect(the_gem.ruuuby_release.uid).to eq('v0.0.40')
        end
        context 'expected number per mode types' do
          it 'for none there is{0}' do
            expect(::RuuubyGem.fetch_by_type(false, false).length).to eq(0)
          end
          it 'for{runtime} there is{0}' do
            expect(::RuuubyGem.fetch_by_type(false, true).length).to eq(0)
          end
          it 'for{development} there is{11}' do
            expect(::RuuubyGem.fetch_by_type(true, false).length).to eq(11)
          end
          it 'for{development & runtime} there is{1}' do
            expect(::RuuubyGem.fetch_by_type(true, true).length).to eq(1)
          end
        end
        it 'there is only 1 gem which is for mode{development & runtime}' do
          expect(::RuuubyGem.fetch_by_type(true, true).first).to eq(::RuuubyGem.find_by_name('tty-command'))
        end
      end

      context 'defines features' do

        Benchmark

        context 'defines f07' do
          it 'passes ORM audit' do
            audit_feature(f07, 'f07', 'enable quick clean up functions for `enumerables`')
          end
        end

        context 'defines f13' do
          it 'passes ORM audit' do
            audit_feature(f13, 'f13', '`∃` to alias concept of `does this(arg) exist?`')
          end
        end

        context 'defines f15' do
          it 'passes ORM audit' do
            audit_feature(f15, 'f15', 'enable quicker tracking and auditing of features across versions')
          end
        end

        context 'defines f18' do
          it 'passes ORM audit' do
            audit_feature(f18, 'f18', 'represent needed fields of math into organized groupings w/ abstractions')
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

        context 'defines f23' do
          it 'passes ORM audit' do
            audit_feature(f23, 'f23', "gather statistics (and/or more debugging information) on `Ruuuby` {example-context: optimizing ordering of if-conditions / function-calls}")
          end
        end

      end # end{features}

      context 'defines versions' do
        context 'v0.0.0' do
          it 'as expected' do
            audit_version(v0_0_0, 'v0.0.0')
            expect(v0_0_0.num_gems_added).to eq(0)
          end
        end

        context 'v0.0.1' do
          it 'as expected' do
            audit_version(v0_0_1, 'v0.0.1')
            expect(v0_0_1.id).to_not eq(v0_0_0.id)
            expect(v0_0_1.num_gems_added).to eq(4)
          end
        end

        context 'v0.0.2' do
          it 'as expected' do
            audit_version(v0_0_2, 'v0.0.2')
            expect(v0_0_2.id).to_not eq(v0_0_0.id)
            expect(v0_0_2.id).to_not eq(v0_0_1.id)
            expect(v0_0_2.num_gems_added).to eq(0)
          end
        end

        context 'v0.0.3' do
          it 'as expected' do
            audit_version(v0_0_3, 'v0.0.3')
            expect(v0_0_3.num_gems_added).to eq(0)
          end
        end

        context 'v0.0.4' do
          it 'as expected' do
            audit_version(v0_0_4, 'v0.0.4')
            expect(v0_0_4.num_gems_added).to eq(1)
          end
        end

        context 'v0.0.5' do
          it 'as expected' do
            audit_version(v0_0_5, 'v0.0.5')
            expect(v0_0_5.num_gems_added).to eq(0)
          end
        end

        context 'v0.0.6' do
          it 'as expected' do
            audit_version(v0_0_6, 'v0.0.6')
            expect(v0_0_6.num_gems_added).to eq(0)
          end
        end

        context 'v0.0.7' do
          it 'as expected' do
            audit_version(v0_0_7, 'v0.0.7')
            expect(v0_0_7.num_gems_added).to eq(1)
          end
        end

        context 'v0.0.8' do
          it 'as expected' do
            audit_version(v0_0_8, 'v0.0.8')
            expect(v0_0_8.num_gems_added).to eq(0)
          end
        end

        context 'v0.0.9' do
          it 'as expected' do
            audit_version(v0_0_9, 'v0.0.9')
            expect(v0_0_9.num_gems_added).to eq(0)
          end
        end

        context 'v0.0.10' do
          it 'as expected' do
            audit_version(v0_0_10, 'v0.0.10')
            expect(v0_0_10.num_gems_added).to eq(0)
          end
        end

        context 'v0.0.11' do
          it 'as expected' do
            audit_version(v0_0_11, 'v0.0.11')
            expect(v0_0_11.num_gems_added).to eq(0)
          end
        end

        context 'v0.0.12' do
          it 'as expected' do
            audit_version(v0_0_12, 'v0.0.12')
            expect(v0_0_12.num_gems_added).to eq(0)
          end
        end

        context 'v0.0.13' do
          it 'as expected' do
            audit_version(v0_0_13, 'v0.0.13')
            expect(v0_0_13.num_gems_added).to eq(0)
          end
        end

        context 'v0.0.14' do
          it 'as expected' do
            audit_version(v0_0_14, 'v0.0.14')
            expect(v0_0_14.num_gems_added).to eq(1)
          end
        end

        context 'v0.0.15' do
          it 'as expected' do
            audit_version(v0_0_15, 'v0.0.15')
            expect(v0_0_15.num_gems_added).to eq(0)
          end
        end

        context 'v0.0.16' do
          it 'as expected' do
            audit_version(v0_0_16, 'v0.0.16')
            expect(v0_0_16.num_gems_added).to eq(0)
          end
        end

        context 'v0.0.17' do
          it 'as expected' do
            audit_version(v0_0_17, 'v0.0.17')
            expect(v0_0_17.num_gems_added).to eq(0)
          end
        end

        context 'v0.0.18' do
          it 'as expected' do
            audit_version(v0_0_18, 'v0.0.18')
            expect(v0_0_18.num_gems_added).to eq(2)
          end
        end

        context 'v0.0.19' do
          it 'as expected' do
            audit_version(v0_0_19, 'v0.0.19')
            expect(v0_0_19.num_gems_added).to eq(0)
          end
        end

        context 'v0.0.20' do
          it 'as expected' do
            audit_version(v0_0_20, 'v0.0.20')
            expect(v0_0_20.num_gems_added).to eq(0)
          end
        end

        context 'v0.0.21' do
          it 'as expected' do
            audit_version(v0_0_21, 'v0.0.21')
            expect(v0_0_21.num_gems_added).to eq(0)
          end
        end

        context 'v0.0.22' do
          it 'as expected' do
            audit_version(v0_0_22, 'v0.0.22')
            expect(v0_0_22.num_gems_added).to eq(0)
          end
        end

        context 'v0.0.23' do
          it 'as expected' do
            audit_version(v0_0_23, 'v0.0.23')
            expect(v0_0_23.num_gems_added).to eq(0)
          end
        end

        context 'v0.0.24' do
          it 'as expected' do
            audit_version(v0_0_24, 'v0.0.24')
            expect(v0_0_24.num_gems_added).to eq(0)
          end
        end

        context 'v0.0.25' do
          it 'as expected' do
            audit_version(v0_0_25, 'v0.0.25')
            expect(v0_0_25.num_gems_added).to eq(0)
          end
        end

        context 'v0.0.26' do
          it 'as expected' do
            audit_version(v0_0_26, 'v0.0.26')
            expect(v0_0_26.num_gems_added).to eq(0)
          end
        end

        context 'v0.0.27' do
          it 'as expected' do
            audit_version(v0_0_27, 'v0.0.27')
            expect(v0_0_27.num_gems_added).to eq(1)
          end
        end

        context 'v0.0.28' do
          it 'as expected' do
            audit_version(v0_0_28, 'v0.0.28')
            expect(v0_0_28.num_gems_added).to eq(0)
          end
        end

        context 'v0.0.29' do
          it 'as expected' do
            audit_version(v0_0_29, 'v0.0.29')
            expect(v0_0_29.num_gems_added).to eq(0)
          end
        end

        context 'v0.0.30' do
          it 'as expected' do
            audit_version(v0_0_30, 'v0.0.30')
            expect(v0_0_30.num_gems_added).to eq(0)
          end
        end

        context 'v0.0.31' do
          it 'as expected' do
            audit_version(v0_0_31, 'v0.0.31')
            expect(v0_0_31.num_gems_added).to eq(0)
          end
        end

        context 'v0.0.32' do
          it 'as expected' do
            audit_version(v0_0_32, 'v0.0.32')
            expect(v0_0_32.num_gems_added).to eq(0)
          end
        end

        context 'v0.0.33' do
          it 'as expected' do
            audit_version(v0_0_33, 'v0.0.33')
            expect(v0_0_33.num_gems_added).to eq(0)
          end
        end

        context 'v0.0.34' do
          it 'as expected' do
            audit_version(v0_0_34, 'v0.0.34')
            expect(v0_0_34.num_gems_added).to eq(0)
          end
        end

        context 'v0.0.35' do
          it 'as expected' do
            audit_version(v0_0_35, 'v0.0.35')
            expect(v0_0_35.num_gems_added).to eq(1)
          end
        end

        context 'v0.0.36' do
          it 'as expected' do
            audit_version(v0_0_36, 'v0.0.36')
            expect(v0_0_36.num_gems_added).to eq(0)
          end
        end

        context 'v0.0.37' do
          it 'as expected' do
            audit_version(v0_0_37, 'v0.0.37')
            expect(v0_0_37.num_gems_added).to eq(0)
          end
        end

        context 'v0.0.38' do
          it 'as expected' do
            audit_version(v0_0_38, 'v0.0.38')
            expect(v0_0_38.num_gems_added).to eq(0)
          end
        end

        context 'v0.0.39' do
          it 'as expected' do
            audit_version(v0_0_39, 'v0.0.39')
            expect(v0_0_39.num_gems_added).to eq(0)
          end
        end

        context 'v0.0.40' do
          it 'as expected' do
            audit_version(v0_0_40, 'v0.0.40')
            expect(v0_0_40.num_gems_added).to eq(1)
          end
        end

      end # end{versions}

    end

  end

end
