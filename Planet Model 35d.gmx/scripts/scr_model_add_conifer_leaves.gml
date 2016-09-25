///scr_model_add_conifer_leaves()

var model, trunk_scale, height_scale, height_offset, colour, dark_colour, vtx, u, v;

model = argument0
trunk_scale = argument1;
height_scale = argument2;
height_offset = argument3;
colour = argument4;
dark_colour = argument5;
u = argument6;
v = argument7;

height_scale *= 0.666;

d3d_model_primitive_begin( model, pr_trianglefan );

vtx = d3d_transform_vertex(            0, height_scale + height_offset,            0 ); d3d_model_vertex_texture_color( model, vtx[0], vtx[1], vtx[2],   u,v,  dark_colour, 1 );
vtx = d3d_transform_vertex( -trunk_scale,                height_offset,            0 ); d3d_model_vertex_texture_color( model, vtx[0], vtx[1], vtx[2],   u,v,  dark_colour, 1 );
vtx = d3d_transform_vertex(            0,                height_offset,  trunk_scale ); d3d_model_vertex_texture_color( model, vtx[0], vtx[1], vtx[2],   u,v,  dark_colour, 1 );
vtx = d3d_transform_vertex(  trunk_scale,                height_offset,            0 ); d3d_model_vertex_texture_color( model, vtx[0], vtx[1], vtx[2],   u,v,  dark_colour, 1 );
vtx = d3d_transform_vertex(            0,                height_offset, -trunk_scale ); d3d_model_vertex_texture_color( model, vtx[0], vtx[1], vtx[2],   u,v,  dark_colour, 1 );
vtx = d3d_transform_vertex( -trunk_scale,                height_offset,            0 ); d3d_model_vertex_texture_color( model, vtx[0], vtx[1], vtx[2],   u,v,  dark_colour, 1 );

d3d_model_primitive_end( model );

height_offset += height_scale/2;
trunk_scale *= 0.7;

d3d_model_primitive_begin( model, pr_trianglefan );

vtx = d3d_transform_vertex(            0, height_scale + height_offset,            0 ); d3d_model_vertex_texture_color( model, vtx[0], vtx[1], vtx[2],   u,v,  colour, 1 );
vtx = d3d_transform_vertex( -trunk_scale,                height_offset,            0 ); d3d_model_vertex_texture_color( model, vtx[0], vtx[1], vtx[2],   u,v,  colour, 1 );
vtx = d3d_transform_vertex(            0,                height_offset,  trunk_scale ); d3d_model_vertex_texture_color( model, vtx[0], vtx[1], vtx[2],   u,v,  colour, 1 );
vtx = d3d_transform_vertex(  trunk_scale,                height_offset,            0 ); d3d_model_vertex_texture_color( model, vtx[0], vtx[1], vtx[2],   u,v,  colour, 1 );
vtx = d3d_transform_vertex(            0,                height_offset, -trunk_scale ); d3d_model_vertex_texture_color( model, vtx[0], vtx[1], vtx[2],   u,v,  colour, 1 );
vtx = d3d_transform_vertex( -trunk_scale,                height_offset,            0 ); d3d_model_vertex_texture_color( model, vtx[0], vtx[1], vtx[2],   u,v,  colour, 1 );

d3d_model_primitive_end( model );
