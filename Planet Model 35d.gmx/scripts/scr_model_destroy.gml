///destroy_models()

for( i = ds_list_size( lst_model_physical  ) - 1; i >= 0; i-- ) d3d_model_destroy( ds_list_size( lst_model_physical ) );
for( i = ds_list_size( lst_model_features  ) - 1; i >= 0; i-- ) d3d_model_destroy( ds_list_size( lst_model_features ) );

ds_list_destroy( lst_model_physical );
ds_list_destroy( lst_model_features );
