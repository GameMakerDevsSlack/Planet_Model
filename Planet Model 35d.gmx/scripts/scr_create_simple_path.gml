///create_simple_path( start hex, end hex );

var inst;

inst = instance_create( 0, 0, obj_path );

inst.start_hex = argument0;
inst.end_hex = argument1;

inst.path_list = scr_calculate_simple_path( inst.start_hex, inst.end_hex );

return inst;
