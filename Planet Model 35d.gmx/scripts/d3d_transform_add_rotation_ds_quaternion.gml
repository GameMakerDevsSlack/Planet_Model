///d3d_transform_add_rotation_ds_quaternion( quaternion )
//
//With thanks to Boris
//http://www.boristheengineer.co.uk/gamemaker/direct3d.htm

var a, b, c, d, r, ang, quaternion

quaternion = argument0;

a = ds_list_find_value( quaternion, 0 );
b = ds_list_find_value( quaternion, 1 );
c = ds_list_find_value( quaternion, 2 );
d = ds_list_find_value( quaternion, 3 );

r = point_distance_3d( 0, 0, 0, b, c, d );
ang = radtodeg( arctan2( r, a ) );

d3d_transform_add_rotation_axis( b, c, d, -2 * ang );
