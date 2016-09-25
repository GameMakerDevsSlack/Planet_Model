///scr_model_add_tree_trunk( model, trunk thickness, height, colour );
//
//Adds a tree trunk to a model using some hard-coded madness

var model, trunk_scale, height_scale, colour, vtx, u, v;

model = argument0
trunk_scale = argument1;
height_scale = argument2;
colour = argument3;
u = argument4;
v = argument5;

d3d_model_primitive_begin( model, pr_trianglestrip );

vtx = d3d_transform_vertex( -trunk_scale,            0,            0 ); d3d_model_vertex_texture_color( model, vtx[0], vtx[1], vtx[2],   u,v,  colour, 1 );
vtx = d3d_transform_vertex( -trunk_scale, height_scale,            0 ); d3d_model_vertex_texture_color( model, vtx[0], vtx[1], vtx[2],   u,v,  colour, 1 );
vtx = d3d_transform_vertex(            0,            0, -trunk_scale ); d3d_model_vertex_texture_color( model, vtx[0], vtx[1], vtx[2],   u,v,  colour, 1 );
vtx = d3d_transform_vertex(            0, height_scale, -trunk_scale ); d3d_model_vertex_texture_color( model, vtx[0], vtx[1], vtx[2],   u,v,  colour, 1 );
vtx = d3d_transform_vertex(  trunk_scale,            0,            0 ); d3d_model_vertex_texture_color( model, vtx[0], vtx[1], vtx[2],   u,v,  colour, 1 );
vtx = d3d_transform_vertex(  trunk_scale, height_scale,            0 ); d3d_model_vertex_texture_color( model, vtx[0], vtx[1], vtx[2],   u,v,  colour, 1 );
vtx = d3d_transform_vertex(            0,            0,  trunk_scale ); d3d_model_vertex_texture_color( model, vtx[0], vtx[1], vtx[2],   u,v,  colour, 1 );
vtx = d3d_transform_vertex(            0, height_scale,  trunk_scale ); d3d_model_vertex_texture_color( model, vtx[0], vtx[1], vtx[2],   u,v,  colour, 1 );
vtx = d3d_transform_vertex( -trunk_scale,            0,            0 ); d3d_model_vertex_texture_color( model, vtx[0], vtx[1], vtx[2],   u,v,  colour, 1 );
vtx = d3d_transform_vertex( -trunk_scale, height_scale,            0 ); d3d_model_vertex_texture_color( model, vtx[0], vtx[1], vtx[2],   u,v,  colour, 1 );

d3d_model_primitive_end( model );
