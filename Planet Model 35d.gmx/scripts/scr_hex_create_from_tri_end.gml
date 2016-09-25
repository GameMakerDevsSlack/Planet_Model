///scr_hex_end_create_from_tri()
//Crucial processing step that tidies up the mess that create_hex_from_faces leaves

//Perform finalising calculations
scr_hex_all_remove_duplicate_vertices();
scr_hex_all_set_centres();
scr_hex_all_reorder_vertices();
scr_hex_all_set_neighbours();

//Always free up memory!
ds_list_destroy( search_px_stack );
ds_list_destroy( search_py_stack );
ds_list_destroy( search_pz_stack );
ds_list_destroy( search_face_stack );
ds_list_destroy( fill_stack );

//As promised...
repeat( ds_list_size( hex_nested_neighbour_faces_list ) ) ds_list_destroy( ds_list_find_value( hex_nested_neighbour_faces_list, 0 ) );
ds_list_destroy( hex_nested_neighbour_faces_list );
