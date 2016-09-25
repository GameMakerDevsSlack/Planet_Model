///scr_hex_destroy()
//Free up memory. Can't see this being used in practice

ds_list_destroy( lst_hex_x );
ds_list_destroy( lst_hex_y );
ds_list_destroy( lst_hex_z );

ds_list_destroy( lst_hex_radius );
ds_list_destroy( lst_hex_phi );
ds_list_destroy( lst_hex_theta );

ds_list_destroy( lst_hex_light_presin );
ds_list_destroy( lst_hex_light_precos );

ds_list_destroy( lst_hex_quat_a );
ds_list_destroy( lst_hex_quat_b );
ds_list_destroy( lst_hex_quat_c );
ds_list_destroy( lst_hex_quat_d );

ds_list_destroy( lst_hex_surface_x );
ds_list_destroy( lst_hex_surface_y );

ds_list_destroy( lst_hex_visited );

for( var i = 0; i < k_hexes; i++ ) {
    ds_list_destroy( ds_list_find_value( lst_hex_list_vertex_x, i ) );
    ds_list_destroy( ds_list_find_value( lst_hex_list_vertex_y, i ) );
    ds_list_destroy( ds_list_find_value( lst_hex_list_vertex_z, i ) );
    ds_list_destroy( ds_list_find_value( lst_hex_list_adj, i ) );
}

ds_list_destroy( lst_hex_list_vertex_x );
ds_list_destroy( lst_hex_list_vertex_y );
ds_list_destroy( lst_hex_list_vertex_z );
ds_list_destroy( lst_hex_list_adj );
