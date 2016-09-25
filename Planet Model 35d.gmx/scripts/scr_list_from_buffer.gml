///scr_list_from_buffer( buffer, data type, length )
//

var i, list, type, buffer, length;

buffer = argument0;
type = argument1;
length = argument2;

list = ds_list_create();
repeat( length ) ds_list_add( list, buffer_read( buffer, type ) );

return list;
