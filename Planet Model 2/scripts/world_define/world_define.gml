/// @param subdivisions
/// @param scale

enum world_tri { a_x, a_y, a_z,
                 b_x, b_y, b_z,
				 c_x, c_y, c_z,
				 a_adj, b_adj, c_adj,
				 a_chi, b_chi, c_chi,
				 o_x, o_y, o_z,
				 parent, hex, size }
				 
enum world_hex { x, y, z,
                 radius, phi, theta,
				 list_vx, list_vy, list_vz, list_adj,
				 visited, test,
				 size }

world_subdivisions = argument0;
world_scale        = argument1;

world_max_triangles    = 20*power( 3, world_subdivisions );
world_tri_grid_a       = ds_grid_create( world_max_triangles, world_tri.size );
world_tri_grid_b       = ds_grid_create( world_max_triangles, world_tri.size );
world_tri_grid_a_count = 0;
world_tri_grid_b_count = 0;

world_max_hexes        = 2+world_max_triangles/6;
world_hex_grid         = ds_grid_create( world_max_hexes, world_hex.size );
world_hex_grid_count   = 0;

vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_colour();
vertex_format_add_texcoord();
vertex_format_add_normal();
world_vertex_format = vertex_format_end();