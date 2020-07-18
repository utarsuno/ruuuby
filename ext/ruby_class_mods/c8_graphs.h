// encoding: UTF-8

#ifndef CRUUUBY_H7_TIME_SERIES_DATA
#include "c7_time_series_data.h"
#endif

#ifndef CRUUUBY_H8_GRAPHS
#define CRUUUBY_H8_GRAPHS

typedef struct Pseudo_Graph {
    unsigned int num_nodes;
    double * nodes;
} PseudoGraph, *ptr_pseudo_graph;

/*                                                           __
                                                            /\ \                 __
    ___ ___      __    ___ ___     ___   _ __   __  __      \_\ \___        ____/\_\  ____      __
  /' __` __`\  /'__`\/' __` __`\  / __`\/\`'__\/\ \/\ \    /\___  __\      /',__\/\ \/\_ ,`\  /'__`\
  /\ \/\ \/\ \/\  __//\ \/\ \/\ \/\ \L\ \ \ \/ \ \ \_\ \   \/__/\ \_/     /\__, `\ \ \/_/  /_/\  __/
  \ \_\ \_\ \_\ \____\ \_\ \_\ \_\ \____/\ \_\  \/`____ \      \ \_\      \/\____/\ \_\/\____\ \____\
   \/_/\/_/\/_/\/____/\/_/\/_/\/_/\/___/  \/_/   `/___/> \      \/_/       \/___/  \/_/\/____/\/____/
                                                    /\___/
                                                    \/__/                                            */

static void   _pseudo_graph_free(void * data);
static size_t _pseudo_graph_size(const void * data);
static VALUE  pseudo_graph_m_free(VALUE self);
static VALUE  pseudo_graph_alloc(VALUE self);
static VALUE  pseudo_graph_m_initialize(VALUE self, const VALUE num_nodes);
static void   ptr_pseudo_graph_free(ptr_pseudo_graph graph);

static void ptr_pseudo_graph_free(ptr_pseudo_graph graph) {
    if (graph != NULL) {
        if (graph->nodes != NULL && graph->num_nodes != 0) {
            xfree(graph->nodes);
            //graph->nodes     = NULL;
            graph->num_nodes = 0;
        }
    }
}

static void _pseudo_graph_free(void * data) {
    if (data != NULL) {
        ptr_pseudo_graph_free(data);
        xfree(data);
    }
}

static size_t _pseudo_graph_size(const void * data) {return sizeof(struct Pseudo_Graph);}

static const rb_data_type_t type_pseudo_graph = {
    .data             = NULL,
    .flags             = RUBY_TYPED_PROMOTED1,
    .wrap_struct_name = "pseudo_graph",
    .function         = {
        .dmark = NULL, // NULL as the struct contains no references to the c-data-type{VALUE}
        .dfree = _pseudo_graph_free,
        .dsize = _pseudo_graph_size,
    },
};

static VALUE pseudo_graph_alloc(VALUE self){
    ptr_pseudo_graph graph;
    return TypedData_Make_Struct(self, PseudoGraph, & type_pseudo_graph, graph);
}

#define 💎parse_ptr_pseudo_graph(the_data, the_ptr) TypedData_Get_Struct(the_data, PseudoGraph, & type_pseudo_graph, the_ptr)
#define 💎self_to_ptr_pseudo_graph ptr_pseudo_graph graph; 💎parse_ptr_pseudo_graph(self, graph);

static VALUE pseudo_graph_m_free(VALUE self) {
    💎self_to_ptr_pseudo_graph
    ptr_pseudo_graph_free(graph);
    return Qnil;
}

