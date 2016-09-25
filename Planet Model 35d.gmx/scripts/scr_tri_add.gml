///scr_tri_add( x1, y1, z1, x2, y2, z2, x3, y3, z3, colour, parent )
//Returns the index of the newly added face
//Does what it says on the tin, really

//Vertex A
ds_list_add( lst_tri_a_x, argument0 );
ds_list_add( lst_tri_a_y, argument1 );
ds_list_add( lst_tri_a_z, argument2 );

//Vertex B
ds_list_add( lst_tri_b_x, argument3 );
ds_list_add( lst_tri_b_y, argument4 );
ds_list_add( lst_tri_b_z, argument5 );

//Vertex C
ds_list_add( lst_tri_c_x, argument6 );
ds_list_add( lst_tri_c_y, argument7 );
ds_list_add( lst_tri_c_z, argument8 );

//The calculation for the centre coordinates actually puts the face inside the sphere but we can fix that later and it's faster this way
ds_list_add( lst_tri_centre_x, mean( argument0, argument3, argument6 ) );
ds_list_add( lst_tri_centre_y, mean( argument1, argument4, argument7 ) );
ds_list_add( lst_tri_centre_z, mean( argument2, argument5, argument8 ) );

//Side A is given by A -> B
ds_list_add( lst_tri_a_adj, noone );

//Side B is given by B -> C
ds_list_add( lst_tri_b_adj, noone );

//Side C is given by C -> A
ds_list_add( lst_tri_c_adj, noone );

//Creating a record of children and parents created during by subdivision lets assign_face_neighbours() work
ds_list_add( lst_tri_a_child, noone );
ds_list_add( lst_tri_b_child, noone );
ds_list_add( lst_tri_c_child, noone );
ds_list_add( lst_tri_parent, argument9 );

//What hex this face belongs to
ds_list_add( lst_tri_hex, noone );

//Return the index
return ds_list_size( lst_tri_a_x ) - 1;
