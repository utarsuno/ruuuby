# coding: utf-8

RSpec.describe 'ruuuby_release.rb' do

  context 'db', :db do

    context 'ApplicationRecord{RuuubyRelease}' do

      context 'ORM operations' do

        it 'can be created' do
          fake_release = RuuubyRelease.create!(vmajor: 1, vminor: 2, vtiny: 3)
          expect(fake_release.vmajor).to eq(1)
          expect(fake_release.vminor).to eq(2)
          expect(fake_release.vtiny).to eq(3)

          expect(fake_release.uid).to eq('v1.2.3')

          fake_release.♻️!
        end

        it 'prevents duplicate versions from being created' do
          expect{
            RuuubyRelease.spawn(1, 2, 3)
            RuuubyRelease.spawn(1, 2, 3)
          }.to raise_error(ActiveRecord::RecordNotUnique)

          result = RuuubyRelease.find_by_uid(1, 2, 3)
          result.♻️!
        end

        it 'prevents negative values being used for version values' do
          expect{ RuuubyRelease.spawn(1, 1, -1) }.to raise_error(ActiveRecord::RecordInvalid)
          expect{ RuuubyRelease.spawn(1, -1, 1) }.to raise_error(ActiveRecord::RecordInvalid)
          expect{ RuuubyRelease.spawn(-1, 1, 1) }.to raise_error(ActiveRecord::RecordInvalid)
        end

        it 'prevents non-integer values being used for version values' do
          expect{ RuuubyRelease.spawn(1.0, 1, 1) }.to raise_error(ActiveRecord::RecordInvalid)
          expect{ RuuubyRelease.spawn(1, 1, nil) }.to raise_error(ActiveRecord::RecordInvalid)
          expect{ RuuubyRelease.spawn(1.0, 1, []) }.to raise_error(ActiveRecord::RecordInvalid)
          expect{ RuuubyRelease.spawn('a', 1, 1) }.to raise_error(ActiveRecord::RecordInvalid)
        end
      end

      context 'static-functions' do

        context 'adds func{parse_uid_str}' do
          context 'handles needed scenarios' do
            it 'cases: positive' do
              expect(RuuubyRelease.parse_uid_str('v9.7.05')).to eq([9, 7, 5])
              expect(RuuubyRelease.parse_uid_str('v9.7.5')).to eq([9, 7, 5])
              expect(RuuubyRelease.parse_uid_str('9.7.05')).to eq([9, 7, 5])
              expect(RuuubyRelease.parse_uid_str('9.7.5')).to eq([9, 7, 5])
              expect(RuuubyRelease.parse_uid_str('v9.7.5 release')).to eq([9, 7, 5])
              expect(RuuubyRelease.parse_uid_str('v9.7.5 version')).to eq([9, 7, 5])
            end
            it 'cases: bad params' do
              expect{RuuubyRelease.parse_uid_str(nil)}.to raise_error(ArgumentError)
            end
          end
        end

        context 'adds func{find_by_uid}' do
          context 'handles needed scenarios' do
            it 'cases: positive' do
              expect(RuuubyRelease.find_by_uid('v0.0.26')).to eq(RuuubyRelease.find_by_uid(0, 0, 26))
              expect(RuuubyRelease.find_by_uid('0.0.26')).to eq(RuuubyRelease.find_by_uid(0, 0, 26))
            end
            it 'cases: negative' do
              expect{RuuubyRelease.find_by_uid(0, 0, 1337)}.to raise_error(RuntimeError)
            end
          end
        end

        context 'adds func{get_version_prev}' do
          it 'works' do
            expect(RuuubyRelease.get_version_prev).to eq(v0_0_26)
          end
        end

        context 'adds func{get_version_curr}' do
          it 'works' do
            expect(RuuubyRelease.get_version_curr).to eq(v0_0_27)
          end
        end


        context 'adds func{get_version_next}' do
          it 'works' do
            expect(RuuubyRelease.get_version_next).to eq(v0_0_28)
          end
        end

        context 'defines module[Syntax]' do
          it 'exists' do
            expect_∃module(:Syntax, ::RuuubyRelease)
          end

          context 'dynamically adds needed fetch functions' do
            context 'func{syntax_uid}' do
              it 'exists as needed' do
                expect(RuuubyRelease.respond_to?(:syntax_uid)).to eq(true)
                expect(RuuubyRelease.syntax_uid.class).to eq(Regexp)
                expect(RuuubyRelease.syntax_uid.source).to eq("\\A#{RuuubyRelease::Syntax::UID}\\z")
              end
            end
            # TODO: devise design to mark and exclude certain types of patterns (sub-modules likely)
            #context 'func{syntax_sql_uid}' do
            #  it 'exists as needed' do
            #    expect(RuuubyRelease.respond_to?(:syntax_sql_uid)).to eq(true)
            #    expect(RuuubyRelease.syntax_sql_uid.class).to eq(Regexp)
            #    expect(RuuubyRelease.syntax_sql_uid.source).to eq("\\A#{RuuubyRelease::Syntax::SQL_UID}\\z")
            #  end
            #end
          end

          context 'with needed constants' do
            context '::RuuubyRelease::Syntax::UID' do
              it 'exists' do
                expect(RuuubyRelease::Syntax::UID).to eq('(v?)\d.\d.\d(\d?)( ((version)|(release)))?')
              end
              it "can't be changed" do
                expect{RuuubyRelease::Syntax::UID = 5}.to raise_error(FrozenError)
              end
            end
            context '::RuuubyRelease::Syntax::SQL_UID' do
              it 'exists' do
                expect(RuuubyRelease::Syntax::SQL_UID).to eq('vmajor = ? AND vminor = ? AND vtiny = ?')
              end
              it "can't be changed" do
                expect{RuuubyRelease::Syntax::SQL_UID = 5}.to raise_error(FrozenError)
              end
            end
          end
        end # end{syntax}

      end # end{static-functions}

      context 'instance-functions' do
        context 'adds func{<}' do
          context 'handles needed cases' do
            it 'cases: positive' do
              expect(v0_0_24.<(v0_0_25)).to eq(true)
            end
            it 'cases: negative' do
              expect(v0_0_25.<(v0_0_24)).to eq(false)
            end
            it 'cases: error' do
              expect{v0_0_24.<(nil)}.to raise_error(ArgumentError)
            end
          end
        end
        context 'adds func{>}' do
          context 'handles needed cases' do
            it 'cases: positive' do
              expect(v0_0_25.>(v0_0_24)).to eq(true)
            end
            it 'cases: negative' do
              expect(v0_0_24.>(v0_0_25)).to eq(false)
            end
            it 'cases: error' do
              expect{v0_0_24.>(nil)}.to raise_error(ArgumentError)
            end
          end
        end
      end

    end # end{RuuubyRelease}

  end

end
