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

      context 'defines versions' do
        context 'v0.0.0' do
          it 'as expected' do
            audit_version(v0_0_0, 'v0.0.0', 0)
          end
        end

        context 'v0.0.1' do
          it 'as expected' do
            audit_version(v0_0_1, 'v0.0.1', 4)
            expect(v0_0_1.id).to_not eq(v0_0_0.id)
          end
        end

        context 'v0.0.2' do
          it 'as expected' do
            audit_version(v0_0_2, 'v0.0.2', 0)
            expect(v0_0_2.id).to_not eq(v0_0_0.id)
            expect(v0_0_2.id).to_not eq(v0_0_1.id)
          end
        end

        context 'v0.0.3' do
          it 'as expected' do
            audit_version(v0_0_3, 'v0.0.3', 0)
          end
        end

        context 'v0.0.4' do
          it 'as expected' do
            audit_version(v0_0_4, 'v0.0.4', 1)
          end
        end

        context 'v0.0.5' do
          it 'as expected' do
            audit_version(v0_0_5, 'v0.0.5', 0)
          end
        end

        context 'v0.0.6' do
          it 'as expected' do
            audit_version(v0_0_6, 'v0.0.6', 0)
          end
        end

        context 'v0.0.7' do
          it 'as expected' do
            audit_version(v0_0_7, 'v0.0.7', 1)
          end
        end

        context 'v0.0.8' do
          it 'as expected' do
            audit_version(v0_0_8, 'v0.0.8', 0)
          end
        end

        context 'v0.0.9' do
          it 'as expected' do
            audit_version(v0_0_9, 'v0.0.9', 0)
          end
        end

        context 'v0.0.10' do
          it 'as expected' do
            audit_version(v0_0_10, 'v0.0.10', 0)
          end
        end

        context 'v0.0.11' do
          it 'as expected' do
            audit_version(v0_0_11, 'v0.0.11', 0)
          end
        end

        context 'v0.0.12' do
          it 'as expected' do
            audit_version(v0_0_12, 'v0.0.12', 0)
          end
        end

        context 'v0.0.13' do
          it 'as expected' do
            audit_version(v0_0_13, 'v0.0.13', 0)
          end
        end

        context 'v0.0.14' do
          it 'as expected' do
            audit_version(v0_0_14, 'v0.0.14', 1)
          end
        end

        context 'v0.0.15' do
          it 'as expected' do
            audit_version(v0_0_15, 'v0.0.15', 0)
          end
        end

        context 'v0.0.16' do
          it 'as expected' do
            audit_version(v0_0_16, 'v0.0.16', 0)
          end
        end

        context 'v0.0.17' do
          it 'as expected' do
            audit_version(v0_0_17, 'v0.0.17', 0)
          end
        end

        context 'v0.0.18' do
          it 'as expected' do
            audit_version(v0_0_18, 'v0.0.18', 2)
          end
        end

        context 'v0.0.19' do
          it 'as expected' do
            audit_version(v0_0_19, 'v0.0.19', 0, false)
          end
        end

        context 'v0.0.20' do
          it 'as expected' do
            audit_version(v0_0_20, 'v0.0.20', 0)
          end
        end

        context 'v0.0.21' do
          it 'as expected' do
            audit_version(v0_0_21, 'v0.0.21', 0)
          end
        end

        context 'v0.0.22' do
          it 'as expected' do
            audit_version(v0_0_22, 'v0.0.22', 0)
          end
        end

        context 'v0.0.23' do
          it 'as expected' do
            audit_version(v0_0_23, 'v0.0.23', 0)
          end
        end

        context 'v0.0.24' do
          it 'as expected' do
            audit_version(v0_0_24, 'v0.0.24', 0)
          end
        end

        context 'v0.0.25' do
          it 'as expected' do
            audit_version(v0_0_25, 'v0.0.25', 0)
          end
        end

        context 'v0.0.26' do
          it 'as expected' do
            audit_version(v0_0_26, 'v0.0.26', 0)
          end
        end

        context 'v0.0.27' do
          it 'as expected' do
            audit_version(v0_0_27, 'v0.0.27', 1)
          end
        end

        context 'v0.0.28' do
          it 'as expected' do
            audit_version(v0_0_28, 'v0.0.28', 0)
          end
        end

        context 'v0.0.29' do
          it 'as expected' do
            audit_version(v0_0_29, 'v0.0.29', 0)
          end
        end

        context 'v0.0.30' do
          it 'as expected' do
            audit_version(v0_0_30, 'v0.0.30', 0)
          end
        end

        context 'v0.0.31' do
          it 'as expected' do
            audit_version(v0_0_31, 'v0.0.31', 0)
          end
        end

        context 'v0.0.32' do
          it 'as expected' do
            audit_version(v0_0_32, 'v0.0.32', 0)
          end
        end

        context 'v0.0.33' do
          it 'as expected' do
            audit_version(v0_0_33, 'v0.0.33', 0)
          end
        end

        context 'v0.0.34' do
          it 'as expected' do
            audit_version(v0_0_34, 'v0.0.34', 0)
          end
        end

        context 'v0.0.35' do
          it 'as expected' do
            audit_version(v0_0_35, 'v0.0.35', 1)
          end
        end

        context 'v0.0.36' do
          it 'as expected' do
            audit_version(v0_0_36, 'v0.0.36', 0)
          end
        end

        context 'v0.0.37' do
          it 'as expected' do
            audit_version(v0_0_37, 'v0.0.37', 0)
          end
        end

        context 'v0.0.38' do
          it 'as expected' do
            audit_version(v0_0_38, 'v0.0.38', 0)
          end
        end

        context 'v0.0.39' do
          it 'as expected' do
            audit_version(v0_0_39, 'v0.0.39', 0)
          end
        end

        context 'v0.0.40' do
          it 'as expected' do
            audit_version(v0_0_40, 'v0.0.40', 1)
          end
        end

        context 'v0.0.41' do
          it 'as expected' do
            audit_version(v0_0_41, 'v0.0.41', 0)
          end
        end

        context 'v0.0.42' do
          it 'as expected' do
            audit_version(v0_0_42, 'v0.0.42', 0)
          end
        end

        context 'v0.0.43' do
          it 'as expected' do
            audit_version(v0_0_43, 'v0.0.43', 0)
          end
        end

        #context 'v0.0.44' do
        #  it 'as expected' do
        #    audit_version(v0_0_44, 'v0.0.44', 0)
        #  end
        #end

      end # end{versions}

    end

  end

end
