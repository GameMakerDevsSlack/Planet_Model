///ryb_create_lookup_table( resolution )

var red,      yellow,      blue;
var red_list, yellow_list, blue_list;
var coarse_res, coarse_value;
var list;

coarse_res = argument0;
coarse_value = 1 / coarse_res;

red_list = ds_list_create();

for( red = 0; red <= 1; red += coarse_value ) {
    
    yellow_list = ds_list_create();
    ds_list_add( red_list, yellow_list );
    
    for( yellow = 0; yellow <= 1; yellow += coarse_value ) {
        
        blue_list = ds_list_create();
        ds_list_add( yellow_list, blue_list );
        
        for( blue = 0; blue <= 1; blue += coarse_value ) {
            
            ds_list_add( blue_list, make_colour_ryb( red, yellow, blue ) );
            
        }
    }
}

return red_list;
