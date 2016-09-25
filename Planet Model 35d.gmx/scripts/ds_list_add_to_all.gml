///ds_list_add_to_all( list, value )
//Adds to a value to all indices in a list

var i;
for( i = 0; i < ds_list_size( argument0 ); i++ ) ds_list_replace( argument0, i, ds_list_find_value( argument0, i ) + argument1 );
