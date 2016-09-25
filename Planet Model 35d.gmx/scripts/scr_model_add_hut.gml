///scr_model_add_hut( model, thickness, height, colour, u, v )
//

var model, trunk_scale, height_scale, colour, dark_colour, j, xx, yy, vtx;

model = argument0;
trunk_scale = argument1;
height_scale = argument2;
colour = argument3;
dark_colour = argument4;
u = argument5;
v = argument6;

d3d_model_primitive_begin( model, pr_trianglestrip );

for( j = 0; j <= 7; j++ ) {
    
    xx = lengthdir_x( trunk_scale * 0.8, j * 51.43 );
    yy = lengthdir_y( trunk_scale * 0.8, j * 51.43 );
    
    vtx = d3d_transform_vertex( xx, height_scale/3, yy ); d3d_model_vertex_texture_color( model, vtx[0], vtx[1], vtx[2],   u,v,  dark_colour, 1 );
    vtx = d3d_transform_vertex( xx,              0, yy ); d3d_model_vertex_texture_color( model, vtx[0], vtx[1], vtx[2],   u,v,  dark_colour, 1 );
    
}

d3d_model_primitive_end( model );

d3d_model_primitive_begin( model, pr_trianglestrip );

for( j = 0; j <= 7; j++ ) {
    
    xx = lengthdir_x( trunk_scale, j * 51.43 );
    yy = lengthdir_y( trunk_scale, j * 51.43 );
    
    vtx = d3d_transform_vertex(  0,   height_scale,  0 ); d3d_model_vertex_texture_color( model, vtx[0], vtx[1], vtx[2],   u,v,  colour, 1 );
    vtx = d3d_transform_vertex( xx, height_scale/3, yy ); d3d_model_vertex_texture_color( model, vtx[0], vtx[1], vtx[2],   u,v,  colour, 1 );
    
}

d3d_model_primitive_end( model );

return model;
