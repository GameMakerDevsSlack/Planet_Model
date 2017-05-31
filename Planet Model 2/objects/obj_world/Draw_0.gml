matrix_reset_world();
matrix_multiply_world( matrix );
matrix_multiply_world( matrix_build( 0, 0, 0,   0, 0, 0,   world_scale, world_scale, world_scale ) );
vertex_submit( vbf_tiles, pr_trianglelist, sprite_get_texture( spr_white, 0 ) );