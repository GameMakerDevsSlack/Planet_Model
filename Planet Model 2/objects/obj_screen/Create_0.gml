application_surface_draw_enable( false );

space_colour   = make_colour_rgb( 20, 11, 20 );
ambient_colour = space_colour; //merge_colour( space_colour, c_white, 0.02 );

do_lighting = true;
do_fxaa     = true;
do_debug    = false;
do_click    = false;

camera_vel_y = 0;
camera_y = 0.6;

srf_click = noone;
click_array = [];