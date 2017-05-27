/// @param triangle
/// @param direction
/// @param hex

var _tri = argument0;
var _dir = argument1;
var _hex = argument2;

world_tri_grid_a[# _tri, world_tri.hex ] = _hex;

var _lst_hex_ax = world_hex_grid[# _hex, world_hex.list_ax ];
var _lst_hex_ay = world_hex_grid[# _hex, world_hex.list_ay ];
var _lst_hex_az = world_hex_grid[# _hex, world_hex.list_az ];

var _lst_hex_bx = world_hex_grid[# _hex, world_hex.list_bx ];
var _lst_hex_by = world_hex_grid[# _hex, world_hex.list_by ];
var _lst_hex_bz = world_hex_grid[# _hex, world_hex.list_bz ];

var _cache_list = hex_tri_cache[| _hex ];

switch( _dir ) {
    
    case 1: {
        
        ds_list_add( _lst_hex_ax, world_tri_grid_a[# _tri, world_tri.b_x ] );
        ds_list_add( _lst_hex_ay, world_tri_grid_a[# _tri, world_tri.b_y ] );
        ds_list_add( _lst_hex_az, world_tri_grid_a[# _tri, world_tri.b_z ] );
		
        ds_list_add( _lst_hex_bx, world_tri_grid_a[# _tri, world_tri.c_x ] );
        ds_list_add( _lst_hex_by, world_tri_grid_a[# _tri, world_tri.c_y ] );
        ds_list_add( _lst_hex_bz, world_tri_grid_a[# _tri, world_tri.c_z ] );
		
        ds_list_add( _cache_list, world_tri_grid_a[# _tri, world_tri.b_adj ] );
        
        break;
    }
    
    case 2: {
        
        ds_list_add( _lst_hex_ax, world_tri_grid_a[# _tri, world_tri.a_x ] );
        ds_list_add( _lst_hex_ay, world_tri_grid_a[# _tri, world_tri.a_y ] );
        ds_list_add( _lst_hex_az, world_tri_grid_a[# _tri, world_tri.a_z ] );
		
        ds_list_add( _lst_hex_bx, world_tri_grid_a[# _tri, world_tri.c_x ] );
        ds_list_add( _lst_hex_by, world_tri_grid_a[# _tri, world_tri.c_y ] );
        ds_list_add( _lst_hex_bz, world_tri_grid_a[# _tri, world_tri.c_z ] );
        
        ds_list_add( _cache_list, world_tri_grid_a[# _tri, world_tri.c_adj ] );
        
        break;
    }
    
    case 3: {
        
        ds_list_add( _lst_hex_ax, world_tri_grid_a[# _tri, world_tri.a_x ] );
        ds_list_add( _lst_hex_ay, world_tri_grid_a[# _tri, world_tri.a_y ] );
        ds_list_add( _lst_hex_az, world_tri_grid_a[# _tri, world_tri.a_z ] );
		
        ds_list_add( _lst_hex_bx, world_tri_grid_a[# _tri, world_tri.b_x ] );
        ds_list_add( _lst_hex_by, world_tri_grid_a[# _tri, world_tri.b_y ] );
        ds_list_add( _lst_hex_bz, world_tri_grid_a[# _tri, world_tri.b_z ] );
		
        ds_list_add( _cache_list, world_tri_grid_a[# _tri, world_tri.a_adj ] );
        
        break;
    }
}