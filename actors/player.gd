extends Actor

var mouseDownEvent = null;
var mouseEvent = null;

var bulletScene: Resource = null;

func _init():
	bulletScene = load("res://actors/gun_type_weapon_shot.tscn")

func _input(event):
	if (event is InputEventMouseButton):
		mouseEvent = event;
		
	if (event is InputEventKey):
		if (event.keycode == KEY_SPACE && event.is_pressed()):
			var bullet: CharacterBody2D = bulletScene.instantiate()
			
			bullet.position = position + facing(50)
			bullet.rotation = rotation
			bullet.velocity = facing(maxSpeed) 
		
			get_parent().add_child(bullet)
		
func  _process(delta):
	var mouseButton = mouseEvent != null && mouseEvent.pressed == true;
	
	if (mouseButton):
		destination = get_global_mouse_position();
	
	if (destination != null):
		if ((position - destination).length() < deceleration * delta):
			destination = null;
		
