///process_timed_tickets()

var i;

ds_list_add_to_all( ticket_done_time_list, delta_time / 1000 );

for( i = ds_list_size( ticket_done_time_list ) - 1; i >= 0; i-- ) {
    
    if ( ds_list_find_value( ticket_done_time_list, i ) >= 0 ) {
        
        ds_queue_enqueue( ticket_queue, ds_list_find_value( ticket_done_index_list, i ) );
        ds_list_delete( ticket_done_index_list, i );
        ds_list_delete( ticket_done_time_list, i );
        
    }
    
}
