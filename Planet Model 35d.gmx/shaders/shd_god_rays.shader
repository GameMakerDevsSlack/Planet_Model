attribute vec3 in_Position;
attribute vec4 in_Colour;
attribute vec2 in_TextureCoord;

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main() {
    
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
    
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 lightPositionOnScreen;
uniform vec2 surfaceSize;

const float Density = 0.4;
const float weight = 0.4;
const float decay = 0.75;
const int samples = 40;
    
void main() {
    
    vec2 textCoo = v_vTexcoord;
    
    vec2 deltaTextCoord = vec2( v_vTexcoord - lightPositionOnScreen );
    deltaTextCoord *= Density / float( samples );
    
    float illuminationDecay = 1.0;
    
    for( int i = 0; i < samples; i++ ) {
        
       textCoo -= deltaTextCoord;
       
       vec4 sample = texture2D( gm_BaseTexture, textCoo );
       sample *= illuminationDecay * weight;
       gl_FragColor += sample;
       
       illuminationDecay *= decay;
       
    }

}
