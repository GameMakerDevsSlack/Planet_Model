///scr_projection_2d( surface )
//
//Sets the d3d projection to the camera settings defined in obj_camera
//Used to keep consistency across the code base

if ( argument0 == noone ) d3d_set_projection_ortho( 0, 0, view_wview[0], view_hview[0], 0 );
else d3d_set_projection_ortho( 0, 0, surface_get_width( argument0 ), surface_get_height( argument0 ), 0 );
