var _height = 0.2; //world_hex_grid[# _hex, world_hex.test ];

var _grid = obj_world.world_hex_grid;
/*
var _result = slerp( _grid[# hex_a, world_hex.x ], _grid[# hex_a, world_hex.y ], _grid[# hex_a, world_hex.z ],
	                 _grid[# hex_b, world_hex.x ], _grid[# hex_b, world_hex.y ], _grid[# hex_b, world_hex.z ],
					 0.5 + 0.5*dsin( current_time/50 ) );

var _x = _result[0];
var _y = _result[1] + obj_world.world_relief*_height;
var _z = _result[2];
*/

var _x = _grid[# hex_a, world_hex.x ];
var _y = _grid[# hex_a, world_hex.y ] + obj_world.world_relief*_height;
var _z = _grid[# hex_a, world_hex.z ];

var _r     = point_distance_3d( 0, 0, 0, _x, _y, _z );
var _phi   = darctan2( _z, _x );
var _theta = darccos( _y / _r );

var _a_sin = dsin( z_rotation );
var _a_cos = dcos( z_rotation );
var _t_sin = dsin( _theta );
var _t_cos = dcos( _theta );
var _p_sin = dsin( _phi );
var _p_cos = dcos( _phi );

var _model_scale = obj_world.world_model_scale;
var _x_scale = _model_scale;
var _y_scale = _model_scale;
var _z_scale = _model_scale;
	
var _scale = obj_world.world_scale;
var _pos_matrix = [ _x_scale*( _a_cos*_t_cos*_p_cos - _a_sin*_p_sin), _x_scale*(-_a_cos*_t_sin), _x_scale*( _a_cos*_t_cos*_p_sin+_a_sin*_p_cos), 0,
		            _y_scale*(                        _t_sin*_p_cos), _y_scale*(        _t_cos), _y_scale*(                      _t_sin*_p_sin), 0,
		            _z_scale*(-_a_sin*_t_cos*_p_cos - _a_cos*_p_sin), _z_scale*( _a_sin*_t_sin), _z_scale*(-_a_sin*_t_cos*_p_sin+_a_cos*_p_cos), 0,
		                                                   _scale*_x,                 _scale*_y,                                      _scale*_z, 1 ];
	
matrix = matrix_multiply( _pos_matrix, obj_world.matrix );