///ds_quaternion_normalise( quaternion )
//I don't actually use this because the game doesn't do many repeat transforms
//Handy to have around though
//
//With credit to Boris
//http://www.boristheengineer.co.uk/gamemaker/direct3d.htm

var a, b, c, d, temp, quaternion

quaternion = argument0;

a = ds_list_find_value( quaternion, 0 );
b = ds_list_find_value( quaternion, 1 );
c = ds_list_find_value( quaternion, 2 );
d = ds_list_find_value( quaternion, 3 );

temp = 1 / sqrt( sqr(a) + sqr(b) + sqr(c) + sqr(d) );

ds_list_replace( quaternion, 0, a * temp );
ds_list_replace( quaternion, 1, b * temp );
ds_list_replace( quaternion, 2, c * temp );
ds_list_replace( quaternion, 3, d * temp );
