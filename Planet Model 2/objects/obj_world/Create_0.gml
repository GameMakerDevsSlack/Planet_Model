world_define( 7, 300, 0.13, 3.5 );
world_generate();

vbf_tiles  = world_tile_vertex_buffer();
vbf_relief = world_tile_relief_vertex_buffer();

quaternion = quaternion_create();
matrix = quaternion_matrix( quaternion );
rot_x_speed = 0;
rot_y_speed = 0;
rot_z_speed = 0;

/*
for( var _i = 0; _i < world_hex_grid_count; _i++ ) {
	var _inst = instance_create_depth( 0, 0, 0, obj_test_character );
	_inst.hex_a = _i;
}
/*/
repeat( 20 ) instance_create_depth( 0, 0, 0, obj_test_character );
//*/