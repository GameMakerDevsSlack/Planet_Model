///scr_model_chunk_physical( chunk )

var model, scale, colour, i, height, height_index, chunk, start, limit, list, has_rim, alpha, hex;

chunk = argument0;
hex_list = ds_list_find_value( lst_chunk_hex_list, chunk );

model = ds_list_find_value( lst_model_physical, chunk );
d3d_model_clear( model );

for( i = 0; i < ds_list_size( hex_list ); i++ ) {
    
    hex = ds_list_find_value( hex_list, i );
    
    u = scr_hex_texture_u( hex );
    v = scr_hex_texture_v( hex );
    
    height = ds_list_find_value( lst_terrain_height, hex );
    height_index = height * 5;
    scale = ds_list_find_value( world_relief_list, height_index );
    
    colour = ds_list_find_value( lst_terrain_colour, hex );
    //has_rim = ds_list_find_value( lst_terrain_rim, hex );
    
    scr_model_add_hex_texture( model, hex, scale, colour, u, v );
    /*if ( has_rim )*/ scr_model_add_hex_rim_texture( model, hex, 0.9, scale, scr_darker_colour( colour, 0.3 ), u, v );
    scr_model_add_hex_base_texture( model, hex, 0.9, merge_color( colour, c_mahogany, 0.9 ), 1, 1 );
    
}
