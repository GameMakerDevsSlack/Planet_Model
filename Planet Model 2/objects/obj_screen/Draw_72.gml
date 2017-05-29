old_view_matrix = matrix_get( matrix_view );
old_proj_matrix = matrix_get( matrix_projection );

draw_clear( space_colour );



if ( do_lighting ) {
	shader_set( shd_lighting );
	shader_set_uniform_f( shader_get_uniform( shd_lighting, "u_vAmbientColour" ), colour_get_red(   ambient_colour )/255,
																				  colour_get_green( ambient_colour )/255,
																				  colour_get_blue(  ambient_colour )/255,
																				  0 );
	light_set( 0,   0, -5000,    0, 10000,   c_white, 1 );
	light_set( 1,   0,  -500,  600,   700,   C_AMBER, 1 );
	light_set( 2, 200,  -400, -200,   400,    C_ROSE, 1 );
	
}




if ( do_ortho ) {
	camera_set_view_mat( camera_get_active(), matrix_build_lookat( 0, -500, 0,
									                               0,    0, 0,
									                               0,    0, 1 ) );
	var _zoom = lerp( 0.05, 2, ease_quad_inout( camera_y ) );
	camera_set_proj_mat( camera_get_active(), matrix_build_projection_ortho( 1024*_zoom, 768*_zoom, 1, 10000 ) );
} else {
	//*
	var _y = lerp( -450, -2000, ease_quad_inout( camera_y ) );
	var _z = lerp(  120,     0, ease_quad_inout( camera_y ) );
	camera_set_view_mat( camera_get_active(), matrix_build_lookat( 0,  _y, _z,
									                               0,-350, _z*0.4,
									                               0,   0,  1 ) );
	camera_set_proj_mat( camera_get_active(), matrix_build_projection_perspective_fov( 45, 1024/768, 1, 16000 ) );
	/*/
	var _y = lerp( -350, -2000, ease_quad_inout( camera_y ) );
	var _z = lerp(  120,     0, ease_quad_inout( camera_y ) );
	camera_set_view_mat( camera_get_active(), matrix_build_lookat( 0,  _y, _z,
									                               0,-300, _z/2,
									                               0,   0,  1 ) );
	camera_set_proj_mat( camera_get_active(), matrix_build_projection_perspective_fov( 60, 1024/768, 1, 16000 ) );
	//*/
}

camera_apply( camera_get_active() );