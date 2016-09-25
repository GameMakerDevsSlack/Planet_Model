///ryb_to_green( red, yellow, blue )

var red = argument0;
var yellow = argument1;
var blue = argument2;

var x0 = cubic_interpolation( blue, color_get_green( c_ryb_magic_white  ), color_get_green( c_ryb_magic_blue   ) );   // white r -> blue r
var x1 = cubic_interpolation( blue, color_get_green( c_ryb_magic_yellow ), color_get_green( c_ryb_magic_green  ) );   // yellow r -> green r
var x2 = cubic_interpolation( blue, color_get_green( c_ryb_magic_red    ), color_get_green( c_ryb_magic_purple ) );   // red r -> purple r
var x3 = cubic_interpolation( blue, color_get_green( c_ryb_magic_orange ), color_get_green( c_ryb_magic_black  ) );   // orange r -> black r

var y0 = cubic_interpolation( yellow, x0, x1 );
var y1 = cubic_interpolation( yellow, x2, x3 );

return ceil( cubic_interpolation( red, y0, y1 ) );
