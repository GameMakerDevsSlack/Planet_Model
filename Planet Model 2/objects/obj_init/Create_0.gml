definitions();

//global.model_flag       = vertex_create_buffer_from_obj( "flag.obj", vft_3d,   false, false,   0, 0, 0, 6 );

global.buffer_flag      = create_buffer_from_obj(           "flag_small.obj",   false, false,   0, 0, 0,  12.5 );
//global.buffer_flag      = create_buffer_from_obj(           "flag_small.obj",   false, false,   0, 0, 0,  6.2 );
//global.buffer_flag      = create_buffer_from_obj(           "flag.obj",   false, false,   0, 0, 0, 12.5 );
global.buffer_conifer   = create_buffer_from_obj(   "conifer_lite.obj",   false, false,   0, 0, 0,  1.8 );
global.buffer_deciduous = create_buffer_from_obj( "deciduous_lite.obj",   false, false,   0, 0, 0,  1.8 );
global.buffer_palm      = create_buffer_from_obj( "palm_xtra_lite.obj",   false, false,   0, 0, 0,  1.8 );

instance_create_depth( 0, 0, 0, obj_screen );
instance_create_depth( 0, 0, 0, obj_debug );
room_goto_next();