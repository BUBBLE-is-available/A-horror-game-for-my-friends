var _cameraViewHeight = camera_get_view_height(CAMERA);
var _cameraViewWidth = camera_get_view_width(CAMERA);

var _cameraX = x - (_cameraViewWidth * .5);
var _cameraY = y - (_cameraViewHeight * .5);

Camera.setPos(_cameraX, _cameraY);