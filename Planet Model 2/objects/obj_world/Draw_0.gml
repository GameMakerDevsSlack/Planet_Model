var _matrix = quaternion_matrix( quaternion );

matrix_reset_world();
matrix_multiply_world( _matrix );
matrix_multiply_world( matrix_build( 0, 0, 0,   0, 0, 0,   300, 300, 300 ) );

switch( mode ) {
	case world.triangles: vertex_submit( vbf_triangles, pr_trianglelist, sprite_get_texture( spr_white, 0 ) ); break;
	case world.hexes: vertex_submit( vbf_hexes, pr_trianglelist, sprite_get_texture( spr_white, 0 ) ); break;
	case world.tiles: vertex_submit( vbf_tiles, pr_trianglelist, sprite_get_texture( spr_white, 0 ) ); break;
}
/*
for( var _i = 0; _i < world_hex_grid_count; _i++ ) {
	
	var _height = world_hex_grid[# _i, world_hex.test ];
	if ( ( _height == 0.2 ) or ( _height == 0.4 ) ) and ( world_hex_grid[# _i, world_hex.tree ] ) {
		
		var _theta = abs( 90 - world_hex_grid[# _i, world_hex.theta ] );
		if ( _theta < 18 ) {
			var _model = global.model_palm;
		} else if ( _theta < 50 ) {
			var _model = global.model_deciduous;
		} else {
			var _model = global.model_conifer;
		}
		
		matrix_reset_world();
		matrix_multiply_world( matrix_build( 0, 300*0.12*_height, 0,   0, world_hex_grid[# _i, world_hex.rotation ], 0,   1, 1, 1 ) );
		matrix_multiply_world( matrix_build( 0, 0, 0,   0, 0, world_hex_grid[# _i, world_hex.theta ],   1, 1, 1 ) );
		matrix_multiply_world( matrix_build( 300*world_hex_grid[# _i, world_hex.x ],
		                                     300*world_hex_grid[# _i, world_hex.y ],
											 300*world_hex_grid[# _i, world_hex.z ],
		                                     0, world_hex_grid[# _i, world_hex.phi ], 0,   1, 1, 1 ) );
		matrix_multiply_world( _matrix );
		vertex_submit( _model, pr_trianglelist, sprite_get_texture( spr_white, 0 ) );
		matrix_reset_world();
	
	}
	
}
*/