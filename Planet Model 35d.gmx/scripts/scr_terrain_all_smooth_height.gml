///scr_terrain_all_smooth_height( mean weight )
//Smooth out terrain height using a mean average of each hex's neighbours
//A weighting of 1 makes each hex the mean of its neighbours, a weighting of 0 makes each hex stand alone
//Higher values lead to more smoothness

var temp_list, mean_weight, point_weight, i;

mean_weight = argument0; //0.6;
point_weight = 1 - mean_weight;


temp_list = ds_list_create(); //We use a temporary list to avoid having the terrain affect itself when averaging
ds_list_copy( temp_list, lst_terrain_height );

for( var i = 0; i < ds_list_size( temp_list ); i++ ) {
    ds_list_replace( lst_terrain_height, i, ds_list_find_value( temp_list, i ) * point_weight + scr_hex_neighbours_get_mean( temp_list, i ) * mean_weight );
}

//You're not a real list. Get lost, loser.
ds_list_destroy( temp_list ); // :(
