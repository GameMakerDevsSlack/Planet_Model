shader_reset();

matrix_set( matrix_world, global.matrix_identity );
matrix_set( matrix_view, old_view_matrix );
matrix_set( matrix_projection, old_proj_matrix );