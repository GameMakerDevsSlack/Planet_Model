//Takes all the face neighbour associations and turns them into hex neighbour associations instead
//Might be a bit buggy as it returns one more neighbour than expected (probably self-neighbouring?)

for( var _i = 0; _i < world_hex_grid_count; _i++ ) {
    
    var _face_neighbour_list = hex_nested_neighbour_faces_list[| _i ];
    var _hex_neighbour_list = world_hex_grid[# _i, world_hex.list_adj ];
    
	var _size = ds_list_size( _face_neighbour_list );
    for( var _j = 0; _j < _size; _j++ ) {
        
        var _face = _face_neighbour_list[| _j ];
        var _hex = world_tri_grid_a[# _face, world_tri.hex ];
        ds_list_add( _hex_neighbour_list, _hex );
        
    }
    
}