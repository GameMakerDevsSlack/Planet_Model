///scr_terrain_set_height_transitions( water pc, hill pc, mountain pc )

//Anyway, the next step is to choose values that separate out the terrain into water, plains, hills and mountains
//This method is so much better than the old one!
//The principle is that, in a sorted list, the Nth highest tile has N-1 tiles below it
//We use this to determine break points based on the number of tiles requested

var profile_list, height;
var water_tile_number, mountain_tile_number, hill_tile_number;
var water_proportion, hill_proportion, mountain_proportion;

water_proportion = argument0;
hill_proportion = argument1;
mountain_proportion = argument2;

profile_list = ds_list_create();
ds_list_copy( profile_list, lst_terrain_height );
ds_list_sort( profile_list, true );

water_tile_number = floor( ds_list_size( lst_terrain_height ) * water_proportion );
water_height = ds_list_find_value( profile_list, water_tile_number );

mountain_tile_number = floor( ds_list_size( lst_terrain_height ) * mountain_proportion );
mountain_height = ds_list_find_value( profile_list, ds_list_size( lst_terrain_height ) - mountain_tile_number );

hill_tile_number = floor( ds_list_size( lst_terrain_height ) * hill_proportion );
hill_height = ds_list_find_value( profile_list, ds_list_size( lst_terrain_height ) - ( hill_tile_number + mountain_tile_number ) );

//Subdivides the water into deep ocean and just plain sea
water_sub_height = water_height * 0.75;

//Subdivides the mountains into two heights
mountain_sub_height = hill_height * 0.5 + mountain_height * 0.5;

ds_list_destroy( profile_list ); // :(
