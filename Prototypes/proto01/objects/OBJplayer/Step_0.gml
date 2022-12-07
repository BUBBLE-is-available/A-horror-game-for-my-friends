var _keyboardInputs = {};

with(_keyboardInputs)
{
	verticalDirection = keyboard_check(KEY.S) - keyboard_check(KEY.Z);
	horizontalDirection = keyboard_check(KEY.D) - keyboard_check(KEY.Q);
}

var _speed = 0.5;

x += _keyboardInputs.horizontalDirection * _speed;
y += _keyboardInputs.verticalDirection * _speed;

delete _keyboardInputs;


