old_view_matrix = matrix_get( matrix_view );
old_proj_matrix = matrix_get( matrix_projection );

if ( mouse_collect ) screen_mouse_collect();

draw_clear( space_colour );

if ( global.do_lighting ) {
	shader_set( shd_lighting );
	shader_set_uniform_f( global.uni_ambient_colour, colour_get_red(   ambient_colour )/255,
													 colour_get_green( ambient_colour )/255,
													 colour_get_blue(  ambient_colour )/255,
													 0 );
	light_set( 0,   0, -5000,    0, 10000,   c_white, 1 );
	light_set( 1,   0,  -500,  600,   700,   C_AMBER, 1 );
	light_set( 2, 200,  -400, -200,   400,    C_ROSE, 1 );
}

camera_set_view_mat( camera_get_active(), obj_world.camera_view_matrix );
camera_set_proj_mat( camera_get_active(), obj_world.camera_proj_matrix );
camera_apply( camera_get_active() );