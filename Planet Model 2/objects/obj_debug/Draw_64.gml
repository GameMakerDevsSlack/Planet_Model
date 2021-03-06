if ( do_debug ) {
	
	if ( !global.on_mobile ) {
		
		var _str = "(c) 2017 Juju Adams + Chris Anselmo";
		_str += "\n\n" + string( obj_world.world_subdivisions ) + " subdivisions";
		_str += "\n" + string( obj_world.world_max_triangles ) + " triangles";
		_str += "\n" + string( obj_world.world_max_hexes ) + " hexes";
		//_str += "\n\nWASDQERF = rotate";
		_str += "\n\n8 = toggle lighting";
		_str += "\n9 = toggle FXAA";
		_str += "\n0 = toggle debug";
		/*
		_str += "\n\nmouse_hex=" + string( obj_screen.mouse_p_hex );
		_str += "\nmouse_instance=" + string( obj_screen.mouse_p_inst );
		if ( instance_exists( obj_screen.mouse_p_inst ) ) {
			_str += "\ninstance hex=" + string( (obj_screen.mouse_p_inst).hex_a );
		} else {
			_str += "\n(no instance)";
		}
		with( obj_screen ) _str += "\nmouse=" + string( mouse_d_x - mouse_d_pre_x ) + "," + string( mouse_d_y - mouse_d_pre_y );
		*/
		_str += "\n";
		if ( global.do_lighting ) _str += "\nLighting";
		if ( global.do_fxaa     ) _str	+= "\nFXAA";
		
		draw_set_colour( c_white );
		draw_set_font( fnt_default );
		draw_text( 5, 5,  _str );
		
		var _cx = display_get_gui_width() div 2;
		draw_set_colour( c_black );
		draw_set_alpha( 0.3 );
		draw_rectangle( _cx-100, 10, _cx+100, 110, false );
		draw_set_alpha( 1 );
	
		draw_set_color( c_gray );
		var _size = ds_list_size( lst_frame_time );
		for( var _i = 0; _i < _size; _i++ ) {
			draw_point( _cx-100 + 2*_i, 10 + 100 - 100*lst_frame_time[| _i ]/target_frame_time );
			draw_point( _cx- 99 + 2*_i, 10 + 100 - 100*lst_frame_time[| _i ]/target_frame_time );
		}
	
		draw_set_color( c_white );
		var _size = ds_list_size( lst_smoothed_timer );
		for( var _i = 0; _i < _size; _i++ ) {
			draw_point( _cx-100 + 2*_i, 10 + 100 - 100*lst_smoothed_timer[| _i ]/target_frame_time );
			draw_point( _cx- 99 + 2*_i, 10 + 100 - 100*lst_smoothed_timer[| _i ]/target_frame_time );
		}
		
		var _str = string( fps ) + " | " + string( floor( fps_real ) );
		draw_set_alpha( 1 );
		draw_set_halign( fa_center );
		draw_set_color( c_black );
		draw_text( _cx+1, 121, _str );
		draw_set_color( c_white );
		draw_text( _cx, 120, _str );
		draw_set_halign( fa_left );
		
	} else {
		
		var _str = "(c) 2017 Juju Adams + Chris Anselmo";
		
		draw_set_colour( c_white );
		draw_set_font( fnt_default );
		
		draw_set_colour( c_white );
		draw_set_font( fnt_default );
		draw_text( 5, 5,  _str );
		
		var _cx = display_get_gui_width() div 2;
		var _str = string( fps ) + " | " + string( floor( fps_real ) );
		draw_set_alpha( 1 );
		draw_set_halign( fa_center );
		draw_set_color( c_black );
		draw_text( _cx+1, 21, _str );
		draw_set_color( c_white );
		draw_text( _cx, 20, _str );
		draw_set_halign( fa_left );
		
	}
	
}