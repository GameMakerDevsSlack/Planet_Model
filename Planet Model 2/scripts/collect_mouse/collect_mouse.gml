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
}