if ( keyboard_check_pressed( vk_f4 ) ) {
	window_set_fullscreen( !window_get_fullscreen() );
	display_set_gui_maximise();
}

if ( surface_get_width( application_surface ) != display_get_gui_width() ) or ( surface_get_height( application_surface ) != display_get_gui_height() ) {
	surface_resize( application_surface, display_get_gui_width(), display_get_gui_height() );
}

gpu_set_ztestenable( true );
gpu_set_zwriteenable( true );

handle_mouse();