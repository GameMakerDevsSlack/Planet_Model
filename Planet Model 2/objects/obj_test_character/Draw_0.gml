var _hex = hex;
var _a = 300;
var _b = 500;

with( obj_world ) {
	
	var _result = slerp( world_hex_grid[# _a, world_hex.x ], world_hex_grid[# _a, world_hex.y ], world_hex_grid[# _a, world_hex.z ],
	                     world_hex_grid[# _b, world_hex.x ], world_hex_grid[# _b, world_hex.y ], world_hex_grid[# _b, world_hex.z ],
						 0.5 + 0.5*dsin( current_time/50 ) );
	
	var _x = _result[0];
	var _y = _result[1];
	var _z = _result[2];
	
    var _r     = point_distance_3d( 0, 0, 0, _x, _y, _z );
    var _phi   = darctan2( _z, _x );
    var _theta = darccos( _y / _r );
	
	var _height = world_hex_grid[# _hex, world_hex.test ];
	var _model = global.model_conifer;
		
	matrix_reset_world();
	matrix_multiply_world( matrix_build( 0, world_scale*world_relief*_height, 0,
	                                     0, world_hex_grid[# _hex, world_hex.rotation ], 0,
										 world_model_scale, 3*world_model_scale, world_model_scale ) );
	matrix_multiply_world( matrix_build( 0, 0, 0,   0, 0, _theta,   1, 1, 1 ) );
	matrix_multiply_world( matrix_build( world_scale*_x, world_scale*_y, world_scale*_z,
			                             0, _phi, 0,   1, 1, 1 ) );
	matrix_multiply_world( matrix );
	vertex_submit( _model, pr_trianglelist, sprite_get_texture( spr_white, 0 ) );
	matrix_reset_world();
	
}