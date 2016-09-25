///client_send_chat( string )

scr_packet_start( socket );
scr_packet_add( buffer_u16, send_chat_msg );
scr_packet_add( buffer_string, argument0 );
scr_packet_send();
