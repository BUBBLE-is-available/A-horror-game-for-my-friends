function Surface(surfaceWidth, surfaceHeight) constructor 
{
	id = -1;
	width = surfaceWidth;
	height = surfaceHeight;
	
	createItself = function() {
		do { id = createSurface(width,height); } until(surface_exists(id));
		
		surface_set_target(id);
			draw_clear_alpha(c_black, 0);
		surface_reset_target();
	}
	
	returnDuplicate = function() {
		var _newSurface = new Surface(width, height);
		do { _newSurface.createItself(); } until(surface_exists(_newSurface.id));
		surface_copy(_newSurface.id, 0,0, id);
		return _newSurface;
	}
}

function createSurface(surfaceWidth, surfaceHeight)
{
	return surface_create(surfaceWidth, surfaceHeight);
}