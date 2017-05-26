//Perform finalising calculations

world_hex_remove_duplicate_vertices();
world_hex_set_centres();
world_hex_all_reorder_vertices();
world_hex_all_neighbours();

//Always free up memory!
ds_list_destroy( search_px_stack );
ds_list_destroy( search_py_stack );
ds_list_destroy( search_pz_stack );
ds_list_destroy( search_face_stack );
ds_list_destroy( fill_stack );

//As promised...
ds_list_destroy( hex_nested_neighbour_faces_list );