///scr_hex_neighbours_get_median( list, hex )
//
//Returns the median average of a hex and its immediate neighbours

var list = argument0;
var hex = argument1;

var biggest = ds_list_find_value( list, hex );
var smallest = ds_list_find_value( list, hex );
var neighbour_list = ds_list_find_value( lst_hex_list_adj, hex );
        
for( i = 0; i < ds_list_size( neighbour_list ); i++ ) {
    var target = ds_list_find_value( neighbour_list, i );
    var val = ds_list_find_value( list, target );
    if ( val > biggest ) biggest = val;
    if ( val < smallest ) smallest = val;
}
        
return ( ( biggest - smallest ) / 2 ) + smallest;
