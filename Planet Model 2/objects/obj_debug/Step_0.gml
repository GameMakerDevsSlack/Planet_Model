if ( keyboard_check( vk_escape ) ) game_end();

with( obj_screen ) {
	if ( keyboard_check_pressed( ord( "7" ) ) ) do_lighting = !do_lighting
	if ( keyboard_check_pressed( ord( "8" ) ) ) do_click    = !do_click;
	if ( keyboard_check_pressed( ord( "9" ) ) ) do_fxaa     = !do_fxaa;
}

if ( keyboard_check_pressed( ord( "0" ) ) ) do_debug = !do_debug;