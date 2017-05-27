matrix_set( matrix_world, matrix_build( 0, 0, 0,
                                        90, current_time/70, 0,
										300, 300, 300 ) );
vertex_submit( vbf_hexes, pr_trianglelist, sprite_get_texture( spr_white, 0 ) );
matrix_set( matrix_world, global.matrix_identity );