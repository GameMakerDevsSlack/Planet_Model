var _hex = hex;
var _a = 300;
var _b = 500;

with( obj_world ) {
	
	var _height = world_hex_grid[# _hex, world_hex.test ];
	var _model = global.model_flag;
	
	var _result = slerp( world_hex_grid[# _a, world_hex.x ], world_hex_grid[# _a, world_hex.y ], world_hex_grid[# _a, world_hex.z ],
	                     world_hex_grid[# _b, world_hex.x ], world_hex_grid[# _b, world_hex.y ], world_hex_grid[# _b, world_hex.z ],
						 0.5 + 0.5*dsin( current_time/50 ) );
	
	var _x = _result[0];
	var _y = _result[1] + world_relief*_height;
	var _z = _result[2];
	
    var _r     = point_distance_3d( 0, 0, 0, _x, _y, _z );
    var _phi   = darctan2( _z, _x );
    var _theta = darccos( _y / _r );
	
	var _alpha = other.z_rotation;
	var _a_sin = dsin( _alpha );
	var _a_cos = dcos( _alpha );
	var _t_sin = dsin( _theta );
	var _t_cos = dcos( _theta );
	var _p_sin = dsin( _phi );
	var _p_cos = dcos( _phi );
	
	var _x_scale = world_model_scale;
	var _y_scale = world_model_scale;
	var _z_scale = world_model_scale;
	
	var _pos_matrix = [ _x_scale*( _a_cos*_t_cos*_p_cos - _a_sin*_p_sin), _x_scale*(-_a_cos*_t_sin), _x_scale*( _a_cos*_t_cos*_p_sin+_a_sin*_p_cos), 0,
		                _y_scale*(                        _t_sin*_p_cos), _y_scale*(        _t_cos), _y_scale*(                      _t_sin*_p_sin), 0,
		                _z_scale*(-_a_sin*_t_cos*_p_cos - _a_cos*_p_sin), _z_scale*( _a_sin*_t_sin), _z_scale*(-_a_sin*_t_cos*_p_sin+_a_cos*_p_cos), 0,
		                                                  world_scale*_x,            world_scale*_y,                                 world_scale*_z, 1 ];
	
	matrix_set( matrix_world, matrix_multiply( _pos_matrix, matrix ) );
	vertex_submit( _model, pr_trianglelist, sprite_get_texture( spr_white, 0 ) );
	matrix_reset_world();
	
}