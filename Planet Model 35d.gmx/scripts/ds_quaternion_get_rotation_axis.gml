///ds_quaternion_get_rotation_axis( quaternion )
//
//With thanks to Boris
//http://www.boristheengineer.co.uk/gamemaker/direct3d.htm

globalvar result_coord;

var a, b, c, d, r, ang, quaternion;

quaternion = argument0;

a = ds_list_find_value( quaternion, 0 );
b = ds_list_find_value( quaternion, 1 );
c = ds_list_find_value( quaternion, 2 );
d = ds_list_find_value( quaternion, 3 );

r = point_distance_3d( 0, 0, 0, b, c, d );
ang = radtodeg( arctan2( r, a ) );

result_coord[0] = b;
result_coord[1] = c;
result_coord[2] = d;
result_coord[3] = -2 * ang;
