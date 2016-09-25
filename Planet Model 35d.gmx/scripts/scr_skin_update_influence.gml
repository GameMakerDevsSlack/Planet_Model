///scr_skin_update_influence()

var hex, chunk, hex_list, light;

//Update influence surface
scr_draw_to_surface( sur_influence );
draw_set_blend_mode_ext( bm_one, bm_zero );

for ( chunk = 0; chunk < k_chunks; chunk++ ) {
    
    if ( ds_list_find_value( lst_chunk_visible, chunk ) ) {
        
        hex_list = ds_list_find_value( lst_chunk_hex_list, chunk );
        size = ds_list_size( hex_list );
        
        for ( i = 0; i < size; i++ ) {
            
            hex = ds_list_find_value( hex_list, i );
            inst_faction = ds_list_find_value( lst_terrain_stat_owner, hex );
            
            if ( inst_faction == noone ) continue;
            
            draw_set_color( inst_faction.colour );
            draw_set_alpha( 0.9 );
            draw_point( ds_list_find_value( lst_hex_surface_x, hex ), ds_list_find_value( lst_hex_surface_y, hex ) );
            
        }
    }
}       

draw_set_alpha( 1 );
draw_set_color( c_white );
draw_set_blend_mode( bm_normal );
surface_reset_target();
