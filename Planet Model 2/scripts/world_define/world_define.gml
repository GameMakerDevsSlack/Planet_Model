/// @param subdivisions
/// @param scale

enum world_tri { a_x, a_y, a_z,
                 b_x, b_y, b_z,
				 c_x, c_y, c_z,
				 a_adj, b_adj, c_adj,
				 a_chi, b_chi, c_chi,
				 o_x, o_y, o_z,
				 parent, hex, size }
				 

world_subdivisions = argument0;
world_scale        = argument1;

world_max_triangles = 20 * ( power( 3, world_subdivisions-1) + power( 3, world_subdivisions ) );

world_grid_flipflop = false;
world_grid_a_count = 0;
world_grid_a = ds_grid_create( world_max_triangles, world_tri.size );
world_grid_b_count = 0;
world_grid_b = ds_grid_create( world_max_triangles, world_tri.size );