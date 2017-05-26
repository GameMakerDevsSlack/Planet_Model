/// @param grid
/// @param x
/// @param y
/// @param z
/// @param current

var _x       = argument0;
var _y       = argument1;
var _z       = argument2;
var _grid    = argument3;
var _current = argument4;

var _ax = _grid[# _current, world_tri.a_x ];
var _ay = _grid[# _current, world_tri.a_y ];
var _az = _grid[# _current, world_tri.a_z ];

var _bx = _grid[# _current, world_tri.b_x ];
var _by = _grid[# _current, world_tri.b_y ];
var _bz = _grid[# _current, world_tri.b_z ];

var _cx = _grid[# _current, world_tri.c_x ];
var _cy = _grid[# _current, world_tri.c_y ];
var _cz = _grid[# _current, world_tri.c_z ];

if ( compare_3d_points( _x, _y, _z,   _ax, _ay, _az ) ) return 1 else
if ( compare_3d_points( _x, _y, _z,   _bx, _by, _bz ) ) return 2 else
if ( compare_3d_points( _x, _y, _z,   _cx, _cy, _cz ) ) return 3 else return false;