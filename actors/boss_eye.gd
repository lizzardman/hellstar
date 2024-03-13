extends EnemyActor

class_name BossEye

var monster_max_cooldown = 2
var monster_cooldown = 0 
var child_monster_scene;

func _init():
	child_monster_scene = load("res://actors/enemy.tscn")
	rotation_speed = 50
	maxSpeed = 10
	hit_points = 10000
	shoot_radius = 1600
	
	weapons.append(BossEyeWeapon.new())

func _process(delta):
	if (monster_cooldown <= 0):
		var monster = child_monster_scene.instantiate()
		monster.position = position + facing(364)
		monster_cooldown = monster_max_cooldown
		get_parent().add_child(monster)
		
	monster_cooldown -= delta
		
	var player = get_parent().find_child('player')
	if (player != null):
		destination = player.position
		
	super._process(delta)
	
func _ready():
	wasd_direction = Vector2(0, 1)
