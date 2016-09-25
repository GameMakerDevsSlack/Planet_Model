///scr_tri_subdivide( triangle )
//The heart and soul of the entire operation. Makes faces where there were none before, whilst retaining the even tiling
//I wish I had come up with this method
//This is an abstraction of subdivide_all_faces()


var index;
var ax, ay, az,   bx, by, bz,   cx, cy, cz,   centre_x, centre_y, centre_z,   na, nb, nc,   index_a, index_b, index_c;

index = argument0;
    
    //Get the vertex coordinates
    var ax = ds_list_find_value( lst_tri_a_x, index );
    var ay = ds_list_find_value( lst_tri_a_y, index );
    var az = ds_list_find_value( lst_tri_a_z, index );
    
    var bx = ds_list_find_value( lst_tri_b_x, index );
    var by = ds_list_find_value( lst_tri_b_y, index );
    var bz = ds_list_find_value( lst_tri_b_z, index );
    
    var cx = ds_list_find_value( lst_tri_c_x, index );
    var cy = ds_list_find_value( lst_tri_c_y, index );
    var cz = ds_list_find_value( lst_tri_c_z, index );
    
    //And the central point
    var centre_x = ds_list_find_value( lst_tri_centre_x, index );
    var centre_y = ds_list_find_value( lst_tri_centre_y, index );
    var centre_z = ds_list_find_value( lst_tri_centre_z, index );
    
    //Find the neighbours. We create one new triangle per side such that neighbours create interlocking new faces
    var na = ds_list_find_value( lst_tri_a_adj, index );
    var nb = ds_list_find_value( lst_tri_b_adj, index );
    var nc = ds_list_find_value( lst_tri_c_adj, index );
    
    //Vertex order here is very important because everything needs to have directionality preserved to avoid clashes during subdivision
    var index_a = scr_tri_add( centre_x, centre_y, centre_z,
                               ax, ay, az,
                               ds_list_find_value( lst_tri_centre_x, na ),  ds_list_find_value( lst_tri_centre_y, na ),  ds_list_find_value( lst_tri_centre_z, na ),
                               index );
    
    var index_b = scr_tri_add( centre_x, centre_y, centre_z,
                               bx, by, bz,
                               ds_list_find_value( lst_tri_centre_x, nb ),  ds_list_find_value( lst_tri_centre_y, nb ),  ds_list_find_value( lst_tri_centre_z, nb ),
                               index );
    
    var index_c = scr_tri_add( centre_x, centre_y, centre_z,
                               cx, cy, cz,
                               ds_list_find_value( lst_tri_centre_x, nc ),  ds_list_find_value( lst_tri_centre_y, nc ),  ds_list_find_value( lst_tri_centre_z, nc ),
                               index );
    
    //Keep a record in the parent of where the children are. This is crucial for assign_face_neighbours
    ds_list_replace( lst_tri_a_child, index, index_a );
    ds_list_replace( lst_tri_b_child, index, index_b );
    ds_list_replace( lst_tri_c_child, index, index_c );
