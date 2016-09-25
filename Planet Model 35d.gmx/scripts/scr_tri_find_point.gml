///scr_is_point_on_face( x, y, z, face index )
//
//Returns false if (x,y,z) is not a vertex of the triangle
//Returns 1, 2 or 3 corresponding to ABC on a triangle if (x,y,z) is found to be a vertex

var xx, yy, zz, current;
var ax, ay, az;
var bx, by, bz;
var cx, cy, cz;

xx = argument0;
yy = argument1;
zz = argument2;
current = argument3;

ax = ds_list_find_value( lst_tri_a_x, current );
ay = ds_list_find_value( lst_tri_a_y, current );
az = ds_list_find_value( lst_tri_a_z, current );

bx = ds_list_find_value( lst_tri_b_x, current );
by = ds_list_find_value( lst_tri_b_y, current );
bz = ds_list_find_value( lst_tri_b_z, current );

cx = ds_list_find_value( lst_tri_c_x, current );
cy = ds_list_find_value( lst_tri_c_y, current );
cz = ds_list_find_value( lst_tri_c_z, current );


if ( scr_compare_3d_points( xx, yy, zz,   ax, ay, az ) ) return 1 else
if ( scr_compare_3d_points( xx, yy, zz,   bx, by, bz ) ) return 2 else
if ( scr_compare_3d_points( xx, yy, zz,   cx, cy, cz ) ) return 3 else return false;
