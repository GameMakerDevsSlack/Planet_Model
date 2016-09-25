///scr_hex_neighbours_set( list, hex, value, distance )

var list = argument0;
var start_hex = argument1;
var value = argument2;
var start_distance = argument3;

var stack = ds_list_create();

ds_list_destroy( lst_hex_visited );
lst_hex_visited = ds_list_create_length( k_hexes, noone );
ds_list_replace( lst_hex_visited, start_hex, start_distance );

ds_list_add( stack, start_hex );

while( !ds_list_empty( stack ) ) {
    
    var hex = ds_list_find_value( stack, 0 );
    ds_list_delete( stack, 0 );
    
    ds_list_replace( list, hex, value );
    
    var distance = ds_list_find_value( lst_hex_visited, hex );
    
    if ( distance > 0 ) {
        
        var neighbour_list = ds_list_find_value( lst_hex_list_adj, hex );
        
        for( var i = 0; i < ds_list_size( neighbour_list ); i++ ) {
            
            var target = ds_list_find_value( neighbour_list, i );
            
            if ( ds_list_find_value( lst_hex_visited, target ) < 0 ) {
                ds_list_add( stack, target );
                ds_list_replace( lst_hex_visited, target, distance - 1 );
            }
            
        }
    }
    
}

ds_list_destroy( stack );
