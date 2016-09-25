///scr_change_layer( layer )

switch( argument0 ) {
    
    case k_tech: {
        
        if ( instance_exists( wnd_toolbar_tech ) ) scr_window_close( wnd_toolbar_tech ) else {
            scr_window_close( par_toolbar );
            scr_window_create( wnd_toolbar_tech, obj_window_layer, noone, noone, noone, noone );
        }
        
        break;
    }
    case k_economy: {
        
        if ( instance_exists( wnd_toolbar_economy ) ) scr_window_close( wnd_toolbar_economy ) else {
            scr_window_close( par_toolbar );
            scr_window_create( wnd_toolbar_economy, obj_window_layer, noone, noone, noone, noone );
        }
        
        break;
    }
    case k_influence: {
        
        if ( instance_exists( wnd_toolbar_influence ) ) scr_window_close( wnd_toolbar_influence ) else {
            scr_window_close( par_toolbar );
            scr_window_create( wnd_toolbar_influence, obj_window_layer, noone, noone, noone, noone );
        }
        
        break;
    }
    case k_military: {
        
        if ( instance_exists( wnd_toolbar_military ) ) scr_window_close( wnd_toolbar_military ) else {
            scr_window_close( par_toolbar );
            scr_window_create( wnd_toolbar_military, obj_window_layer, noone, noone, noone, noone );
        }
        
        break;
    }
    default: { //physical
        
        if ( instance_exists( wnd_toolbar_physical ) ) scr_window_close( wnd_toolbar_physical ) else {
            scr_window_close( par_toolbar );
            scr_window_create( wnd_toolbar_physical, obj_window_layer, noone, noone, noone, noone );
        }
        
        break;
    }
}

if ( obj_camera.camera_prev_layer_view != argument0 ) and ( obj_camera.camera_layer_transition == 0 ) {
    obj_camera.camera_layer_transition = 0.01;
    obj_camera.camera_layer_view = argument0;
}
