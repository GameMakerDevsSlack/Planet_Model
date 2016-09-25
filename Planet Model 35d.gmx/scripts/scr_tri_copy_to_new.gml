///scr_tri_copy_to_new( tri )
//Free up memory for more exciting things, like explosions

var tri = argument0;

ds_list_add( new_lst_tri_a_x, ds_list_find_value( lst_tri_a_x, tri ) );
ds_list_add( new_lst_tri_a_y, ds_list_find_value( lst_tri_a_y, tri ) );
ds_list_add( new_lst_tri_a_z, ds_list_find_value( lst_tri_a_z, tri ) );

ds_list_add( new_lst_tri_b_x, ds_list_find_value( lst_tri_b_x, tri ) );
ds_list_add( new_lst_tri_b_y, ds_list_find_value( lst_tri_b_y, tri ) );
ds_list_add( new_lst_tri_b_z, ds_list_find_value( lst_tri_b_z, tri ) );

ds_list_add( new_lst_tri_c_x, ds_list_find_value( lst_tri_c_x, tri ) );
ds_list_add( new_lst_tri_c_y, ds_list_find_value( lst_tri_c_y, tri ) );
ds_list_add( new_lst_tri_c_z, ds_list_find_value( lst_tri_c_z, tri ) );

ds_list_add( new_lst_tri_a_adj, ds_list_find_value( lst_tri_a_adj, tri ) );
ds_list_add( new_lst_tri_b_adj, ds_list_find_value( lst_tri_b_adj, tri ) );
ds_list_add( new_lst_tri_c_adj, ds_list_find_value( lst_tri_c_adj, tri ) );

ds_list_add( new_lst_tri_centre_x, ds_list_find_value( lst_tri_centre_x, tri ) );
ds_list_add( new_lst_tri_centre_y, ds_list_find_value( lst_tri_centre_y, tri ) );
ds_list_add( new_lst_tri_centre_z, ds_list_find_value( lst_tri_centre_z, tri ) );

ds_list_add( new_lst_tri_a_child, ds_list_find_value( lst_tri_a_child, tri ) );
ds_list_add( new_lst_tri_b_child, ds_list_find_value( lst_tri_b_child, tri ) );
ds_list_add( new_lst_tri_c_child, ds_list_find_value( lst_tri_c_child, tri ) );
ds_list_add( new_lst_tri_parent, ds_list_find_value( lst_tri_parent, tri ) );

ds_list_add( new_lst_tri_hex, ds_list_find_value( lst_tri_hex, tri ) );
