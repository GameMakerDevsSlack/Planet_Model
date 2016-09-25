///server_send_handshake( user instance )

var inst = argument0;

scr_packet_start( inst.socket );
scr_packet_add( buffer_u16, server_send_handshake_msg );
scr_packet_send();

ds_list_add( log, "sending handshake to " + string( inst ) );
