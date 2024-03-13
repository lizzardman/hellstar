extends EnemyActor

class_name BossEye

var monster_max_cooldown = 2
var monster_cooldown = 0 
var child_monster_scene;
var active = false

func _init():
	child_monster_scene = load("res://actors/enemy.tscn")
	rotation_speed = 50
	maxSpeed = 30
	hit_points = 10000
	shoot_radius = 1600
	
	weapons.append(BossEyeWeapon.new())
	weapons.append(BossAoeWeapon.new(self))

func _process(delta):
	if (!active):
		return
		
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
