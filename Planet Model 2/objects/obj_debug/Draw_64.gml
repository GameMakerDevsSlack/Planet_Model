if ( do_debug ) {
	
	var _str = string( obj_world.world_subdivisions ) + " subdivisions";
	_str += "\n" + string( obj_world.world_max_triangles ) + " triangles";
	_str += "\n" + string( obj_world.world_max_hexes ) + " hexes";
	_str += "\n\nWASDQERF = rotate";
	_str += "\n\n7 = toggle lighting";
	_str += "\n8 = toggle relief";
	_str += "\n9 = toggle FXAA";
	_str += "\n0 = toggle debug";
	
	_str += "\n\nclick_hex=" + string( obj_screen.click_hex );
	_str += "\nclick_instance=" + string( obj_screen.click_instance );
	if ( instance_exists( obj_screen.click_instance ) ) {
		_str += "\ninstance hex=" + string( (obj_screen.click_instance).hex_a );
	} else {
		_str += "\n(no instance)";
	}
	
	_str += "\n";
	if ( obj_screen.do_lighting ) _str += "\nLighting";
	if ( obj_screen.do_fxaa     ) _str += "\nFXAA";
	
	draw_set_colour( c_white );
	draw_set_font( fnt_default );
	draw_text( 5, 5,  _str );
	
	draw_set_colour( c_black );
	draw_set_alpha( 0.3 );
	draw_rectangle( 540, 10, 740, 110, false );
	draw_set_alpha( 1 );
	
	draw_set_color( c_gray );
	var _size = ds_list_size( lst_frame_time );
	for( var _i = 0; _i < _size; _i++ ) {
		draw_point( 540 + 2*_i, 10 + 100 - 100*lst_frame_time[| _i ]/target_frame_time );
		draw_point( 541 + 2*_i, 10 + 100 - 100*lst_frame_time[| _i ]/target_frame_time );
	}
	
	draw_set_color( c_white );
	var _size = ds_list_size( lst_smoothed_timer );
	for( var _i = 0; _i < _size; _i++ ) {
		draw_point( 540 + 2*_i, 10 + 100 - 100*lst_smoothed_timer[| _i ]/target_frame_time );
		draw_point( 541 + 2*_i, 10 + 100 - 100*lst_smoothed_timer[| _i ]/target_frame_time );
	}
	
	var _str = string( fps ) + " | " + string( floor( fps_real ) );
	draw_set_alpha( 1 );
	draw_set_halign( fa_center );
	draw_set_color( c_black );
	draw_text( 641, 121, _str );
	draw_set_color( c_white );
	draw_text( 640, 120, _str );
	draw_set_halign( fa_left );

}