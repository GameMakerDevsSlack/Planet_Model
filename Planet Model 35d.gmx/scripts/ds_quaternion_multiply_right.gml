///ds_quaternion_multiply_right( quaternion, q0, q1, q2, q3 )
//Does some quaternion magic. No idea how it works
//
//With credit to Boris
//http://www.boristheengineer.co.uk/gamemaker/direct3d.htm

var a, b, c, d, i, j, k, l, quaternion

quaternion = argument0;

a = ds_list_find_value( quaternion, 0 );
b = ds_list_find_value( quaternion, 1 );
c = ds_list_find_value( quaternion, 2 );
d = ds_list_find_value( quaternion, 3 );

i = argument1;
j = argument2;
k = argument3;
l = argument4;

ds_list_replace( quaternion, 0, a*i - b*j - c*k - d*l );
ds_list_replace( quaternion, 1, a*j + b*i + c*l - d*k );
ds_list_replace( quaternion, 2, a*k + c*i + d*j - b*l );
ds_list_replace( quaternion, 3, a*l + d*i + b*k - c*j );
