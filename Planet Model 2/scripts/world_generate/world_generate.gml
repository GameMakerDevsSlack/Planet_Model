world_create_icosahedron();
world_tri_subdivide_all_iterations();
world_tri_pop_all();
world_hex_create_from_tri_begin();
do world_hex_create_from_tri() until ds_list_empty( search_face_stack );
world_hex_create_from_tri_end();
world_hex_set_centres();
repeat( world_hex_grid_count ) world_tile_neighbours_add( world_hex.test, irandom( world_hex_grid_count-1 ), random( 1 ), 5 );
repeat( world_hex_grid_count*0.4 ) {
	var _index = irandom( world_hex_grid_count-1 );
	world_hex_grid[# _index, world_hex.tree ] = true;
	world_hex_grid[# _index, world_hex.rotation ] = random( 360 );
}
world_tile_all_add( world_hex.test, -world_tile_all_find_min( world_hex.test ) );
world_tile_all_multiply( world_hex.test, 1/world_tile_all_find_max( world_hex.test ) );
world_tile_all_clamp( world_hex.test, 0.33, 1 );
world_tile_all_add( world_hex.test, -0.33 );
world_tile_all_multiply( world_hex.test, 1/(1-0.33) );
for( var _i = 0; _i < world_hex_grid_count; _i++ ) world_hex_grid[# _i, world_hex.test ] = ( ( 5*world_hex_grid[# _i, world_hex.test ] ) div 1 )/5;
world_tile_set_edges();