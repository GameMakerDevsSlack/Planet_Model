if ( keyboard_check_pressed( ord( "1" ) ) ) {
	mode = world.triangles;
} else if ( keyboard_check_pressed( ord( "2" ) ) ) {
	mode = world.hexes;
} else if ( keyboard_check_pressed( ord( "3" ) ) ) {
	mode = world.tiles;
}


if( obj_screen.do_ortho ) {
	if ( keyboard_check( ord( "W" ) ) ) rot_x_speed -= 0.15;
	if ( keyboard_check( ord( "S" ) ) ) rot_x_speed += 0.15;
	if ( keyboard_check( ord( "A" ) ) ) rot_z_speed -= 0.15;
	if ( keyboard_check( ord( "D" ) ) ) rot_z_speed += 0.15;
	if ( keyboard_check( ord( "Q" ) ) ) rot_y_speed -= 0.15;
	if ( keyboard_check( ord( "E" ) ) ) rot_y_speed += 0.15;
	rot_x_speed *= 0.85;
	rot_y_speed *= 0.85;
	rot_z_speed *= 0.85;
} else {
	if ( keyboard_check( ord( "W" ) ) ) rot_x_speed += 0.15;
	if ( keyboard_check( ord( "S" ) ) ) rot_x_speed -= 0.15;
	if ( keyboard_check( ord( "A" ) ) ) rot_z_speed += 0.15;
	if ( keyboard_check( ord( "D" ) ) ) rot_z_speed -= 0.15;
	if ( keyboard_check( ord( "Q" ) ) ) rot_y_speed -= 0.15;
	if ( keyboard_check( ord( "E" ) ) ) rot_y_speed += 0.15;
	rot_x_speed *= 0.85;
	rot_y_speed *= 0.85;
	rot_z_speed *= 0.85;
}
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

if ( abs( rot_x_speed ) > 0.01 ) quaternion = quaternion_rotate_worldx( quaternion, rot_x_speed );
if ( abs( rot_z_speed ) > 0.01 ) quaternion = quaternion_rotate_worldz( quaternion, rot_z_speed );
if ( abs( rot_y_speed ) > 0.01 ) quaternion = quaternion_rotate_worldy( quaternion, rot_y_speed );
matrix = quaternion_matrix( quaternion );