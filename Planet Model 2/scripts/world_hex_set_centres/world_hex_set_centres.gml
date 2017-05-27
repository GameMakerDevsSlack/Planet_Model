//Averages all hex vertices to give the centre point
//This deliberately causes the centre point to lie inside the sphere and not on it
//The discrepancy (called the "sagitta" in geometry) is not a consistent value
//For spherical coordinates (commented out here), the radius needs to be individually calculated to maintain accuracy

for( var _i = 0; _i < world_hex_grid_count; _i++ ) {
    
    var _ax_list = world_hex_grid[# _i, world_hex.list_ax ];
    var _ay_list = world_hex_grid[# _i, world_hex.list_ay ];
    var _az_list = world_hex_grid[# _i, world_hex.list_az ];
    
    var _x = ds_list_mean( _ax_list );
    var _y = ds_list_mean( _ay_list );
    var _z = ds_list_mean( _az_list );
    
	world_hex_grid[# _i, world_hex.x ] = _x;
	world_hex_grid[# _i, world_hex.y ] = _y;
	world_hex_grid[# _i, world_hex.z ] = _z;
    
    var _r     = point_distance_3d( 0, 0, 0, _x, _y, _z );
    var _phi   = darctan2( _z, _x );
    var _theta = darccos( _y / _r );
    
	world_hex_grid[# _i, world_hex.radius ] = _r;
	world_hex_grid[# _i, world_hex.phi    ] = _phi;
	world_hex_grid[# _i, world_hex.theta  ] = _theta;
	/*
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
    */
}