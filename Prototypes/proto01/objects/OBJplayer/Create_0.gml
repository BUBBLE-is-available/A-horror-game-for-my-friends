x = 0;
y = 0;


lightSurface = new Surface(512, 256);
lightObstaclesSurface = new Surface(512,256); 

#macro LIGHT_RADIUS 45
var _numberOfRays = LIGHT_RADIUS * 2 * pi;
var _surfaceWidth = 1 << (floor(log2(_numberOfRays)) + 1);
raysLengthsSurface = new Surface(_surfaceWidth, 1); 


Camera = {};
with(Camera)
{
	id = CAMERA;
	
	x = INITIAL_VIEW_X;
	y = INITIAL_VIEW_Y;
	
	view = {};
	with(view)
	{
		width = BASE_VIEW_WIDTH;
		height = BASE_VIEW_HEIGHT;
	}
	
	//Methods
	setPos = function(newX, newY)
	{
		x = newX;
		y = newY;
		
		camera_set_view_pos(id, x,y);
	}
	
	setSize = function(newWidth, newHeight)
	{
		view.width = newWidth;
		view.height = newHeight;
		
		camera_set_view_size(id, view.width, view.height);
	}
	
	initialize = function(initialX =x,initialY =y, initialWidth =view.width, initialHeight =view.height)
	{
		view_enabled = true;
		view_visible[VISIBLE_VIEW] = true;
		
		x = initialX;
		y = initialY;
		setPos(x,y);
		
		view.width = initialWidth;
		view.height = initialHeight;
		setSize(view.width,view.height);
	}
	
}



