var _vbuff = vertex_create_buffer();
vertex_begin( _vbuff, world_vertex_format );

var _grid  = world_tri_grid_a;
var _count = world_tri_grid_a_count;

for( var _i = 0; _i < _count; _i++ ) {
    
    var _hex = _grid[# _i, world_tri.hex ];
	var _colour = make_colour_hsv( 240*_hex/world_max_hexes, 240, 240 );
	
    var _ax = _grid[# _i, world_tri.a_x ];
    var _ay = _grid[# _i, world_tri.a_y ];
    var _az = _grid[# _i, world_tri.a_z ];
	
    var _bx = _grid[# _i, world_tri.b_x ];
    var _by = _grid[# _i, world_tri.b_y ];
    var _bz = _grid[# _i, world_tri.b_z ];
	
    var _cx = _grid[# _i, world_tri.c_x ];
    var _cy = _grid[# _i, world_tri.c_y ];
    var _cz = _grid[# _i, world_tri.c_z ];
    
	var _nx = _grid[# _i, world_tri.o_x ];
	var _ny = _grid[# _i, world_tri.o_y ];
	var _nz = _grid[# _i, world_tri.o_z ];
    var _d = 1/sqrt( _nx*_nx + _ny*_ny + _nz*_nz );
	_nx *= _d;
	_ny *= _d;
	_nz *= _d;
	
	vertex_position_3d( _vbuff,   _ax, _ay, _az ); vertex_texcoord( _vbuff, 0.5, 0.5 ); vertex_colour( _vbuff,   _colour, 1 ); vertex_normal( _vbuff,   _nx, _ny, _nz );
	vertex_position_3d( _vbuff,   _bx, _by, _bz ); vertex_texcoord( _vbuff, 0.5, 0.5 ); vertex_colour( _vbuff,   _colour, 1 ); vertex_normal( _vbuff,   _nx, _ny, _nz );
	vertex_position_3d( _vbuff,   _cx, _cy, _cz ); vertex_texcoord( _vbuff, 0.5, 0.5 ); vertex_colour( _vbuff,   _colour, 1 ); vertex_normal( _vbuff,   _nx, _ny, _nz );
	
}

vertex_end( _vbuff );

return _vbuff;