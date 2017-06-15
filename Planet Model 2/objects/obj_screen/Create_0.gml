application_surface_draw_enable( false );

space_colour   = make_colour_rgb( 20, 11, 20 );
ambient_colour = space_colour;

srf_mouse        = noone;
mouse_array      = [];
mouse_collect    = false;
mouse_sample     = false;
mouse_pressed    = false;
mouse_down       = false;
mouse_released   = false;
mouse_long_press = false;
mouse_p_time     = current_time;
mouse_p_hex      = noone;
mouse_p_x        = noone;
mouse_p_y        = noone;
mouse_d_x        = noone;
mouse_d_y        = noone;
mouse_d_pre_x    = noone;
mouse_d_pre_y    = noone;
mouse_hex        = noone;
mouse_inst       = noone;
mouse_scroll     = 0;
mouse_scroll_pos = 0;
mouse_moved      = false;

//window_set_cursor( cr_drag );
//window_set_cursor( cr_size_all );
//window_set_cursor( cr_handpoint );