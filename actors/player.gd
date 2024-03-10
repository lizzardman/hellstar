extends Actor

var bulletScene: Resource = null;

var rmb = false
var lmb = false

func _init():
	weapons.append(MachineGun.new())

func _input(event):
	if (event is InputEventMouseButton && event.button_index == MOUSE_BUTTON_LEFT):
		if (event.button_index == MOUSE_BUTTON_LEFT):
			lmb =  event.is_pressed()
		if (event.button_index == MOUSE_BUTTON_RIGHT):
			rmb = event.is_pressed()

func  _process(delta):
	super._process(delta)
	
	if (lmb):
		weapons[0].shoot(self)
	
	destination = get_global_mouse_position();
	
	var x = (Input.is_key_pressed(KEY_W) as int) - (Input.is_key_pressed(KEY_S) as int);
	var y = (Input.is_key_pressed(KEY_D) as int) - (Input.is_key_pressed(KEY_A) as int);
	
	wasd_direction = Vector2(y, x)
