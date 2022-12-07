//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

const vec2 colorValueLimits = vec2(0.,1.);
const vec4 red = colorValueLimits.yxxy;

void main()
{
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	gl_FragColor = red;
}
