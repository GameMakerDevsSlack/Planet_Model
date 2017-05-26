world_define( 7, 300 );
world_create_icosahedron();
world_tri_subdivide_all_iterations();
world_tri_pop_all();
world_hex_process();

vbf_triangles = world_hex_vertex_buffer();