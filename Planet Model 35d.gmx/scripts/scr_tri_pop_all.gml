///scr_tri_pop_all()
//Forces all faces to adopt a convex shape. Kinda KYSIWYG

for( var i = 0; i < ds_list_size( lst_tri_a_x ); i++ ) {
    
    var xx = ds_list_find_value( lst_tri_a_x, i );
    var yy = ds_list_find_value( lst_tri_a_y, i );
    var zz = ds_list_find_value( lst_tri_a_z, i );
    
    var rad = point_distance_3d( 0, 0, 0,   xx, yy, zz );
    var ratio = k_world_scale / rad;
    
    ds_list_replace( lst_tri_a_x, i, xx * ratio );
    ds_list_replace( lst_tri_a_y, i, yy * ratio );
    ds_list_replace( lst_tri_a_z, i, zz * ratio );
    
    
    var xx = ds_list_find_value( lst_tri_b_x, i );
    var yy = ds_list_find_value( lst_tri_b_y, i );
    var zz = ds_list_find_value( lst_tri_b_z, i );
    
    var rad = point_distance_3d( 0, 0, 0,   xx, yy, zz );
    var ratio = k_world_scale / rad;
    
    ds_list_replace( lst_tri_b_x, i, xx * ratio );
    ds_list_replace( lst_tri_b_y, i, yy * ratio );
    ds_list_replace( lst_tri_b_z, i, zz * ratio );
    
    
    var xx = ds_list_find_value( lst_tri_c_x, i );
    var yy = ds_list_find_value( lst_tri_c_y, i );
    var zz = ds_list_find_value( lst_tri_c_z, i );
    
    var rad = point_distance_3d( 0, 0, 0,   xx, yy, zz );
    var ratio = k_world_scale / rad;
    
    ds_list_replace( lst_tri_c_x, i, xx * ratio );
    ds_list_replace( lst_tri_c_y, i, yy * ratio );
    ds_list_replace( lst_tri_c_z, i, zz * ratio );
    
    
    var xx = ds_list_find_value( lst_tri_centre_x, i );
    var yy = ds_list_find_value( lst_tri_centre_y, i );
    var zz = ds_list_find_value( lst_tri_centre_z, i );
    
    var rad = point_distance_3d( 0, 0, 0,   xx, yy, zz );
    var ratio = k_world_scale / rad;
    
    ds_list_replace( lst_tri_centre_x, i, xx * ratio );
    ds_list_replace( lst_tri_centre_y, i, yy * ratio );
    ds_list_replace( lst_tri_centre_z, i, zz * ratio );
    
}
