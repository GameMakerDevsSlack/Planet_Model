//Ok, so subdivide_all_faces() isn't the end of the journey. We're got a subdivided dodecahedron but that's not really what we're after.
//We're after hexagonal tiling (with 12 pentagons) and this script makes that possible.

//Search_stack loop takes "free" faces that have not been assigned a hex

//Search face is the hex that begins the fill process
var _search_face = search_face_stack[| 0 ];
//px,py,pz are the coords of the centre of a hex, and the corner of each triangle
var _px = search_px_stack[| 0 ];
var _py = search_py_stack[| 0 ];
var _pz = search_pz_stack[| 0 ];
    
ds_list_delete( search_px_stack, 0 );
ds_list_delete( search_py_stack, 0 );
ds_list_delete( search_pz_stack, 0 );
ds_list_delete( search_face_stack, 0 );
    
ds_list_clear( fill_stack );
    
if ( world_tri_grid_a[# _search_face, world_tri.hex ] == noone ) {
    var _hex_index = world_hex_add();
    ds_list_add( fill_stack, _search_face );
}
    
//The fill stack searches neighbours of the search face, finding every tile that shares px,py,pz as a vertex
while( !ds_list_empty( fill_stack ) ) {
    
    var _fill_face = fill_stack[| 0 ];
    ds_list_delete( fill_stack, 0 );
        
    var _na = world_tri_grid_a[# _fill_face, world_tri.a_adj ];
    var _nb = world_tri_grid_a[# _fill_face, world_tri.b_adj ];
    var _nc = world_tri_grid_a[# _fill_face, world_tri.c_adj ];
    
    //Find the hexagon centre
    var _dir = world_tri_find_point( _px, _py, _pz,   world_tri_grid_a, _fill_face );
        
    //Link face and hex together
    world_hex_add_tri( _fill_face, _dir, _hex_index );
        
    switch ( _dir ) {
        case 1: {
            var _target = _nb;
            if ( world_tri_grid_a[# _nc, world_tri.hex ] == noone ) ds_list_add( fill_stack, _nc );
            if ( world_tri_grid_a[# _na, world_tri.hex ] == noone ) ds_list_add( fill_stack, _na );
            break;
        }
        case 2: {
            var _target = _nc;
            if ( world_tri_grid_a[# _na, world_tri.hex ] == noone ) ds_list_add( fill_stack, _na );
            if ( world_tri_grid_a[# _nb, world_tri.hex ] == noone ) ds_list_add( fill_stack, _nb );
            break;
        }
        case 3: {
            var _target = _na;
            if ( world_tri_grid_a[# _nb, world_tri.hex ] == noone ) ds_list_add( fill_stack, _nb );
            if ( world_tri_grid_a[# _nc, world_tri.hex ] == noone ) ds_list_add( fill_stack, _nc );
            break;
        }
        default: {
            var _target = noone;
            break;
        }
    }       
        
        
    //If this neighbour isn't already assigned
    if ( world_tri_grid_a[# _target, world_tri.hex ] == noone ) {
            
        //Work backwards from the neighbour to the fill face to get another value of px,py,pz for the neighbour's hexagon
        ds_list_add( search_face_stack, _target );
            
        if ( world_tri_grid_a[# _target, world_tri.a_adj ] == _fill_face ) { //AB
            ds_list_add( search_px_stack, world_tri_grid_a[# _target, world_tri.c_x ] );
            ds_list_add( search_py_stack, world_tri_grid_a[# _target, world_tri.c_y ] );
            ds_list_add( search_pz_stack, world_tri_grid_a[# _target, world_tri.c_z ] );
        }
        
        if ( world_tri_grid_a[# _target, world_tri.b_adj ] == _fill_face ) { //BC
            ds_list_add( search_px_stack, world_tri_grid_a[# _target, world_tri.a_x ] );
            ds_list_add( search_py_stack, world_tri_grid_a[# _target, world_tri.a_y ] );
            ds_list_add( search_pz_stack, world_tri_grid_a[# _target, world_tri.a_z ] );
        }
            
        if ( world_tri_grid_a[# _target, world_tri.c_adj ] == _fill_face ) { //CA
            ds_list_add( search_px_stack, world_tri_grid_a[# _target, world_tri.b_x ] );
            ds_list_add( search_py_stack, world_tri_grid_a[# _target, world_tri.b_y ] );
            ds_list_add( search_pz_stack, world_tri_grid_a[# _target, world_tri.b_z ] );
        }
            
    }
    
}