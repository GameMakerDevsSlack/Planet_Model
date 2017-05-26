hex_nested_neighbour_faces_list = ds_list_create();
search_px_stack   = ds_list_create();
search_py_stack   = ds_list_create();
search_pz_stack   = ds_list_create();
search_face_stack = ds_list_create();
fill_stack        = ds_list_create();

//Add a vertex to the stack - start with vertex B because... reasons
ds_list_add( search_px_stack, world_tri_grid_a[# 0, world_tri.b_x ] );
ds_list_add( search_py_stack, world_tri_grid_a[# 0, world_tri.b_y ] );
ds_list_add( search_pz_stack, world_tri_grid_a[# 0, world_tri.b_z ] );
ds_list_add( search_face_stack, 0 );