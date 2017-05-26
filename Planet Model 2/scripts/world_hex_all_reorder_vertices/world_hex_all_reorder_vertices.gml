//Unfortunately, the face/hex system I've used up until this point doesn't want to get drawn easily
//Since I really want to use a pr_trianglefan method, it's conceptually easier to reorder the coordinates beforehand
//The good news is that since every hex underwent the same subdivision method, there's a general solution
//Behold! Magic numbers!

var _j;
for( var _i = 0; _i < world_hex_grid_count; _i++ ) {
    
    var _x_list = world_hex_grid[# _i, world_hex.list_vx ];
    var _y_list = world_hex_grid[# _i, world_hex.list_vy ];
    var _z_list = world_hex_grid[# _i, world_hex.list_vz ];
    
    switch( ds_list_size( _x_list ) ) {

        case 6: { //For the hexagons
            _j = 1;
            ds_list_add( _x_list, _x_list[| _j ] );
            ds_list_add( _y_list, _y_list[| _j ] );
            ds_list_add( _z_list, _z_list[| _j ] );
            							 
            _j = 0;						 
            ds_list_add( _x_list, _x_list[| _j ] );
            ds_list_add( _y_list, _y_list[| _j ] );
            ds_list_add( _z_list, _z_list[| _j ] );
            							 
            _j = 2;						 
            ds_list_add( _x_list, _x_list[| _j ] );
            ds_list_add( _y_list, _y_list[| _j ] );
            ds_list_add( _z_list, _z_list[| _j ] );
            							
            _j = 4;						
            ds_list_add( _x_list, _x_list[| _j ] );
            ds_list_add( _y_list, _y_list[| _j ] );
            ds_list_add( _z_list, _z_list[| _j ] );
            							
            _j = 5;						
            ds_list_add( _x_list, _x_list[| _j ] );
            ds_list_add( _y_list, _y_list[| _j ] );
            ds_list_add( _z_list, _z_list[| _j ] );
            							
            _j = 3;						
            ds_list_add( _x_list, _x_list[| _j ] );
            ds_list_add( _y_list, _y_list[| _j ] );
            ds_list_add( _z_list, _z_list[| _j ] );
            
            repeat( 6 ) { //Delete the old vertices
                ds_list_delete( _x_list, 0 );
                ds_list_delete( _y_list, 0 );
                ds_list_delete( _z_list, 0 );
            }
            
            break;
        }
        
        case 5: { //For the pentagons too - we don't discriminate
            
            _j = 1;
            ds_list_add( _x_list, _x_list[| _j ] );
            ds_list_add( _y_list, _y_list[| _j ] );
            ds_list_add( _z_list, _z_list[| _j ] );
            					  		
            _j = 0;				  		
            ds_list_add( _x_list, _x_list[| _j ] );
            ds_list_add( _y_list, _y_list[| _j ] );
            ds_list_add( _z_list, _z_list[| _j ] );
            					  		
            _j = 2;				  		
            ds_list_add( _x_list, _x_list[| _j ] );
            ds_list_add( _y_list, _y_list[| _j ] );
            ds_list_add( _z_list, _z_list[| _j ] );
            					  		
            _j = 4;				  		
            ds_list_add( _x_list, _x_list[| _j ] );
            ds_list_add( _y_list, _y_list[| _j ] );
            ds_list_add( _z_list, _z_list[| _j ] );
            					  		 
            _j = 3;				  		 
            ds_list_add( _x_list, _x_list[| _j ] );
            ds_list_add( _y_list, _y_list[| _j ] );
            ds_list_add( _z_list, _z_list[| _j ] );
            
            repeat( 5 ) { //Delete the old vertices
                ds_list_delete( _x_list, 0 );
                ds_list_delete( _y_list, 0 );
                ds_list_delete( _z_list, 0 );
            }
            
            break;
        }
        
        default: {
            
            //Err...
            show_message( "reorder_hex_vertices has invalid hex, size " + string( ds_list_size( _x_list ) ) );
            
        }
        
    }
    
}