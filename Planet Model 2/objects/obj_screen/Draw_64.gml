if ( do_debug ) {
	
	var _str = string( fps ) + " | " + string( floor( fps_real ) );
	_str += "\n" + string( obj_world.world_subdivisions ) + " subdivisions";
	_str += "\n" + string( obj_world.world_max_triangles ) + " triangles";
	_str += "\n" + string( obj_world.world_max_hexes ) + " hexes";
	_str += "\n\nWASDQERF = rotate";
	_str += "\n\n7 = toggle lighting";
	_str += "\n8 = toggle relief";
	_str += "\n9 = toggle FXAA";
	_str += "\n0 = toggle debug";
	
	_str += "\n";
	if ( do_lighting ) _str += "\nLighting";
	if ( do_fxaa     ) _str += "\nFXAA";
	
	if ( os_browser == browser_not_a_browser ) {
		var _pixel = surface_getpixel( srf_click, window_mouse_get_x(), surface_get_height( application_surface )-window_mouse_get_y() );
	} else {
		var _pixel = surface_getpixel( srf_click, mouse_x, mouse_y );
	}
	
	var _red   =   _pixel         & $FF;
	var _green = ( _pixel >>  8 ) & $FF;
	var _blue  = ( _pixel >> 16 ) & $FF;
	
	_str += "\n\n" + string( _red ) + "," + string( _green ) + "," + string( _blue );
	if ( _blue == 0 ) {
		var _hex = _green*255 + _red - 1;
		_str += "\n" + string( _hex );
	} else {
		var _inst = click_array[ _green*255 + _red ];
		_str += "\n" + string( _inst ) + ":" + string( _inst.hex_a );
	}
	_str += "\nclick_array=" + string( array_length_1d( click_array ) );
	
	draw_set_colour( c_white );
	draw_set_font( fnt_default );
	draw_text( 5, 5,  _str );
	
}