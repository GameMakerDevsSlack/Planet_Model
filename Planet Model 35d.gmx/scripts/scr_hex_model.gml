///scr_hex_model()
//
//Generates a model made from hexex, each randomly coloured. Mostly meant as a debug tool

var model, i, colour, centre_x, centre_y, centre_z, x_list, y_list, z_list, xx, yy, zz;

model = d3d_model_create();

for( i = 0; i < ds_list_size( lst_hex_x ); i++ ) {
    
    d3d_model_primitive_begin( model, pr_trianglefan );
    
    colour = make_colour_random();
    
    centre_x = ds_list_find_value( lst_hex_x, i );
    centre_y = ds_list_find_value( lst_hex_y, i );
    centre_z = ds_list_find_value( lst_hex_z, i );
    d3d_model_vertex_color( model,   centre_x, centre_y, centre_z,  colour, 1 );
    
    x_list = ds_list_find_value( lst_hex_list_vertex_x, i );
    y_list = ds_list_find_value( lst_hex_list_vertex_y, i );
    z_list = ds_list_find_value( lst_hex_list_vertex_z, i );
    
    for( j = 0; j < ds_list_size( x_list ); j++ ) {
        
        xx = ds_list_find_value( x_list, j );
        yy = ds_list_find_value( y_list, j );
        zz = ds_list_find_value( z_list, j );  
        d3d_model_vertex_color( model,   xx, yy, zz,  colour, 1 );
        
    }
    
    xx = ds_list_find_value( x_list, 0 );
    yy = ds_list_find_value( y_list, 0 );
    zz = ds_list_find_value( z_list, 0 );  
    d3d_model_vertex_color( model,   xx, yy, zz,  colour, 1 );
    
    d3d_model_primitive_end( model );
    
}

return model;
