///scr_send_list( instance, header, list, data type )

var socket = argument0.socket;
var header = argument1;
var list = argument2;
var type = argument3;

scr_packet_start( socket );
scr_packet_add( buffer_u16, send_list_msg );
scr_packet_add( buffer_u16, header );
scr_packet_add_list( type, list );
scr_packet_add( buffer_f32, k_terminate );
scr_packet_send();
