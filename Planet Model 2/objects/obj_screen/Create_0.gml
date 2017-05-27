application_surface_draw_enable( false );

ambient_colour = make_colour_rgb( 22, 12, 37 );

gpu_set_ztestenable( true );
gpu_set_zwriteenable( true );
gpu_set_cullmode( cull_counterclockwise );

do_lighting = true;
do_ortho    = false;
do_fxaa     = false;
do_debug    = true;