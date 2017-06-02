with( instance_create_depth( 0, 0, 0, obj_test_character ) ) {
	
	hex_a = irandom( obj_world.world_hex_grid_count-1 );
	hex_b = hex_a;
	
	if ( other.world_hex_grid[# hex_a, world_hex.test ] == 0.0 ) {
		model = vertex_create_buffer_from_buffer_fixed( global.buffer_boat, global.vft_3d, make_colour_random(), 1 );
	} else {
		var _model = choose( global.buffer_flag, global.buffer_bird );
		model = vertex_create_buffer_from_buffer_fixed( _model, global.vft_3d, make_colour_random(), 1 );
	}
}