world_define( 6, 300, 0.16, 1.7 );
//world_define( 7, 300, 0.13, 1 );
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
repeat( 30 ) create_test_character();
//*/

var _y = lerp( -350, -1100, ease_quad_inout( camera_y ) );
var _z = lerp(  120,     0, ease_quad_inout( camera_y ) );

camera_view_matrix = matrix_build_lookat( 0,  _y, _z,
						                  0,-300, _z/2,
						                  0,   0,  1 );
camera_proj_matrix = matrix_build_projection_perspective_fov( 60, global.app_surf_width/global.app_surf_height, 1, 16000 );
camera_viewproj_matrix = matrix_multiply( camera_view_matrix, camera_proj_matrix );