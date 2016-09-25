///rgb_to_ryb_components( red, green, blue, lookup table, fine resolution )
//
//The RYB system uses cubic interpolation to find values within a cubic colour space. Don't worry, it confuses me too.
//Turning RYB values into RGB values (and HSV too) is fine but going back the other way is very difficult and differential equations are not my forte.
//Instead of trying to work out a deterministic connection going from RGB to RYB, not that I think one actually exists, this script fudges an answer.
//
//Firstly, the script uses a look-up table to find a coarse resolution answer contained in the (nested) list "ryb_matrix_list". It's a 3D array, effectively.
//Secondly, we do a search around that coarse value to get a precise answer, hopefully with an acceptible colour distance.
//
//This script assumes each nested list in the "ryb_matrix_list" data structure is of the same length i.e. it is a perfectly cubic 3D array. A script is provided that makes this table for you.
//This script is also pretty damn slow. Because the RYB-RGB conversion uses a lot of exponential functions, the fine resolution search should be used sparingly.
//
//The RYB components are returned in the globally scoped array "result_coord".



globalvar result_coord;

var rgb_r,        rgb_g,        rgb_b;
var rgb_r_real,   rgb_g_real,   rgb_b_real;
var ryb_r_coarse, ryb_y_coarse, ryb_b_coarse;
var ryb_r_fine,   ryb_y_fine,   ryb_b_fine;
var test_r,       test_y,       test_b;
var red,          yellow,       blue;
var red_list,     yellow_list,  blue_list;
var index, list;

var colour, dist, temp_dist;
var coarse_res, coarse_value, fine_res, fine_value;

//Set the RGB components for the script
rgb_r = argument0;
rgb_g = argument1;
rgb_b = argument2;

//Scale these components to a more standard configuration
rgb_r_real = rgb_r * 255;
rgb_g_real = rgb_g * 255;
rgb_b_real = rgb_b * 255;


red_list = argument3;
fine_res = argument4; //Set the fine resolution search

coarse_res = ds_list_size( red_list ); //Work out the resolution of the coarse look-up lists
coarse_value = 1 / coarse_res; //Number of colour units per coarse step

//Set the colour distance as being impossibly large
dist = 999999;

for( red = 0; red <= coarse_res; red++ ) {
    
    yellow_list = ds_list_find_value( red_list, red );
    
    for( yellow = 0; yellow <= coarse_res; yellow++ ) {
    
        blue_list = ds_list_find_value( yellow_list, yellow );
        
        for( blue = 0; blue <= coarse_res; blue++ ) {
            
            colour = ds_list_find_value( blue_list, blue );
            
            temp_dist = point_distance_3d( color_get_red( colour ), color_get_green( colour ), color_get_blue( colour ),    rgb_r_real, rgb_g_real, rgb_b_real );
            
            if ( temp_dist < dist ) {
                ryb_r_coarse = coarse_value * red;
                ryb_y_coarse = coarse_value * yellow;
                ryb_b_coarse = coarse_value * blue;
                dist = temp_dist;
            }
        }
    }
}

if ( fine_res <= 0 ) {
    
    result_coord[0] = ryb_r_coarse;
    result_coord[1] = ryb_y_coarse;
    result_coord[2] = ryb_b_coarse;
    
    exit;
    
}


fine_value = coarse_value / fine_res; //Number of colour units per fine step

ryb_r_fine = ryb_r_coarse;
ryb_y_fine = ryb_y_coarse;
ryb_b_fine = ryb_b_coarse;

for( red = -coarse_value; red <= coarse_value; red += fine_value ) {
    
    test_r = clamp( ryb_r_coarse + red, 0, 1 );
    
    for( yellow = -coarse_value; yellow <= coarse_value; yellow += fine_value ) {
        
        test_y = clamp( ryb_y_coarse + yellow, 0, 1 );
    
        for( blue = -coarse_value; blue <= coarse_value; blue += fine_value ) {
            
            test_b = clamp( ryb_b_coarse + blue, 0, 1 );
            
            colour = make_colour_ryb( test_r, test_y, test_b );
            
            temp_dist = point_distance_3d( color_get_red( colour ), color_get_green( colour ), color_get_blue( colour ),    rgb_r_real, rgb_g_real, rgb_b_real );
            
            if ( temp_dist < dist ) {
                ryb_r_fine = test_r;
                ryb_y_fine = test_y;
                ryb_b_fine = test_b;
                dist = temp_dist;
            }
        }
    }
}

result_coord[0] = ryb_r_fine;
result_coord[1] = ryb_y_fine;
result_coord[2] = ryb_b_fine;
