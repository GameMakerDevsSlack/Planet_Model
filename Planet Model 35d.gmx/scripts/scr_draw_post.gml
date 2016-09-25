///draw_post( thickness, height, post colour, flag colour, outline colour );
//Draws a flag using a hard-coded primitive

var post_scale, height_scale, flag_scale, post_colour, flag_colour, outline_colour;

post_scale = argument0;
height_scale = argument1;
post_colour = argument2;
flag_colour = argument3;
outline_colour = argument4;

//Post    
d3d_primitive_begin( pr_trianglestrip );

d3d_vertex_color( -post_scale,            0,           0,   post_colour, 1 );
d3d_vertex_color( -post_scale, height_scale,           0,   post_colour, 1 );
d3d_vertex_color(           0,            0, -post_scale,   post_colour, 1 );
d3d_vertex_color(           0, height_scale, -post_scale,   post_colour, 1 );
d3d_vertex_color(  post_scale,            0,           0,   post_colour, 1 );
d3d_vertex_color(  post_scale, height_scale,           0,   post_colour, 1 );
d3d_vertex_color(           0,            0,  post_scale,   post_colour, 1 );
d3d_vertex_color(           0, height_scale,  post_scale,   post_colour, 1 );
d3d_vertex_color( -post_scale,            0,           0,   post_colour, 1 );
d3d_vertex_color( -post_scale, height_scale,           0,   post_colour, 1 );

d3d_primitive_end();

//Coloured cap
d3d_primitive_begin( pr_trianglestrip );

d3d_vertex_color(           0, height_scale, -post_scale,   flag_colour, 1 );
d3d_vertex_color( -post_scale, height_scale,           0,   flag_colour, 1 );
d3d_vertex_color(  post_scale, height_scale,           0,   flag_colour, 1 );
d3d_vertex_color(           0, height_scale,  post_scale,   flag_colour, 1 );

d3d_primitive_end();

//Cap border
d3d_primitive_begin( pr_linestrip );

d3d_vertex_color( -post_scale, height_scale,           0,   outline_colour, 1 );
d3d_vertex_color(           0, height_scale, -post_scale,   outline_colour, 1 );
d3d_vertex_color(  post_scale, height_scale,           0,   outline_colour, 1 );
d3d_vertex_color(           0, height_scale,  post_scale,   outline_colour, 1 );
d3d_vertex_color( -post_scale, height_scale,           0,   outline_colour, 1 );

d3d_primitive_end();
