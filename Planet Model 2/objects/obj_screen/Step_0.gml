if ( keyboard_check_pressed( ord( "7" ) ) ) do_lighting = !do_lighting
if ( keyboard_check_pressed( ord( "8" ) ) ) do_ortho    = !do_ortho;
if ( keyboard_check_pressed( ord( "9" ) ) ) do_fxaa     = !do_fxaa;
if ( keyboard_check_pressed( ord( "0" ) ) ) do_debug    = !do_debug;

if ( keyboard_check( ord( "R" ) ) ) camera_vel_y -= 0.002;
if ( keyboard_check( ord( "F" ) ) ) camera_vel_y += 0.002;

camera_vel_y *= 0.8;
camera_y = clamp( camera_y + camera_vel_y, 0, 1 );