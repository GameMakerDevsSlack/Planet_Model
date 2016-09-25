///scr_model_chunk_features( chunk )

var model, colour, dark_colour, i, height, chunk, start, limit, feature, tree, u, v;
var i, j, hex, temp_scale, xx, yy, zz, r, phi, theta, temp, model, ran_dist, ran_dist, end_scale;

chunk = argument0;
hex_list = ds_list_find_value( lst_chunk_hex_list, chunk );

model = ds_list_find_value( lst_model_features, chunk );
d3d_model_clear( model );

for( i = 0; i < ds_list_size( hex_list ); i++ ) {
    
    hex = ds_list_find_value( hex_list, i );
    
    u = scr_hex_texture_u( hex );
    v = scr_hex_texture_v( hex );
    
    feature = ds_list_find_value( lst_terrain_feature, hex );
    tree = ds_list_find_value( lst_terrain_tree, hex );
    
    if ( feature != k_feature_empty ) or ( tree != k_feature_empty ) {
        
        temp = ds_list_find_value( lst_terrain_tempr, hex );
            
        random_set_seed( ds_list_find_value( lst_terrain_seed, hex) );
        
    } else continue;
    
    if ( feature == k_feature_empty ) {
        if ( tree == k_feature_tree ) {
            
            for( j = 0; j < k_tree_repeats; j++ ) {
                
                ran_dist = k_tree_scale * ( random_range( 2, 3.5 ) );
                ran_dir = ( j - random_range( 0.8, 1.2 ) ) / k_tree_repeats * 360;
        
                d3d_transform_set_identity();
                d3d_transform_add_rotation_y( random( 360 ) );
                d3d_transform_add_translation( lengthdir_x( ran_dist, ran_dir ), 0, lengthdir_y( ran_dist, ran_dir ) );
                d3d_add_transform_to_hex( hex );
                
                if ( temp == 0.33 ) {
                    
                    scr_model_add_tree_trunk( model, k_tree_scale * 0.8, k_tree_scale * 2, c_mahogany, u, v );
                    scr_model_add_conifer_leaves( model, k_tree_scale * 2  , k_tree_scale * 5,   k_tree_scale * 2, c_conifer, scr_darker_colour( c_conifer, 0.2 ), u, v );
                    
                } else if ( temp == 0.66 ) {
                    
                    scr_model_add_tree_trunk( model, k_tree_scale * 0.6, k_tree_scale * 2, c_dark_brown, u, v );
                    scr_model_add_deciduous_leaves( model, k_tree_scale * 2  , k_tree_scale * 4,   k_tree_scale * 1,   c_deciduous, scr_darker_colour( c_deciduous, 0.3 ), u, v );
                    
                } else {
                    
                    scr_model_add_tree_trunk( model, k_tree_scale * 0.4, k_tree_scale * 3.5, c_brown, u, v );
                    scr_model_add_palm_leaves( model, k_tree_scale * 3  , k_tree_scale * 1.5,   k_tree_scale * 3.5, c_palm_leaf, scr_darker_colour( c_palm_leaf, 0.2 ), u, v );
                    
                }
                
                d3d_transform_set_identity();
                
            }
        }
    
    } else {
        
        for( j = 0; j < 3; j++ ) {
            
            ran_dist = k_tree_scale * ( random_range( 2, 4 ) );
            ran_dir = ( j - random_range( 0.8, 1.2 ) ) / k_tree_repeats * 360;
            
            d3d_transform_set_identity();
            d3d_transform_add_rotation_y( random( 360 ) );
            d3d_transform_add_translation( lengthdir_x( ran_dist, ran_dir ), 0, lengthdir_y( ran_dist, ran_dir ) );
            
            d3d_add_transform_to_hex( hex );
            scr_model_add_hut( model, k_tree_scale * 1.5, k_tree_scale * 3, c_brown, c_dark_brown, u, v );
    
            d3d_transform_set_identity();
            
        }
        
            
        d3d_transform_set_identity();
        d3d_transform_add_rotation_y( random( 360 ) );
        
        d3d_add_transform_to_hex( hex );
        scr_model_add_campfire( model, k_tree_scale * 0.6, k_tree_scale * 1.3, c_orange, 1, 1 );
        
        d3d_transform_set_identity();
        
    }
}
