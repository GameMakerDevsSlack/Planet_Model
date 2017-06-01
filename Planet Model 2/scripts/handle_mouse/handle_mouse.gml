mouse_pressed = mouse_check_button_pressed( mb_left );
mouse_down = mouse_check_button( mb_left );
mouse_released = mouse_check_button_released( mb_left );
var _collect = mouse_pressed or mouse_released;

if ( mouse_pressed ) {
	mouse_p_x = mouse_get_x();
	mouse_p_y = mouse_get_y();
	mouse_d_pre_x = mouse_p_x;
	mouse_d_pre_y = mouse_p_y;
	mouse_d_x = mouse_p_x;
	mouse_d_y = mouse_p_y;
}

if ( mouse_down ) {
	mouse_d_pre_x = mouse_d_x;
	mouse_d_pre_y = mouse_d_y;
	mouse_d_x = mouse_get_x();
	mouse_d_y = mouse_get_y();
} else {
	mouse_p_x = noone;
	mouse_p_y = noone;
	mouse_d_pre_x = noone;
	mouse_d_pre_y = noone;
	mouse_d_x = noone;
	mouse_d_y = noone;
}

if ( _collect ) {

	var _hex  = noone;
	var _inst = noone;
	
	var _app_w = surface_get_width( application_surface );
	var _app_h = surface_get_height( application_surface );
	
	if ( !surface_exists( srf_mouse ) ) or ( surface_get_width( srf_mouse ) != _app_w ) or ( surface_get_height( srf_mouse ) != _app_h ) {
		srf_mouse = surface_create( _app_w, _app_h );
	}

	if ( surface_exists( srf_mouse ) ) {
		
		var _camera_viewproj_matrix = obj_world.camera_viewproj_matrix;
		
		surface_set_target( srf_mouse );
			
			draw_clear( c_black );
			matrix_set( matrix_view, global.matrix_identity );
			matrix_set( matrix_projection, global.matrix_identity );
			
			with( obj_world ) {
				var _matrix = matrix_multiply( matrix, matrix_build( 0, 0, 0,   0, 0, 0,   world_scale, world_scale, world_scale ) );
				matrix_set( matrix_world, matrix_multiply( _matrix, _camera_viewproj_matrix ) );
				vertex_submit( vbf_relief, pr_trianglelist, sprite_get_texture( spr_white, 0 ) );
			}
		
			var _array = [];
			shader_set( shd_fog );
			
			var _i = 0;
			with( obj_test_character ) {
				
				var _red   = _i mod 255;
				var _green = _i div 255;
				shader_set_uniform_f( shader_get_uniform( shd_fog, "u_vColour" ), _red/255, _green/255, 1/255, 1 );
				
				matrix_set( matrix_world, matrix_multiply( matrix, _camera_viewproj_matrix ) );
				vertex_submit( model, pr_trianglelist, sprite_get_texture( spr_white, 0 ) );
				
				_array[_i] = id;
				_i++;
			}
			
			shader_reset();
			mouse_array = _array;
	
		surface_reset_target();
		
		if ( os_browser == browser_not_a_browser ) {
			var _pixel = surface_getpixel( srf_mouse, mouse_get_x(), surface_get_height( application_surface )-mouse_get_y() );
		} else {
			var _pixel = surface_getpixel( srf_mouse, mouse_get_x(), mouse_get_y() );
		}
		
		var _red   =   _pixel         & $FF;
		var _green = ( _pixel >>  8 ) & $FF;
		var _blue  = ( _pixel >> 16 ) & $FF;

		if ( _blue == 0 ) {
			var _hex = _green*255 + _red - 1;
		} else {
			var _inst = mouse_array[ _green*255 + _red ];
		}
		
	}
	
	if ( mouse_pressed ) {
		mouse_p_hex  = _hex;
		mouse_p_inst = _inst;
	} else if ( mouse_released ) {
		mouse_r_hex  = _hex;
		mouse_r_inst = _inst;
	}
	
}