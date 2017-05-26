/// @param x1
/// @param y1
/// @param z1
/// @param x2
/// @param y2
/// @param z2
/// @param x3
/// @param y3
/// @param z3
/// @param parent

var _grid = world_tri_get_grid();

_grid[# world_grid_a_count, world_tri.a_x ] = argument0;
_grid[# world_grid_a_count, world_tri.a_y ] = argument1;
_grid[# world_grid_a_count, world_tri.a_z ] = argument2;

_grid[# world_grid_a_count, world_tri.b_x ] = argument3;
_grid[# world_grid_a_count, world_tri.b_y ] = argument4;
_grid[# world_grid_a_count, world_tri.b_z ] = argument5;

_grid[# world_grid_a_count, world_tri.c_x ] = argument6;
_grid[# world_grid_a_count, world_tri.c_y ] = argument7;
_grid[# world_grid_a_count, world_tri.c_z ] = argument8;

_grid[# world_grid_a_count, world_tri.o_x ] = ( argument0 + argument3 + argument6 )/3;
_grid[# world_grid_a_count, world_tri.o_y ] = ( argument1 + argument4 + argument7 )/3;
_grid[# world_grid_a_count, world_tri.o_z ] = ( argument2 + argument5 + argument8 )/3;

_grid[# world_grid_a_count, world_tri.a_adj ] = noone;
_grid[# world_grid_a_count, world_tri.b_adj ] = noone;
_grid[# world_grid_a_count, world_tri.c_adj ] = noone;

_grid[# world_grid_a_count, world_tri.a_chi  ] = noone;
_grid[# world_grid_a_count, world_tri.b_chi  ] = noone;
_grid[# world_grid_a_count, world_tri.c_chi  ] = noone;
_grid[# world_grid_a_count, world_tri.parent ] = argument9;

_grid[# world_grid_a_count, world_tri.hex ] = noone;

if ( world_grid_flipflop ) world_grid_b_count++ else world_grid_a_count++;