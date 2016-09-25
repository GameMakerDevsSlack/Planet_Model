///scr_packet_add_list( data type, list )
//

var list, type, list_size, i;

type = argument0;
list = argument1;

list_size = ds_list_size( list );

scr_packet_add( buffer_u16, list_size );
for( i = 0; i < list_size; i++ ) scr_packet_add( type, ds_list_find_value( list, i ) );
