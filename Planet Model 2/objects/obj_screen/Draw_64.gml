if ( do_debug ) {
	
	var _str = string( fps ) + " | " + string( floor( fps_real ) );
	_str += "\n" + string( obj_world.world_subdivisions ) + " subdivisions";
	_str += "\n" + string( obj_world.world_max_triangles ) + " triangles";
	_str += "\n" + string( obj_world.world_max_hexes ) + " hexes";
	_str += "\n\nWASDQERF = rotate";
	_str += "\n\n1 = show triangles";
	_str += "\n2 = show hexes";
	_str += "\n3 = show tiles";
	_str += "\n\n7 = toggle lighting";
	_str += "\n8 = toggle projection";
	_str += "\n9 = toggle FXAA";
	_str += "\n0 = toggle debug";
	
	_str += "\n";
	if ( do_lighting ) _str += "\nLighting";
	if ( do_ortho    ) _str += "\nOrthographic";
	if ( do_fxaa     ) _str += "\nFXAA";
	
	draw_set_colour( c_white );
	draw_set_font( fnt_default );
	draw_text( 5, 5,  _str );
	
}