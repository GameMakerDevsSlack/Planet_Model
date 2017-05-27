matrix_set( matrix_world, matrix_build( 0, 0, 0,
                                        current_time/37, current_time/79, 0,
										300, 300, 300 ) );

switch( mode ) {
	case world.triangles: vertex_submit( vbf_triangles, pr_trianglelist, sprite_get_texture( spr_white, 0 ) ); break;
	case world.hexes: vertex_submit( vbf_hexes, pr_trianglelist, sprite_get_texture( spr_white, 0 ) ); break;
	case world.tiles: vertex_submit( vbf_tiles, pr_trianglelist, sprite_get_texture( spr_white, 0 ) ); break;
}

matrix_set( matrix_world, global.matrix_identity );