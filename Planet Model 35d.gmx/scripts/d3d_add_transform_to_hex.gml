///d3d_add_transform_to_hex( hex )
//Applies a d3d transform that places a model onto a hex tile
//Does NOT include external rotations, including that of the globe

var hex, a, b, c, d;

hex = argument0;

//Displace along the y-axis
d3d_transform_add_translation( 0, ds_list_find_value( world_relief_list, ds_list_find_value( obj_world.lst_terrain_height, hex ) * 5 ) * k_world_scale, 0 );

a = ds_list_find_value( obj_world.lst_hex_quat_a, hex );
b = ds_list_find_value( obj_world.lst_hex_quat_b, hex );
c = ds_list_find_value( obj_world.lst_hex_quat_c, hex );
d = ds_list_find_value( obj_world.lst_hex_quat_d, hex );

d3d_transform_add_rotation_axis( a, b, c, d );
