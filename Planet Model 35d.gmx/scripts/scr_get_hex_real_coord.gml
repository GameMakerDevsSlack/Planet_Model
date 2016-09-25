///find_hex_coord( index )

globalvar result_coord;

var index = argument0;

result_coord[0] = ds_list_find_value( obj_world.lst_hex_x, index );
result_coord[1] = ds_list_find_value( obj_world.lst_hex_y, index );
result_coord[2] = ds_list_find_value( obj_world.lst_hex_z, index );

scale = ds_list_find_value( world_relief_list, ds_list_find_value( obj_world.lst_terrain_height, index ) * 5 );

result_coord[0] *= scale;
result_coord[1] *= scale;
result_coord[2] *= scale;
