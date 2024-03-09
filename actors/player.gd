extends Actor

var mouseDownEvent = null;
var mouseEvent = null;

var bulletScene: Resource = null;

func _init():
	weapons.append(MachineGun.new())

func _input(event):
	if (event is InputEventMouseButton):
		mouseEvent = event;
		
	if (event is InputEventKey):
		if (event.keycode == KEY_Q && event.is_pressed()):
			weapons[0].shoot(self)
		
func  _process(delta):
	super._process(delta)
	var mouseButton = mouseEvent != null && mouseEvent.pressed == true;
	
	if (mouseButton):
		destination = get_global_mouse_position();
	
	if (destination != null):
		if ((position - destination).length() < deceleration * delta):
			destination = null;
			
	var x = 0;
	var y = 0;
	
	if Input.is_key_pressed(KEY_W):
		x = 1
	if Input.is_key_pressed(KEY_S):
		x = -1
	if Input.is_key_pressed(KEY_A):
		y = -1
	if Input.is_key_pressed(KEY_D):
		y = 1
	
	if (x != 0 || y != 0):
		wasd_direction = Vector2(y, x)
	else:
		wasd_direction = null
	
		
