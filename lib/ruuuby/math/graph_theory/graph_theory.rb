# encoding: UTF-8

# mathematics related code
module ::Math

  # ‣ `Four Color Theorem` | "any map is 4-colorable and so one only needs four different colors to assure that no 2 states or countries w/ the same color share a border"
  # ‣ graphs can be represented w/ Matrices (as long as each there does not exceed a single edge from one vertex to another in the same direction)
  module GraphTheory

    # https://en.wikipedia.org/wiki/Directed_acyclic_graph
    # https://en.wikipedia.org/wiki/Topological_sorting

    # | term                 | definition                                                         |
    # | -------------------- | ----------------------------------------------------------------- |
    # | `walk`               | process of traversing between `vertices`                          |
    # | `path`               | a `walk` w/o traversing over the same `vertex` more than once     |
    # | `trail`              | a `path` w/o traversing over the same `edge` more than once       |
    # | `cycle`              | `∃ path v₁,...,vᵢ` & `v₁ == vᵢ`                                   |
    # | `circuit`            | `∃ trail v₁,...,vᵢ` & `v₁ == vᵢ`                                  |
    # | `tree`               | a `graph` with no `cycles`                                        |
    # | `Eulerian Circuit`   | a `cycle` that visits every `vertex` and ends up where it started; graph, `G`, is `Eulerian` if and only if every vertex has even degree |
    # | `edge-cover`         | total cost (number of travels w/ or w/o `edge weights`) required to visit every `vertex` at least once                                   |
    # | `spanning tree`      | "collection of edges such that the collection of edges forms a tree and every vertex is included in the tree"                            |
    # | `strongly connected` | when ∃ `path` from any `vertex` to any other `vertex`; also called `completely connected`                                                |
    # | `not-planar`         | a graph which can't be drawn w/o `edges` crossing                                                                                        |

    # | graph types      | definition                                                                    |
    # | ---------------- | ---------------------------------------------------------------------------- |
    # | `regular graph`  | `vertices` connected w/ `edges`                                              |
    # | `digraph`        | a `regular graph` where `edges` are assigned a single direction              |
    # | `multi-graph`    | a `regular graph` allowing multiples `edges` to connect a pair of `vertices` |
    # | `weighted-graph` | a `weighted-graph` is a `graph` w/ `edges` containing assigned `weights`     |

    # | syntax    | meaning                                       |
    # | --------- | --------------------------------------------- |
    # | `deg(v₄)` | the number of edges connected to vertex: `v₄` |

  end

end
