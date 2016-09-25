///scr_model_group_draw_texture( model group, texture )

var i, list, skin;

list = argument0;
skin = argument1;

for( i = 0; i < k_chunks; i++ ) {
    if ( ds_list_find_value( obj_world.lst_chunk_visible, i ) ) d3d_model_draw( ds_list_find_value( list, i ),   0, 0, 0,   skin );    
}

/*
for( i = 0; i < k_chunks; i++ ) {    
    xx = ds_list_find_value( obj_world.lst_chunk_x, i );
    yy = ds_list_find_value( obj_world.lst_chunk_y, i );
    zz = ds_list_find_value( obj_world.lst_chunk_z, i );
    
    if ( ds_list_find_value( obj_world.lst_chunk_visible, i ) ) draw_set_color( c_custom_lime ) else draw_set_color( c_custom_red );
    
    d3d_draw_ellipsoid( xx - 5, yy - 5, zz - 5,   xx + 5, yy + 5, zz + 5,   -1,   1, 1, 12 );
}
*/
