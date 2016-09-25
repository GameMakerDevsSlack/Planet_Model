///scr_skin_init_lighting()

sur_lighting = surface_create( k_skin_size, k_skin_size );

scr_draw_to_surface( sur_lighting );
draw_clear_alpha( c_sun_shadow, 0 );
surface_reset_target();
