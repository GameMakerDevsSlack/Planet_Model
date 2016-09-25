///change_screen_resolution( width, height, full screen, aa)
//Creates an object that changes the game resolution on the fly

var inst;

inst = instance_create( 0, 0, obj_change_resolution );

if ( argument0 != noone ) and ( argument1 != noone ) {
    inst.width = argument0;
    inst.height = argument1;
}

if ( argument2 != noone ) inst.fullscreen = argument2;

if ( argument3 != noone ) game_aa = argument3;
