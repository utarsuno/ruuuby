# encoding: UTF-8

RSpec.describe 'f37_b00' do

  context 'functionality' do

    context 'defines{f37_b00}' do
      context 'c{PseudoGraph}' do
        context 'constructor' do
          context 'handles needed scenarios' do
            it 'simple creation' do
              expect_pseudo_graph(::PseudoGraph.new(0), 0)
            end
            it 'each instance created has a unique object_id' do
              obj_0 = ::PseudoGraph.new(0)
              obj_1 = ::PseudoGraph.new(0)
              expect(obj_0.🆔).to_not eq(obj_1.🆔)
              expect_pseudo_graph(obj_0, 0)
              expect_pseudo_graph(obj_1, 0)
            end
            it 'creation w/ memory allocated' do
              graph = ::PseudoGraph.new(3)
              expect_pseudo_graph(graph, 3)
              expect{graph.free_memory}.to_not raise_error
            end
          end
        end
        context 'misc checks' do
          it 'extends rb_cObject' do
            expect(::PseudoGraph.ⓣ).to eq(::Class)
            expect(::PseudoGraph.superclass).to eq(::Data)
          end
        end

        context 'func{set_edge}' do
          context 'handles needed scenarios' do
            it 'cases: positive' do
              graph = ::PseudoGraph.new(3)
              graph.set_edge(0, 1, 0.5)
              expect(graph[0, 1]).to eq(0.5)
              expect{graph.free_memory}.to_not raise_error
            end
            it 'cases: negative' do

            end
          end
        end # end: {func{set_edge}}

        context 'func{set_edge_inverse}' do
          context 'handles needed scenarios' do
            it 'cases: positive' do
              graph = ::PseudoGraph.new(3)
              graph.set_edge_inverse(0, 1, 0.5)
              expect(graph[0, 1]).to eq(0.5)
              expect(graph[1, 0]).to eq(2.0)
              expect{graph.free_memory}.to_not raise_error
            end
            it 'cases: negative' do

            end
          end
        end # end: {func{set_edge}}

      end # end: {c{PseudoGraph}}
    end # end: {defines{f37_b00}}

  end

  context 'audit', :audit do
    context 'c{PseudoGraph} passes audits' do
      it 'module is defined in correct location' do
        expect_∃ᶜ(:PseudoGraph)
      end
      context 'needed funcs are defined in expected location' do
        it 'for c{PseudoGraph}' do
          expect_∃⨍(:num_nodes, ::PseudoGraph)
          expect_∃⨍(:free_memory, ::PseudoGraph)
          expect_∃⨍(:set_edge, ::PseudoGraph)
          expect_∃⨍(:[], ::PseudoGraph)
          expect_∃⨍(:print_debugging, ::PseudoGraph)
          expect_∃⨍_with_alias(:empty?, :∅?, ::PseudoGraph)
        end
      end
    end
  end # end: {audit}

end
