old_view_matrix = matrix_get( matrix_view );
old_proj_matrix = matrix_get( matrix_projection );

var _view_w = camera_get_view_width( camera_get_active() );
var _view_h = camera_get_view_height( camera_get_active() );
var _app_w = surface_get_width( application_surface );
var _app_h = surface_get_height( application_surface );


var _y = lerp( -350, -2000, ease_quad_inout( camera_y ) );
var _z = lerp(  120,     0, ease_quad_inout( camera_y ) );

var _view_matrix = matrix_build_lookat( 0,  _y, _z,
							            0,-300, _z/2,
							            0,   0,  1 );
var _proj_matrix = matrix_build_projection_perspective_fov( 60, _app_w/_app_h, 1, 16000 );
var _viewproj_matrix = matrix_multiply( _view_matrix, _proj_matrix );

if ( surface_get_width( srf_click ) != _app_w ) or ( surface_get_height( srf_click ) != _app_h ) {
	srf_click = surface_create( _app_w, _app_h );
}

surface_set_target( srf_click );
	
	draw_clear( c_black );
	matrix_set( matrix_view, global.matrix_identity );
	matrix_set( matrix_projection, global.matrix_identity );
	
	with( obj_world ) {
		var _matrix = matrix_multiply( matrix, matrix_build( 0, 0, 0,   0, 0, 0,   world_scale, world_scale, world_scale ) );
		_matrix = matrix_multiply( _matrix, _viewproj_matrix );
		matrix_set( matrix_world, _matrix );
		vertex_submit( vbf_relief, pr_trianglelist, sprite_get_texture( spr_white, 0 ) );
	}
	
	click_array = [];
	shader_set( shd_fog );
	var _i = 0;
	with( obj_test_character ) {
		
		var _red   = _i mod 255;
		var _green = _i div 255;
		shader_set_uniform_f( shader_get_uniform( shd_fog, "u_vColour" ), _red/255, _green/255, 1/255, 1 );
		
		matrix_set( matrix_world, matrix_multiply( matrix, _viewproj_matrix ) );
		vertex_submit( model, pr_trianglelist, sprite_get_texture( spr_white, 0 ) );
		other.click_array[_i] = id;
		_i++;
		
	}
	shader_reset();

surface_reset_target();



draw_clear( space_colour );

if ( do_lighting ) {
	shader_set( shd_lighting );
	shader_set_uniform_f( shader_get_uniform( shd_lighting, "u_vAmbientColour" ), colour_get_red(   ambient_colour )/255,
																				  colour_get_green( ambient_colour )/255,
																				  colour_get_blue(  ambient_colour )/255,
																				  0 );
	light_set( 0,   0, -5000,    0, 10000,   c_white, 1 );
	light_set( 1,   0,  -500,  600,   700,   C_AMBER, 1 );
	light_set( 2, 200,  -400, -200,   400,    C_ROSE, 1 );
}

camera_set_view_mat( camera_get_active(), _view_matrix );
camera_set_proj_mat( camera_get_active(), _proj_matrix );
camera_apply( camera_get_active() );