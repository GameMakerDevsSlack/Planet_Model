///scr_tri_force_neighbours( face index )
//A brute force neighbour assignment method. Scans every vertex pair to see if they match
//This was actually used as the main neighbour assignment strategy! Hah! It was so slow.


//Create a count of successful matches. If things are going well, we should have exactly three for each face
var result = 0;

//Make sure we know which face we're dealing with
var current = argument0;

//Grabbing the vertices outside of the loop saves a bit of time
var ax = ds_list_find_value( lst_tri_a_x, current );
var ay = ds_list_find_value( lst_tri_a_y, current );
var az = ds_list_find_value( lst_tri_a_z, current );

var bx = ds_list_find_value( lst_tri_b_x, current );
var by = ds_list_find_value( lst_tri_b_y, current );
var bz = ds_list_find_value( lst_tri_b_z, current );

var cx = ds_list_find_value( lst_tri_c_x, current );
var cy = ds_list_find_value( lst_tri_c_y, current );
var cz = ds_list_find_value( lst_tri_c_z, current );

//Run through all the faces
for( var i = 0; i < ds_list_size( lst_tri_a_x ); i++ ) {
    
    //Though skip past ourselves
    if ( current == i ) continue;
    
    //Could probably speed this up a bit. Not a priority compared to assign_face_neighbours
    var a_on_face = scr_tri_find_point( ax, ay, az,  i );
    var b_on_face = scr_tri_find_point( bx, by, bz,  i );
    var c_on_face = scr_tri_find_point( cx, cy, cz,  i );
    
    //If the two faces (current and i) share two vertices, they must also share a face
    
    //If the two vertices are A+B then side A is common
    if ( a_on_face and b_on_face ) {
        ds_list_replace( lst_tri_a_adj, current, i );
        result++; if (result == 3 ) exit;
    }
    
    //If the two vertices are B+C then side B is common
    if ( b_on_face and c_on_face ) {
        ds_list_replace( lst_tri_b_adj, current, i );
        result++; if (result == 3 ) exit;
    }
    
    //If the two vertices are C+A then side C is common
    if ( c_on_face and a_on_face ) {
        ds_list_replace( lst_tri_c_adj, current, i );
        result++; if (result == 3 ) exit;
    }
    
}

//We really shouldn't be able to get down here unless something's gone wrong
show_message( "Forcing error? 'result < 3' for " + string( i ) );
