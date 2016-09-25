///scr_tri_show_message( triangle, header )

var str, tri;

tri = argument0;
str = argument1 + "#";

str += "tri " + string( tri ) + ", sub " + string( subdivision_count ) + ":##";

str += string( ds_list_find_value( lst_tri_a_x, tri ) ) + ", " + string( ds_list_find_value( lst_tri_a_y, tri ) ) + ", " + string( ds_list_find_value( lst_tri_a_z, tri ) ) + "#";
str += string( ds_list_find_value( lst_tri_b_x, tri ) ) + ", " + string( ds_list_find_value( lst_tri_b_y, tri ) ) + ", " + string( ds_list_find_value( lst_tri_b_z, tri ) ) + "#";
str += string( ds_list_find_value( lst_tri_c_x, tri ) ) + ", " + string( ds_list_find_value( lst_tri_c_y, tri ) ) + ", " + string( ds_list_find_value( lst_tri_c_z, tri ) ) + "##";

str += string( ds_list_find_value( lst_tri_centre_x, tri ) ) + ", " + string( ds_list_find_value( lst_tri_centre_y, tri ) ) + ", " + string( ds_list_find_value( lst_tri_centre_z, tri ) ) + "##";

str += string( ds_list_find_value( lst_tri_a_child, tri ) ) + ", " + string( ds_list_find_value( lst_tri_b_child, tri ) ) + ", " + string( ds_list_find_value( lst_tri_c_child, tri ) ) + "#";

show_message( str );

/*

lst_tri_parent = ds_list_create();

lst_tri_hex = ds_list_create();

*/
