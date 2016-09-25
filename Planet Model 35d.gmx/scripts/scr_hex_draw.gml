var index = argument0;
var colour = argument1;
var alpha = argument2;

var temp_scale = ds_list_find_value( world_relief_list, ds_list_find_value( lst_terrain_height, index ) * 5 );
var toe_in = ds_list_find_value( world_toe_in_list, ds_list_find_value( lst_terrain_height, index ) * 5 );

var centre_x = ds_list_find_value( lst_hex_x, index );
var centre_y = ds_list_find_value( lst_hex_y, index );
var centre_z = ds_list_find_value( lst_hex_z, index );

var x_list = ds_list_find_value( lst_hex_list_vertex_x, index );
var y_list = ds_list_find_value( lst_hex_list_vertex_y, index );
var z_list = ds_list_find_value( lst_hex_list_vertex_z, index );

var xx, yy, zz, j;

d3d_primitive_begin( pr_trianglefan );

d3d_vertex_color( centre_x * temp_scale, centre_y * temp_scale, centre_z * temp_scale,  colour, alpha );

for( j = ds_list_size( x_list ) - 1; j >= 0 ; j-- ) {
            
    xx = ds_list_find_value( x_list, j );
    yy = ds_list_find_value( y_list, j );
    zz = ds_list_find_value( z_list, j ); 
    
    xx = lerp( xx, centre_x, toe_in );
    yy = lerp( yy, centre_y, toe_in );
    zz = lerp( zz, centre_z, toe_in );
    
    d3d_vertex_color( xx * temp_scale, yy * temp_scale, zz * temp_scale,  colour, alpha );
    
}
    
j = ds_list_size( x_list ) - 1;

xx = ds_list_find_value( x_list, j );
yy = ds_list_find_value( y_list, j );
zz = ds_list_find_value( z_list, j );  
    
xx = lerp( xx, centre_x, toe_in );
yy = lerp( yy, centre_y, toe_in );
zz = lerp( zz, centre_z, toe_in );

d3d_vertex_color( xx * temp_scale, yy * temp_scale, zz * temp_scale,  colour, alpha );
    
d3d_primitive_end();
