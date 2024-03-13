extends Actor

class_name EnemyActor

var shoot_radius = 300

func _init():
	var weapon = EyeEnemyGun.new()
	rotation_speed = 100
	maxSpeed = 100
	weapons.append(weapon)

func _process(delta):
	var player = get_parent().find_child('player')
	if (player != null):
		destination = get_parent().find_child('player').position
		if (position.distance_to(destination) < shoot_radius && !weapons.is_empty()):
			weapons[0].shoot(self)
		
	super._process(delta)
	
func _ready():
	wasd_direction = Vector2(0, 1)
