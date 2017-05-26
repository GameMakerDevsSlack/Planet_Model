matrix_set( matrix_world, matrix_build( 0, 200, 0,
                                        current_time/50, 0, 45,
										1, 1, 1 ) );
vertex_submit( vbf_triangles, pr_trianglelist, -1 );
matrix_set( matrix_world, global.matrix_identity );