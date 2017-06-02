if ( id == global.selected_inst ) {
	shader_set_uniform_f( global.uni_ambient_colour, colour_get_red(   c_ltgray )/255,
													 colour_get_green( c_ltgray )/255,
													 colour_get_blue(  c_ltgray )/255,
													 0 );
}

matrix_set( matrix_world, matrix );
vertex_submit( model, pr_trianglelist, sprite_get_texture( spr_white, 0 ) );
matrix_reset_world();

if ( id == global.selected_inst ) {
	shader_set_uniform_f( global.uni_ambient_colour, colour_get_red(   obj_screen.ambient_colour )/255,
													 colour_get_green( obj_screen.ambient_colour )/255,
													 colour_get_blue(  obj_screen.ambient_colour )/255,
													 0 );
}