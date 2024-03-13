extends Actor

class_name EnemyActor

var shoot_radius = 300
var agro_radius = 3000

func distance_to_player():
	var player = get_parent().find_child('player')
	return position.distance_to(player.position)

func _init():
	var weapon = EyeEnemyGun.new()
	rotation_speed = 100
	maxSpeed = 100
	weapons.append(weapon)

func _process(delta):
	var player = get_parent().find_child('player')
	if (player != null):
		if (position.distance_to(player.position) <= agro_radius):
			destination = player.position
			for weapon in weapons:
				if (position.distance_to(destination) < shoot_radius):
					weapon.shoot(self)
			
	super._process(delta)
	
func _ready():
	wasd_direction = Vector2(0, 1)
