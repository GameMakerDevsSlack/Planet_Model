///draw_flag( thickness, height, flag length, post colour, flag colour, outline colour );
//Draws a flag using a hard-coded primitive

var post_scale, height_scale, flag_scale, post_colour, flag_colour, outline_colour;

post_scale = argument0;
height_scale = argument1;
flag_scale = argument2;
post_colour = argument3;
flag_colour = argument4;
outline_colour = argument5;
alpha = argument6;

//Post
d3d_primitive_begin_texture( pr_trianglestrip, tex_white );

d3d_vertex_texture_color( -post_scale,            0,           0,   0, 0,   post_colour, alpha );
d3d_vertex_texture_color( -post_scale, height_scale,           0,   0, 0,   post_colour, alpha );
d3d_vertex_texture_color(           0,            0, -post_scale,   0, 0,   post_colour, alpha );
d3d_vertex_texture_color(           0, height_scale, -post_scale,   0, 0,   post_colour, alpha );
d3d_vertex_texture_color(  post_scale,            0,           0,   0, 0,   post_colour, alpha );
d3d_vertex_texture_color(  post_scale, height_scale,           0,   0, 0,   post_colour, alpha );
d3d_vertex_texture_color(           0,            0,  post_scale,   0, 0,   post_colour, alpha );
d3d_vertex_texture_color(           0, height_scale,  post_scale,   0, 0,   post_colour, alpha );
d3d_vertex_texture_color( -post_scale,            0,           0,   0, 0,   post_colour, alpha );
d3d_vertex_texture_color( -post_scale, height_scale,           0,   0, 0,   post_colour, alpha );

d3d_primitive_end();

//Flag
d3d_primitive_begin_texture( pr_trianglestrip, tex_white );

d3d_vertex_texture_color( post_scale,         height_scale, 0,   0, 0,   flag_colour, alpha );
d3d_vertex_texture_color( post_scale, 0.5   * height_scale, 0,   0, 0,   flag_colour, alpha );
d3d_vertex_texture_color( flag_scale, 0.75  * height_scale, 0,   0, 0,   flag_colour, alpha );

d3d_primitive_end();

//Flag reverse
d3d_primitive_begin_texture( pr_trianglestrip, tex_white );

d3d_vertex_texture_color( post_scale,         height_scale, 0,   0, 0,   flag_colour, alpha );
d3d_vertex_texture_color( flag_scale, 0.75  * height_scale, 0,   0, 0,   flag_colour, alpha );
d3d_vertex_texture_color( post_scale, 0.5   * height_scale, 0,   0, 0,   flag_colour, alpha );

d3d_primitive_end();

//Coloured cap
d3d_primitive_begin_texture( pr_trianglestrip, tex_white );

d3d_vertex_texture_color(           0, height_scale, -post_scale,   0, 0,   flag_colour, alpha );
d3d_vertex_texture_color( -post_scale, height_scale,           0,   0, 0,   flag_colour, alpha );
d3d_vertex_texture_color(  post_scale, height_scale,           0,   0, 0,   flag_colour, alpha );
d3d_vertex_texture_color(           0, height_scale,  post_scale,   0, 0,   flag_colour, alpha );

d3d_primitive_end();

d3d_primitive_end();
