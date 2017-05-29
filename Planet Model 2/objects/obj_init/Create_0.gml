defintions();

global.model_conifer    = vertex_create_buffer_from_obj(   "conifer.obj", vft_3d,   false, false,   0, 0, 0, 2.5 );
global.model_deciduous  = vertex_create_buffer_from_obj( "deciduous.obj", vft_3d,   false, false,   0, 0, 0, 2.5 );
global.model_palm       = vertex_create_buffer_from_obj(      "palm.obj", vft_3d,   false, false,   0, 0, 0, 2.5 );

global.buffer_conifer   = create_buffer_from_obj(   "conifer.obj",   false, false,   0, 0, 0, 2.5 );
global.buffer_deciduous = create_buffer_from_obj( "deciduous.obj",   false, false,   0, 0, 0, 2.5 );
global.buffer_palm      = create_buffer_from_obj(      "palm.obj",   false, false,   0, 0, 0, 2.5 );

instance_create_depth( 0, 0, 0, obj_screen );
room_goto_next();