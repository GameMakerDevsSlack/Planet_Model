///scr_hex_neighbours_get_min( list, hex, distance )

with( obj_world ) {

var list, start_hex, value, hex, max_distance, result, start_distance, distance, target, neighbour_list, i;

list = argument0;
start_hex = argument1;
start_distance = argument2;

var stack = ds_list_create();

//ds_list_set_all( lst_hex_visited, noone );
ds_list_destroy( lst_hex_visited );
lst_hex_visited = ds_list_create_length( k_hexes, noone );
ds_list_replace( lst_hex_visited, start_hex, start_distance );

ds_list_add( stack, start_hex );
result = ds_list_find_value( list, start_hex );

while( !ds_list_empty( stack ) ) {
    
    hex = ds_list_find_value( stack, 0 );
    ds_list_delete( stack, 0 );
    
    value = ds_list_find_value( list, hex );
    
    if ( value < result ) result = value;
    
    var distance = ds_list_find_value( lst_hex_visited, hex );
    
    if ( distance > 0 ) {
        
        var neighbour_list = ds_list_find_value( lst_hex_list_adj, hex );
        
        for( i = 0; i < ds_list_size( neighbour_list ); i++ ) {
            
            target = ds_list_find_value( neighbour_list, i );
            
            if ( ds_list_find_value( lst_hex_visited, target ) < 0 ) {
                ds_list_add( stack, target );
                ds_list_replace( lst_hex_visited, target, distance - 1 );
            }
        }
    }
}

ds_list_destroy( stack );

return result;

}
