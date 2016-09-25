///scr_model_starfield()

var model, xx, yy, zz, r;

model = d3d_model_create();

d3d_model_primitive_begin( model, pr_pointlist );

repeat( 10000 ) {
    
    xx = random_range( -1, 1 );
    yy = random_range( -1, 1 );
    zz = random_range( -1, 1 );
    
    r = k_sun_distance / point_distance_3d( 0, 0, 0, xx, yy, zz );
    
    xx *= r;
    yy *= r;
    zz *= r;
    
    d3d_model_vertex_color( model,   xx, yy, zz,   make_color_hsv( random( 255 ), random_range( 60, 90 ), random_range( 50, 230 ) ), 1 );
    
}

d3d_model_primitive_end( model );

return model;
