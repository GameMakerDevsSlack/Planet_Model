///scr_terrain_add_wetness( hex, near radius, far radius )

var wetness_short_radius, wetness_long_radius, index, height;

index = argument0;
wetness_short_radius = argument1;
wetness_long_radius = argument2;
    
height = ds_list_find_value( lst_terrain_height, index );

if ( height < water_height ) {
    scr_hex_neighbours_add( lst_terrain_wetness, index, 1, wetness_long_radius );
    scr_hex_neighbours_add( lst_terrain_wetness, index, 1, wetness_short_radius );
}

ds_list_add_to( lst_terrain_wetness, index, random( 0.4 ) );
