///server_send_start( user instance )

var inst = argument0;

scr_packet_start( inst.socket );
scr_packet_add( buffer_u16, server_start_msg );
scr_packet_send();

ds_list_add( log, "sending start to " + string( inst ) );
