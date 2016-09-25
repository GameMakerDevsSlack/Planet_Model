///ds_list_sum( list )
//Returns the sum of all indices in the list

var val, i;
val = 0;
for( i = 0; i < ds_list_size( argument0 ); i++ ) val += ds_list_find_value( argument0, i );
return val;
