///scr_hex_init()
//If init_face_lists() starts the party, this script goes and buys the second round of drinks
//Should only be called once

//Real x,y,z coords for the centre of the hex - this is NOT on the sphere but a little below it. Calculated in calculate_hex_centres()
lst_hex_x = ds_list_create();
lst_hex_y = ds_list_create();
lst_hex_z = ds_list_create();

//As above but spherical coordinates for the centre of the hex. phi and theta are in radians, by the way
lst_hex_radius = ds_list_create();
lst_hex_phi = ds_list_create();
lst_hex_theta = ds_list_create();

//Precomputed trig values for the lighting calculations
lst_hex_light_presin = ds_list_create();
lst_hex_light_precos = ds_list_create();

//Precomputed quaternion rotation values
lst_hex_quat_a = ds_list_create();
lst_hex_quat_b = ds_list_create();
lst_hex_quat_c = ds_list_create();
lst_hex_quat_d = ds_list_create();

//Surface coordinate for use with skins
lst_hex_surface_x = ds_list_create();
lst_hex_surface_y = ds_list_create();

//Contains lists that enumerate vertices on the corner of each hex
lst_hex_list_vertex_x = ds_list_create();
lst_hex_list_vertex_y = ds_list_create();
lst_hex_list_vertex_z = ds_list_create();

//Contains lists that enumerate neighbours that are hexes
lst_hex_list_adj = ds_list_create();

//Used later for utility scripts
lst_hex_visited = ds_list_create();