static VALUE pseudo_graph_m_initialize(VALUE self, const VALUE num_nodes) {
    🛑_is_fixnum("PseudoGraph", "new", "num_nodes", num_nodes);
    💎self_to_ptr_pseudo_graph
    graph->num_nodes = FIX2INT(num_nodes);
    if (graph->num_nodes != 0) {
        graph->nodes     = 💎create_ptr_dbls(graph->num_nodes * graph->num_nodes);
        unsigned int len = graph->num_nodes;
        unsigned int r, c;
        for (r = 0; r < len; r++) {
            for (c = 0; c < len; c++) {
                graph->nodes[r * len + c] = 0.0;
            }
        }
    } else {
        graph->nodes = NULL;
    }
    re_me
}

// ---------------------------

static void ptr_pseudo_graph_print_debugging(ptr_pseudo_graph graph);
static void ptr_pseudo_graph_set_edge(ptr_pseudo_graph graph, const unsigned int node_from, const unsigned int node_to, const double edge_weight);
static void ptr_pseudo_graph_set_edge_inverse(ptr_pseudo_graph graph, const unsigned int node_from, const unsigned int node_to, const double edge_weight);
static double ptr_pseudo_graph_get_edge(ptr_pseudo_graph graph, const unsigned int node_from, const unsigned int node_to);

static void ptr_pseudo_graph_print_debugging(ptr_pseudo_graph graph) {
    unsigned int len = graph->num_nodes;
    unsigned int r, c;
    for (r = 0; r < len; r++) {
        for (c = 0; c < len; c++) {
            printf("[%u, %u]: {%f}\n", r, c, graph->nodes[r * len + c]);
        }
    }
}

static void ptr_pseudo_graph_set_edge(ptr_pseudo_graph graph, const unsigned int node_from, const unsigned int node_to, const double edge_weight) {
    graph->nodes[node_from * graph->num_nodes + node_to] = edge_weight;
}

static void ptr_pseudo_graph_set_edge_inverse(ptr_pseudo_graph graph, const unsigned int node_from, const unsigned int node_to, const double edge_weight) {
    graph->nodes[node_from * graph->num_nodes + node_to] = edge_weight;
    graph->nodes[node_to * graph->num_nodes + node_from] = 1.0 / edge_weight;
}

static double ptr_pseudo_graph_get_edge(ptr_pseudo_graph graph, const unsigned int node_from, const unsigned int node_to) {
    return graph->nodes[node_from * graph->num_nodes + node_to];
}

static VALUE pseudo_graph_m_print_debugging(const VALUE self);
static VALUE pseudo_graph_m_set_edge(const VALUE self, const VALUE node_from, const VALUE node_to, const VALUE edge_weight);
static VALUE pseudo_graph_m_set_edge_inverse(const VALUE self, const VALUE node_from, const VALUE node_to, const VALUE edge_weight);
static VALUE pseudo_graph_m_get_edge(const VALUE self, const VALUE node_from, const VALUE node_to);

static VALUE pseudo_graph_m_print_debugging(const VALUE self) {
    💎self_to_ptr_pseudo_graph
    ptr_pseudo_graph_print_debugging(graph);
    re_me
}

static VALUE pseudo_graph_m_set_edge(const VALUE self, const VALUE node_from, const VALUE node_to, const VALUE edge_weight) {
    💎self_to_ptr_pseudo_graph
    🛑_is_fixnum("PseudoGraph", "set_edge", "node_from", node_from);
    🛑_is_fixnum("PseudoGraph", "set_edge", "node_to", node_to);
    const int val_node_from = FIX2INT(node_from);
    const int val_node_to   = FIX2INT(node_to);
    if (val_node_from < 0 || val_node_from >= (int) (graph->num_nodes)) {
        rb_raise(R_ERR_ARG, "| c{PseudoGraph}-> m{set_edge} got arg-node-from w/ val{%"PRIsVALUE"} when range is {0}-{%u} |", node_from, graph->num_nodes);
    }
    if (val_node_from < 0 || val_node_to >= (int) (graph->num_nodes)) {
        rb_raise(R_ERR_ARG, "| c{PseudoGraph}-> m{set_edge} got arg-node-to w/ val{%"PRIsVALUE"} when range is {0}-{%u} |", node_to, graph->num_nodes);
    }
    🛑_is_flt("PseudoGraph", "set_edge", "edge_weight", edge_weight);
    ptr_pseudo_graph_set_edge(graph, (unsigned int) val_node_from, (unsigned int) val_node_to, NUM2DBL(edge_weight));
    re_me
}

