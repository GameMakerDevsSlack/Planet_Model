///scr_hex_neighbours_get_mean( list, hex )
//
//Returns the mean average of a hex and its immediate neighbours

var list = argument0;
var hex = argument1;

var val = ds_list_find_value( list, hex );
var neighbour_list = ds_list_find_value( lst_hex_list_adj, hex );
        
for( i = 0; i < ds_list_size( neighbour_list ); i++ ) {
    var target = ds_list_find_value( neighbour_list, i );
    val += ds_list_find_value( list, target );
}
        
val /= ds_list_size( neighbour_list ) + 1;
return val;
