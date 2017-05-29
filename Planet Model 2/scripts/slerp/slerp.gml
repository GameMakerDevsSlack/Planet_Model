/// @param x1
/// @param y1
/// @param z1
/// @param x2
/// @param y2
/// @param z2
/// @param t

var _x1 = argument0;
var _y1 = argument1;
var _z1 = argument2;
var _x2 = argument3;
var _y2 = argument4;
var _z2 = argument5;
var _t  = argument6;

var _angle = arccos( dot_product_3d_normalised( _x1, _y1, _z1,   _x2, _y2, _z2 ) );

var _s0 = sin( _angle );

var _result;
if ( abs( _s0 ) < 0.001 ) {
    
    _result[0] = 0.5*_x1 + 0.5*_x2;
    _result[1] = 0.5*_y1 + 0.5*_y2;
    _result[2] = 0.5*_z1 + 0.5*_z2;
    
} else {
    
    var _s1 = sin( ( 1 - _t ) * _angle ) / _s0;
    var _s2 = sin( _t * _angle ) / _s0;
    
    _result[0] = _s1*_x1 + _s2*_x2;
    _result[1] = _s1*_y1 + _s2*_y2;
    _result[2] = _s1*_z1 + _s2*_z2;

}

return _result;