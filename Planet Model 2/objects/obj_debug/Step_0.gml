if ( keyboard_check( vk_escape ) ) game_end();

//if ( keyboard_check_pressed( ord( "8" ) ) ) global.do_mouse    = !global.do_mouse;
if ( keyboard_check_pressed( ord( "8" ) ) ) global.do_lighting = !global.do_lighting
if ( keyboard_check_pressed( ord( "9" ) ) ) global.do_fxaa     = !global.do_fxaa;

if ( keyboard_check_pressed( ord( "0" ) ) ) do_debug = !do_debug;