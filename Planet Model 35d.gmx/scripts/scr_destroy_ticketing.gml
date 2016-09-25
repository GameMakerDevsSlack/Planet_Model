///destroy_ticketing()

ds_queue_destroy( ticket_queue );
ds_list_destroy( ticket_done_index_list );
ds_list_destroy( ticket_done_time_list );
