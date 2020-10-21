# encoding: UTF-8

::RSpec.describe 'ruuuby_releases.rb' do

  context 'ApplicationRecord{RuuubyRelease}', :db do

    #context 'version wip' do
    #  it 'reports correct prev version' do
    #    expect(::RuuubyRelease::Version.wip).to eq(::RuuubyRelease::Version.curr.next)
    #    expect(::RuuubyRelease::Version.wip).to eq(v0_0_50)
    #  end
    #end

    context 'integration tests w/ modules{Version, Remote}' do

      context 'additional checks' do
        it 'curr reports matching prev' do
          expect(::RuuubyRelease::Version.curr.prev).to eq(::RuuubyRelease::Version.prev)
        end
      end

      context 'adds func{curr}' do
        context 'handling needed scenarios' do
          it 'cases: positive' do
            current = ::RuuubyRelease::Version.curr
            expect(current.uid_components).to eq(::RuuubyRelease::Remote.curr_uid)
            expect(current.release_tag.oid).to    eq($git.release_tags[-1][2].oid)
            expect(current.release_commit.oid).to eq($git.release_tags[-1][1].oid)
          end
          it 'cases: negative' do
            expect(::RuuubyRelease::Version.curr.uid_components).to_not eq(::RuuubyRelease::Remote.prev_uid)
          end
        end
      end
      context 'adds func{prev}' do
        context 'handling needed scenarios' do
          it 'cases: positive' do
            previous = ::RuuubyRelease::Version.prev
            expect(previous.uid_components).to eq(::RuuubyRelease::Remote.prev_uid)
            expect(previous.release_tag.oid).to    eq($git.release_tags[-2][2].oid)
            expect(previous.release_commit.oid).to eq($git.release_tags[-2][1].oid)
          end
          it 'cases: negative' do
            expect(::RuuubyRelease::Version.prev.uid_components).to_not eq(::RuuubyRelease::Remote.curr_uid)
          end
        end
      end
    end

    context 'static-functions' do

      context 'adds func{find_by_uid}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect(::RuuubyRelease['v0.0.26']).to eq(::RuuubyRelease[0, 0, 26])
            expect(::RuuubyRelease['0.0.26']).to eq(::RuuubyRelease[0, 0, 26])
          end
          it 'cases: negative' do
            expect{::RuuubyRelease[0, 0, 1337]}.to raise_error(::RuntimeError)
          end
        end
      end

    end # end: {static-functions}

    context 'instance-functions' do
      context 'RuuubyRelease ORM objects index order is sorted' do
        it 'ascending' do
          ::RuuubyRelease.all.∀τ²∈λ𝑓₍ᵢ،ᵢ₊₁₎{|prev, curr| expect(prev < curr && curr > prev).to eq(true)}
        end
      end
      context 'adds func{<}' do
        context 'handles needed cases' do
          it 'cases: positive' do
            expect(v0_0_24.<(v0_0_25)).to eq(true)
          end
          it 'cases: negative' do
            expect(v0_0_25.<(v0_0_24)).to eq(false)
          end
          it 'cases: error' do
            expect{v0_0_24.<(nil)}.to raise_error(::ArgumentError)
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
            expect{v0_0_24.>(nil)}.to raise_error(::ArgumentError)
          end
        end
      end
    end # end: {instance-functions}
  end # end: {RuuubyRelease}

end
