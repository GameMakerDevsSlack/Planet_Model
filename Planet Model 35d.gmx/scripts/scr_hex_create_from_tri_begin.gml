///scr_hex_start_create_from_tris()
//Initialises all the required data structures for the script create_hex_from_face()
//These data structures should be deleted afterwards using finish_create_hex_from_face()

hex_nested_neighbour_faces_list = ds_list_create();
search_px_stack = ds_list_create();
search_py_stack = ds_list_create();
search_pz_stack = ds_list_create();
search_face_stack = ds_list_create();
fill_stack = ds_list_create();

//Add a vertex to the stack - start with vertex B because... reasons
ds_list_add( search_px_stack, ds_list_find_value( lst_tri_b_x, 0 ) );
ds_list_add( search_py_stack, ds_list_find_value( lst_tri_b_y, 0 ) );
ds_list_add( search_pz_stack, ds_list_find_value( lst_tri_b_z, 0 ) );
ds_list_add( search_face_stack, 0 );
