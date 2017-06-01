if ( keyboard_check_pressed( vk_f4 ) ) {
	window_set_fullscreen( !window_get_fullscreen() );
	display_set_gui_maximise();
}

if ( surface_get_width( application_surface ) != display_get_gui_width() ) or ( surface_get_height( application_surface ) != display_get_gui_height() ) {
	surface_resize( application_surface, display_get_gui_width(), display_get_gui_height() );
}



click_hex      = noone;
click_instance = noone;

if ( surface_exists( srf_click ) ) {
	if ( os_browser == browser_not_a_browser ) {
		var _pixel = surface_getpixel( srf_click, window_mouse_get_x(), surface_get_height( application_surface )-window_mouse_get_y() );
	} else {
		var _pixel = surface_getpixel( srf_click, mouse_x, mouse_y );
	}

	var _red   =   _pixel         & $FF;
	var _green = ( _pixel >>  8 ) & $FF;
	var _blue  = ( _pixel >> 16 ) & $FF;

	if ( _blue == 0 ) {
		click_hex = _green*255 + _red - 1;
	} else {
		click_instance = click_array[ _green*255 + _red ];
	}
}


gpu_set_ztestenable( true );
gpu_set_zwriteenable( true );