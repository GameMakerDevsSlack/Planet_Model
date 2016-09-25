///scr_skin_undo_lighting()

scr_draw_to_surface( sur_lighting );
draw_clear_alpha( c_sun_shadow, 0 );
surface_reset_target();
