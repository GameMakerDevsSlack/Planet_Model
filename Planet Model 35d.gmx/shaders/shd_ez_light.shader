attribute vec3 in_Position;
attribute vec4 in_Colour;

varying vec4 v_vColour;

uniform float blend;

void main() {
    
    v_vColour = mix( in_Colour, vec4( 0.149, 0.114, 0.180, in_Colour.a ), blend );
    
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
}
//######################_==_YOYO_SHADER_MARKER_==_######################@~varying vec4 v_vColour;

void main() {
    
    gl_FragColor = v_vColour;
    
}
