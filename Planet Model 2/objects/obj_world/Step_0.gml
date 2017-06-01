/*
if ( keyboard_check( ord( "W" ) ) ) rot_x_speed += 0.15;
if ( keyboard_check( ord( "S" ) ) ) rot_x_speed -= 0.15;
if ( keyboard_check( ord( "A" ) ) ) rot_z_speed += 0.15;
if ( keyboard_check( ord( "D" ) ) ) rot_z_speed -= 0.15;
if ( keyboard_check( ord( "Q" ) ) ) rot_y_speed -= 0.15;
if ( keyboard_check( ord( "E" ) ) ) rot_y_speed += 0.15;
if ( keyboard_check( ord( "R" ) ) ) camera_vel_y -= 0.002;
if ( keyboard_check( ord( "F" ) ) ) camera_vel_y += 0.002;

rot_x_speed *= 0.85;
rot_y_speed *= 0.85;
rot_z_speed *= 0.85;
*/


/*
if ( keyboard_check( ord( "W" ) ) ) rot_x_speed += 0.1;
if ( keyboard_check( ord( "S" ) ) ) rot_x_speed -= 0.1;
if ( keyboard_check( ord( "A" ) ) ) rot_z_speed += 0.1;
if ( keyboard_check( ord( "D" ) ) ) rot_z_speed -= 0.1;
if ( keyboard_check( ord( "Q" ) ) ) rot_y_speed -= 0.1;
if ( keyboard_check( ord( "E" ) ) ) rot_y_speed += 0.1;
rot_x_speed *= 0.96;
rot_y_speed *= 0.96;
rot_z_speed *= 0.96;
*/

var _app_w = surface_get_width( application_surface );
var _app_h = surface_get_height( application_surface );



var _k = 0.031;
if ( obj_screen.mouse_p_hex >= 0 ) or ( obj_screen.mouse_p_inst >= 0 ) {
	
	rot_z_speed -= _k*lerp( 0.16, 1, camera_y )*( obj_screen.mouse_d_x - obj_screen.mouse_d_pre_x );
	rot_x_speed -= _k*lerp( 0.16, 1, camera_y )*( obj_screen.mouse_d_y - obj_screen.mouse_d_pre_y );
	
} else if ( obj_screen.mouse_down ) {
	
	//rot_y_speed -= _k*( obj_screen.mouse_d_y - obj_screen.mouse_d_pre_y )*sign( (0.5*_app_w)-obj_screen.mouse_d_x );
	
	var _x1 = obj_screen.mouse_d_pre_x - (0.5*_app_w);
	var _y1 = obj_screen.mouse_d_pre_y - (0.5*_app_h);
	var _x2 = obj_screen.mouse_d_x - (0.5*_app_w);
	var _y2 = obj_screen.mouse_d_y - (0.5*_app_h);
	
	var _ang1 = point_direction( 0, 0, _x1, _y1 );
	var _ang2 = point_direction( 0, 0, _x2, _y2 );
	
	var _dang = angle_difference( _ang2, _ang1 );
	rot_y_speed -= 3.5*_k*_dang;
	
}

var _recalc_matrix = false;
if ( abs( rot_x_speed ) > 0.01 ) { quaternion = quaternion_rotate_worldx( quaternion, rot_x_speed ); _recalc_matrix = true; }
if ( abs( rot_z_speed ) > 0.01 ) { quaternion = quaternion_rotate_worldz( quaternion, rot_z_speed ); _recalc_matrix = true; }
if ( abs( rot_y_speed ) > 0.01 ) { quaternion = quaternion_rotate_worldy( quaternion, rot_y_speed ); _recalc_matrix = true; }
if ( _recalc_matrix ) matrix = quaternion_matrix( quaternion );

rot_x_speed *= 0.89;
rot_y_speed *= 0.89;
rot_z_speed *= 0.89;



if ( mouse_wheel_down() ) {
	if ( camera_vel_y < 0 ) camera_vel_y = 0;
	camera_vel_y += 0.010;
}
if ( mouse_wheel_up() ) {
	if ( camera_vel_y > 0 ) camera_vel_y = 0;
	camera_vel_y -= 0.010;
}

camera_vel_y *= 0.88;
camera_y = clamp( camera_y + camera_vel_y, 0, 1 );

var _y = lerp( -350, -1100, ease_quad_inout( camera_y ) );
var _z = lerp(  120,     0, ease_quad_inout( camera_y ) );

camera_view_matrix = matrix_build_lookat( 0,  _y, _z,
							                0,-300, _z/2,
							                0,   0,  1 );
camera_proj_matrix = matrix_build_projection_perspective_fov( 60, _app_w/_app_h, 1, 16000 );
camera_viewproj_matrix = matrix_multiply( camera_view_matrix, camera_proj_matrix );