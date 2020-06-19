# coding: UTF-8

RSpec.describe 'application_record.rb' do

  context 'ApplicationRecord', :db do

    context 'adds static functions' do
      let(:flag_wip){::RuuubyFeature::EnumFlagState::STATE_WIP}
      let(:flag_stable){::RuuubyFeature::EnumFlagState::STATE_STABLE}
      let(:flag_todo){::RuuubyFeature::EnumFlagState::STATE_NULL}
      let(:flag_needs_merge){::RuuubyFeature::EnumFlagState::STATE_NEEDS_MERGE}
      let(:expected_wip){RuuubyFeature.where('flag_state = ?', flag_wip).count}
      let(:expected_stable){::RuuubyFeature.where('flag_state = ?', flag_stable).count}
      let(:expected_todo){::RuuubyFeature.where('flag_state = ?', flag_todo).count}
      let(:expected_needs_merge){::RuuubyFeature.where('flag_state = ?', flag_needs_merge).count}

      context 'func{length}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect(::RuuubyFeature.length).to eq(expected_wip + expected_stable + expected_todo + expected_needs_merge)
          end
        end
      end

      context 'func{num_where}' do
        context 'handles needed scenarios' do
          context 'cases: positive' do
            it 'w/ 1 group' do
              expect(::RuuubyFeature.num_where(*['flag_state = ?', flag_wip])).to eq(expected_wip)
              expect(::RuuubyFeature.num_where(*['flag_state = ?', flag_stable])).to eq(expected_stable)
              expect(::RuuubyFeature.num_where(*['flag_state = ?', flag_todo])).to eq(expected_todo)
              expect(::RuuubyFeature.num_where(*['flag_state = ?', flag_needs_merge])).to eq(expected_needs_merge)
            end
            it 'w/ 2 groups' do
              expect(::RuuubyFeature.num_where(*['flag_state = ? OR flag_state = ?', flag_wip, flag_needs_merge])).to eq(expected_wip + expected_needs_merge)
              expect(::RuuubyFeature.num_where(*['flag_state = ? OR flag_state = ?', flag_wip, flag_stable])).to eq(expected_wip + expected_stable)
              expect(::RuuubyFeature.num_where(*['flag_state = ? OR flag_state = ?', flag_wip, flag_todo])).to eq(expected_wip + expected_todo)

              expect(::RuuubyFeature.num_where(*['flag_state = ? OR flag_state = ?', flag_needs_merge, flag_stable])).to eq(expected_needs_merge + expected_stable)
              expect(::RuuubyFeature.num_where(*['flag_state = ? OR flag_state = ?', flag_needs_merge, flag_todo])).to eq(expected_needs_merge + expected_todo)

              expect(::RuuubyFeature.num_where(*['flag_state = ? OR flag_state = ?', flag_stable, flag_todo])).to eq(expected_stable + expected_todo)
            end
            it 'w/ 3 groups' do
              expect(::RuuubyFeature.num_where(*['flag_state = ? OR flag_state = ? OR flag_state = ?', flag_wip, flag_needs_merge, flag_todo])).to eq(expected_wip + expected_needs_merge + expected_todo)
              expect(::RuuubyFeature.num_where(*['flag_state = ? OR flag_state = ? OR flag_state = ?', flag_wip, flag_needs_merge, flag_stable])).to eq(expected_wip + expected_needs_merge + expected_stable)
            end
            it 'w/ 4 groups' do
              expect(::RuuubyFeature.num_where(*['flag_state = ? OR flag_state = ? OR flag_state = ? OR flag_state = ?', flag_wip, flag_needs_merge, flag_todo, flag_stable])).to eq(expected_wip + expected_needs_merge + expected_todo + expected_stable)
            end
          end
        end
      end

    end # end: {adds static functions}

  end

end
