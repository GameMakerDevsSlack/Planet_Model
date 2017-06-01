//world_define( 6, 300, 0.13, 1.7 );
world_define( 7, 300, 0.13, 1 );
world_generate();

vbf_tiles  = world_tile_vertex_buffer();
vbf_relief = world_tile_relief_vertex_buffer();

camera_vel_y = 0;
camera_y = 0.6;

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
repeat( 30 ) instance_create_depth( 0, 0, 0, obj_test_character );
//*/