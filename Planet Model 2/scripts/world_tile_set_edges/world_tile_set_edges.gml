for( var _i = 0; _i < world_hex_grid_count; _i++ ) {
    
    var _r      = world_hex_grid[# _i, world_hex.test      ];
    var _a_list = world_hex_grid[# _i, world_hex.list_adj  ];
    var _e_list = world_hex_grid[# _i, world_hex.list_edge ];
	
	var _size = ds_list_size( _a_list );
    for( var _j = 0; _j < _size; _j++ ) {
		_e_list[| _j ] = ( _r > world_hex_grid[# _a_list[| _j ], world_hex.test ] );
	}
    
}