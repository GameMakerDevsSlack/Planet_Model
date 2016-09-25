///scr_hex_all_calculate_centres()
//
//Averages all hex vertices to give the centre point
//This deliberately causes the centre point to lie inside the sphere and not on it
//The discrepancy (called the "sagitta" in geometry) is not a consistent value
//For spherical coordinates (commented out here), the radius needs to be individually calculated to maintain accuracy

var i, x_list, y_list, z_list, xx, yy, zz, r, phi, sintheta;

for( i = 0; i < k_hexes; i++ ) {
    
    x_list = ds_list_find_value( lst_hex_list_vertex_x, i );
    y_list = ds_list_find_value( lst_hex_list_vertex_y, i );
    z_list = ds_list_find_value( lst_hex_list_vertex_z, i );
    
    xx = ds_list_mean( x_list );
    yy = ds_list_mean( y_list );
    zz = ds_list_mean( z_list );
    
    ds_list_replace( lst_hex_x, i, xx );
    ds_list_replace( lst_hex_y, i, yy );
    ds_list_replace( lst_hex_z, i, zz );
    
    r = point_distance_3d( 0, 0, 0, xx, yy, zz );
    phi   = arctan2( zz, xx );
    theta = arccos( yy / r );
    
    ds_list_replace( lst_hex_radius, i, r );
    ds_list_replace( lst_hex_phi, i, phi );
    ds_list_replace( lst_hex_theta, i, theta );
    
    
    
    //Precompute trig values for lighting
    sintheta = sin( theta );
    ds_list_replace( lst_hex_light_presin, i, sin( phi ) * sintheta );
    ds_list_replace( lst_hex_light_precos, i, cos( phi ) * sintheta );
    
    
    
    //Precompute quaternion values for model placement
    ds_quaternion_reset( k_global_quaternion );
    ds_quaternion_multiply_left( k_global_quaternion,   cos( theta * 0.5 ), 0, 0, -sin( theta * 0.5 ) );
    ds_quaternion_multiply_left( k_global_quaternion,   cos( phi * 0.5 ), 0, -sin( phi * 0.5 ), 0 );
    ds_quaternion_get_rotation_axis( k_global_quaternion );
    
    ds_list_replace( lst_hex_quat_a, i, result_coord[0] );
    ds_list_replace( lst_hex_quat_b, i, result_coord[1] );
    ds_list_replace( lst_hex_quat_c, i, result_coord[2] );
    ds_list_replace( lst_hex_quat_d, i, result_coord[3] );
    
    
    
    //Calculate hex's position for skin application
    ds_list_replace( lst_hex_surface_x, i, scr_hex_surface_x( i ) );
    ds_list_replace( lst_hex_surface_y, i, scr_hex_surface_y( i ) );
    
}
