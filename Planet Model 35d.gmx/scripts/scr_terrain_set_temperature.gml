///scr_terrain_set_temperature( hex, bounce point, height pc, latitude pc, random pc )

//Calculate temperatures
//All this business with "bouncing" is to simulate the ITCZ
//https://en.wikipedia.org/wiki/Intertropical_Convergence_Zone
//Otherwise, it just gets linearly colder as you get away from the equator

var bounce_term, bounce_coeff, index, xx, yy, zz, height, r, lat, temp_lat, temp_height, temp, height_balance, latitude_balance, randomness;

index = argument0;
bounce_term = argument1; //0.15;

height_balance = argument2; //0.5;
latitude_balance = argument3; //0.4;
randomness = 1 - ( height_balance + latitude_balance );

bounce_coeff = 1 / ( 1 - bounce_term );


xx = ds_list_find_value( lst_hex_x, index );
yy = ds_list_find_value( lst_hex_y, index );
zz = ds_list_find_value( lst_hex_z, index );
height = ds_list_find_value( lst_terrain_height, index );

r = point_distance_3d( 0, 0, 0, xx, yy, zz );
lat = arccos( yy / r ) / pi;

temp_lat = abs( lat - 0.5 ) * 2;
temp_lat = abs( bounce_term - temp_lat ) * bounce_coeff;

temp_height = height * sqr( height );

temp = temp_height * height_balance + temp_lat * latitude_balance + random( randomness ); //Weight temperature to be mostly about the latitude rather than height, and add some randomness
temp = 1 - temp; //Oh and it's all been backwards too

ds_list_replace( lst_terrain_tempr, index, temp );
