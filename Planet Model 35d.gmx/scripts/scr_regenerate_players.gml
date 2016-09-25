///regenerate_world( seed )
//Clears the terrain data of a world and recreates it by triggering the last generation steps of obj_world

ds_list_add( log, "~~~ Regenerating terrain" );

//Set the random generation seed
world_seed = argument0;
random_set_seed( world_seed );

//Hide the world whilst thigns are regenerating
scr_hide_world();
 
with( obj_world ) {
    
    time_to_generate = current_time;
    
    scr_game_destroy();
    scr_model_destroy();
    scr_skin_destroy();
    
    //ds_list_set_all( lst_terrain_feature, k_feature_empty );
    ds_list_destroy( lst_terrain_feature );
    lst_terrain_feature = ds_list_create_length( k_hexes, k_feature_empty );
    
    adjusted_index_per_step = index_per_step / generation_factor;
    regeneration = true;
    generation_phase = 14;
    index = 0;
    generation_finished = false;
    
}
