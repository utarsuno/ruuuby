// encoding: UTF-8

#ifndef CRUUUBY_H7_TIME_SERIES_DATA
#include "c7_time_series_data.h"
#endif

#ifndef CRUUUBY_H8_GRAPHS
#define CRUUUBY_H8_GRAPHS


typedef struct Pseudo_Graph {
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
static VALUE  pseudo_graph_alloc(VALUE self);

static void _pseudo_graph_free(void * data) {if (data != NULL) {xfree(data);}}

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

#endif
