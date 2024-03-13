extends CharacterBody2D

class_name Actor

var maxSpeed = 400
var maxAccel = 800
var rotation_speed = PI * 4
var deceleration = 650
var hit_points = 100.0
var max_hit_points = 100.0

var shields = 0
var max_shields = 300
var shield_degradation_rate = 5

var destination = null;
var wasd_direction = Vector2.ZERO;
var weapons = []

func isEnemyType() -> bool: 
	return self is EnemyActor

func facing(length) -> Vector2:
	return Vector2.RIGHT.rotated(rotation) * length
	
func die():
	var death_scene = load("res://effects/death_effect.tscn")
	var death_node = death_scene.instantiate()
	death_node.position = position
	get_parent().call_deferred("add_child", death_node)
	queue_free()
	
func _process(delta):
	give_shields(-shield_degradation_rate * delta)
	if (hit_points <= 0):
		die()
	else:
		for w in weapons:
			w.process(delta)
			
func give_shields(value):
	shields = max(0, min(max_shields, shields + value))
	
func give_hit_points(value):
	hit_points = min(max_hit_points, hit_points + value)
	
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
	var damage = other.damage

	if (shields > 0):
		give_shields(-other.damage)
	else:
		hit_points = hit_points - other.damage
		
	return true
