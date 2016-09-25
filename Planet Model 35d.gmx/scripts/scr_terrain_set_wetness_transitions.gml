///scr_terrain_set_wetness_transitions( dry pc, wet pc )

var profile_list;
var dry_tile_number, dry_proportion;
var wet_tile_number, wet_proportion;

dry_proportion = argument0; //0.25;
wet_proportion = argument1; //0.20;

profile_list = ds_list_create();

ds_list_copy( profile_list, lst_terrain_wetness );
ds_list_sort( profile_list, true );

dry_tile_number = floor( ds_list_size( lst_terrain_wetness ) * dry_proportion );
dry_wetness = ds_list_find_value( profile_list, dry_tile_number );

wet_tile_number = floor( ds_list_size( lst_terrain_wetness ) * wet_proportion );
wet_wetness = ds_list_find_value( profile_list, ds_list_size( lst_terrain_height ) - wet_tile_number );

ds_list_destroy( profile_list );
