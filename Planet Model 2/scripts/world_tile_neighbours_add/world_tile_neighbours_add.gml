/// @param property
/// @param start_hex
/// @param value
/// @param distance

var _property       = argument0;
var _start_hex      = argument1;
var _value          = argument2;
var _start_distance = argument3;

ds_grid_set_region( world_hex_grid,   0, world_hex.visited, world_hex_grid_count-1, world_hex.visited,   noone );
world_hex_grid[# _start_hex, world_hex.visited ] = _start_distance;

var _stack = ds_list_create();
ds_list_add( _stack, _start_hex );

while( !ds_list_empty( _stack ) ) {
    
    var _hex = _stack[| 0 ];
    ds_list_delete( _stack, 0 );
    
    world_hex_grid[# _hex, _property ] += _value;
    
    var _distance = world_hex_grid[# _hex, world_hex.visited ];
    if ( _distance > 0 ) {
        
        var _neighbour_list = world_hex_grid[# _hex, world_hex.list_adj ];
        
		var _size = ds_list_size( _neighbour_list );
        for( var _i = 0; _i < _size; _i++ ) {
            
            var _target = _neighbour_list[| _i ];
            
            if ( world_hex_grid[# _target, world_hex.visited ] < 0 ) {
                ds_list_add( _stack, _target );
                world_hex_grid[# _target, world_hex.visited ] = _distance-1;
            }
            
        }
		
    }
    
}

ds_list_destroy( _stack );