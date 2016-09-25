///get_path_real_coord( path, index, tween )

globalvar result_coord;

var path, list, hex, next_hex, index, tween, xx, yy, zz, scale;

path = argument0;
list = path.path_list;

index = argument1;
tween = argument2;

hex = ds_list_find_value( list, index );

if ( index >= ds_list_size( list ) - 1 ) {
    
    result_coord[0] = ds_list_find_value( obj_world.lst_hex_x, hex );
    result_coord[1] = ds_list_find_value( obj_world.lst_hex_y, hex );
    result_coord[2] = ds_list_find_value( obj_world.lst_hex_z, hex );
    
    scale = ds_list_find_value( world_relief_list, ds_list_find_value( obj_world.lst_terrain_height, hex ) * 5 );
    
} else {
    
    next_hex = ds_list_find_value( list, index + 1 );
    
    result_coord[0] = lerp( ds_list_find_value( obj_world.lst_hex_x, hex ), ds_list_find_value( obj_world.lst_hex_x, next_hex ), tween );
    result_coord[1] = lerp( ds_list_find_value( obj_world.lst_hex_y, hex ), ds_list_find_value( obj_world.lst_hex_y, next_hex ), tween );
    result_coord[2] = lerp( ds_list_find_value( obj_world.lst_hex_z, hex ), ds_list_find_value( obj_world.lst_hex_z, next_hex ), tween );
    
    scale = lerp( ds_list_find_value( world_relief_list, ds_list_find_value( obj_world.lst_terrain_height, hex ) * 5 ),
                  ds_list_find_value( world_relief_list, ds_list_find_value( obj_world.lst_terrain_height, next_hex ) * 5 ),
                  tween );
    
}

result_coord[0] *= scale;
result_coord[1] *= scale;
result_coord[2] *= scale;
