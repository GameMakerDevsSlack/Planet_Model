/// @param current

//A brute force neighbour assignment method. Scans every vertex pair to see if they match
//This was actually used as the main neighbour assignment strategy! Hah! .It was so slow.

//Create a count of successful matches. If things are going well, we should have exactly three for each face
var _result = 0;

//Make sure we know which face we're dealing with
var _current = argument0;

//Grabbing the vertices outside of the loop saves a bit of time
var _ax = world_tri_grid_a[# _current, world_tri.a_x ];
var _ay = world_tri_grid_a[# _current, world_tri.a_y ];
var _az = world_tri_grid_a[# _current, world_tri.a_z ];

var _bx = world_tri_grid_a[# _current, world_tri.b_x ];
var _by = world_tri_grid_a[# _current, world_tri.b_y ];
var _bz = world_tri_grid_a[# _current, world_tri.b_z ];

var _cx = world_tri_grid_a[# _current, world_tri.c_x ];
var _cy = world_tri_grid_a[# _current, world_tri.c_y ];
var _cz = world_tri_grid_a[# _current, world_tri.c_z ];

//Run through all the faces
var _count = world_tri_grid_a_count;
for( var _i = 0; _i < _count; _i++ ) {
    
    //Though skip past ourselves
    if ( _current == _i ) continue;
    
    //Could probably speed this up a bit. Not a priority compared to assign_face_neighbours
    var _a_on_face = world_tri_find_point( _ax, _ay, _az,   world_tri_grid_a, _i );
    var _b_on_face = world_tri_find_point( _bx, _by, _bz,   world_tri_grid_a, _i );
    var _c_on_face = world_tri_find_point( _cx, _cy, _cz,   world_tri_grid_a, _i );
	
    //If the two vertices are A+B then side A is common
    if ( _a_on_face and _b_on_face ) {
		world_tri_grid_a[# _current, world_tri.a_adj ] = _i;
        _result++; if ( _result == 3 ) exit;
    }
    
    //If the two vertices are B+C then side B is common
    if ( _b_on_face and _c_on_face ) {
		world_tri_grid_a[# _current, world_tri.b_adj ] = _i;
        _result++; if ( _result == 3 ) exit;
    }
    
    //If the two vertices are C+A then side C is common
    if ( _c_on_face and _a_on_face ) {
		world_tri_grid_a[# _current, world_tri.c_adj ] = _i;
        _result++; if ( _result == 3 ) exit;
    }
    
}

//We really shouldn't be able to get down here unless something's gone wrong
show_error( "Forcing error? 'result < 3' for " + string( _i ), false );