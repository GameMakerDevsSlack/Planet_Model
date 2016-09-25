var flag_inst, faction_inst, index, max_factions, escape, iterations, height, temp_list, tree_prox, faction_prox, water_prox, temperature, inst;

max_factions = argument0;
escape = false;
iterations = 0;
max_iterations = k_hexes;
temp_list = ds_list_create_length( k_hexes, noone );

while( !escape ) {
    
    index = irandom( ds_list_size( obj_world.lst_terrain_height ) - 1 );
    iterations++;
    
    height = ds_list_find_value( obj_world.lst_terrain_height, index );
    tree_prox = scr_hex_neighbours_find( obj_world.lst_terrain_tree, index, true, 1 ); //If the site is on or next to a tree
    faction_prox = scr_hex_neighbours_get_max( temp_list, index, k_faction_proximity ); //If there's a faction within a certain distance
    hill_prox = scr_hex_neighbours_find( obj_world.lst_terrain_height, index, 0.6, 2 ); //If there are hills within sight range
    temperature = ds_list_find_value( obj_world.lst_terrain_tempr, index );
    
    
    //Rules for placement:
    //Has to be flat land
    //Has to be on or next to trees
    //Has to be within sight of hills (2 hexes)
    //Has to not be ice
    
    if ( height == 0.4 ) and ( tree_prox != noone ) and ( faction_prox == noone ) and ( hill_prox != noone ) and ( temperature >= 0.33 ) {
        
        faction_inst = instance_create( 0, 0, obj_faction );
        faction_inst.hex_location = index;
        faction_inst.colour = make_colour_random();
        faction_inst.light_colour = scr_lighter_colour( faction_inst.colour, 0.6 );
        faction_inst.dark_colour = scr_darker_colour( faction_inst.colour, 0.2 );
        
        ds_list_replace( lst_terrain_feature, index, k_feature_chopped );
        
        flag_inst = instance_create( 0, 0, obj_army );
        flag_inst.hex_location = index;
        flag_inst.rotation = random( 360 );
        flag_inst.faction = faction_inst;
        
        ds_list_replace( temp_list, index, flag_inst );
        ds_list_add( faction_inst.army_list, flag_inst );
        scr_hex_neighbours_set( obj_world.lst_terrain_stat_owner, index, faction_inst, 2 );
        
        ds_list_add( faction_instance_list, faction_inst );
        
        iterations = 0;
    }
    
    if ( iterations >= max_iterations ) escape = true;
    if ( instance_number( obj_faction ) >= max_factions ) escape = true;
    
}

ds_list_destroy( temp_list );
