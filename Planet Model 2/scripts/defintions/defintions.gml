#macro DEBUG true

#macro C_AMBER make_colour_rgb( 255, 240, 100 )
#macro C_ROSE make_colour_rgb( 255, 210, 200 )
// #140B14

//randomise();

global.return[0] = undefined;
global.return[1] = undefined;
global.return[2] = undefined;

global.matrix_identity = [ 1, 0, 0, 0,
                           0, 1, 0, 0,
						   0, 0, 1, 0,
						   0, 0, 0, 1 ];

vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_colour();
vertex_format_add_texcoord();
vertex_format_add_normal();
vft_3d = vertex_format_end();