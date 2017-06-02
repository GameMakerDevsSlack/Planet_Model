if ( global.keyboard_control ) {
	
	if ( keyboard_check( ord( "W" ) ) ) rot_x_speed += 0.22;
	if ( keyboard_check( ord( "S" ) ) ) rot_x_speed -= 0.22;
	if ( keyboard_check( ord( "A" ) ) ) rot_z_speed += 0.22;
	if ( keyboard_check( ord( "D" ) ) ) rot_z_speed -= 0.22;
	if ( keyboard_check( ord( "Q" ) ) ) rot_y_speed -= 0.22;
	if ( keyboard_check( ord( "E" ) ) ) rot_y_speed += 0.22;
	if ( keyboard_check( ord( "R" ) ) ) camera_vel_y -= 0.002;
	if ( keyboard_check( ord( "F" ) ) ) camera_vel_y += 0.002;
	rot_x_speed *= 0.84;
	rot_y_speed *= 0.84;
	rot_z_speed *= 0.84;
	
} else {
	
	if ( !device_multitouch() ) and ( obj_screen.mouse_moved ) {
	
		if ( global.on_mobile ) var _k = 0.034 else var _k = 0.031;
		if ( obj_screen.mouse_p_hex >= 0 ) or ( obj_screen.mouse_p_inst >= 0 ) {
	
			rot_z_speed -= _k*lerp( 0.16, 1, camera_y )*( obj_screen.mouse_d_x - obj_screen.mouse_d_pre_x );
			rot_x_speed -= _k*lerp( 0.16, 1, camera_y )*( obj_screen.mouse_d_y - obj_screen.mouse_d_pre_y );
	
		} else if ( obj_screen.mouse_down ) {
			
			var _x1 = obj_screen.mouse_d_pre_x - (0.5*global.app_surf_width);
			var _y1 = obj_screen.mouse_d_pre_y - (0.5*global.app_surf_height);
			var _x2 = obj_screen.mouse_d_x - (0.5*global.app_surf_width);
			var _y2 = obj_screen.mouse_d_y - (0.5*global.app_surf_height);
			
			var _ang1 = point_direction( 0, 0, _x1, _y1 );
			var _ang2 = point_direction( 0, 0, _x2, _y2 );
	
			var _dang = angle_difference( _ang2, _ang1 );
			rot_y_speed -= 3*_k*_dang;
	
		}
	
	}

	rot_x_speed *= 0.89;
	rot_y_speed *= 0.89;
	rot_z_speed *= 0.89;
	
	if ( global.on_mobile ) var _k = 0.012 else var _k = 0.008;
	var _scroll = obj_screen.mouse_scroll;
	if ( _scroll != 0 ) {
		if ( sign( camera_vel_y ) != sign( _scroll ) ) camera_vel_y = 0;
		camera_vel_y += _k*_scroll;
	}
	
}

var _recalc_matrix = false;
if ( abs( rot_x_speed ) > 0.01 ) { quaternion = quaternion_rotate_worldx( quaternion, rot_x_speed ); _recalc_matrix = true; }
if ( abs( rot_z_speed ) > 0.01 ) { quaternion = quaternion_rotate_worldz( quaternion, rot_z_speed ); _recalc_matrix = true; }
if ( abs( rot_y_speed ) > 0.01 ) { quaternion = quaternion_rotate_worldy( quaternion, rot_y_speed ); _recalc_matrix = true; }
if ( _recalc_matrix ) matrix = quaternion_matrix( quaternion );

camera_vel_y *= 0.88;
camera_y = clamp( camera_y + camera_vel_y, 0, 1 );

var _y = lerp( -350, -1100, ease_quad_inout( camera_y ) );
var _z = lerp(  200,     0, ease_quad_inout( camera_y ) );
var _w = lerp(   60,     0, ease_quad_inout( camera_y ) );

camera_view_matrix = matrix_build_lookat( 0,  _y, _z,
							              0,-300, _w,
							              0,   0,  1 );
camera_proj_matrix = matrix_build_projection_perspective_fov( 60, global.app_surf_width/global.app_surf_height, 1, 16000 );
camera_viewproj_matrix = matrix_multiply( camera_view_matrix, camera_proj_matrix );