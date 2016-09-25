///scr_projection_camera()
//
//Sets the d3d projection to the camera settings defined in obj_camera
//Used to keep consistency across the code base

with( obj_camera ) d3d_set_projection_ext( camera_x, camera_y, camera_z,   0, 0, -k_world_scale,    0,1,0,    camera_view_ang, view_wview[0] / view_hview[0],    1, 50000 );
