///scr_window_add_button( object, parent instance, x, y )
//
//Creates a clickable button for use with the internal window system
//argument2 and 3 accept "noone" as an input - the button defaults to the object's starting values

var inst, obj, parent;

obj = argument0;
parent = argument1;

inst = instance_create( 0, 0, obj );

inst.parent = parent;
ds_list_add( parent.window_buttons, inst );

if ( argument2 != noone ) inst.window_local_x = argument2;
if ( argument3 != noone ) inst.window_local_y = argument3;

inst.x = parent.window_screen_x + inst.window_local_x;
inst.y = parent.window_screen_y + inst.window_local_y;

with( inst ) event_user( 0 );

return inst;
