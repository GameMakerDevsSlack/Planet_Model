///scr_chunk_init()

var model, hex_count, last_free_hex, ch_x, ch_y, ch_z, neighbour_list, hex_list, queue, hex, i, check_hex, hexes_in_this_chunk;

hex_count = 0;
last_free_hex = -1;
queue = ds_queue_create();

ds_list_destroy( lst_hex_visited );
lst_hex_visited = ds_list_create_length( k_hexes, false );

while true {
    
    do last_free_hex++ until ( !ds_list_find_value( lst_hex_visited, last_free_hex ) or ( last_free_hex >= k_hexes ) );
    
    if ( last_free_hex >= k_hexes ) break;
    
    ds_queue_clear( queue );
    ds_queue_enqueue( queue, last_free_hex );
    
    hex_list = ds_list_create();
    
    ds_list_add( lst_chunk_visible, true );
    ds_list_add( lst_chunk_hex_list, hex_list );
    
    ch_x = 0;
    ch_y = 0;
    ch_z = 0;
    
    hexes_in_this_chunk = 0;
    
    while ( !ds_queue_empty( queue ) ) and ( hexes_in_this_chunk < k_chunk_size ) {
        
        hex = ds_queue_dequeue( queue );
        
        if ( ds_list_find_value( lst_hex_visited, hex ) ) continue;
        
        ch_x += ds_list_find_value( lst_hex_x, hex );
        ch_y += ds_list_find_value( lst_hex_y, hex );
        ch_z += ds_list_find_value( lst_hex_z, hex );
        
        ds_list_replace( lst_hex_visited, hex, true );
        ds_list_add( hex_list, hex );
        
        hexes_in_this_chunk++;
        
        neighbour_list = ds_list_find_value( lst_hex_list_adj, hex );
        for( i = 0; i < ds_list_size( neighbour_list ); i++ ) ds_queue_enqueue( queue, ds_list_find_value( neighbour_list, i ) );
        
    }
    
    ch_x /= ds_list_size( hex_list );
    ch_y /= ds_list_size( hex_list );
    ch_z /= ds_list_size( hex_list );
    ds_list_add( lst_chunk_x, ch_x );
    ds_list_add( lst_chunk_y, ch_y );
    ds_list_add( lst_chunk_z, ch_z );
    
}

ds_queue_destroy( queue );
