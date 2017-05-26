repeat( world_subdivisions ) {
	world_tri_grid_b_count = 0;
	for( var _i = 0; _i < world_tri_grid_a_count; _i++ ) world_tri_subdivide( _i );
	for( var _i = 0; _i < world_tri_grid_b_count; _i++ ) world_tri_find_neighbours( _i );
	world_tri_flip();
}