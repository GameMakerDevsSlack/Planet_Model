if ( !DEBUG ) {
    instance_destroy();
    exit;
}

do_debug = true;

lst_frame_time = ds_list_create();
repeat( 100 ) ds_list_add( lst_frame_time, 0 );

lst_smoothed_timer = ds_list_create();
repeat( 100 ) ds_list_add( lst_smoothed_timer, 0 );

target_frame_time = 1000000/room_speed;
frame_start_time = get_timer();
frame_time = 8000;
smoothed_timer = frame_time;