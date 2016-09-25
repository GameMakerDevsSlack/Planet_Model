///scr_model_init()
//

lst_model_physical  = ds_list_create();
lst_model_features  = ds_list_create();

repeat( k_chunks ) {
    ds_list_add( lst_model_physical,  d3d_model_create() );
    ds_list_add( lst_model_features,  d3d_model_create() );
}
