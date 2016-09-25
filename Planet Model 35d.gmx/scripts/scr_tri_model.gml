///scr_tri_model()
//Returns a brightly coloured 3D model of the triangular structure
//Pretty simple script. All the clever stuff happens elsewhere, truth be told

var model, i, colour
var ax, ay, az;
var bx, by, bz;
var cx, cy, cz;

model = d3d_model_create();

d3d_model_primitive_begin( model, pr_trianglelist );

for( i = 0; i < ds_list_size( lst_tri_a_x ); i++ ) {
    
    colour = make_colour_random();
    
    ax = ds_list_find_value( lst_tri_a_x, i );
    ay = ds_list_find_value( lst_tri_a_y, i );
    az = ds_list_find_value( lst_tri_a_z, i );
    
    bx = ds_list_find_value( lst_tri_b_x, i );
    by = ds_list_find_value( lst_tri_b_y, i );
    bz = ds_list_find_value( lst_tri_b_z, i );
    
    cx = ds_list_find_value( lst_tri_c_x, i );
    cy = ds_list_find_value( lst_tri_c_y, i );
    cz = ds_list_find_value( lst_tri_c_z, i );
    
    d3d_model_vertex_color( model,   ax, ay, az,  colour, 1 );
    d3d_model_vertex_color( model,   bx, by, bz,  colour, 1 );
    d3d_model_vertex_color( model,   cx, cy, cz,  colour, 1 );
}

d3d_model_primitive_end( model );

return model;
