if ( do_fxaa ) {
	shader_set( shd_fxaa );
	var _texture = surface_get_texture( application_surface );
	shader_set_uniform_f( shader_get_uniform( shd_fxaa, "u_vLuminence" ), colour_get_red(   ambient_colour )/255,
																		  colour_get_green( ambient_colour )/255,
																	      colour_get_blue(  ambient_colour )/255 );
	shader_set_uniform_f( shader_get_uniform( shd_fxaa, "u_vTexel" ), texture_get_texel_width(  _texture ),
		                                                              texture_get_texel_height( _texture ) );
	draw_surface_ext( application_surface, 0, 0, 1, 1, 0, c_white, 1 );
	shader_reset();
} else {
	draw_surface_ext( application_surface, 0, 0, 1, 1, 0, c_white, 1 );
}