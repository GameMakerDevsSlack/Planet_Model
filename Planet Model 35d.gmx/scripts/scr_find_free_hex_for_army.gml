///find_free_hex_for_army( army )

var army, neighbour_list, i, hex, ok;

army = argument0
neighbour_list = ds_list_find_value( obj_world.lst_hex_list_adj, hex_location );

random_set_seed( ds_list_find_value( obj_world.lst_terrain_seed, army.hex_location ) + army + par_game.game_turn );

repeat( ds_list_size( neighbour_list ) ) {
    hex = ds_list_find_value( neighbour_list, irandom( ds_list_size( neighbour_list ) - 1 ) );
    ok = true;
    if ( scr_find_unit_on_hex( hex ) != noone ) ok = false;
    if ( ds_list_find_value( obj_world.lst_terrain_height, hex ) >= 0.8 ) ok = false;
    if ( ds_list_find_value( obj_world.lst_terrain_height, hex ) <= 0.2 ) ok = false;
    if ( ok ) break;
}

if ( ok ) return hex else return noone;
