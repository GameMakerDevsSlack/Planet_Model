///scr_terrain_init()
//Create lists to store terrain data, separate from the physical hex data
//This stuff can be destroyed and recreated without changing the underlying geometry

lst_terrain_height =  ds_list_create_length( k_hexes, 0 );
lst_terrain_wetness = ds_list_create_length( k_hexes, 0 );
lst_terrain_tempr =   ds_list_create_length( k_hexes, 0 );
lst_terrain_tree =    ds_list_create_length( k_hexes, k_feature_empty );
lst_terrain_feature = ds_list_create_length( k_hexes, k_feature_empty );
lst_terrain_colour =  ds_list_create_length( k_hexes, c_gray );
lst_terrain_seed =    ds_list_create_length( k_hexes, 0 );
lst_terrain_light =   ds_list_create_length( k_hexes, 1 );
lst_terrain_rim =     ds_list_create_length( k_hexes, true );

lst_terrain_stat_owner = ds_list_create_length( k_hexes, noone );

terrain_light_offset = 0;
terrain_light_sin_offset = 0;
terrain_light_cos_offset = 1;
