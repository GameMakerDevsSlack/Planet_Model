///scr_tri_destroy()
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
