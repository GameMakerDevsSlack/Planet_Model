/// @param matrix
/// @param x
/// @param y
/// @param z

var _matrix = argument0;
var _x      = argument1;
var _y      = argument2;
var _z      = argument3;
//We presume w=1

var _result;
_result[0] = _x*_matrix[ 0] + _y*_matrix[ 4] + _z*_matrix[ 8] + _matrix[12];
_result[1] = _x*_matrix[ 1] + _y*_matrix[ 5] + _z*_matrix[ 9] + _matrix[13];
_result[2] = _x*_matrix[ 2] + _y*_matrix[ 6] + _z*_matrix[10] + _matrix[14];
return _result;