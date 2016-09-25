///scr_hex_add_face( face, direction to hex centre, hex )
//

var face = argument0;
var dir = argument1;
var hex = argument2;

var lst_hex_x = ds_list_find_value( lst_hex_list_vertex_x, hex );
var lst_hex_y = ds_list_find_value( lst_hex_list_vertex_y, hex );
var lst_hex_z = ds_list_find_value( lst_hex_list_vertex_z, hex );
var hex_neighbour_list = ds_list_find_value( hex_nested_neighbour_faces_list, hex );

ds_list_replace( lst_tri_hex, face, hex );

switch( dir ) {
    
    case 1: {
        
        ds_list_add( lst_hex_x, ds_list_find_value( lst_tri_b_x, face ) );
        ds_list_add( lst_hex_y, ds_list_find_value( lst_tri_b_y, face ) );
        ds_list_add( lst_hex_z, ds_list_find_value( lst_tri_b_z, face ) );
        
        ds_list_add( lst_hex_x, ds_list_find_value( lst_tri_c_x, face ) );
        ds_list_add( lst_hex_y, ds_list_find_value( lst_tri_c_y, face ) );
        ds_list_add( lst_hex_z, ds_list_find_value( lst_tri_c_z, face ) );
        
        ds_list_add( hex_neighbour_list, ds_list_find_value( lst_tri_b_adj, face ) );
        
        break;
    }
    
    case 2: {
        
        ds_list_add( lst_hex_x, ds_list_find_value( lst_tri_a_x, face ) );
        ds_list_add( lst_hex_y, ds_list_find_value( lst_tri_a_y, face ) );
        ds_list_add( lst_hex_z, ds_list_find_value( lst_tri_a_z, face ) );
        
        ds_list_add( lst_hex_x, ds_list_find_value( lst_tri_c_x, face ) );
        ds_list_add( lst_hex_y, ds_list_find_value( lst_tri_c_y, face ) );
        ds_list_add( lst_hex_z, ds_list_find_value( lst_tri_c_z, face ) );
        
        ds_list_add( hex_neighbour_list, ds_list_find_value( lst_tri_c_adj, face ) );
        
        break;
    }
    
    case 3: {
        
        ds_list_add( lst_hex_x, ds_list_find_value( lst_tri_a_x, face ) );
        ds_list_add( lst_hex_y, ds_list_find_value( lst_tri_a_y, face ) );
        ds_list_add( lst_hex_z, ds_list_find_value( lst_tri_a_z, face ) );
        
        ds_list_add( lst_hex_x, ds_list_find_value( lst_tri_b_x, face ) );
        ds_list_add( lst_hex_y, ds_list_find_value( lst_tri_b_y, face ) );
        ds_list_add( lst_hex_z, ds_list_find_value( lst_tri_b_z, face ) );
        
        ds_list_add( hex_neighbour_list, ds_list_find_value( lst_tri_a_adj, face ) );
        
        break;
    }
}
