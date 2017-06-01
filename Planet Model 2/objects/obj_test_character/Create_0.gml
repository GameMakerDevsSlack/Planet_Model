//buffer_change_colour( global.buffer_flag, c_white, 1 );
model = vertex_create_buffer_from_buffer_fixed( global.buffer_flag, global.vft_3d, make_colour_random(), 1 );

hex_a = noone;
hex_b = noone;
z_rotation = random( 360 );
matrix = global.matrix_identity;

hex_a = irandom( obj_world.world_hex_grid_count-1 );
hex_b = hex_a; //irandom( obj_world.world_hex_grid_count-1 );