///scr_terrain_height_noise( hex index, smallest radius, variability )
//Generate random height values in a similar manner to ds_grid_add_disk()

var mini, rand, index;

index = argument0;
mini = argument1; //3;
rand = argument2 - argument1; //6;

scr_hex_neighbours_add( lst_terrain_height, index, choose( 1, -1 ) * sqr( random( 1 ) ), irandom( rand ) + mini );
