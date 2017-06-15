/// @param current

//Uses parent-child relationships to find neighbouring faces waaay more efficiently than force_assign_face_neighbour()
//The stilleto knife to the broadsword, as it were

var _current = argument0;

//Create a count of successful matches. If things are going well, we should have exactly three for each face
var _result = 0;

//A record of what's been found. This lets us selectively test for vertices and save some time
var _a_found = false;
var _b_found = false;
var _c_found = false;

//Grab the vertices. This script is pretty similar to force_assign_face_neighbours()
var _ax = world_tri_grid_b[# _current, world_tri.a_x ];
var _ay = world_tri_grid_b[# _current, world_tri.a_y ];
var _az = world_tri_grid_b[# _current, world_tri.a_z ];

var _bx = world_tri_grid_b[# _current, world_tri.b_x ];
var _by = world_tri_grid_b[# _current, world_tri.b_y ];
var _bz = world_tri_grid_b[# _current, world_tri.b_z ];

var _cx = world_tri_grid_b[# _current, world_tri.c_x ];
var _cy = world_tri_grid_b[# _current, world_tri.c_y ];
var _cz = world_tri_grid_b[# _current, world_tri.c_z ];

//Predeclaring these so things are neater to read in the loop
var _a_on_face = false;
var _b_on_face = false;
var _c_on_face = false;




//We know that faces adjacent to the current face are children of neighbours of the current face's parent
//Got that?
//Trust me, this makes more sense in a second.

//Find the parent of the current face
var _parent = world_tri_grid_b[# _current, world_tri.parent ];
//Find the parent's neighbours
var _parent_na = world_tri_grid_a[# _parent, world_tri.a_adj ];
var _parent_nb = world_tri_grid_a[# _parent, world_tri.b_adj ];
var _parent_nc = world_tri_grid_a[# _parent, world_tri.c_adj ];

//Grab the children of the parent's neighbours and add them to a list of faces we want to check
//We know nothing about the orientation of these faces so we have to check all nine
var _faces_to_check;
_faces_to_check[8] = world_tri_grid_a[# _parent_na, world_tri.a_chi ];
_faces_to_check[7] = world_tri_grid_a[# _parent_na, world_tri.b_chi ];
_faces_to_check[6] = world_tri_grid_a[# _parent_na, world_tri.c_chi ];

_faces_to_check[5] = world_tri_grid_a[# _parent_nb, world_tri.a_chi ];
_faces_to_check[4] = world_tri_grid_a[# _parent_nb, world_tri.b_chi ];
_faces_to_check[3] = world_tri_grid_a[# _parent_nb, world_tri.c_chi ];

_faces_to_check[2] = world_tri_grid_a[# _parent_nc, world_tri.a_chi ];
_faces_to_check[1] = world_tri_grid_a[# _parent_nc, world_tri.b_chi ];
_faces_to_check[0] = world_tri_grid_a[# _parent_nc, world_tri.c_chi ];


//Loop through all the faces we want to check
for( var _i = 0; _i < 9; _i++ ) {
    
    //Get the index of the actual face
    var _target = _faces_to_check[_i];
    
    //Getting data out of ds_list can be kinda slow. It's faster to work out if we need a computation than to just do it
    if ( _a_found and _c_found ) _a_on_face = false else _a_on_face = world_tri_find_point( _ax, _ay, _az,   world_tri_grid_b, _target );
    if ( _a_found and _b_found ) _b_on_face = false else _b_on_face = world_tri_find_point( _bx, _by, _bz,   world_tri_grid_b, _target );
    if ( _b_found and _c_found ) _c_on_face = false else _c_on_face = world_tri_find_point( _cx, _cy, _cz,   world_tri_grid_b, _target );
    
    //If the two faces (current and target) share two vertices, they must also share a face
    
    //If the two vertices are A+B then side A is common
    if ( _a_on_face and _b_on_face ) {
        
        //Change the current face's neighbour to the face we've just found, not forget to correct for the purging to follow
		world_tri_grid_b[# _current, world_tri.a_adj ] = _target;
        _a_found = true;
        _result++;
        
        if ( _result == 3 ) exit;
        
    }
    
    //Same for side B
    if ( _b_on_face and _c_on_face ) {
		
		world_tri_grid_b[# _current, world_tri.b_adj ] = _target;
        _b_found = true;
        _result++;
        
        if ( _result == 3 ) exit;
        
    }
    
    //And side C. Whilst it's probably neater to have all this as numerically indexable, it's faster to have it hard coded
    if ( _c_on_face and _a_on_face ) {
    
		world_tri_grid_b[# _current, world_tri.c_adj ] = _target;
        _c_found = true;
        _result++;
        
        if ( _result == 3 ) exit;
        
    }
    
}

//Error handling. Heaven forfend we get down here during normal operation
show_error( "Assignment error? 'result < 3' for " + string( _current ) + " (child of " + string( world_tri_grid_b[# _current, world_tri.parent ] ) + "). " + string( _a_found ) + "," + string( _b_found ) + "," + string( _c_found ), false );