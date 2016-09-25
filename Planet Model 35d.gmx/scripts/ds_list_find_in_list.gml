///ds_list_find_in_list( list a, list b )

var a_list, b_list, i, val, result;

a_list = argument0;
b_list = argument1;
val = noone;
result = noone;

for( i = 0; i < ds_list_size( a_list ); i++ ) {

    val = ds_list_find_index( b_list, ds_list_find_value( a_list, i ) );
    if ( val >= 0 ) {
        result = val;
        break;
    }
    
}

return result;
