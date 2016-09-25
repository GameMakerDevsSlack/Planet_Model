///make_null_tiles_off_limits()
//Find all the null points (pentagons) and turn them into mountains
var maxi, i, j, hex, neighbour_list;

maxi = ds_list_max( lst_terrain_height );

for( i = 0; i < ds_list_size( lst_terrain_height ); i++ ) {
    
    neighbour_list = ds_list_find_value( lst_hex_list_adj, i );
    
    if ( ds_list_size( neighbour_list ) < 7 ) {
    
        ds_list_replace( lst_terrain_height, i, maxi * 0.85 );
        
        //If we've on a sufficiently big enough map, surround this null point with some mountains/hills
        if ( k_subdivisions >= 5 ) {
            for( j = 0; j < ds_list_size( neighbour_list ); j++ ) {
                hex = ds_list_find_value( neighbour_list, j );
                ds_list_replace( lst_terrain_height, hex, maxi * 0.63 );
            }
        }
    }
}
