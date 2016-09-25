///scr_get_line_sphere_intersection( x, y, z, vector x, vector y, vector z, radius );
//Gets the coordinates of a line intersecting a sphere located at the origin
//Returns the parameter "t" of the line - a value of 0 is usually a failure
//If 0 < t <= 1 then the point is on the line segment
//The coordinates are returned in the globally scoped array "result_coord"

globalvar result_coord;

var px = argument0;
var py = argument1;
var pz = argument2;

var vx = argument3;
var vy = argument4;
var vz = argument5;

var radius = argument6;

var a = sqr( vx ) + sqr( vy ) + sqr( vz );
var b = 2 * (px * vx + py * vy + pz * vz );
var c = sqr( px ) + sqr( py ) + sqr( pz ) - sqr( radius );

var det = sqr( b ) - 4 * a * c;
if ( det < 0 ) return 0;

var t = ( - b - sqrt( det ) ) / ( 2 * a );
        
result_coord[0] = px + t * vx;
result_coord[1] = py + t * vy;
result_coord[2] = pz + t * vz;

return t;
