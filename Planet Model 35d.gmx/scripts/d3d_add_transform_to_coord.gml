///d3d_add_transform_to_coord( x, y, z )
//Applies a d3d transform that places a model at a 3D coordinate, pointing away from the origin
//Does NOT include external rotations, including that of the globe

var xx, yy, zz, r, phi, theta, temp_quaternion;

xx = argument0;
yy = argument1;
zz = argument2;

temp_quaternion = ds_quaternion_create();



//Calculate spherical coordinates
r = point_distance_3d( 0, 0, 0, xx, yy, zz );
phi   = arctan2( zz, xx );
theta = arccos( yy / r );

//Perform compound spherical rotation
phi *= 0.5;
theta *= 0.5;
ds_quaternion_multiply_left( temp_quaternion,   cos( theta ), 0, 0, -sin( theta ) );
ds_quaternion_multiply_left( temp_quaternion,   cos( phi ), 0, -sin( phi ), 0 );



//Displace along the y-axis
d3d_transform_add_translation( 0, r, 0 );

//Apply quaternion to the transformation matrix
d3d_transform_add_rotation_ds_quaternion( temp_quaternion );



//Destroy the temporary quaternion
ds_quaternion_destroy( temp_quaternion );
