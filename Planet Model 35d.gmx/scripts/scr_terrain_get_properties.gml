///scr_terrain_get_properties( height, temperature, wetness );
//Returns a colour. result_coord[0] contains whether or not the tile has trees

globalvar result_coord;

var result = c_fuchsia; //A debug colour
var feature = k_feature_empty; //Default to no trees

var height = argument0;
var temperature = argument1;
var wetness = argument2;

if ( height == 0 ) result = c_ocean else
if ( height <= 0.2 ) result = c_coast else {
    if ( height >= 0.8 ) {
        if ( temperature == 0 ) result = c_ice else result = c_mountain;
    } else if ( temperature == 0 ) {
        result = c_ice;
    } else if ( temperature == 0.33 ) {
        result = c_tundra;
        
        if (wetness == 0.5 ) {
            feature = choose( k_feature_empty, k_feature_tree );
        } else if (wetness == 1 ) {
            result = c_wet;
            feature = k_feature_tree;
        }
        
    } else if ( temperature == 0.66 ) {
        
        if (wetness == 0 ) {
            result = c_temperate;
            feature = choose( k_feature_empty, k_feature_empty, k_feature_empty, k_feature_tree );
        } else if (wetness == 0.5 ) {
            result = c_temperate;
            feature = choose( k_feature_empty, k_feature_empty, k_feature_tree );
        } else if (wetness == 1 ) {
            result = c_wet;
            feature = k_feature_tree;
        }
        
    } else if ( temperature == 1 ) {
        
        if (wetness == 0 ) {
            result = c_arid;
        } else if (wetness == 0.5 ) {
            result = c_arid;
            feature = choose( k_feature_empty, k_feature_tree );
        } else if (wetness == 1 ) {
            result = c_temperate;
            feature = k_feature_tree;
        }
        
    }
}
    
result_coord[0] = feature;
return result;
