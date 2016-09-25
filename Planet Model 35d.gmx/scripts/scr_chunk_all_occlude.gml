///scr_model_occlude_chunks()

var chunk, result, xx, yy, zz, cam_x, cam_y, cam_z, value, vtx;

cam_x = obj_camera.camera_x;
cam_y = obj_camera.camera_y;
cam_z = obj_camera.camera_z;

d3d_transform_set_identity();
d3d_transform_add_rotation_axis( obj_camera.camera_quat_a, obj_camera.camera_quat_b, obj_camera.camera_quat_c, obj_camera.camera_quat_d );
d3d_transform_add_translation( 0, 0, cam_z * k_occlusion_margin );

for( chunk = 0; chunk < k_chunks; chunk++ ) {
    
    xx = ds_list_find_value( lst_chunk_x, chunk );
    yy = ds_list_find_value( lst_chunk_y, chunk );
    zz = ds_list_find_value( lst_chunk_z, chunk );
    
    vtx = d3d_transform_vertex( xx, yy, zz );
    
    xx = vtx[0];
    yy = vtx[1];
    zz = vtx[2];
    
    if ( dot_product_3d( xx, yy, zz,   cam_x, cam_y, cam_z ) < 0 ) result = false else result = true;
    
    ds_list_replace( lst_chunk_visible, chunk, result );
    
}

d3d_transform_set_identity();
