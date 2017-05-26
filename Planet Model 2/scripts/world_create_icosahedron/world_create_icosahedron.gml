//Create 20 points in data structures created by init_face_lists() in the shape of a dodecahedron
//This took so long to get right
//http://mathworld.wolfram.com/Dodecahedron.html was super helpful

//Trust me on this
var _side_length  = 1.051;  //sqrt( 50 - 10 * sqrt( 5 ) ) / 5;
var _layer_radius = 0.8944; //0.4 * sqrt( 5 );
var _layer_height = 0.4472; //0.2 * sqrt( 5 );
var _vertex_rot = 72;       //360 / 5;

//Make sure these arrays go away when we're done
var _vertex_x;
var _vertex_y;
var _vertex_z;

//This gives us the locations of the first "ring" of points
for( var _i = 0; _i < 5; _i++ ) { //0 -> 4
    _vertex_x[_i] = lengthdir_x( _layer_radius, _i * _vertex_rot ) * world_scale;
    _vertex_y[_i] = _layer_height                                  * world_scale;
    _vertex_z[_i] = lengthdir_y( _layer_radius, _i * _vertex_rot ) * world_scale;
}

//And this, the second ring. Note annotations to remind me that 5 + 5 = 10
for( var _i = 0; _i < 5; _i++ ) { //5 -> 9
    _vertex_x[_i + 5] = lengthdir_x( -_layer_radius, _i * _vertex_rot ) * world_scale;
    _vertex_y[_i + 5] = -_layer_height                                  * world_scale;
    _vertex_z[_i + 5] = lengthdir_y( -_layer_radius, _i * _vertex_rot ) * world_scale;
}

//The order of these coordinates was completely trial and error
for( var _i = 0; _i < 5; _i++ ) { //Construct top faces, 0 -> 4
    var _next_i = ( _i + 1 ) mod 5;
    world_tri_add( _vertex_x[_i], _vertex_y[_i], _vertex_z[_i],
                   0, world_scale, 0,
                   _vertex_x[_next_i], _vertex_y[_next_i], _vertex_z[_next_i],
                   noone );
}

//I though I got these ones right, then I had to go back and mess with them again
for( var _i = 0; _i < 5; _i++ ) { //Construct upper waist, 5 -> 9
    var _next_i = ( _i + 1 ) mod 5;
    var _bottom_i = ( ( _i + 3 ) mod 5 ) + 5;
    world_tri_add( _vertex_x[_bottom_i], _vertex_y[_bottom_i], _vertex_z[_bottom_i],
                   _vertex_x[_i], _vertex_y[_i], _vertex_z[_i],
                   _vertex_x[_next_i], _vertex_y[_next_i], _vertex_z[_next_i],
                   noone );
}

//Definitely trial and error
for( var _i = 0; _i < 5; _i++ ) { //Construct lower waist, 10 -> 14
    var _my_i = _i + 5;
    var _next_i = ( ( _i + 1 ) mod 5 ) + 5;
    var _top_i = ( ( _i + 3 ) mod 5 );
    world_tri_add( _vertex_x[_top_i ], _vertex_y[_top_i] , _vertex_z[_top_i ],
                   _vertex_x[_next_i], _vertex_y[_next_i], _vertex_z[_next_i],
                   _vertex_x[_my_i  ], _vertex_y[_my_i  ], _vertex_z[_my_i  ],
                   noone );
}

//And the last set of faces - trial and error, I assure you
for( var _i = 0; _i < 5; _i++ ) { //Construct bottom faces, 15 -> 19
    var _my_i = _i + 5;
    var _next_i = ( ( _i + 1 ) mod 5 ) + 5;
    world_tri_add( _vertex_x[_next_i], _vertex_y[_next_i], _vertex_z[_next_i],
                   0, -world_scale, 0,
                   _vertex_x[_my_i], _vertex_y[_my_i], _vertex_z[_my_i],
                   noone );
}

//I did originally have it to that the faces were hard-coded to know where each other were
//That made this entire script horrible to read - this acted as a test of force_assign_face_neighbours() anyway
for( var _i = 0; _i < 20; _i++ ) world_tri_force_neighbours( _i );