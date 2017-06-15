if ( mouse_check_button_pressed( mb_left ) ) {
	mouse_pressed = true;
	mouse_p_time = current_time;
}
if ( mouse_check_button_released( mb_left ) ) mouse_released = true;
mouse_down = mouse_check_button( mb_left );

if ( mouse_down ) {
	if ( current_time - mouse_p_time > 1000 ) and ( !mouse_moved ) {
		if ( !mouse_long_press ) mouse_released = true;
		mouse_long_press = true;
		mouse_down = false;
	}
} else {
	mouse_long_press = false;
}



if ( device_multitouch() ) or ( keyboard_check( vk_control ) ) {
	
	var _y = mouse_get_y();
	if ( mouse_scroll_pos < 0 ) mouse_scroll = 0 else mouse_scroll = (_y - mouse_scroll_pos)/60;
	mouse_scroll_pos = _y;
	
} else {
	
	mouse_scroll_pos = noone;
	mouse_scroll = 0;
	if ( mouse_wheel_up()   ) mouse_scroll = -1;
	if ( mouse_wheel_down() ) mouse_scroll =  1;
	
}

if ( mouse_collect ) {
	mouse_collect = false;
	mouse_sample = true;
} else {
	mouse_collect = mouse_pressed or mouse_released;
	mouse_sample = false;
}

if ( mouse_down ) and ( !mouse_pressed ) {
	mouse_d_pre_x = mouse_d_x;
	mouse_d_pre_y = mouse_d_y;
	mouse_d_x = mouse_get_x();
	mouse_d_y = mouse_get_y();
} else {
	mouse_d_pre_x = noone;
	mouse_d_pre_y = noone;
	mouse_d_x = noone;
	mouse_d_y = noone;
}



if ( mouse_sample ) {
	mouse_sample = false;
	
	var _hex  = noone;
	var _inst = noone;

	if ( surface_exists( srf_mouse ) ) {
		
		if ( !global.on_browser ) {
			var _pixel = surface_getpixel( srf_mouse, mouse_get_x(), surface_get_height( application_surface )-mouse_get_y() );
		} else {
			var _pixel = surface_getpixel( srf_mouse, mouse_get_x(), mouse_get_y() );
		}
		
		var _red   =   _pixel         & $FF;
		var _green = ( _pixel >>  8 ) & $FF;
		var _blue  = ( _pixel >> 16 ) & $FF;

		if ( _blue == 0 ) {
			var _hex = _green*255 + _red - 1;
		} else {
			var _inst = mouse_array[ _green*255 + _red ];
		}
		
	}
	
	if ( mouse_pressed ) {
		
		mouse_p_hex   = _hex;
		mouse_p_time  = current_time;
		mouse_p_x     = mouse_get_x();
		mouse_p_y     = mouse_get_y();
		mouse_d_pre_x = mouse_get_x();
		mouse_d_pre_y = mouse_get_y();
		mouse_d_x     = mouse_get_x();
		mouse_d_y     = mouse_get_y();
		mouse_pressed = false;
		mouse_moved   = false;
		
	} else if ( mouse_released ) {
		
		mouse_hex      = _hex;
		mouse_inst     = _inst;
		mouse_d_pre_x  = noone;
		mouse_d_pre_y  = noone;
		mouse_d_x      = noone;
		mouse_d_y      = noone;
		mouse_released = false;
		
		if ( !mouse_moved ) {
			if ( mouse_inst != noone ) and ( mouse_inst != global.selected_inst ) {
				global.selected_inst = mouse_inst;
			} else {
				global.selected_inst = noone;
			}
		}
		
	}
	
}

if ( !mouse_collect ) {
	if ( point_distance( mouse_p_x, mouse_p_y, mouse_d_x, mouse_d_y ) > 10 ) mouse_moved = true;
}