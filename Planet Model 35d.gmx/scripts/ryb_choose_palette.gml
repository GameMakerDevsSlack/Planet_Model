///ryb_choose_palette( index )

globalvar c_ryb_magic_white;
globalvar c_ryb_magic_yellow;
globalvar c_ryb_magic_red;
globalvar c_ryb_magic_orange;

globalvar c_ryb_magic_blue;
globalvar c_ryb_magic_green;
globalvar c_ryb_magic_purple;
globalvar c_ryb_magic_black;

switch( argument0 ) {

    case 0: {
        //After Gossett & Chen
        c_ryb_magic_white  = make_color_rgb( 255, 255, 255 );
        c_ryb_magic_yellow = make_color_rgb( 255, 255,   0 );
        c_ryb_magic_red    = make_color_rgb( 255,   0,   0 );
        c_ryb_magic_orange = make_color_rgb( 255, 127,   0 );
        
        c_ryb_magic_blue   = make_color_rgb(  42,  95, 153 );
        c_ryb_magic_green  = make_color_rgb(   0, 168,  51 );
        c_ryb_magic_purple = make_color_rgb( 127,   0, 127 );
        c_ryb_magic_black  = make_color_rgb(  51,  24,   0 );
        
        break;
    }
    
    case 1: {
        // "Farbkreis", after Itten
        c_ryb_magic_white  = make_color_rgb( 255, 252, 255 );
        c_ryb_magic_yellow = make_color_rgb( 244, 229,   0 );
        c_ryb_magic_red    = make_color_rgb( 227,  35,  34 );
        c_ryb_magic_orange = make_color_rgb( 241, 145,   1 );
        
        c_ryb_magic_blue   = make_color_rgb(  38, 113, 178 );
        c_ryb_magic_green  = make_color_rgb(   0, 142,  91 );
        c_ryb_magic_purple = make_color_rgb( 109,  56, 137 );
        c_ryb_magic_black  = make_color_rgb(  51,  24,   0 );
        
        break;
    }
    
    case 2: {
        // Juju's own custom palette
        c_ryb_magic_white  = make_color_rgb( 255, 252, 230 );
        c_ryb_magic_yellow = make_color_rgb( 255, 244,  51 );
        c_ryb_magic_red    = make_color_rgb( 242,  20,  33 );
        c_ryb_magic_orange = make_color_rgb( 241, 158,  28 );
        
        c_ryb_magic_blue   = make_color_rgb(  38, 113, 227 );
        c_ryb_magic_green  = make_color_rgb(   0, 142,  74 );
        c_ryb_magic_purple = make_color_rgb( 115,  66, 156 );
        c_ryb_magic_black  = make_color_rgb(  20,  12,   0 );
        
        break;
    }

    case 3: {
        // Pure colours
        c_ryb_magic_white  = make_color_rgb( 255, 255, 255 );
        c_ryb_magic_yellow = make_color_rgb( 255, 255,   0 );
        c_ryb_magic_red    = make_color_rgb( 255,   0,   0 );
        c_ryb_magic_orange = make_color_rgb( 255, 128,   0 );
        
        c_ryb_magic_blue   = make_color_rgb(   0,   0, 255 );
        c_ryb_magic_green  = make_color_rgb(   0, 255,   0 );
        c_ryb_magic_purple = make_color_rgb( 255,   0, 128 );
        c_ryb_magic_black  = make_color_rgb(   0,   0,   0 );
        
        break;
    }
}
