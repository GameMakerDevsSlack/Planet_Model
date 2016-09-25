scr_draw_to_surface( window_surface );
draw_set_alpha( 1 );
draw_clear_alpha( c_window_background, k_window_background_alpha );
d3d_transform_set_identity();
d3d_transform_add_translation( -window_scroll_x_offset * window_scroll_x_scale, -window_scroll_y_offset * window_scroll_y_scale, 0 );
