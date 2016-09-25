///add_timed_ticket( instance, ticket index )

var result;
result = ds_list_find_index( argument0.ticket_done_index_list, argument1 );

if ( result < 0 ) {
    ds_list_delete( argument0.ticket_done_index_list, result );
    ds_list_delete( argument0.ticket_done_time_list, result );
}
