///scr_terrain_destroy()
//Removes terrain data structures from memory, usually to regenerate the world

ds_list_destroy( lst_terrain_height );
ds_list_destroy( lst_terrain_wetness );
ds_list_destroy( lst_terrain_tempr );
ds_list_destroy( lst_terrain_tree );
ds_list_destroy( lst_terrain_feature );
ds_list_destroy( lst_terrain_colour );
ds_list_destroy( lst_terrain_seed );
ds_list_destroy( lst_terrain_light );
ds_list_destroy( lst_terrain_rim );
