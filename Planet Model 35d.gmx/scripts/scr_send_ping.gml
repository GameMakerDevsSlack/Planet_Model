scr_packet_start( socket );
scr_packet_add( buffer_u16, send_ping_msg );
scr_packet_send();
