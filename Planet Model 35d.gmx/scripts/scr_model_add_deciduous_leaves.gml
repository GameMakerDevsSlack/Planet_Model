///scr_model_add_deciduous_leaves()
//

var model, trunk_scale, height_scale, height_offset, colour, dark_colour, vtx, i, dir, xx, yy, u, v;

model = argument0
trunk_scale = argument1;
height_scale = argument2;
height_offset = argument3;
colour = argument4;
dark_colour = argument5;
u = argument6;
v = argument7;

height_scale *= 0.5;

d3d_model_primitive_begin( model, pr_trianglefan );

vtx = d3d_transform_vertex( 0, height_offset/2, 0 ); d3d_model_vertex_texture_color( model, vtx[0], vtx[1], vtx[2],   u,v,  dark_colour, 1 );

for( i = 5; i >= 0; i-- ) {
    
    dir = i * 72;
    xx = lengthdir_x( trunk_scale, dir );
    yy = lengthdir_y( trunk_scale, dir );
    
    vtx = d3d_transform_vertex( xx, height_offset + height_scale, yy ); d3d_model_vertex_texture_color( model, vtx[0], vtx[1], vtx[2],   u,v,  dark_colour, 1 );
    
}

d3d_model_primitive_end( model );

d3d_model_primitive_begin( model, pr_trianglefan );

vtx = d3d_transform_vertex( 0, height_offset + height_scale*2, 0 ); d3d_model_vertex_texture_color( model, vtx[0], vtx[1], vtx[2],   u,v,  colour, 1 );

for( i = 0; i <= 5; i++ ) {
    
    dir = i * 72;
    xx = lengthdir_x( trunk_scale, dir );
    yy = lengthdir_y( trunk_scale, dir );
    
    vtx = d3d_transform_vertex( xx, height_offset + height_scale, yy ); d3d_model_vertex_texture_color( model, vtx[0], vtx[1], vtx[2],   u,v,  colour, 1 );
    
}

d3d_model_primitive_end( model );
