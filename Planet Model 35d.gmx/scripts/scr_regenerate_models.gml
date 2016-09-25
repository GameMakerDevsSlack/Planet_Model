///scr_regenerate_models()
//Clears the terrain data of a world and recreates it by triggering the last generation steps of obj_world

ds_list_add( log, "~~~ Regenerating terrain" );

//Hide the world whilst thigns are regenerating
scr_hide_world();
 
with( obj_world ) {
    
    time_to_generate = current_time;
    
    scr_model_destroy();
    scr_chunk_destroy();
    scr_skin_destroy();
    
    regeneration = true;
    generation_phase = 15;
    index = 0;
    generation_finished = false;
    
}
