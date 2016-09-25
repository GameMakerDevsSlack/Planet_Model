///ds_quaternion_rotate_vector( quaternion, x, y, z )
//Rotates the vector (x,y,z) using a quaternion
//Returns the result in the globally scoped array "result_coord"
//
//With credit to Boris
//http://www.boristheengineer.co.uk/gamemaker/direct3d.htm
 
globalvar result_coord;

var a, b, c, d, quaternion, temp_quaternion, xx, yy, zz;

quaternion = argument0;

xx = argument1;
yy = argument2;
zz = argument3;

a = ds_list_find_value( quaternion, 0 );
b = ds_list_find_value( quaternion, 1 );
c = ds_list_find_value( quaternion, 2 );
d = ds_list_find_value( quaternion, 3 );

ds_list_replace( k_global_quaternion, 0, a );
ds_list_replace( k_global_quaternion, 1, b );
ds_list_replace( k_global_quaternion, 2, c );
ds_list_replace( k_global_quaternion, 3, d );

ds_quaternion_multiply_left( k_global_quaternion,   0, xx, yy, zz );
ds_quaternion_multiply_left( k_global_quaternion,   a, -b, -c, -d );

result_coord[0] = ds_list_find_value( k_global_quaternion, 1 );
result_coord[1] = ds_list_find_value( k_global_quaternion, 2 );
result_coord[2] = ds_list_find_value( k_global_quaternion, 3 );
