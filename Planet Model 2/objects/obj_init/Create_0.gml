definitions();

global.on_mobile          = ( os_type == os_ios ) or ( os_type == os_android );
global.on_browser         = ( os_browser != browser_not_a_browser );
global.keyboard_control   = false;
global.app_surf_width     = surface_get_width( application_surface );
global.app_surf_height    = surface_get_height( application_surface );
global.selected_inst      = noone;
global.uni_ambient_colour = shader_get_uniform( shd_lighting, "u_vAmbientColour" );

global.do_lighting = true;
global.do_fxaa     = !global.on_mobile;
global.do_mouse    = false;

global.buffer_boat      = create_buffer_from_obj(           "boat.obj",   false, false,   0, 0,1.5,  1.5 );
global.buffer_flag      = create_buffer_from_obj(           "flag.obj",   false, false,   0, 0,  0,  6.0 );
global.buffer_bird      = create_buffer_from_obj(           "bird.obj",   false, false,   0, 0,  0,  0.7 );
global.buffer_conifer   = create_buffer_from_obj(   "conifer_lite.obj",   false, false,   0, 0,  0,  1.8 );
global.buffer_deciduous = create_buffer_from_obj( "deciduous_lite.obj",   false, false,   0, 0,  0,  1.8 );
global.buffer_palm      = create_buffer_from_obj( "palm_xtra_lite.obj",   false, false,   0, 0,  0,  1.8 );

//show_message( "disp=" + string( display_get_width() ) + "," + string( display_get_height() ) + "\nwindow=" + string( window_get_width() ) + "," + string( window_get_height() ) );
if ( global.on_browser ) window_set_rectangle( 0, 0, display_get_width(), display_get_height() );

instance_create_depth( 0, 0, 0, obj_screen );
instance_create_depth( 0, 0, 0, obj_debug );
room_goto_next();