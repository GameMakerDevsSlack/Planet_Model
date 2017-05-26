for( var _i = 0; _i < world_tri_grid_a_count; _i++ ) {
    
    var _x = world_tri_grid_a[# _i, world_tri.a_x ];
    var _y = world_tri_grid_a[# _i, world_tri.a_y ];
    var _z = world_tri_grid_a[# _i, world_tri.a_z ];
    var _ratio = world_scale/sqrt( _x*_x + _y*_y + _z*_z );
    
	world_tri_grid_a[# _i, world_tri.a_x ] = _x * _ratio;
	world_tri_grid_a[# _i, world_tri.a_y ] = _y * _ratio;
	world_tri_grid_a[# _i, world_tri.a_z ] = _z * _ratio;
    
    
    
    var _x = world_tri_grid_a[# _i, world_tri.b_x ];
    var _y = world_tri_grid_a[# _i, world_tri.b_y ];
    var _z = world_tri_grid_a[# _i, world_tri.b_z ];
    var _ratio = world_scale/sqrt( _x*_x + _y*_y + _z*_z );
    
	world_tri_grid_a[# _i, world_tri.b_x ] = _x * _ratio;
	world_tri_grid_a[# _i, world_tri.b_y ] = _y * _ratio;
	world_tri_grid_a[# _i, world_tri.b_z ] = _z * _ratio;
    
    
    
    var _x = world_tri_grid_a[# _i, world_tri.c_x ];
    var _y = world_tri_grid_a[# _i, world_tri.c_y ];
    var _z = world_tri_grid_a[# _i, world_tri.c_z ];
    var _ratio = world_scale/sqrt( _x*_x + _y*_y + _z*_z );
    
	world_tri_grid_a[# _i, world_tri.c_x ] = _x * _ratio;
	world_tri_grid_a[# _i, world_tri.c_y ] = _y * _ratio;
	world_tri_grid_a[# _i, world_tri.c_z ] = _z * _ratio;
    
    
    
    var _x = world_tri_grid_a[# _i, world_tri.o_x ];
    var _y = world_tri_grid_a[# _i, world_tri.o_y ];
    var _z = world_tri_grid_a[# _i, world_tri.o_z ];
    var _ratio = world_scale/sqrt( _x*_x + _y*_y + _z*_z );
    
	world_tri_grid_a[# _i, world_tri.o_x ] = _x * _ratio;
	world_tri_grid_a[# _i, world_tri.o_y ] = _y * _ratio;
	world_tri_grid_a[# _i, world_tri.o_z ] = _z * _ratio;
    
}