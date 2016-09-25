///scr_3d_to_2d( xfrom, yfrom, zfrom, xto, yto, zto, xup, yup, zup, angle, width, height, targetx, targety, targetz )
//
//Arguments mirror the arguments of d3d_set_projection_ext()
//The vector that this returns is drawn from (xfrom,yfrom,zfrom) along a vector direction
//The normalised vector direction is returned in the globally scoped array "result_coord"
//
//With thanks to Yourself from the GMC

globalvar result_coord;

var mm, dX, dY, dZ, uX, uY, uZ, vX, vY, vZ, mX, mY, mZ, pX, pY, pZ, width, height, tFOV, aspect;

dX = argument3 - argument0;
dY = argument4 - argument1;
dZ = argument5 - argument2;

uX = argument6;
uY = argument7;
uZ = argument8;

tFOV = tan( degtorad( argument9 * 0.5 ) );
width = argument10;
height = argument11;
aspect = width / height;

pX = argument12 - argument0;
pY = argument13 - argument1;
pZ = argument14 - argument2;

mm = 1 / point_distance_3d( 0, 0, 0,  dX, dY, dZ );
dX *= mm;
dY *= mm;
dZ *= mm;

mm = dot_product_3d( uX, uY, uZ,   dX, dY, dZ );
uX -= mm * dX;
uY -= mm * dY;
uZ -= mm * dZ;

mm = 1 / point_distance_3d( 0, 0, 0,  uX, uY, uZ );
uX *= mm;
uY *= mm;
uZ *= mm;

vX = uY * dZ - dY * uZ;
vY = uZ * dX - dZ * uX;
vZ = uX * dY - dX * uY;

uX *= tFOV;
uY *= tFOV;
uZ *= tFOV;

vX *= tFOV * aspect;
vY *= tFOV * aspect;
vZ *= tFOV * aspect;

mm = 1 / point_distance_3d( 0, 0, 0,   pX, pY, pZ );
pX *= mm;
pY *= mm;
pZ *= mm;

mm = dot_product_3d( pX, pY, pZ,   vX, vY, vZ ) / sqr( aspect * tFOV );
result_coord[0] = ( mm + 1 ) / 2 * view_wview[0];

mm = dot_product_3d( pX, pY, pZ,   uX, uY, uZ ) / sqr( tFOV );
result_coord[1] = ( 1 - mm ) / 2 * view_hview[0];
