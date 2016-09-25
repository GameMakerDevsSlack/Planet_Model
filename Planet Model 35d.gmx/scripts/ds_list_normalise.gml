///ds_list_normalise( list )
//Normalises all indices in a list (puts all values on a scale from 0 to 1 inclusive)

ds_list_add_to_all( argument0, -ds_list_min( argument0 ) );
ds_list_multiply_all( argument0, 1 / ds_list_max( argument0 ) );
