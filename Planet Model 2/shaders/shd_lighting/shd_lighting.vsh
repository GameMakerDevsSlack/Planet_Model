attribute vec3 in_Position;
attribute vec2 in_TextureCoord;
attribute vec4 in_Colour;
attribute vec3 in_Normal;

varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec4 v_vPos;
varying vec3 v_vNormal;
varying mat4 v_mWorld;

void main() {
    
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos; 
    
    v_vColour   = in_Colour;
    v_vTexcoord = in_TextureCoord;
	v_vNormal   = in_Normal;
	v_vPos      = object_space_pos;
	v_mWorld    = gm_Matrices[MATRIX_WORLD];
    
}