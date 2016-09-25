///scr_window_update_position()
//Realigns the window children and attached buttons

var i, inst, target;

target = argument0;

with( target ) {
    
    //Update the positions of child windows
    for( i = 0; i < ds_list_size( window_children ); i++ ) {
        inst = ds_list_find_value( window_children, i );
        
        with( inst ) {
            window_screen_x = parent.window_screen_x + window_local_x;
            window_screen_y = parent.window_screen_y + window_local_y;
        }
    }
    
    //Update the positions of buttons
    for( i = 0; i < ds_list_size( window_buttons ); i++ ) {
        inst = ds_list_find_value( window_buttons, i );
        
        with( inst ) {
            x = parent.window_screen_x + window_local_x;
            y = parent.window_screen_y + window_local_y;
        }
    }

}
