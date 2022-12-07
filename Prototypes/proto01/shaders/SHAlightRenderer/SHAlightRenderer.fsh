varying vec2 v_vTexcoord;
varying vec4 v_vColour;


const vec2 oneAndZero = vec2(0.,1.);
const vec4 black = oneAndZero.xxxy;

const float lightSurfaceWidth = 512.;
const float lightSurfaceHeight = 256.;
const float lightRadius = 128.;
const vec2 relativeLightRadiusInUV = vec2(lightRadius/lightSurfaceWidth, lightRadius/lightSurfaceHeight);

float FOVAmplitude = radians(135.);
float FOVHalfAmplitude = FOVAmplitude * .5;


uniform vec2 mouseUVCoordinates;
uniform vec2 playerUVCoordinates;
uniform sampler2D raysLengthsTexture;


float distanceBetweenMouseAndPlayer = distance(mouseUVCoordinates, playerUVCoordinates) / .25;
vec2 secondRelativeLightRadiusInUV = vec2(distanceBetweenMouseAndPlayer/relativeLightRadiusInUV.x, distanceBetweenMouseAndPlayer/relativeLightRadiusInUV.y);

float mousePlayerAngle = atan(mouseUVCoordinates.y - playerUVCoordinates.y, mouseUVCoordinates.x - playerUVCoordinates.x);
float FOVTerminalSide = mousePlayerAngle + FOVHalfAmplitude;
float FOVInitialSide = mousePlayerAngle - FOVHalfAmplitude;

void main()
{
    float TexcoordAngle = atan(v_vTexcoord.y - playerUVCoordinates.y, v_vTexcoord.x - playerUVCoordinates.x);
	float TexcoordAngleCos = abs(cos(TexcoordAngle));
	float TexcoordAngleSin = abs(sin(TexcoordAngle));
	
	float angle = abs(TexcoordAngle - mousePlayerAngle);
	
	float finalAlpha = abs(v_vTexcoord.x - playerUVCoordinates.x) / relativeLightRadiusInUV.x * TexcoordAngleCos;
	finalAlpha += abs(v_vTexcoord.y - playerUVCoordinates.y) / relativeLightRadiusInUV.y * TexcoordAngleSin;
	finalAlpha += (angle / FOVHalfAmplitude);
	
	gl_FragColor = vec4(black.rgb, finalAlpha);
}
