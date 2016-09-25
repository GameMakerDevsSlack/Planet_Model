///scr_window_move( instance, screen x, screen y )
//
//Moves an internal window and recalculates its position relative to its parent

var inst;

inst = argument0;
inst.window_screen_x = argument1;
inst.window_screen_y = argument2;

with( inst ) {
    window_local_x = window_screen_x - parent.window_screen_x;
    window_local_y = window_screen_y - parent.window_screen_y;
    
    if ( parent.window_moveable ) or ( parent.window_closeable ) {
        window_local_x = clamp( window_local_x, 0, parent.window_width - window_width );
        window_local_y = clamp( window_local_y, 0, parent.window_height - 20 );
    }
}
