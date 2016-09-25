///scr_window_create( object, parent instance, x, y, width, height )
//
//Creates a window using the internal window system
//argument2 through 5 accept "noone" as an input - the window defaults to the object's starting values

var obj, inst, parent;

obj = argument0;
parent = argument1;

inst = instance_create( 0, 0, obj );

ds_list_add( parent.window_children, inst );

inst.parent = parent;

if ( argument2 != noone ) inst.window_local_x = argument2;
if ( argument3 != noone ) inst.window_local_y = argument3;

inst.window_screen_x = parent.window_screen_x + inst.window_local_x;
inst.window_screen_y = parent.window_screen_y + inst.window_local_y;

if ( argument4 != noone ) and ( argument5 != noone ) {
    inst.window_width = argument4;
    inst.window_height = argument5;
}

with( inst ) event_user( 0 );

return inst;
