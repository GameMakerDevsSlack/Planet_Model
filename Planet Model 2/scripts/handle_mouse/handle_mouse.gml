if ( mouse_check_button_pressed( mb_left ) ) mouse_pressed = true;
if ( mouse_check_button_released( mb_left ) ) mouse_released = true;
mouse_down = mouse_check_button( mb_left );

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

	var _hex  = noone;
	var _inst = noone;

	if ( surface_exists( srf_mouse ) ) {
		
		if ( os_browser == browser_not_a_browser ) {
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
			
		mouse_p_hex  = _hex;
		mouse_p_inst = _inst;
		mouse_d_pre_x = mouse_get_x();
		mouse_d_pre_y = mouse_get_y();
		mouse_d_x = mouse_d_pre_x;
		mouse_d_y = mouse_d_pre_y;
		mouse_pressed = false;
			
	} else if ( mouse_released ) {
			
		mouse_r_hex  = _hex;
		mouse_r_inst = _inst;
		mouse_d_pre_x = noone;
		mouse_d_pre_y = noone;
		mouse_d_x = noone;
		mouse_d_y = noone;
		mouse_released = false;
			
	}
	
	mouse_sample = false;
	
}