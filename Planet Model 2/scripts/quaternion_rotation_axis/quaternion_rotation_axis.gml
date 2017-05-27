/// @param quaternion

var _quaternion = argument0;

var _a = _quaternion[ 0 ];
var _b = _quaternion[ 1 ];
var _c = _quaternion[ 2 ];
var _d = _quaternion[ 3 ];

var _r = sqrt( _b*_b + _c*_c + _d*_d );
var _ang = radtodeg( arctan2( _r, _a ) );

return [ _b, _c, _d, -2*_ang ];