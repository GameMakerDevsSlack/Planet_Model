if ( !DEBUG ) {
    instance_destroy();
    exit;
}

target_frame_time = 1000000/room_speed;

persistent = true;
debug_visible = false;
do_debug = false;

lst_frame_time = ds_list_create();
repeat( 100 ) ds_list_add( lst_frame_time, 0 );

lst_smoothed_timer = ds_list_create();
repeat( 100 ) ds_list_add( lst_smoothed_timer, 0 );

frame_start_time = get_timer();
frame_time = 8000;
smoothed_timer = frame_time;