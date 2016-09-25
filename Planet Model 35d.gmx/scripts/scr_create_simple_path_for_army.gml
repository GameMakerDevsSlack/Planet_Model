///create_simple_path_for_army( army, start hex, end hex );

var inst;

inst = scr_create_simple_path( argument1, argument2 ); //Create a dumb as-the-crow-flies path
inst.army = argument0;
argument0.path = inst;
