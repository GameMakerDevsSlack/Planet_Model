matrix_set( matrix_world, matrix_build( 0, 0, 0,
                                        current_time/15, 0, 0,
										50, 50, 50 ) );
vertex_submit( vbf_triangles, pr_trianglelist, -1 );
matrix_set( matrix_world, global.matrix_identity );