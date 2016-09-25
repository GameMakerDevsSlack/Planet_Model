///ds_list_find_duplicate( a, b, list a, list b )

var a, b, a_list, b_list, index, i;

a = argument0;
b = argument1;
a_list = argument2;
b_list = argument3;

for( i = 0; i < ds_list_size( a_list ); i++ ) {
    
    if ( ds_list_find_value( a_list, i ) == a ) and ( ds_list_find_value( b_list, i ) == b ) return true;
    if ( ds_list_find_value( a_list, i ) == b ) and ( ds_list_find_value( b_list, i ) == a ) return true;
    
}

return false;
