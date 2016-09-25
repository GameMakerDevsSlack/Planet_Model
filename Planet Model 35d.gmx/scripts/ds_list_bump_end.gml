///ds_list_bump_end( list, index )
//Takes an index and moves it to the end of the list (index = size - 1)

var val = ds_list_find_value( argument0, argument1 );
ds_list_delete( argument0, argument1 );
ds_list_add( argument0, val );
