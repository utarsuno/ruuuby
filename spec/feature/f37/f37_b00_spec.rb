# encoding: UTF-8

RSpec.describe 'f37_b00' do

  context 'functionality' do

    context 'defines{f37_b00}' do
      context 'c{PseudoGraph}' do
        context 'constructor' do
          context 'handles needed scenarios' do
            it 'simple creation' do
              obj = ::PseudoGraph.new
              expect(obj.ⓣ).to eq(::PseudoGraph)
            end
            it 'each instance created has a unique object_id' do
              obj_0 = ::PseudoGraph.new
              expect(obj_0.ⓣ).to eq(::PseudoGraph)
              obj_1 = ::PseudoGraph.new
              expect(obj_1.ⓣ).to eq(::PseudoGraph)
              expect(obj_0.🆔).to_not eq(obj_1.🆔)
            end
          end
        end
        context 'misc checks' do
          it 'extends rb_cObject' do
            expect(::PseudoGraph.ⓣ).to eq(::Class)
            expect(::PseudoGraph.superclass).to eq(::Data)
          end
        end
      end
    end # end: {defines{f37_b00}}

  end

  context 'audit', :audit do
    context 'vector.rb passes audits' do
      it 'module is defined in correct location' do
        expect_∃ᶜ(:PseudoGraph)
      end
      #context 'needed funcs are defined in expected location' do
      #  it 'for c{PseudoGraph}' do
      #    expect_∃⨍(:∅?, ::PseudoGraph)
      #  end
      #end
    end
  end # end: {audit}

end
