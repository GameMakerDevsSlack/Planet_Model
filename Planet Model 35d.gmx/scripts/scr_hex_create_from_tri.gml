///scr_hex_create_from_tris()
//Ok, so subdivide_all_faces() isn't the end of the journey. We're got a subdivided dodecahedron but that's not really what we're after.
//We're after hexagonal tiling (with 12 pentagons) and this script makes that possible.

//Search_stack loop takes "free" faces that have not been assigned a hex

var px, py, pz, search_face, hex_index;
var na, nb, nc, dir, target, fill_face;

 
    //px,py,pz are the coords of the centre of a hex
    px = ds_list_find_value( search_px_stack, 0 );
    py = ds_list_find_value( search_py_stack, 0 );
    pz = ds_list_find_value( search_pz_stack, 0 );
    
    //Search face is the hex that begins the fill process
    search_face = ds_list_find_value( search_face_stack, 0 );
    
    ds_list_delete( search_px_stack, 0 );
    ds_list_delete( search_py_stack, 0 );
    ds_list_delete( search_pz_stack, 0 );
    ds_list_delete( search_face_stack, 0 );
    
    ds_list_clear( fill_stack );
    
    if ( ds_list_find_value( lst_tri_hex, search_face ) == noone ) {
        hex_index = scr_hex_add();
        ds_list_add( fill_stack, search_face );
    }
    
    //The fill stack searches neighbours of the search face, finding every tile that shares px,py,pz as a vertex
    while( !ds_list_empty( fill_stack ) ) {
        
        fill_face = ds_list_find_value( fill_stack, 0 );
        ds_list_delete( fill_stack, 0 );
        
        na = ds_list_find_value( lst_tri_a_adj, fill_face );
        nb = ds_list_find_value( lst_tri_b_adj, fill_face );
        nc = ds_list_find_value( lst_tri_c_adj, fill_face );
        
        //Find the hexagon centre
        dir = scr_tri_find_point( px, py, pz, fill_face );
        
        //Link face and hex together
        scr_hex_add_tri( fill_face, dir, hex_index );
        
        switch ( dir ) {
            case 1: {
                target = nb;
                if ( ds_list_find_value( lst_tri_hex, nc ) == noone ) ds_list_add( fill_stack, nc );
                if ( ds_list_find_value( lst_tri_hex, na ) == noone ) ds_list_add( fill_stack, na );
                break;
            }
            case 2: {
                target = nc;
                if ( ds_list_find_value( lst_tri_hex, na ) == noone ) ds_list_add( fill_stack, na );
                if ( ds_list_find_value( lst_tri_hex, nb ) == noone ) ds_list_add( fill_stack, nb );
                break;
            }
            case 3: {
                target = na;
                if ( ds_list_find_value( lst_tri_hex, nb ) == noone ) ds_list_add( fill_stack, nb );
                if ( ds_list_find_value( lst_tri_hex, nc ) == noone ) ds_list_add( fill_stack, nc );
                break;
            }
            default: {
                target = noone;
                break;
            }
        }       
        
        
        //If this neighbour isn't already assigned
        if ( ds_list_find_value( lst_tri_hex, target ) == noone ) {
            
            //Work backwards from the neighbour to the fill face to get another value of px,py,pz for the neighbour's hexagon
            ds_list_add( search_face_stack, target );
            
            if ( ds_list_find_value( lst_tri_a_adj, target ) == fill_face ) { //AB
                ds_list_add( search_px_stack, ds_list_find_value( lst_tri_c_x, target ) );
                ds_list_add( search_py_stack, ds_list_find_value( lst_tri_c_y, target ) );
                ds_list_add( search_pz_stack, ds_list_find_value( lst_tri_c_z, target ) );
            }
            
            if ( ds_list_find_value( lst_tri_b_adj, target ) == fill_face ) { //BC
                ds_list_add( search_px_stack, ds_list_find_value( lst_tri_a_x, target ) );
                ds_list_add( search_py_stack, ds_list_find_value( lst_tri_a_y, target ) );
                ds_list_add( search_pz_stack, ds_list_find_value( lst_tri_a_z, target ) );
            }
            
            if ( ds_list_find_value( lst_tri_c_adj, target ) == fill_face ) { //CA
                ds_list_add( search_px_stack, ds_list_find_value( lst_tri_b_x, target ) );
                ds_list_add( search_py_stack, ds_list_find_value( lst_tri_b_y, target ) );
                ds_list_add( search_pz_stack, ds_list_find_value( lst_tri_b_z, target ) );
            }
            
        }
        
        
    }
