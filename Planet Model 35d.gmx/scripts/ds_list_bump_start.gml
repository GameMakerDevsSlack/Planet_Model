///ds_list_bump_start( list, index )
//Takes an index and moves it to the start of the list (index = 0)

var val = ds_list_find_value( argument0, argument1 );
ds_list_delete( argument0, argument1 );
ds_list_insert( argument0, 0, val );
