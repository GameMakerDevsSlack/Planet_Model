/// @param buffer
/// @param colour
/// @param alpha

var _buffer = argument0;
var _colour = argument1;
var _alpha  = argument2;

_colour = ( (_alpha*255) << 24 ) + _colour;

var _size = buffer_get_size( _buffer );
for( var _i = 0; _i < _size; _i += 36 ) buffer_poke( _buffer, _i+12, buffer_u32, _colour );