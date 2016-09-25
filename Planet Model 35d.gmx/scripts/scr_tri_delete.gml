///tri_delete( face index )
//Removes data from lists created by init_face_lists(). Handy for keeping ontop of data management

ds_list_delete( lst_tri_a_x, argument0 );
ds_list_delete( lst_tri_a_y, argument0 );
ds_list_delete( lst_tri_a_z, argument0 );

ds_list_delete( lst_tri_b_x, argument0 );
ds_list_delete( lst_tri_b_y, argument0 );
ds_list_delete( lst_tri_b_z, argument0 );

ds_list_delete( lst_tri_c_x, argument0 );
ds_list_delete( lst_tri_c_y, argument0 );
ds_list_delete( lst_tri_c_z, argument0 );

ds_list_delete( lst_tri_centre_x, argument0 );
ds_list_delete( lst_tri_centre_y, argument0 );
ds_list_delete( lst_tri_centre_z, argument0 );

ds_list_delete( lst_tri_a_adj, argument0 );
ds_list_delete( lst_tri_b_adj, argument0 );
ds_list_delete( lst_tri_c_adj, argument0 );

ds_list_delete( lst_tri_a_child, argument0 );
ds_list_delete( lst_tri_b_child, argument0 );
ds_list_delete( lst_tri_c_child, argument0 );
ds_list_delete( lst_tri_parent, argument0 );

ds_list_delete( lst_tri_hex, argument0 );
