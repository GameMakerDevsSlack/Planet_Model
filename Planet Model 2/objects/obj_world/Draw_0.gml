matrix_reset_world();
matrix_multiply_world( matrix );
matrix_multiply_world( matrix_build( 0, 0, 0,   0, 0, 0,   world_scale, world_scale, world_scale ) );

switch( mode ) {
	case world.triangles: vertex_submit( vbf_triangles, pr_trianglelist, sprite_get_texture( spr_white, 0 ) ); break;
	case world.hexes: vertex_submit( vbf_hexes, pr_trianglelist, sprite_get_texture( spr_white, 0 ) ); break;
	case world.tiles: vertex_submit( vbf_tiles, pr_trianglelist, sprite_get_texture( spr_white, 0 ) ); break;
}