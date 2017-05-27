application_surface_draw_enable( false );

space_colour   = make_colour_rgb( 20, 11, 20 );
ambient_colour = merge_colour( space_colour, c_white, 0.02 );

gpu_set_ztestenable( true );
gpu_set_zwriteenable( true );
gpu_set_cullmode( cull_noculling );

do_lighting = true;
do_ortho    = false;
do_fxaa     = false;
do_debug    = true;

camera_vel_y = 0;
camera_y = 0.6;