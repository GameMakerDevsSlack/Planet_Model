scr_packet_start( socket );
scr_packet_add( buffer_u16, client_finished_regen_msg );
scr_packet_add( buffer_s32, world_seed );
scr_packet_send();

ds_list_add( log, "regen finished - notifying server" );
