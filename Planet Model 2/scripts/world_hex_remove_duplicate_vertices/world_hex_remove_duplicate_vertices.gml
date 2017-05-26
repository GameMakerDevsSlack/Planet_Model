//Does what it says on the tin
//create_hex_from_faces() makes no effort to weed out vertex conflicts, as a result, you get double the number of vertices
//It's easier to just remove them at the end instead of bogging down the vertex collection with more conditionals

//Loop through hexes
for( var _i = 0; _i < world_hex_grid_count; _i++ ) {
    
    var _x_list = world_hex_grid[# _i, world_hex.list_vx ];
    var _y_list = world_hex_grid[# _i, world_hex.list_vy ];
    var _z_list = world_hex_grid[# _i, world_hex.list_vz ];
    
    //Loop through vertices
    for( var _j = 0; _j < ds_list_size( _x_list ); _j++ ) {
        
        var _comp_x = _x_list[| _j ];
        var _comp_y = _y_list[| _j ];
        var _comp_z = _z_list[| _j ];
        
        //Loop through vertices again
        for( var _k = 0; _k < ds_list_size( _x_list ); _k++ ) {
            
            //Ignore self-comparisons
            if ( _k == _j ) continue;
            
            var _x = _x_list[| _k ];
            var _y = _y_list[| _k ];
            var _z = _z_list[| _k ];
            
            if ( compare_3d_points( _comp_x, _comp_y, _comp_z,   _x, _y, _z ) ) {
                
                //Delete conflicting vertices
                ds_list_delete( _x_list, _k );
                ds_list_delete( _y_list, _k );
                ds_list_delete( _z_list, _k );
                
                //Make sure that k doesn't get ahead of itself and skip vertices
                _k--;
                
            }
            
        }
        
    }
    
}

/*
var i, x_list, y_list, z_list, j, comp_x, comp_y, comp_z, k, xx, yy, zz;

//Loop through hexes
for( i = 0; i < ds_list_size( lst_hex_x ); i++ ) {
    
    x_list = ds_list_find_value( lst_hex_list_vertex_x, i );
    y_list = ds_list_find_value( lst_hex_list_vertex_y, i );
    z_list = ds_list_find_value( lst_hex_list_vertex_z, i );
    
    //Loop through vertices
    for( j = 0; j < ds_list_size( x_list ); j++ ) {
        
        comp_x = ds_list_find_value( x_list, j );
        comp_y = ds_list_find_value( y_list, j );
        comp_z = ds_list_find_value( z_list, j );
        
        //Loop through vertices again
        for( k = 0; k < ds_list_size( x_list ); k++ ) {
            
            //Ignore self-comparisons
            if ( k == j ) continue;
            
            xx = ds_list_find_value( x_list, k );
            yy = ds_list_find_value( y_list, k );
            zz = ds_list_find_value( z_list, k );
            
            if ( scr_compare_3d_points( comp_x, comp_y, comp_z,   xx, yy, zz ) ) {
                
                //Delete conflicting vertices
                ds_list_delete( x_list, k );
                ds_list_delete( y_list, k );
                ds_list_delete( z_list, k );
                
                //Make sure that k doesn't get ahead of itself and skip vertices
                k--;
                
            }
            
        }
        
    }
    
}
*/