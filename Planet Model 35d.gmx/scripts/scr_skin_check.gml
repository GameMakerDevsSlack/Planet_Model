///scr_skin_check()

if ( surface_get_width( sur_lighting ) != k_skin_size ) or ( surface_get_width( sur_lighting ) != k_skin_size ) or ( !surface_exists( sur_lighting ) ) {
    if ( surface_exists( sur_lighting ) ) surface_free( sur_lighting );
    scr_skin_init_lighting();
}

if ( surface_get_width( sur_military ) != k_skin_size ) or ( surface_get_width( sur_military ) != k_skin_size ) or ( !surface_exists( sur_military ) ) {
    if ( surface_exists( sur_military ) ) surface_free( sur_military );
    scr_skin_init_military();
}

if ( surface_get_width( sur_influence ) != k_skin_size ) or ( surface_get_width( sur_influence ) != k_skin_size ) or ( !surface_exists( sur_influence ) ) {
    if ( surface_exists( sur_influence ) ) surface_free( sur_influence );
    scr_skin_init_influence();
}

if ( surface_get_width( sur_economy ) != k_skin_size ) or ( surface_get_width( sur_economy ) != k_skin_size ) or ( !surface_exists( sur_economy ) ) {
    if ( surface_exists( sur_economy ) ) surface_free( sur_economy );
    scr_skin_init_economy();
}

if ( surface_get_width( sur_tech ) != k_skin_size ) or ( surface_get_width( sur_tech ) != k_skin_size ) or ( !surface_exists( sur_tech ) ) {
    if ( surface_exists( sur_tech ) ) surface_free( sur_tech );
    scr_skin_init_tech();
}
