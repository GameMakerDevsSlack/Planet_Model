for( var _i = 0; _i < world_hex_grid_count; _i++ ) {
	
	var  _ax_list = world_hex_grid[# _i, world_hex.list_ax  ];
	var  _ay_list = world_hex_grid[# _i, world_hex.list_ay  ];
	var  _az_list = world_hex_grid[# _i, world_hex.list_az  ];
	var  _bx_list = world_hex_grid[# _i, world_hex.list_bx  ];
	var  _by_list = world_hex_grid[# _i, world_hex.list_by  ];
	var  _bz_list = world_hex_grid[# _i, world_hex.list_bz  ];
	var _adj_list = world_hex_grid[# _i, world_hex.list_adj ];
	
	ds_list_delete(  _ax_list, ds_list_size(  _ax_list )-1 );
	ds_list_delete(  _ay_list, ds_list_size(  _ay_list )-1 );
	ds_list_delete(  _az_list, ds_list_size(  _az_list )-1 );
	ds_list_delete(  _bx_list, ds_list_size(  _bx_list )-1 );
	ds_list_delete(  _by_list, ds_list_size(  _by_list )-1 );
	ds_list_delete(  _bz_list, ds_list_size(  _bz_list )-1 );
	ds_list_delete( _adj_list, ds_list_size( _adj_list )-1 );
	
	var _cache_list = hex_tri_cache[| _i ];
	
	var _size = ds_list_size( _cache_list );
	for( var _j = 0; _j < _size; _j++ ) {
		_adj_list[| _j ] = world_tri_grid_a[# _cache_list[| _j ], world_tri.hex ];
	}
	
}