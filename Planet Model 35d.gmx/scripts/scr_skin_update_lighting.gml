///scr_skin_update_lighting()

var hex, chunk, hex_list, light;

//Update lighting surface
scr_draw_to_surface( sur_lighting );
draw_set_blend_mode_ext( bm_one, bm_zero );

for ( chunk = 0; chunk < k_chunks; chunk++ ) {
    
    if ( ds_list_find_value( lst_chunk_visible, chunk ) ) {
        
        hex_list = ds_list_find_value( lst_chunk_hex_list, chunk );
        size = ds_list_size( hex_list );
        
        for ( i = 0; i < size; i++ ) {
            
            hex = ds_list_find_value( hex_list, i );
            
            light = ( ds_list_find_value( lst_hex_light_precos, hex ) * terrain_light_cos_offset ) - ( ds_list_find_value( lst_hex_light_presin, hex ) * terrain_light_sin_offset );
            light = min( k_sun_shadow_depth, ( light + 1 ) * 0.5 * k_sun_shadow_bloom );
            
            ds_list_replace( lst_terrain_light, hex, light );
            
            draw_set_color( c_sun_shadow );
            
            /*if ( obj_camera.mouse_hex_over_id == hex ) {
                draw_set_color( merge_color( c_lime, c_sun_shadow, light * 0.95 ) );
                light = max( 0.2, light * 0.95 );
            } else*/ if ( ds_list_find_value( lst_terrain_feature, hex ) == k_feature_chopped ) {
                draw_set_color( merge_color( c_orange, c_sun_shadow, light * 0.98 ) );
                light *= 0.98;
            }
            
            draw_set_alpha( light );
            draw_point( ds_list_find_value( lst_hex_surface_x, hex ), ds_list_find_value( lst_hex_surface_y, hex ) );
            
        }
    }
}       

draw_set_alpha( 1 );
draw_set_color( c_white );
draw_set_blend_mode( bm_normal );
surface_reset_target();