static VALUE pseudo_graph_m_set_edge_inverse(const VALUE self, const VALUE node_from, const VALUE node_to, const VALUE edge_weight) {
    💎self_to_ptr_pseudo_graph
    🛑_is_fixnum("PseudoGraph", "set_edge_inverse", "node_from", node_from);
    🛑_is_fixnum("PseudoGraph", "set_edge_inverse", "node_to", node_to);
    🛑_is_flt("PseudoGraph", "set_edge_inverse", "edge_weight", edge_weight);
    ptr_pseudo_graph_set_edge_inverse(graph, FIX2UINT(node_from), FIX2UINT(node_to), NUM2DBL(edge_weight));
    re_me
}

static VALUE pseudo_graph_m_get_edge(const VALUE self, const VALUE node_from, const VALUE node_to) {
    💎self_to_ptr_pseudo_graph
    🛑_is_fixnum("PseudoGraph", "[]", "node_from", node_from);
    🛑_is_fixnum("PseudoGraph", "[]", "node_to", node_to);
    return DBL2NUM(ptr_pseudo_graph_get_edge(graph, FIX2UINT(node_from), FIX2UINT(node_to)));
}

/*                      __                 __         ___             ___       __
                       /\ \               /\ \      /'___\ __        /\_ \     /\ \
    ___     __      ___\ \ \___      __   \_\ \    /\ \__//\_\     __\//\ \    \_\ \    ____
   /'___\ /'__`\   /'___\ \  _ `\  /'__`\ /'_` \   \ \ ,__\/\ \  /'__`\\ \ \   /'_` \  /',__\
  /\ \__//\ \L\.\_/\ \__/\ \ \ \ \/\  __//\ \L\ \   \ \ \_/\ \ \/\  __/ \_\ \_/\ \L\ \/\__, `\
  \ \____\ \__/.\_\ \____\\ \_\ \_\ \____\ \___,_\   \ \_\  \ \_\ \____\/\____\ \___,_\/\____/
   \/____/\/__/\/_/\/____/ \/_/\/_/\/____/\/__,_ /    \/_/   \/_/\/____/\/____/\/__,_ /\/___/ */

#define ⓡ𝑓_ptr_psuedo_graph(func_name, expr)             static VALUE func_name(const VALUE self){💎self_to_ptr_pseudo_graph; expr}
#define ⓡ𝑓_ptr_psuedo_graph_getter(func_name, expr)      static VALUE func_name(const VALUE self){💎self_to_ptr_pseudo_graph; return expr;}
#define ⓡ𝑓_ptr_psuedo_graph_getter_bool(func_name, expr) static VALUE func_name(const VALUE self){💎self_to_ptr_pseudo_graph; re_as_bool(expr)}
#define ⓡ𝑓_ptr_psuedo_graph_getter_dbl(func_name, expr)  static VALUE func_name(const VALUE self){💎self_to_ptr_pseudo_graph; return DBL2NUM(expr);}
#define ⓡ𝑓_ptr_psuedo_graph_getter_int(func_name, expr)  static VALUE func_name(const VALUE self){💎self_to_ptr_pseudo_graph; return UINT2NUM(expr);}

static VALUE pseudo_graph_m_get_num_nodes(const VALUE self);
static VALUE pseudo_graph_m_get_is_empty(const VALUE self);

ⓡ𝑓_ptr_psuedo_graph_getter_int(pseudo_graph_m_get_num_nodes, graph->num_nodes)
ⓡ𝑓_ptr_psuedo_graph_getter_bool(pseudo_graph_m_get_is_empty, graph->num_nodes == 0)

#endif
