///scr_tri_dodecahedron()
//Create 20 points in data structures created by init_face_lists() in the shape of a dodecahedron
//This took so long to get right
//http://mathworld.wolfram.com/Dodecahedron.html was super helpful

//Trust me on this
var side_length  = 1.051;  //sqrt( 50 - 10 * sqrt( 5 ) ) / 5;
var layer_radius = 0.8944; //0.4 * sqrt( 5 );
var layer_height = 0.4472; //0.2 * sqrt( 5 );
var vertex_rot = 72;       //360 / 5;

//Make sure these arrays go away when we're done
var vertex_x;
var vertex_y;
var vertex_z;

//This gives us the locations of the first "ring" of points
for( var i = 0; i < 5; i++ ) { //0 -> 4
    vertex_x[i] = lengthdir_x( layer_radius, i * vertex_rot ) * k_world_scale;
    vertex_y[i] = layer_height                                * k_world_scale;
    vertex_z[i] = lengthdir_y( layer_radius, i * vertex_rot ) * k_world_scale;
}

//And this, the second ring. Note annotations to remind me that 5 + 5 = 10
for( var i = 0; i < 5; i++ ) { //5 -> 9
    vertex_x[i + 5] = lengthdir_x( -layer_radius, i * vertex_rot ) * k_world_scale;
    vertex_y[i + 5] = -layer_height                                * k_world_scale;
    vertex_z[i + 5] = lengthdir_y( -layer_radius, i * vertex_rot ) * k_world_scale;
}

//The order of these coordinates was completely trial and error
for( var i = 0; i < 5; i++ ) { //Construct top faces, 0 -> 4
    var next_i = ( i + 1 ) mod 5;
    scr_tri_add( vertex_x[i], vertex_y[i], vertex_z[i],
                 0, k_world_scale, 0,
                 vertex_x[next_i], vertex_y[next_i], vertex_z[next_i],
                 noone );
}

//I though I got these ones right, then I had to go back and mess with them again
for( var i = 0; i < 5; i++ ) { //Construct upper waist, 5 -> 9
    var next_i = ( i + 1 ) mod 5;
    var bottom_i = ( ( i + 3 ) mod 5 ) + 5;
    scr_tri_add( vertex_x[bottom_i], vertex_y[bottom_i], vertex_z[bottom_i],
                 vertex_x[i], vertex_y[i], vertex_z[i],
                 vertex_x[next_i], vertex_y[next_i], vertex_z[next_i],
                 noone );
}

//Definitely trial and error
for( var i = 0; i < 5; i++ ) { //Construct lower waist, 10 -> 14
    var my_i = i + 5;
    var next_i = ( ( i + 1 ) mod 5 ) + 5;
    var top_i = ( ( i + 3 ) mod 5 );
    scr_tri_add( vertex_x[top_i], vertex_y[top_i], vertex_z[top_i],
                 vertex_x[next_i], vertex_y[next_i], vertex_z[next_i],
                 vertex_x[my_i], vertex_y[my_i], vertex_z[my_i],
                 noone );
}

//And the last set of faces - trial and error, I assure you
for( var i = 0; i < 5; i++ ) { //Construct bottom faces, 15 -> 19
    var my_i = i + 5;
    var next_i = ( ( i + 1 ) mod 5 ) + 5;
    scr_tri_add( vertex_x[next_i], vertex_y[next_i], vertex_z[next_i],
                 0, -k_world_scale, 0,
                 vertex_x[my_i], vertex_y[my_i], vertex_z[my_i],
                 noone );
}

//I did originally have it to that the faces were hard-coded to know where each other were
//That made this entire script horrible to read - this acted as a test of force_assign_face_neighbours() anyway
for( var i = 0; i < ds_list_size( lst_tri_a_x ); i++ ) scr_tri_force_neighbours( i );
