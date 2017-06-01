frame_time = get_timer() - frame_start_time;
smoothed_timer = lerp( smoothed_timer, frame_time, 0.1 );

ds_list_add( lst_frame_time, frame_time );
ds_list_delete( lst_frame_time, 0 );
ds_list_add( lst_smoothed_timer, smoothed_timer );
ds_list_delete( lst_smoothed_timer, 0 );