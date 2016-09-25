///scr_model_add_palm_leaves()
//

var model, trunk_scale, height_scale, height_offset, colour, dark_colour, vtx, sq_rt, u, v;

model = argument0
trunk_scale = argument1;
height_scale = argument2;
height_offset = argument3;
colour = argument4;
dark_colour = argument5;
u = argument6;
v = argument7;

sq_rt = sqrt( trunk_scale );

height_scale *= 0.5;

d3d_model_primitive_begin( model, pr_trianglestrip );

vtx = d3d_transform_vertex(               0,                height_offset,                0 ); d3d_model_vertex_texture_color( model, vtx[0], vtx[1], vtx[2],   u,v,  dark_colour, 1 );
vtx = d3d_transform_vertex( trunk_scale*0.7, height_offset + height_scale,  trunk_scale*0.3 ); d3d_model_vertex_texture_color( model, vtx[0], vtx[1], vtx[2],   u,v,  dark_colour, 1 );
vtx = d3d_transform_vertex( trunk_scale*0.7, height_offset + height_scale, -trunk_scale*0.3 ); d3d_model_vertex_texture_color( model, vtx[0], vtx[1], vtx[2],   u,v,  dark_colour, 1 );
vtx = d3d_transform_vertex(     trunk_scale, height_offset + height_scale,                0 ); d3d_model_vertex_texture_color( model, vtx[0], vtx[1], vtx[2],   u,v,  dark_colour, 1 );

d3d_model_primitive_end( model );

d3d_model_primitive_begin( model, pr_trianglestrip );

vtx = d3d_transform_vertex(           0,                height_offset,           0 ); d3d_model_vertex_texture_color( model, vtx[0], vtx[1], vtx[2],   u,v,  dark_colour, 1 );
vtx = d3d_transform_vertex( -sq_rt*0.49, height_offset + height_scale, -sq_rt*0.92 ); d3d_model_vertex_texture_color( model, vtx[0], vtx[1], vtx[2],   u,v,  dark_colour, 1 );
vtx = d3d_transform_vertex( -sq_rt*0.92, height_offset + height_scale, -sq_rt*0.49 ); d3d_model_vertex_texture_color( model, vtx[0], vtx[1], vtx[2],   u,v,  dark_colour, 1 );
vtx = d3d_transform_vertex(      -sq_rt, height_offset + height_scale,      -sq_rt ); d3d_model_vertex_texture_color( model, vtx[0], vtx[1], vtx[2],   u,v,  dark_colour, 1 );

d3d_model_primitive_end( model );

d3d_model_primitive_begin( model, pr_trianglestrip );

vtx = d3d_transform_vertex(           0,                height_offset,           0 ); d3d_model_vertex_texture_color( model, vtx[0], vtx[1], vtx[2],   u,v,  dark_colour, 1 );
vtx = d3d_transform_vertex( -sq_rt*0.92, height_offset + height_scale,  sq_rt*0.49 ); d3d_model_vertex_texture_color( model, vtx[0], vtx[1], vtx[2],   u,v,  dark_colour, 1 );
vtx = d3d_transform_vertex( -sq_rt*0.49, height_offset + height_scale,  sq_rt*0.92 ); d3d_model_vertex_texture_color( model, vtx[0], vtx[1], vtx[2],   u,v,  dark_colour, 1 );
vtx = d3d_transform_vertex(      -sq_rt, height_offset + height_scale,       sq_rt ); d3d_model_vertex_texture_color( model, vtx[0], vtx[1], vtx[2],   u,v,  dark_colour, 1 );

d3d_model_primitive_end( model );

height_scale *= 2;

d3d_model_primitive_begin( model, pr_trianglestrip );

vtx = d3d_transform_vertex(                0,                height_offset,                0 ); d3d_model_vertex_texture_color( model, vtx[0], vtx[1], vtx[2],   u,v,  colour, 1 );
vtx = d3d_transform_vertex( -trunk_scale*0.7, height_offset + height_scale, -trunk_scale*0.3 ); d3d_model_vertex_texture_color( model, vtx[0], vtx[1], vtx[2],   u,v,  colour, 1 );
vtx = d3d_transform_vertex( -trunk_scale*0.7, height_offset + height_scale,  trunk_scale*0.3 ); d3d_model_vertex_texture_color( model, vtx[0], vtx[1], vtx[2],   u,v,  colour, 1 );
vtx = d3d_transform_vertex(     -trunk_scale, height_offset + height_scale,                0 ); d3d_model_vertex_texture_color( model, vtx[0], vtx[1], vtx[2],   u,v,  colour, 1 );

d3d_model_primitive_end( model );

d3d_model_primitive_begin( model, pr_trianglestrip );

vtx = d3d_transform_vertex(          0,                height_offset,           0 ); d3d_model_vertex_texture_color( model, vtx[0], vtx[1], vtx[2],   u,v,  colour, 1 );
vtx = d3d_transform_vertex( sq_rt*0.92, height_offset + height_scale, -sq_rt*0.49 ); d3d_model_vertex_texture_color( model, vtx[0], vtx[1], vtx[2],   u,v,  colour, 1 );
vtx = d3d_transform_vertex( sq_rt*0.49, height_offset + height_scale, -sq_rt*0.92 ); d3d_model_vertex_texture_color( model, vtx[0], vtx[1], vtx[2],   u,v,  colour, 1 );
vtx = d3d_transform_vertex(      sq_rt, height_offset + height_scale,      -sq_rt ); d3d_model_vertex_texture_color( model, vtx[0], vtx[1], vtx[2],   u,v,  colour, 1 );

d3d_model_primitive_end( model );

d3d_model_primitive_begin( model, pr_trianglestrip );

vtx = d3d_transform_vertex(          0,                height_offset,           0 ); d3d_model_vertex_texture_color( model, vtx[0], vtx[1], vtx[2],   u,v,  colour, 1 );
vtx = d3d_transform_vertex( sq_rt*0.49, height_offset + height_scale,  sq_rt*0.92 ); d3d_model_vertex_texture_color( model, vtx[0], vtx[1], vtx[2],   u,v,  colour, 1 );
vtx = d3d_transform_vertex( sq_rt*0.92, height_offset + height_scale,  sq_rt*0.49 ); d3d_model_vertex_texture_color( model, vtx[0], vtx[1], vtx[2],   u,v,  colour, 1 );
vtx = d3d_transform_vertex(      sq_rt, height_offset + height_scale,       sq_rt ); d3d_model_vertex_texture_color( model, vtx[0], vtx[1], vtx[2],   u,v,  colour, 1 );

d3d_model_primitive_end( model );
