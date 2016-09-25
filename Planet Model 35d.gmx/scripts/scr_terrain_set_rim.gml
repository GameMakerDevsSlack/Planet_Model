///scr_terrain_set_rim( hex )

var hex, result;

hex = argument0;
result = true;

if ( scr_hex_neighbours_get_min( lst_terrain_height, hex, 1 ) >= ds_list_find_value( lst_terrain_height, hex ) ) result = false;

ds_list_replace( lst_terrain_rim, hex, result );
