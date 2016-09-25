///scr_chunk_destroy()

for( var i = 0; i < ds_list_size( lst_chunk_hex_list ); i++ ) ds_list_destroy( ds_list_find_value( lst_chunk_hex_list, i ) );

ds_list_destroy( lst_chunk_visible );
ds_list_destroy( lst_chunk_hex_list );
ds_list_destroy( lst_chunk_x );
ds_list_destroy( lst_chunk_y );
ds_list_destroy( lst_chunk_z );
