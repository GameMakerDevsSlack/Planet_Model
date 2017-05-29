world_define( 5, 300, 0.2, 5 );
world_generate();

vbf_triangles = world_tri_vertex_buffer();
vbf_hexes = world_hex_vertex_buffer();
vbf_tiles = world_tile_vertex_buffer();



enum world { triangles, hexes, tiles }
mode = world.tiles;

quaternion = quaternion_create();
matrix = quaternion_matrix( quaternion );
rot_x_speed = 0;
rot_y_speed = 0;
rot_z_speed = 0;