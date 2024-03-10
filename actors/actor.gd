extends CharacterBody2D

class_name Actor

var maxSpeed = 400
var maxAccel = 800
var rotation_speed = PI * 4
var deceleration = 650
var hit_points = 100

var destination = null;
var wasd_direction = Vector2.ZERO;
var weapons = []

func facing(length) -> Vector2:
	return Vector2.RIGHT.rotated(rotation) * length
	
func die():
	var death_scene = load("res://effects/death_effect.tscn")
	var death_node = death_scene.instantiate()
	death_node.position = position
	get_parent().add_child(death_node)
	queue_free()
	
func _process(delta):
	if (hit_points <= 0):
		die()
	else:
		for w in weapons:
			w.process(delta)
	
func _rotation_process(delta):
	if (destination != null):
		var angle = get_angle_to(destination);
		var angleToRotate  = 0;
		
		if (angle > 0 ):
			angleToRotate = min((rotation_speed * delta), angle);
		elif (angle < 0 ):
			angleToRotate = max(-(rotation_speed * delta), angle);
			
		rotate(angleToRotate);
		
func _movement_process(delta):
	var _destination = destination
	var angle = 0;
	
	if (_destination != null && wasd_direction != Vector2.ZERO):
		angle = atan2(wasd_direction.x, wasd_direction.y)
		if (_destination == null):
			_destination = facing(Constants.max_int) 
			
		var inputVector = (_destination - position).normalized().rotated(angle);
		velocity = velocity.move_toward(inputVector * maxSpeed, maxAccel * delta).limit_length(maxSpeed);	
	else:
		velocity = velocity.move_toward(Vector2.ZERO, deceleration * delta)

func _physics_process(delta):
	_rotation_process(delta);
	_movement_process(delta);
	move_and_slide();
	
func onImpact(other):
	if (other is Bullet):
		hit_points = hit_points - other.damage
