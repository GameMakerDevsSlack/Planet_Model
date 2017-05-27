#macro DEBUG true

#macro C_AMBER make_colour_rgb( 255, 240, 100 )
// #160C25

randomise();

global.return[0] = undefined;
global.return[1] = undefined;
global.return[2] = undefined;

global.matrix_identity = [ 1, 0, 0, 0,
                           0, 1, 0, 0,
						   0, 0, 1, 0,
						   0, 0, 0, 1 ];