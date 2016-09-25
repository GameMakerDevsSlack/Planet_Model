///scr_game_destroy()
//Wipes all the game data structures from memory

scr_game_destroy_objects();

ds_list_destroy( faction_instance_list );
