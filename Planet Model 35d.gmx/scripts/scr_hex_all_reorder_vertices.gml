///scr_hex_all_reorder_vertices()
//
//Unfortunately, the face/hex system I've used up until this point doesn't want to get drawn easily
//Since I really want to use a pr_trianglefan method, it's conceptually easier to reorder the coordinates beforehand
//The good news is that since every hex underwent the same subdivision method, there's a general solution
//Behold! Magic numbers!

var i, j, x_list, y_list, z_list;

for( i = 0; i < ds_list_size( lst_hex_x ); i++ ) {
    
    x_list = ds_list_find_value( lst_hex_list_vertex_x, i );
    y_list = ds_list_find_value( lst_hex_list_vertex_y, i );
    z_list = ds_list_find_value( lst_hex_list_vertex_z, i );
    
    switch( ds_list_size( x_list ) ) {

        case 6: { //For the hexagons
            j = 1;
            ds_list_add( x_list, ds_list_find_value( x_list, j ) );
            ds_list_add( y_list, ds_list_find_value( y_list, j ) );
            ds_list_add( z_list, ds_list_find_value( z_list, j ) );
            
            j = 0;
            ds_list_add( x_list, ds_list_find_value( x_list, j ) );
            ds_list_add( y_list, ds_list_find_value( y_list, j ) );
            ds_list_add( z_list, ds_list_find_value( z_list, j ) );
            
            j = 2;
            ds_list_add( x_list, ds_list_find_value( x_list, j ) );
            ds_list_add( y_list, ds_list_find_value( y_list, j ) );
            ds_list_add( z_list, ds_list_find_value( z_list, j ) );
            
            j = 4;
            ds_list_add( x_list, ds_list_find_value( x_list, j ) );
            ds_list_add( y_list, ds_list_find_value( y_list, j ) );
            ds_list_add( z_list, ds_list_find_value( z_list, j ) );
            
            j = 5;
            ds_list_add( x_list, ds_list_find_value( x_list, j ) );
            ds_list_add( y_list, ds_list_find_value( y_list, j ) );
            ds_list_add( z_list, ds_list_find_value( z_list, j ) );
            
            j = 3;
            ds_list_add( x_list, ds_list_find_value( x_list, j ) );
            ds_list_add( y_list, ds_list_find_value( y_list, j ) );
            ds_list_add( z_list, ds_list_find_value( z_list, j ) );
            
            repeat( 6 ) { //Delete the old vertices
                ds_list_delete( x_list, 0 );
                ds_list_delete( y_list, 0 );
                ds_list_delete( z_list, 0 );
            }
            
            break;
        }
        
        case 5: { //For the pentagons too - we don't discriminate
            
            j = 1;
            ds_list_add( x_list, ds_list_find_value( x_list, j ) );
            ds_list_add( y_list, ds_list_find_value( y_list, j ) );
            ds_list_add( z_list, ds_list_find_value( z_list, j ) );
            
            j = 0;
            ds_list_add( x_list, ds_list_find_value( x_list, j ) );
            ds_list_add( y_list, ds_list_find_value( y_list, j ) );
            ds_list_add( z_list, ds_list_find_value( z_list, j ) );
            
            j = 2;
            ds_list_add( x_list, ds_list_find_value( x_list, j ) );
            ds_list_add( y_list, ds_list_find_value( y_list, j ) );
            ds_list_add( z_list, ds_list_find_value( z_list, j ) );
            
            j = 4;
            ds_list_add( x_list, ds_list_find_value( x_list, j ) );
            ds_list_add( y_list, ds_list_find_value( y_list, j ) );
            ds_list_add( z_list, ds_list_find_value( z_list, j ) );
            
            j = 3;
            ds_list_add( x_list, ds_list_find_value( x_list, j ) );
            ds_list_add( y_list, ds_list_find_value( y_list, j ) );
            ds_list_add( z_list, ds_list_find_value( z_list, j ) );
            
            repeat( 5 ) { //Delete the old vertices
                ds_list_delete( x_list, 0 );
                ds_list_delete( y_list, 0 );
                ds_list_delete( z_list, 0 );
            }
            
            break;
        }
        
        default: {
            
            //Err...
            show_message( "reorder_hex_vertices has invalid hex, size " + string( ds_list_size( x_list ) ) );
            
        }
        
    }
    
}
