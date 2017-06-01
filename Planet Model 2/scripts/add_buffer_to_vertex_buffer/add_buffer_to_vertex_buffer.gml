/// @param buffer
/// @param position_matrix
/// @param normal_matrix
/// @param force_colour
/// @param force_alpha
/// @param vertex_buffer

var _buffer       = argument0;
var _pos_matrix   = argument1;
var _norm_matrix  = argument2;
var _force_colour = argument3;
var _force_alpha  = argument4;
var _vbuff        = argument5;

if ( _force_colour < 0 ) or ( _force_alpha < 0 ) {
	_force_colour = noone;
	_force_alpha  = noone;
}
	  
buffer_seek( _buffer, buffer_seek_start, 0 );
var _size = buffer_get_size( _buffer );

if ( !is_real( _pos_matrix ) and !is_real( _norm_matrix ) ) {
	repeat( _size/36 ) {
			
		var _x = buffer_read( _buffer, buffer_f32 );
		var _y = buffer_read( _buffer, buffer_f32 );
		var _z = buffer_read( _buffer, buffer_f32 );
		var _pos_array = matrix_transform_vertex_fixed( _pos_matrix, _x, _y, _z );
		
		var _colour = buffer_read( _buffer, buffer_u32 );
		if ( _force_colour >= 0 ) _colour = _force_colour;
			
		var _u = buffer_read( _buffer, buffer_f32 );
		var _v = buffer_read( _buffer, buffer_f32 );
			
		var _nx = buffer_read( _buffer, buffer_f32 );
		var _ny = buffer_read( _buffer, buffer_f32 );
		var _nz = buffer_read( _buffer, buffer_f32 );
		var _norm_array = matrix_transform_vertex_fixed( _norm_matrix, _nx, _ny, _nz );
			
		vertex_position_3d( _vbuff, _pos_array[0], _pos_array[1], _pos_array[2] );
		if ( _force_colour >= 0 ) {
			vertex_colour( _vbuff, _force_colour, _force_alpha );
		} else {
			vertex_colour( _vbuff, _colour & $FFFFFF, ( _colour >> 24 )/255 );
		}
		vertex_texcoord( _vbuff, _u, _v );
		vertex_normal(   _vbuff, _norm_array[0], _norm_array[1], _norm_array[2] );
		
	}
} else {
	repeat( _size/36 ) {
			
		var _x = buffer_read( _buffer, buffer_f32 );
		var _y = buffer_read( _buffer, buffer_f32 );
		var _z = buffer_read( _buffer, buffer_f32 );
			
		var _colour = buffer_read( _buffer, buffer_u32 );
			
		var _u = buffer_read( _buffer, buffer_f32 );
		var _v = buffer_read( _buffer, buffer_f32 );
			
		var _nx = buffer_read( _buffer, buffer_f32 );
		var _ny = buffer_read( _buffer, buffer_f32 );
		var _nz = buffer_read( _buffer, buffer_f32 );
		
		vertex_position_3d( _vbuff,   _x, _y, _z );
		if ( _force_colour >= 0 ) {
			vertex_colour( _vbuff, _force_colour, _force_alpha );
		} else {
			vertex_colour( _vbuff, _colour & $FFFFFF, ( _colour >> 24 )/255 );
		}
		vertex_texcoord( _vbuff,   _u, _v );
		vertex_normal(   _vbuff,   _nx, _ny, _nz );
			
	}
}