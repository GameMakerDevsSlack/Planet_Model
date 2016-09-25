///scr_hex_remove_duplicate_vertices()
//
//Does what it says on the tin
//create_hex_from_faces() makes no effort to weed out vertex conflicts, as a result, you get double the number of vertices
//It's easier to just remove them at the end instead of bogging down the vertex collection with more conditionals

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
