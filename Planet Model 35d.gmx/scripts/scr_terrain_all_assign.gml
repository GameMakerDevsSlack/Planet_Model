///scr_terrain_all_assign()

var i, height, temperature, wetness, colour;

for( i = 0; i < ds_list_size( lst_terrain_height ); i++ ) {
    
    height = ds_list_find_value( lst_terrain_height, i );
    temperature = ds_list_find_value( lst_terrain_tempr, i );
    wetness = ds_list_find_value( lst_terrain_wetness, i );
    
    if ( temperature == 0 ) height = max( height, water_sub_height ); //Make sure ice can't exist on the bottom of the ocean
    
    if ( height < water_sub_height    ) height = 0.0 else //Ocean
    if ( height < water_height        ) height = 0.2 else //Coast
    if ( height < hill_height         ) height = 0.4 else //Flat
    if ( height < mountain_sub_height ) height = 0.6 else //Hills
    if ( height < mountain_height     ) height = 0.8 else //Submount
                                        height = 1.0;     //Mount
    
    if ( temperature < ice_temperature  ) temperature = 0.00 else //Ice
    if ( temperature < cold_temperature ) temperature = 0.33 else //Cold
    if ( temperature < warm_temperature ) temperature = 0.66 else //Warm
                                          temperature = 1.00;     //Hot
    
    if ( wetness < dry_wetness ) wetness = 0.0 else //Dry
    if ( wetness < wet_wetness ) wetness = 0.5 else //Damp
                                 wetness = 1.0;     //Wet
    
    ds_list_replace( lst_terrain_height, i, height );
    ds_list_replace( lst_terrain_tempr, i, temperature );
    ds_list_replace( lst_terrain_wetness, i, wetness );
    
    colour = scr_terrain_get_properties( height, temperature, wetness );
    ds_list_replace( lst_terrain_colour, i, colour );
    ds_list_replace( lst_terrain_tree, i, result_coord[0] );
    
}
