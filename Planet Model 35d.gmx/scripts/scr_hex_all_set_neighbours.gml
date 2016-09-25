///scr_hex_all_neighbours( erase )
//
//Takes all the face neighbour associations and turns them into hex neighbour associations instead
//Might be a bit buggy as it returns one more neighbour than expected (probably self-neighbouring?)

var i, j, face_neighbour_list, hex_neighbour_list, face, hex;

for( i = 0; i < ds_list_size( lst_hex_x ); i++ ) {
    
    face_neighbour_list = ds_list_find_value( hex_nested_neighbour_faces_list, i );
    hex_neighbour_list = ds_list_find_value( lst_hex_list_adj, i );
    
    for( j = 0; j < ds_list_size( face_neighbour_list ); j++ ) {
        
        face = ds_list_find_value( face_neighbour_list, j );
        hex = ds_list_find_value( lst_tri_hex, face );
        ds_list_add( hex_neighbour_list, hex );
        
    }
    
}
