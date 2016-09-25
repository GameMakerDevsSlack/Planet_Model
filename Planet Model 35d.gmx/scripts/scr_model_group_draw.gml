///scr_model_group_draw( model group )

var i, list;

list = argument0;

for( i = 0; i < k_chunks; i++ ) d3d_model_draw( ds_list_find_value( list, i),   0, 0, 0,   -1 );
