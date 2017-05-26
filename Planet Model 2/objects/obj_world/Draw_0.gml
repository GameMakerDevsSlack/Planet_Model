matrix_set( matrix_world, matrix_build( 0, 0, 0,
                                        current_time/10, 0, 0,
										1, 1, 1 ) );
vertex_submit( vbf_triangles, pr_trianglelist, sprite_get_texture( spr_white, 0 ) );
matrix_set( matrix_world, global.matrix_identity );