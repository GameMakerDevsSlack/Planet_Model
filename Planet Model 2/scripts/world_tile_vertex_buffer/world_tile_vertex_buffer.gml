var _vbuff = vertex_create_buffer();
vertex_begin( _vbuff, world_vertex_format );

//Build hexes themselves
for( var _i = 0; _i < world_hex_grid_count; _i++ ) {
    
	var _value = world_hex_grid[# _i, world_hex.test ];
	var _height = 1 + world_relief*_value;
	var _colour = make_colour_hsv( 0, 0, 255*_value );
	
    var _ox = _height*world_hex_grid[# _i, world_hex.x ];
    var _oy = _height*world_hex_grid[# _i, world_hex.y ];
    var _oz = _height*world_hex_grid[# _i, world_hex.z ];
    
    var _d = 1/sqrt( _ox*_ox + _oy*_oy + _oz*_oz );
	var _nx = _ox*_d;
	var _ny = _oy*_d;
	var _nz = _oz*_d;
    
    var _ax_list = world_hex_grid[# _i, world_hex.list_ax   ];
    var _ay_list = world_hex_grid[# _i, world_hex.list_ay   ];
    var _az_list = world_hex_grid[# _i, world_hex.list_az   ];
	
    var _bx_list = world_hex_grid[# _i, world_hex.list_bx   ];
    var _by_list = world_hex_grid[# _i, world_hex.list_by   ];
    var _bz_list = world_hex_grid[# _i, world_hex.list_bz   ];
	
    var  _e_list = world_hex_grid[# _i, world_hex.list_edge ];
	
	var _size = ds_list_size( _ax_list );
    for( var _j = 0; _j < _size; _j++ ) {
		 
		var _jx = _height*_ax_list[| _j ];
		var _jy = _height*_ay_list[| _j ];
		var _jz = _height*_az_list[| _j ];
		
		var _kx = _height*_bx_list[| _j ];
		var _ky = _height*_by_list[| _j ];
		var _kz = _height*_bz_list[| _j ];
		
		vertex_position_3d( _vbuff,   _ox, _oy, _oz ); vertex_colour( _vbuff,   _colour, 1 ); vertex_texcoord( _vbuff, 0.5, 0.5 ); vertex_normal( _vbuff,   _nx, _ny, _nz );
		vertex_position_3d( _vbuff,   _kx, _ky, _kz ); vertex_colour( _vbuff,   _colour, 1 ); vertex_texcoord( _vbuff, 0.5, 0.5 ); vertex_normal( _vbuff,   _nx, _ny, _nz );
		vertex_position_3d( _vbuff,   _jx, _jy, _jz ); vertex_colour( _vbuff,   _colour, 1 ); vertex_texcoord( _vbuff, 0.5, 0.5 ); vertex_normal( _vbuff,   _nx, _ny, _nz );
		
		if ( _e_list[| _j ] ) {
			
			cross_product_normalised( _kx, _ky, _kz,   _jx, _jy, _jz );
		
			vertex_position_3d( _vbuff,     0,   0,   0 ); vertex_colour( _vbuff,   _colour, 1 ); vertex_texcoord( _vbuff, 0.5, 0.5 ); vertex_normal( _vbuff,   global.return[0], global.return[1], global.return[2] );
			vertex_position_3d( _vbuff,   _jx, _jy, _jz ); vertex_colour( _vbuff,   _colour, 1 ); vertex_texcoord( _vbuff, 0.5, 0.5 ); vertex_normal( _vbuff,   global.return[0], global.return[1], global.return[2] );
			vertex_position_3d( _vbuff,   _kx, _ky, _kz ); vertex_colour( _vbuff,   _colour, 1 ); vertex_texcoord( _vbuff, 0.5, 0.5 ); vertex_normal( _vbuff,   global.return[0], global.return[1], global.return[2] );
			
		}
		
    }
    
}


//Build foliage
for( var _i = 0; _i < world_hex_grid_count; _i++ ) {
	
	var _value = world_hex_grid[# _i, world_hex.test ];
	
	var _height = 1 + world_relief*_value;
    var _ox = _height*world_hex_grid[# _i, world_hex.x ];
    var _oy = _height*world_hex_grid[# _i, world_hex.y ];
    var _oz = _height*world_hex_grid[# _i, world_hex.z ];
	
	if ( ( _value == 0.2 ) or ( _value == 0.4 ) ) and ( world_hex_grid[# _i, world_hex.tree ] ) {
		
		var _theta = abs( 90 - world_hex_grid[# _i, world_hex.theta ] );
		if ( _theta < 18 ) {
			var _buffer = global.buffer_palm;
		} else if ( _theta < 50 ) {
			var _buffer = global.buffer_deciduous;
		} else {
			var _buffer = global.buffer_conifer;
		}
		
		var _k = world_model_scale/world_scale;
		var _alpha = world_hex_grid[# _i, world_hex.rotation ];
		var _theta = world_hex_grid[# _i, world_hex.theta ];
		var _phi   = world_hex_grid[# _i, world_hex.phi ];
		var _a_sin = dsin( _alpha );
		var _a_cos = dcos( _alpha );
		var _t_sin = dsin( _theta );
		var _t_cos = dcos( _theta );
		var _p_sin = dsin( _phi );
		var _p_cos = dcos( _phi );
		
		_a_sin *= _k;
		_a_cos *= _k;
		var _pos_matrix = [  _a_cos*_t_cos*_p_cos - _a_sin*_p_sin, -_a_cos*_t_sin,  _a_cos*_t_cos*_p_sin+_a_sin*_p_cos, 0,
		                                         _k*_t_sin*_p_cos,      _k*_t_cos,                    _k*_t_sin*_p_sin, 0,
		                    -_a_sin*_t_cos*_p_cos - _a_cos*_p_sin,  _a_sin*_t_sin, -_a_sin*_t_cos*_p_sin+_a_cos*_p_cos, 0,
		                                                      _ox,            _oy,                                 _oz, 1 ];
		
		_a_sin /= _k;
		_a_cos /= _k;
		var _norm_matrix = [  _a_cos*_t_cos*_p_cos - _a_sin*_p_sin, -_a_cos*_t_sin,  _a_cos*_t_cos*_p_sin+_a_sin*_p_cos, 0,
		                                             _t_sin*_p_cos,         _t_cos,                       _t_sin*_p_sin, 0,
		                     -_a_sin*_t_cos*_p_cos - _a_cos*_p_sin,  _a_sin*_t_sin, -_a_sin*_t_cos*_p_sin+_a_cos*_p_cos, 0,
		                                                         0,              0,                                   0, 1 ];
																	
		/*
		var _pos_matrix = [  _k*_a_cos*_t_cos*_p_cos - _k*_a_sin*_p_sin, -_k*_a_cos*_t_sin,  _k*_a_cos*_t_cos*_p_sin+_k*_a_sin*_p_cos, 0,
		                                               _k*_t_sin*_p_cos,         _k*_t_cos,                          _k*_t_sin*_p_sin, 0,
		                    -_k*_a_sin*_t_cos*_p_cos - _k*_a_cos*_p_sin,  _k*_a_sin*_t_sin, -_k*_a_sin*_t_cos*_p_sin+_k*_a_cos*_p_cos, 0,
		                                                            _ox,               _oy,                                       _oz, 1 ];
		*/
		
		/*
		_pos_matrix = [ _k*_a_cos,  0, _k*_a_sin, 0,
					            0, _k,         0, 0,
				       -_k*_a_sin,  0, _k*_a_cos, 0,
					            0,  0,         0, 1 ];
		
		_pos_matrix = matrix_multiply( _pos_matrix, [ _t_cos, -_t_sin, 0, 0,
													  _t_sin,  _t_cos, 0, 0,
													       0,       0, 1, 0,
													       0,       0, 0, 1 ] );
		
		_pos_matrix = matrix_multiply( _pos_matrix, [  _p_cos, 0, _p_sin, 0,
													        0, 1,      0, 0,
													  -_p_sin, 0, _p_cos, 0,
													        0, 0,      0, 1 ] );
		_pos_matrix[12] = _ox;
		_pos_matrix[13] = _oy;
		_pos_matrix[14] = _oz;
		*/
		/*
		var _norm_matrix = matrix_build( 0, 0, 0,   0, world_hex_grid[# _i, world_hex.rotation ], 0,   1, 1, 1 );
		_norm_matrix = matrix_multiply( _norm_matrix, matrix_build( 0, 0, 0,   0, 0, world_hex_grid[# _i, world_hex.theta ],   1, 1, 1 ) );
		_norm_matrix = matrix_multiply( _norm_matrix, matrix_build( 0, 0, 0,   0, world_hex_grid[# _i, world_hex.phi ], 0,   1, 1, 1 ) );
		*/
																	
		add_buffer_to_vertex_buffer( _buffer, _pos_matrix, _norm_matrix, _vbuff );
		
	}
	
}

vertex_end( _vbuff );

return _vbuff;