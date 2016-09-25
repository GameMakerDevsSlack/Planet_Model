///scr_2d_to_3d( xfrom, yfrom, zfrom, xto, yto, zto, xup, yup, zup, angle, width, height, x, y )
//
//Arguments mirror the arguments of d3d_set_projection_ext()
//The vector that this returns is drawn from (xfrom,yfrom,zfrom) along a vector direction
//The normalised vector direction is returned in the globally scoped array "result_coord"
//
//With thanks to Yourself from the GMC

globalvar result_coord;

var mm, dX, dY, dZ, uX, uY, uZ, vX, vY, vZ, mX, mY, mZ, width, height, tFOV, width, height, aspect, xx, yy;

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

xx = argument12;
yy = argument13;

//Normalise
mm = 1 / point_distance_3d( 0, 0, 0,  dX, dY, dZ );
dX *= mm;
dY *= mm;
dZ *= mm;

mm = dot_product_3d( uX, uY, uZ,   dX, dY, dZ );
uX -= mm * dX;
uY -= mm * dY;
uZ -= mm * dZ;

//Normalise
mm = 1 / point_distance_3d( 0, 0, 0,  uX, uY, uZ );
uX *= mm;
uY *= mm;
uZ *= mm;

// v = u x d
vX = uY * dZ - dY * uZ;
vY = uZ * dX - dZ * uX;
vZ = uX * dY - dX * uY;

uX *= tFOV;
uY *= tFOV;
uZ *= tFOV;

vX *= tFOV * aspect;
vY *= tFOV * aspect;
vZ *= tFOV * aspect;

mX = dX + uX * ( 1 - 2 * yy / height ) + vX * ( 2 * xx / width - 1 );
mY = dY + uY * ( 1 - 2 * yy / height ) + vY * ( 2 * xx / width - 1 );
mZ = dZ + uZ * ( 1 - 2 * yy / height ) + vZ * ( 2 * xx / width - 1 );

//Normalise
mm = 1 / point_distance_3d( 0, 0, 0,  mX, mY, mZ );
result_coord[0] = mX * mm;
result_coord[1] = mY * mm;
result_coord[2] = mZ * mm;
