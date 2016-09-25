///scr_terrain_set_temperature_transitions( ice pc, cold pc, warm pc )

var profile_list;
var ice_tile_number,  ice_proportion;
var cold_tile_number, cold_proportion;
var warm_tile_number, warm_proportion;

ice_proportion = argument0; //0.05;
cold_proportion = argument1; //0.18;
warm_proportion = argument2; //0.40;

profile_list = ds_list_create();
ds_list_copy( profile_list, lst_terrain_tempr );
ds_list_sort( profile_list, true );

ice_tile_number = floor( ds_list_size( lst_terrain_tempr ) * ice_proportion );
ice_temperature = ds_list_find_value( profile_list, ice_tile_number );

cold_tile_number = floor( ds_list_size( lst_terrain_tempr ) * cold_proportion );
cold_temperature = ds_list_find_value( profile_list, ice_tile_number + cold_tile_number );

warm_tile_number = floor( ds_list_size( lst_terrain_tempr ) * warm_proportion );
warm_temperature = ds_list_find_value( profile_list, ice_tile_number + cold_tile_number + warm_tile_number );

ds_list_destroy( profile_list ); // :(
