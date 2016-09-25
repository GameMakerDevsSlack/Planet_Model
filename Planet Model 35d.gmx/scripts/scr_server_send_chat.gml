///server_send_chat( user instance, string )

var inst = argument0;

scr_packet_start( inst.socket );
scr_packet_add( buffer_u16, send_chat_msg );
scr_packet_add( buffer_string, argument1 );
scr_packet_send();
