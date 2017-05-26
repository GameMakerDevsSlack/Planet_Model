/// @param triangle
/// @param direction
/// @param hex

var _tri = argument0;
var _dir = argument1;
var _hex = argument2;

world_tri_grid_a[# _tri, world_tri.hex ] = _hex;

var _lst_hex_x = world_hex_grid[# _hex, world_hex.list_vx ];
var _lst_hex_y = world_hex_grid[# _hex, world_hex.list_vy ];
var _lst_hex_z = world_hex_grid[# _hex, world_hex.list_vz ];
var _hex_neighbour_list = hex_nested_neighbour_faces_list[| _hex ];

switch( _dir ) {
    
    case 1: {
        
        ds_list_add( _lst_hex_x, world_tri_grid_a[# _tri, world_tri.b_x ] );
        ds_list_add( _lst_hex_y, world_tri_grid_a[# _tri, world_tri.b_y ] );
        ds_list_add( _lst_hex_z, world_tri_grid_a[# _tri, world_tri.b_z ] );
		
        ds_list_add( _lst_hex_x, world_tri_grid_a[# _tri, world_tri.c_x ] );
        ds_list_add( _lst_hex_y, world_tri_grid_a[# _tri, world_tri.c_y ] );
        ds_list_add( _lst_hex_z, world_tri_grid_a[# _tri, world_tri.c_z ] );
        
        ds_list_add( _hex_neighbour_list, world_tri_grid_a[# _tri, world_tri.b_adj ] );
        
        break;
    }
    
    case 2: {
        
        ds_list_add( _lst_hex_x, world_tri_grid_a[# _tri, world_tri.a_x ] );
        ds_list_add( _lst_hex_y, world_tri_grid_a[# _tri, world_tri.a_y ] );
        ds_list_add( _lst_hex_z, world_tri_grid_a[# _tri, world_tri.a_z ] );
		
        ds_list_add( _lst_hex_x, world_tri_grid_a[# _tri, world_tri.c_x ] );
        ds_list_add( _lst_hex_y, world_tri_grid_a[# _tri, world_tri.c_y ] );
        ds_list_add( _lst_hex_z, world_tri_grid_a[# _tri, world_tri.c_z ] );
        
        ds_list_add( _hex_neighbour_list, world_tri_grid_a[# _tri, world_tri.c_adj ] );
        
        break;
    }
    
    case 3: {
        
        ds_list_add( _lst_hex_x, world_tri_grid_a[# _tri, world_tri.a_x ] );
        ds_list_add( _lst_hex_y, world_tri_grid_a[# _tri, world_tri.a_y ] );
        ds_list_add( _lst_hex_z, world_tri_grid_a[# _tri, world_tri.a_z ] );
		
        ds_list_add( _lst_hex_x, world_tri_grid_a[# _tri, world_tri.b_x ] );
        ds_list_add( _lst_hex_y, world_tri_grid_a[# _tri, world_tri.b_y ] );
        ds_list_add( _lst_hex_z, world_tri_grid_a[# _tri, world_tri.b_z ] );
		
        ds_list_add( _hex_neighbour_list, world_tri_grid_a[# _tri, world_tri.a_adj ] );
        
        break;
    }
}