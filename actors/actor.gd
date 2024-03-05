extends CharacterBody2D

class_name Actor

@export var maxSpeed = 300
@export var maxAccel = 400

@export var rotation_speed = PI * 4
@export var deceleration = 450

@export var hit_points = 100

var destination = null;

func facing(length) -> Vector2:
	return Vector2.RIGHT.rotated(rotation) * length
	
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	pass

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
	if (destination != null):
		var inputVector = (destination - position).normalized();
		velocity = velocity.move_toward(inputVector * maxSpeed, maxAccel * delta).limit_length(maxSpeed);	
	
	if (destination == null):
		velocity = velocity.move_toward(Vector2.ZERO, deceleration * delta)

func _physics_process(delta):
	_rotation_process(delta);
	_movement_process(delta);
	move_and_slide();
	
func onImpact(other):
	if (other is Bullet):
		hit_points = hit_points - other.hit_points
		
func onDestroy():
	get_parent().remove_child(self)
	
