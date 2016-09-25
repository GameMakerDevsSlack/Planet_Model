///ds_list_create_length( length, value )
//Creates a list of a specific length, where all indices hold the same value

var list = ds_list_create();
repeat( argument0 ) ds_list_add( list, argument1 );
return list;
