if ( global.on_browser ) {
	if ( display_get_width() != window_get_width() ) or ( display_get_height() != window_get_height() ) {
		window_set_rectangle( 0, 0, display_get_width(), display_get_height() );
	}
} else {
	if ( keyboard_check_pressed( vk_f4 ) ) {
		window_set_fullscreen( !window_get_fullscreen() );
		display_set_gui_maximise();
	}
}

global.app_surf_width = surface_get_width( application_surface );
global.app_surf_height = surface_get_height( application_surface );

if ( global.app_surf_width != display_get_gui_width() ) or ( global.app_surf_height != display_get_gui_height() ) {
	surface_resize( application_surface, display_get_gui_width(), display_get_gui_height() );
}

gpu_set_ztestenable( true );
gpu_set_zwriteenable( true );
gpu_set_cullmode( cull_clockwise );

screen_mouse_handle();