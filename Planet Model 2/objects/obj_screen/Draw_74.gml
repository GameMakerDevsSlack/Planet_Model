var _x_scale = display_get_gui_width()/camera_get_view_width( camera_get_active() );
var _y_scale = display_get_gui_height()/camera_get_view_height( camera_get_active() );

if ( global.do_mouse ) {
	
	if ( os_browser == browser_not_a_browser ) {
		draw_surface_ext( srf_mouse, 0, display_get_gui_height(), 1, -1, 0, c_white, 1 );
	} else {
		draw_surface_ext( srf_mouse, 0, 0, 1, 1, 0, c_white, 1 );
	}
	
} else if ( global.do_fxaa ) {
	
	shader_set( shd_fxaa );
	var _texture = surface_get_texture( application_surface );
	shader_set_uniform_f( shader_get_uniform( shd_fxaa, "u_vLuminence" ), colour_get_red(   ambient_colour )/255,
																		  colour_get_green( ambient_colour )/255,
																	      colour_get_blue(  ambient_colour )/255 );
	shader_set_uniform_f( shader_get_uniform( shd_fxaa, "u_vTexel" ), texture_get_texel_width(  _texture ),
		                                                              texture_get_texel_height( _texture ) );
	//draw_surface_ext( application_surface, 0, 0, _x_scale, _y_scale, 0, c_white, 1 );
	draw_surface_stretched( application_surface, 0, 0, display_get_gui_width(), display_get_gui_height() );
	shader_reset();
	
} else {
	
	draw_surface_stretched( application_surface, 0, 0, display_get_gui_width(), display_get_gui_height() );
	
}