///scr_model_add_hex_rim_texture()
//

var xx, yy, zz, j;

var model = argument0;
var index = argument1;
var b_scale = argument2;
var t_scale = argument3;
var colour = argument4;
var u = argument5;
var v = argument6;

if ( b_scale == 1 ) and ( t_scale == 1 ) exit;

var x_list = ds_list_find_value( lst_hex_list_vertex_x, index );
var y_list = ds_list_find_value( lst_hex_list_vertex_y, index );
var z_list = ds_list_find_value( lst_hex_list_vertex_z, index );

d3d_model_primitive_begin( model, pr_trianglestrip );
    
for( j = 0; j < ds_list_size( x_list ); j++ ) {
    
    xx = ds_list_find_value( x_list, j );
    yy = ds_list_find_value( y_list, j );
    zz = ds_list_find_value( z_list, j );
    
    d3d_model_vertex_texture_color( model,   xx * b_scale, yy * b_scale, zz * b_scale,  u, v,  colour, 1 );
    d3d_model_vertex_texture_color( model,   xx * t_scale, yy * t_scale, zz * t_scale,  u, v,  colour, 1 );
    
}
    
xx = ds_list_find_value( x_list, 0 );
yy = ds_list_find_value( y_list, 0 );
zz = ds_list_find_value( z_list, 0 );

d3d_model_vertex_texture_color( model,   xx * b_scale, yy * b_scale, zz * b_scale,  u, v,  colour, 1 );
d3d_model_vertex_texture_color( model,   xx * t_scale, yy * t_scale, zz * t_scale,  u, v,  colour, 1 );

d3d_model_primitive_end( model );
