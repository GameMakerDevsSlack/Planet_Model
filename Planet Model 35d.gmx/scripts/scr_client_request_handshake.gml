scr_packet_start( socket );
scr_packet_add( buffer_u16, client_req_handshake_msg );
scr_packet_send();

ds_list_add( log, "requesting handshake" );
