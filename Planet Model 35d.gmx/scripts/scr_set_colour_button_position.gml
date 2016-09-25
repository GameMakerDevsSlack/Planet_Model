///set_colour_button_position( instance, position )

with( argument0 ) {
    colour_value = argument1;
    window_local_x = min_x + colour_value * ( max_x - min_x );
    x = window_local_x + parent.window_screen_x;
}
