///scr_skin_init_influence()

sur_influence = surface_create( k_skin_size, k_skin_size );

scr_draw_to_surface( sur_influence );
draw_clear_alpha( c_space, 0 );
surface_reset_target();
