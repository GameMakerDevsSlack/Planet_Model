if ( keyboard_check_pressed( ord( "1" ) ) ) {
	mode = world.triangles;
} else if ( keyboard_check_pressed( ord( "2" ) ) ) {
	mode = world.hexes;
} else if ( keyboard_check_pressed( ord( "3" ) ) ) {
	mode = world.tiles;
}