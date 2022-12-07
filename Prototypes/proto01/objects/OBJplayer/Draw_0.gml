draw_circle(0,0, 8, true);

if(surface_exists(lightObstaclesSurface.id)) {
	
	
}
else
{
	lightObstaclesSurface.createItself();
}

var _raysLengthsHasBeenTraced = false;
if(surface_exists(raysLengthsSurface.id)) {
	
	var _temporaryCloneSurface = raysLengthsSurface.returnDuplicate();
	
	surface_set_target(raysLengthsSurface.id);
		shader_set(RaysLengthsTracerShader.index);
		draw_surface(_temporaryCloneSurface.id, 0,0);
		shader_reset();
	surface_reset_target();
	
	surface_free(_temporaryCloneSurface.id);
	_temporaryCloneSurface = undefined;
	
	_raysLengthsHasBeenTraced = true;
}
else
{
	raysLengthsSurface.createItself();
}

if(surface_exists(lightSurface.id) && _raysLengthsHasBeenTraced) {
	
	shader_set(LightRendererShader.index);
	var _uniformVariables = LightRendererShader.uniformVariables;
	
	var _mouseU = (mouse_x - Camera.x) / 512;
	var _mouseV = (mouse_y - Camera.y) / 256;
	var _mouseUVCoordinates = [_mouseU, _mouseV];
	shader_set_uniform_f_array(_uniformVariables.mouseUVCoordinates, _mouseUVCoordinates);
	
	var _playerU = (x - Camera.x) / 512;
	var _playerV = (y - Camera.y) / 256;
	var _playerUVCoordinates = [_playerU, _playerV];
	shader_set_uniform_f_array(_uniformVariables.playerUVCoordinates, _playerUVCoordinates);
	
	var _raysLengthsTexture = surface_get_texture(raysLengthsSurface.id);
	texture_set_stage(_uniformVariables.raysLengthsTexture, _raysLengthsTexture);
	_uniformVariables = undefined;
		
	draw_surface(lightSurface.id, Camera.x,Camera.y);
	shader_reset();
}
else
{
	lightSurface.createItself();
}

draw_surface(raysLengthsSurface.id, Camera.x, Camera.y);


image_angle = point_direction(x,y, mouse_x, mouse_y);
draw_self();
