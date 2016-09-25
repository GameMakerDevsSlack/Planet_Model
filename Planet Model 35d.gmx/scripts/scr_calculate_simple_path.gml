///calculate_path( start hex, end hex )

var list, i, neighbour_list, current_hex, target, lowest_dist, lowest_index, dist, xx, yy, zz, r, phi, theta;
var finish_hex, fx, fy, fz;

list = ds_list_create();

current_hex = argument0;
lowest_index = argument0;
ds_list_add( list, current_hex );

finish_hex = argument1;
fx = ds_list_find_value( obj_world.lst_hex_x, finish_hex );
fy = ds_list_find_value( obj_world.lst_hex_y, finish_hex );
fz = ds_list_find_value( obj_world.lst_hex_z, finish_hex );

while ( ( current_hex != finish_hex ) and ( lowest_index != noone ) ) {

    neighbour_list = ds_list_find_value( obj_world.lst_hex_list_adj, current_hex );
    
    lowest_dist = -1;
    lowest_index = noone;
    
    for( i = 0; i < ds_list_size( neighbour_list ); i++ ) {
        
        target = ds_list_find_value( neighbour_list, i );
        
        xx = ds_list_find_value( obj_world.lst_hex_x, target );
        yy = ds_list_find_value( obj_world.lst_hex_y, target );
        zz = ds_list_find_value( obj_world.lst_hex_z, target );
            
        dist = dot_product_3d_normalised( xx, yy, zz,   fx, fy, fz );
            
        if ( dist > lowest_dist ) {
            lowest_dist = dist;
            lowest_index = target;
        }
        
    }
    
    if ( lowest_index == current_hex ) {
        current_hex = noone
    } else if ( lowest_index != noone ) {
        current_hex = lowest_index;
        ds_list_add( list, current_hex );
    }
    
}

return list;
