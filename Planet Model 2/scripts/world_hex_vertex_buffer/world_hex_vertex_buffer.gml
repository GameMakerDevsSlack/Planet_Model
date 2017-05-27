var _vbuff = vertex_create_buffer();
vertex_begin( _vbuff, world_vertex_format );

for( var _i = 0; _i < world_hex_grid_count; _i++ ) {
    
	var _colour = make_colour_random();
	
    var _ox = world_hex_grid[# _i, world_hex.x ];
    var _oy = world_hex_grid[# _i, world_hex.y ];
    var _oz = world_hex_grid[# _i, world_hex.z ];
    
    var _d = 1/sqrt( _ox*_ox + _oy*_oy + _oz*_oz );
	var _nx = _ox*_d;
	var _ny = _oy*_d;
	var _nz = _oz*_d;
    
    var _ax_list = world_hex_grid[# _i, world_hex.list_ax ];
    var _ay_list = world_hex_grid[# _i, world_hex.list_ay ];
    var _az_list = world_hex_grid[# _i, world_hex.list_az ];
	
    var _bx_list = world_hex_grid[# _i, world_hex.list_bx ];
    var _by_list = world_hex_grid[# _i, world_hex.list_by ];
    var _bz_list = world_hex_grid[# _i, world_hex.list_bz ];
	
	var _size = ds_list_size( _ax_list );
    for( var _j = 0; _j < _size; _j++ ) {
		 
		var _jx = _ax_list[| _j ];
		var _jy = _ay_list[| _j ];
		var _jz = _az_list[| _j ];
		
		var _kx = _bx_list[| _j ];
		var _ky = _by_list[| _j ];
		var _kz = _bz_list[| _j ];
		
		vertex_position_3d( _vbuff,   _ox, _oy, _oz ); vertex_texcoord( _vbuff, 0.5, 0.5 ); vertex_colour( _vbuff,   _colour, 1 ); vertex_normal( _vbuff,   _nx, _ny, _nz );
		vertex_position_3d( _vbuff,   _kx, _ky, _kz ); vertex_texcoord( _vbuff, 0.5, 0.5 ); vertex_colour( _vbuff,   _colour, 1 ); vertex_normal( _vbuff,   _nx, _ny, _nz );
		vertex_position_3d( _vbuff,   _jx, _jy, _jz ); vertex_texcoord( _vbuff, 0.5, 0.5 ); vertex_colour( _vbuff,   _colour, 1 ); vertex_normal( _vbuff,   _nx, _ny, _nz );
		
    }
    
}

vertex_end( _vbuff );

return _vbuff;