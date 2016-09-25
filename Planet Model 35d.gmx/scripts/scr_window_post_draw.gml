///window_post_draw()
//Performs post-drawing behaviour

var i, inst;

draw_set_color( c_white );
draw_set_halign( fa_left );
draw_set_valign( fa_top );

d3d_transform_set_identity();
scr_draw_to_surface( window_surface );

draw_set_color( c_window_border );
texture_set_interpolation( false );
draw_rectangle( 0, 0, window_width - 1, window_height - 1, true );
texture_set_interpolation( true );

/*
//Draw the movement bar
if ( window_moveable ) {
    texture_set_interpolation( false );
    if ( window_move_down ) draw_set_color( c_button_down ) else if ( window_move_over ) draw_set_color( c_button_over ) else draw_set_color( c_button_background );
    draw_rectangle( 0, 0, window_width, 20, false );
    draw_set_color( c_button_border );
    draw_rectangle( 0, 0, window_width, 20, true );
    draw_set_color( c_white );
    texture_set_interpolation( true );
}
*/

//Draw the buttons
for( i = 0; i < ds_list_size( window_buttons ); i++ ) {
    
    inst = ds_list_find_value( window_buttons, i );
    with( inst ) event_user( 2 );
    
}

surface_reset_target();

//Execute the custom draw event for each of the children
for( i = 0; i < ds_list_size( window_children ); i++ ) {
    
    inst = ds_list_find_value( window_children, i );
    with( inst ) event_user( 2 );
    
    scr_draw_to_surface( window_surface );
    draw_surface( inst.window_surface, inst.window_local_x, inst.window_local_y );
    
    if ( k_window_drop_shadow_alpha > 0 ) {
        draw_set_alpha( k_window_drop_shadow_alpha );
        draw_set_color( c_black );
        draw_rectangle( inst.window_local_x + k_window_drop_shadow_size, inst.window_local_y + inst.window_height, inst.window_local_x + inst.window_width - 1, inst.window_local_y + inst.window_height + k_window_drop_shadow_size, false );
        draw_rectangle( inst.window_local_x + inst.window_width, inst.window_local_y + k_window_drop_shadow_size, inst.window_local_x + inst.window_width + k_window_drop_shadow_size - 1, inst.window_local_y + inst.window_height + k_window_drop_shadow_size, false );
        draw_set_alpha( 1 );
        draw_set_color( c_white );
    }
    
    surface_reset_target();
}
