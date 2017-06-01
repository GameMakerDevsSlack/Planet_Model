application_surface_draw_enable( false );

space_colour   = make_colour_rgb( 20, 11, 20 );
ambient_colour = space_colour;

do_lighting = true;
do_fxaa     = true;
do_mouse    = false;

srf_mouse      = noone;
mouse_array    = [];
mouse_pressed  = false;
mouse_down     = false;
mouse_released = false;
mouse_p_hex    = noone;
mouse_p_inst   = noone;
mouse_p_x      = noone;
mouse_p_y      = noone;
mouse_d_x      = noone;
mouse_d_y      = noone;
mouse_d_pre_x  = noone;
mouse_d_pre_y  = noone;
mouse_r_hex    = noone;
mouse_r_inst   = noone;

//window_set_cursor( cr_drag );
//window_set_cursor( cr_size_all );
//window_set_cursor( cr_handpoint );