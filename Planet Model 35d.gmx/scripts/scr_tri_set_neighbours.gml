///scr_tri_set_neighbours( current face, result offset )
//Uses parent-child relationships to find neighbouring faces waaay more efficiently than force_assign_face_neighbour()
//The stilleto knife to the broadsword, as it were

var i;
var current = argument0;

//Since we're running this script before deleting a bunch of faces, we need to offset our results to that they're not massively wrong later
var result_correction = argument1;

//Create a count of successful matches. If things are going well, we should have exactly three for each face
var result = 0;

//A record of what's been found. This lets us selectively test for vertices and save some time
var a_found = false;
var b_found = false;
var c_found = false;

//Grab the vertices. This script is pretty similar to force_assign_face_neighbours()
var ax = ds_list_find_value( lst_tri_a_x, current );
var ay = ds_list_find_value( lst_tri_a_y, current );
var az = ds_list_find_value( lst_tri_a_z, current );

var bx = ds_list_find_value( lst_tri_b_x, current );
var by = ds_list_find_value( lst_tri_b_y, current );
var bz = ds_list_find_value( lst_tri_b_z, current );

var cx = ds_list_find_value( lst_tri_c_x, current );
var cy = ds_list_find_value( lst_tri_c_y, current );
var cz = ds_list_find_value( lst_tri_c_z, current );

//Predeclaring these so things are neater to read in the loop
var a_on_face = false;
var b_on_face = false;
var c_on_face = false;


//Fun starts here.
var faces_to_check_list = ds_list_create();

//We know that faces adjacent to the current face are children of neighbours of the current face's parent
//Got that?
//Trust me, this makes more sense in a second.

//Find the parent of the current face
var parent = ds_list_find_value( lst_tri_parent, current );

//Find the parent's neighbours
var parent_na = ds_list_find_value( lst_tri_a_adj, parent );
var parent_nb = ds_list_find_value( lst_tri_b_adj, parent );
var parent_nc = ds_list_find_value( lst_tri_c_adj, parent );

//Grab the children of the parent's neighbours and add them to a list of faces we want to check
//We know nothing about the orientation of these faces so we have to check all nine
ds_list_add( faces_to_check_list, ds_list_find_value( lst_tri_a_child, parent_na ) );
ds_list_add( faces_to_check_list, ds_list_find_value( lst_tri_b_child, parent_na ) );
ds_list_add( faces_to_check_list, ds_list_find_value( lst_tri_c_child, parent_na ) );

ds_list_add( faces_to_check_list, ds_list_find_value( lst_tri_a_child, parent_nb ) );
ds_list_add( faces_to_check_list, ds_list_find_value( lst_tri_b_child, parent_nb ) );
ds_list_add( faces_to_check_list, ds_list_find_value( lst_tri_c_child, parent_nb ) );

ds_list_add( faces_to_check_list, ds_list_find_value( lst_tri_a_child, parent_nc ) );
ds_list_add( faces_to_check_list, ds_list_find_value( lst_tri_b_child, parent_nc ) );
ds_list_add( faces_to_check_list, ds_list_find_value( lst_tri_c_child, parent_nc ) );


//Loop through all the faces we want to check
for( i = 0; i < 9; i++ ) {
    
    //Get the index of the actual face
    target = ds_list_find_value( faces_to_check_list, i );
    
    //Getting data out of ds_list can be kinda slow. It's faster to work out if we need a computation than to just do it
    if ( a_found and c_found ) a_on_face = false else a_on_face = scr_tri_find_point( ax, ay, az,  target );
    if ( a_found and b_found ) b_on_face = false else b_on_face = scr_tri_find_point( bx, by, bz,  target );
    if ( b_found and c_found ) c_on_face = false else c_on_face = scr_tri_find_point( cx, cy, cz,  target );
    
    //If the two faces (current and target) share two vertices, they must also share a face
    
    //If the two vertices are A+B then side A is common
    if ( a_on_face and b_on_face ) {
        
        //Change the current face's neighbour to the face we've just found, not forget to correct for the purging to follow
        ds_list_replace( lst_tri_a_adj, current, target - result_correction );
        a_found = true;
        result++;
        
        if (result == 3 ) {
            //We also have to remember to get rid of this ds_list. It's probable that destroy/creating so many lists slows things down
            ds_list_destroy( faces_to_check_list );
            exit;
        }
        
    }
    
    //Same for side B
    if ( b_on_face and c_on_face ) {
    
        ds_list_replace( lst_tri_b_adj, current, target - result_correction );
        b_found = true;
        result++;
        
        if (result == 3 ) {
            ds_list_destroy( faces_to_check_list );
            exit;
        }
        
    }
    
    //And side C. Whilst it's probably neater to have all this as numerically indexable, it's faster to have it hard coded
    if ( c_on_face and a_on_face ) {
    
        ds_list_replace( lst_tri_c_adj, current, target - result_correction );
        c_found = true;
        result++;
        
        if (result == 3 ) {
            ds_list_destroy( faces_to_check_list );
            exit;
        }
        
    }
    
}

//Error handling. Heaven forfend we get down here during normal operation
show_message(" Assignment error? 'result < 3' for " + string( current ) + " (child of " + string( ds_list_find_value( lst_tri_parent, current ) ) + "). " + string( a_found ) + "," + string( b_found ) + "," + string( c_found ) );
