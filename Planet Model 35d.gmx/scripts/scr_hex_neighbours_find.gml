///scr_hex_neighbours_find( list, hex, value, max distance )

globalvar result_coord;

with( obj_world ) {

var list, start_hex, value, hex, max_distance, result, result_distance, distance, target, neighbour_list, i;

list = argument0;
start_hex = argument1;
value = argument2;
max_distance = argument3;
result = noone;
result_distance = noone;

var stack = ds_list_create();

//ds_list_set_all( lst_hex_visited, noone );
ds_list_destroy( lst_hex_visited );
lst_hex_visited = ds_list_create_length( k_hexes, noone );
ds_list_replace( lst_hex_visited, start_hex, 0 );

ds_list_add( stack, start_hex );

while( !ds_list_empty( stack ) ) {
    
    hex = ds_list_find_value( stack, 0 );
    ds_list_delete( stack, 0 );
    
    if ( ds_list_find_value( list, hex ) == value ) {
        result = hex;
        break;
    }
    
    var distance = ds_list_find_value( lst_hex_visited, hex );
    
    if ( distance < max_distance ) {
        
        var neighbour_list = ds_list_find_value( lst_hex_list_adj, hex );
        
        for( i = 0; i < ds_list_size( neighbour_list ); i++ ) {
            
            target = ds_list_find_value( neighbour_list, i );
            
            if ( ds_list_find_value( lst_hex_visited, target ) < 0 ) {
                ds_list_add( stack, target );
                ds_list_replace( lst_hex_visited, target, distance + 1 );
            }
        }
    }
}

ds_list_destroy( stack );

if ( result != noone ) result_distance = ds_list_find_value( lst_hex_visited, result );

result_coord[0] = result_distance;

return result;

}
