///ds_list_multiply_all( list, value )
//Multiplies all indices in a list by a value

for( var i = 0; i < ds_list_size( argument0 ); i++ ) ds_list_replace( argument0, i, ds_list_find_value( argument0, i ) * argument1 );
