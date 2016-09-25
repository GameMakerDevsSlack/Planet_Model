///scr_terrain_regenerate( seed )
//Clears the terrain data of a world and recreates it by triggering the last generation steps of obj_world

ds_list_add( log, "~~~ Regenerating terrain" );

//Set the random generation seed
world_seed = argument0;
random_set_seed( world_seed );

//Hide the world whilst thigns are regenerating
scr_hide_world();
 
with( obj_world ) {
    
    time_to_generate = current_time;
    
    scr_terrain_destroy();
    scr_game_destroy();
    scr_model_destroy();
    scr_skin_destroy();
    
    scr_terrain_init();
    
    adjusted_index_per_step = index_per_step / generation_factor;
    regeneration = true;
    generation_phase = 8;
    index = 0;
    generation_finished = false;
    
}
