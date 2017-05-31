if ( keyboard_check_pressed( ord( "7" ) ) ) do_lighting = !do_lighting
if ( keyboard_check_pressed( ord( "8" ) ) ) do_click    = !do_click;
if ( keyboard_check_pressed( ord( "9" ) ) ) do_fxaa     = !do_fxaa;
if ( keyboard_check_pressed( ord( "0" ) ) ) do_debug    = !do_debug;

if ( keyboard_check( ord( "R" ) ) ) camera_vel_y -= 0.002;
if ( keyboard_check( ord( "F" ) ) ) camera_vel_y += 0.002;

if ( keyboard_check( vk_escape ) ) game_end();
if ( keyboard_check_pressed( vk_f4 ) ) {
	window_set_fullscreen( !window_get_fullscreen() );
	display_set_gui_maximise();
}

if ( surface_get_width( application_surface ) != display_get_gui_width() ) or ( surface_get_height( application_surface ) != display_get_gui_height() ) {
	surface_resize( application_surface, display_get_gui_width(), display_get_gui_height() );
}

camera_vel_y *= 0.8;
camera_y = clamp( camera_y + camera_vel_y, 0, 1 );

gpu_set_ztestenable( true );
gpu_set_zwriteenable( true );