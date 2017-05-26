/// @param grid
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

world_tri_grid_a[# world_tri_grid_a_count, world_tri.a_x ] = argument0;
world_tri_grid_a[# world_tri_grid_a_count, world_tri.a_y ] = argument1;
world_tri_grid_a[# world_tri_grid_a_count, world_tri.a_z ] = argument2;

world_tri_grid_a[# world_tri_grid_a_count, world_tri.b_x ] = argument3;
world_tri_grid_a[# world_tri_grid_a_count, world_tri.b_y ] = argument4;
world_tri_grid_a[# world_tri_grid_a_count, world_tri.b_z ] = argument5;

world_tri_grid_a[# world_tri_grid_a_count, world_tri.c_x ] = argument6;
world_tri_grid_a[# world_tri_grid_a_count, world_tri.c_y ] = argument7;
world_tri_grid_a[# world_tri_grid_a_count, world_tri.c_z ] = argument8;

world_tri_grid_a[# world_tri_grid_a_count, world_tri.o_x ] = ( argument0 + argument3 + argument6 )/3;
world_tri_grid_a[# world_tri_grid_a_count, world_tri.o_y ] = ( argument1 + argument4 + argument7 )/3;
world_tri_grid_a[# world_tri_grid_a_count, world_tri.o_z ] = ( argument2 + argument5 + argument8 )/3;

world_tri_grid_a[# world_tri_grid_a_count, world_tri.a_adj ] = noone;
world_tri_grid_a[# world_tri_grid_a_count, world_tri.b_adj ] = noone;
world_tri_grid_a[# world_tri_grid_a_count, world_tri.c_adj ] = noone;

world_tri_grid_a[# world_tri_grid_a_count, world_tri.a_chi  ] = noone;
world_tri_grid_a[# world_tri_grid_a_count, world_tri.b_chi  ] = noone;
world_tri_grid_a[# world_tri_grid_a_count, world_tri.c_chi  ] = noone;
world_tri_grid_a[# world_tri_grid_a_count, world_tri.parent ] = argument9;

world_tri_grid_a[# world_tri_grid_a_count, world_tri.hex ] = noone;

return world_tri_grid_a_count++;