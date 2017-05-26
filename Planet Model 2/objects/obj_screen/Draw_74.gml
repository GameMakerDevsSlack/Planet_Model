/*
shader_set( shd_fxaa );
	
	var _texture = surface_get_texture( application_surface );
	shader_set_uniform_f( shader_get_uniform( shd_fxaa, "u_vTexel" ), texture_get_texel_width(  _texture ),
	                                                                  texture_get_texel_height( _texture ) );
	draw_surface_ext( application_surface, 0, 0, 1, 1, 0, c_white, 1 );
	
shader_reset();
*/

draw_surface_ext( application_surface, 0, 0, 1, 1, 0, c_white, 1 );