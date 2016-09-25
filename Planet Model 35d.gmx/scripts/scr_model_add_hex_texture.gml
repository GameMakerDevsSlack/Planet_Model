///scr_model_add_hex_texture( model, hex, scale, colour, u, v )

var xx, yy, zz, j;

var model = argument0;
var index = argument1;
var scale = argument2;
var colour = argument3;
var u = argument4;
var v = argument5;

var x_list = ds_list_find_value( lst_hex_list_vertex_x, index );
var y_list = ds_list_find_value( lst_hex_list_vertex_y, index );
var z_list = ds_list_find_value( lst_hex_list_vertex_z, index );

d3d_model_primitive_begin( model, pr_trianglefan );

xx = ds_list_find_value( lst_hex_x, index ) * scale;
yy = ds_list_find_value( lst_hex_y, index ) * scale;
zz = ds_list_find_value( lst_hex_z, index ) * scale;

d3d_model_vertex_texture_color( model,   xx, yy, zz,  u, v,  colour, 1 );

for( j = ds_list_size( x_list ) - 1; j >= 0 ; j-- ) {
            
    xx = ds_list_find_value( x_list, j );
    yy = ds_list_find_value( y_list, j );
    zz = ds_list_find_value( z_list, j );
    
    xx *= scale;
    yy *= scale;
    zz *= scale;
    
    d3d_model_vertex_texture_color( model,   xx, yy, zz,  u, v,  colour, 1 );
    
}
    
j = ds_list_size( x_list ) - 1;

xx = ds_list_find_value( x_list, j );
yy = ds_list_find_value( y_list, j );
zz = ds_list_find_value( z_list, j );
    
xx *= scale;
yy *= scale;
zz *= scale;

d3d_model_vertex_texture_color( model,   xx, yy, zz,  u, v,  colour, 1 );
    
d3d_model_primitive_end( model );
