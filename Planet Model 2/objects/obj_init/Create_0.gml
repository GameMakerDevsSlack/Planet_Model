defintions();

global.model_conifer    = vertex_create_buffer_from_obj(   "conifer_lite.obj", vft_3d,   false, false,   0, 0, 0, 1 );
global.model_deciduous  = vertex_create_buffer_from_obj( "deciduous_lite.obj", vft_3d,   false, false,   0, 0, 0, 1 );
global.model_palm       = vertex_create_buffer_from_obj( "palm_xtra_lite.obj", vft_3d,   false, false,   0, 0, 0, 1 );

global.buffer_conifer   = create_buffer_from_obj(   "conifer_lite.obj",   false, false,   0, 0, 0, 1 );
global.buffer_deciduous = create_buffer_from_obj( "deciduous_lite.obj",   false, false,   0, 0, 0, 1 );
global.buffer_palm      = create_buffer_from_obj( "palm_xtra_lite.obj",   false, false,   0, 0, 0, 1 );

instance_create_depth( 0, 0, 0, obj_screen );
room_goto_next();