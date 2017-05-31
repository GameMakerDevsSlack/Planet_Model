/// @param buffer
/// @param format
/// @param colour
/// @param alpha

var _buffer = argument0;
var _format = argument1;
var _colour = argument2;
var _alpha  = argument3;

var _vbuff = vertex_create_buffer();
vertex_begin( _vbuff, _format );
if ( _colour >= 0 ) and ( _alpha >= 0 ) {
	add_buffer_to_vertex_buffer( _buffer, noone, noone, _colour, _alpha, _vbuff );
} else {
	add_buffer_to_vertex_buffer( _buffer, noone, noone, noone, noone, _vbuff );
}
vertex_end( _vbuff );

return _vbuff;