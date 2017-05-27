//Perform finalising calculations

world_hex_assign_neighbours();

//Always free up memory!
ds_list_destroy( search_px_stack );
ds_list_destroy( search_py_stack );
ds_list_destroy( search_pz_stack );
ds_list_destroy( search_face_stack );
ds_list_destroy( fill_stack );
ds_list_destroy( hex_tri_cache );