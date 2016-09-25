///server_send_regenerate( user instance, seed )

var inst = argument0;

scr_packet_start( inst.socket );
scr_packet_add( buffer_u16, server_regenerate_msg );
scr_packet_send();

ds_list_add( log, "sending regenerate to " + string( inst ) );
