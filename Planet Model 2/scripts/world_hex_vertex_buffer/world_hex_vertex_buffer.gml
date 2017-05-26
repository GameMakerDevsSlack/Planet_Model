var _vbuff = vertex_create_buffer();
vertex_begin( _vbuff, world_vertex_format );

for( var _i = 0; _i < world_hex_grid_count; _i++ ) {
    
	var _colour = make_colour_hsv( 240*_i/world_max_hexes, 240, 240 );
	
    var _ox = world_hex_grid[# _i, world_hex.x ];
    var _oy = world_hex_grid[# _i, world_hex.y ];
    var _oz = world_hex_grid[# _i, world_hex.z ];
    
    var _d = 1/sqrt( _ox*_ox + _oy*_oy + _oz*_oz );
	var _nx = _ox*_d;
	var _ny = _oy*_d;
	var _nz = _oz*_d;
    
    var _x_list = world_hex_grid[# _i, world_hex.list_vx ];
    var _y_list = world_hex_grid[# _i, world_hex.list_vy ];
    var _z_list = world_hex_grid[# _i, world_hex.list_vz ];
    
	var _size = ds_list_size( _x_list );
    for( var _j = 0; _j < _size; _j++ ) {
        
		var _k = ( _j + 1 ) mod _size;
		
		var _jx = _x_list[| _j ];
		var _jy = _y_list[| _j ];
		var _jz = _z_list[| _j ];
		
		var _kx = _x_list[| _k ];
		var _ky = _y_list[| _k ];
		var _kz = _z_list[| _k ];
		
		vertex_position_3d( _vbuff,   _ox, _oy, _oz ); vertex_texcoord( _vbuff, 0.5, 0.5 ); vertex_colour( _vbuff,   _colour, 1 ); vertex_normal( _vbuff,   _nx, _ny, _nz );
		vertex_position_3d( _vbuff,   _jx, _jy, _jz ); vertex_texcoord( _vbuff, 0.5, 0.5 ); vertex_colour( _vbuff,   _colour, 1 ); vertex_normal( _vbuff,   _nx, _ny, _nz );
		vertex_position_3d( _vbuff,   _kx, _ky, _kz ); vertex_texcoord( _vbuff, 0.5, 0.5 ); vertex_colour( _vbuff,   _colour, 1 ); vertex_normal( _vbuff,   _nx, _ny, _nz );
		
    }
    
}

vertex_end( _vbuff );

return _vbuff;