old_view_matrix = matrix_get( matrix_view );
old_proj_matrix = matrix_get( matrix_projection );

draw_clear( ambient_colour );

gpu_set_ztestenable( true );
gpu_set_zwriteenable( true );
gpu_set_cullmode( cull_noculling );



shader_set( shd_lighting );
shader_set_uniform_f( shader_get_uniform( shd_lighting, "u_vAmbientColour" ), colour_get_red(   ambient_colour )/255,
																			  colour_get_green( ambient_colour )/255,
																			  colour_get_blue(  ambient_colour )/255,
																			  0 );
light_set( 0,   0, 0, -150, 500, c_white, 1 );



camera_set_view_mat( camera_get_active(), matrix_build_lookat( 0, 0, -150,
								                               0, 0, 0,
								                               0, 1, 0 ) );
camera_set_proj_mat( camera_get_active(), matrix_build_projection_perspective_fov( 60, 1024/768, 1, 10000 ) );
camera_apply( camera_get_active() );