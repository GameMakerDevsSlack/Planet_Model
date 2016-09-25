///scr_hex_add();
//Similar to add_face but draws much of its data from the configuration of faces - see create_hexes_from_faces()
//Note the use of nested lists to manage hex vertices and neighbours.

//Initialise the centre hex to 0,0,0
ds_list_add( lst_hex_x, 0 );
ds_list_add( lst_hex_y, 0 );
ds_list_add( lst_hex_z, 0 );

ds_list_add( lst_hex_radius, 0 );
ds_list_add( lst_hex_phi, 0 );
ds_list_add( lst_hex_theta, 0 );

ds_list_add( lst_hex_light_presin, 0 );
ds_list_add( lst_hex_light_precos, 0 );

ds_list_add( lst_hex_quat_a, 0 );
ds_list_add( lst_hex_quat_b, 0 );
ds_list_add( lst_hex_quat_c, 1 );
ds_list_add( lst_hex_quat_d, 0 );

ds_list_add( lst_hex_surface_x, k_skin_size - 1 );
ds_list_add( lst_hex_surface_y, k_skin_size - 1 );

//These lists will get fleshed out later
ds_list_add( lst_hex_list_vertex_x, ds_list_create() );
ds_list_add( lst_hex_list_vertex_y, ds_list_create() );
ds_list_add( lst_hex_list_vertex_z, ds_list_create() );
ds_list_add( hex_nested_neighbour_faces_list, ds_list_create() );
ds_list_add( lst_hex_list_adj, ds_list_create() );

//Scripts that use lst_hex_visited should reset the list to noone but just in case
ds_list_add( lst_hex_visited, noone );

return ds_list_size( lst_hex_x ) - 1;
