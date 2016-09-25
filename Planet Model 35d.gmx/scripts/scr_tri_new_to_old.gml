///scr_tri_new_to_old()
//Free up memory for more exciting things, like explosions

ds_list_destroy( lst_tri_a_x );
ds_list_destroy( lst_tri_a_y );
ds_list_destroy( lst_tri_a_z );

ds_list_destroy( lst_tri_b_x );
ds_list_destroy( lst_tri_b_y );
ds_list_destroy( lst_tri_b_z );

ds_list_destroy( lst_tri_c_x );
ds_list_destroy( lst_tri_c_y );
ds_list_destroy( lst_tri_c_z );

ds_list_destroy( lst_tri_a_adj );
ds_list_destroy( lst_tri_b_adj );
ds_list_destroy( lst_tri_c_adj );

ds_list_destroy( lst_tri_centre_x );
ds_list_destroy( lst_tri_centre_y );
ds_list_destroy( lst_tri_centre_z );

ds_list_destroy( lst_tri_a_child );
ds_list_destroy( lst_tri_b_child );
ds_list_destroy( lst_tri_c_child );
ds_list_destroy( lst_tri_parent );

ds_list_destroy( lst_tri_hex );

lst_tri_a_x = new_lst_tri_a_x;
lst_tri_a_y = new_lst_tri_a_y;
lst_tri_a_z = new_lst_tri_a_z;

lst_tri_b_x = new_lst_tri_b_x;
lst_tri_b_y = new_lst_tri_b_y;
lst_tri_b_z = new_lst_tri_b_z;

lst_tri_c_x = new_lst_tri_c_x;
lst_tri_c_y = new_lst_tri_c_y;
lst_tri_c_z = new_lst_tri_c_z;

lst_tri_a_adj = new_lst_tri_a_adj;
lst_tri_b_adj = new_lst_tri_b_adj;
lst_tri_c_adj = new_lst_tri_c_adj;

lst_tri_centre_x = new_lst_tri_centre_x;
lst_tri_centre_y = new_lst_tri_centre_y;
lst_tri_centre_z = new_lst_tri_centre_z;

lst_tri_a_child = new_lst_tri_a_child;
lst_tri_b_child = new_lst_tri_b_child;
lst_tri_c_child = new_lst_tri_c_child;
lst_tri_parent = new_lst_tri_parent;

lst_tri_hex = new_lst_tri_hex;
