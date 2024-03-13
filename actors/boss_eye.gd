extends EnemyActor

class_name BossEye

var monster_max_cooldown = 2
var monster_cooldown = 0 
var child_monster_scene;
var active = false
var healthbar: TextureProgressBar

func _init():
	child_monster_scene = load("res://actors/enemy.tscn")
	rotation_speed = 50
	maxSpeed = 30
	hit_points = 20000
	max_hit_points = 20000
	shoot_radius = 1600
	
	weapons.append(BossEyeWeapon.new())
	weapons.append(BossAoeWeapon.new(self))

func _process(delta):
	if (!active):
		return
		
	if (hit_points <= 0):
		get_tree().change_scene_to_file("res://win_screen.tscn")
		
	if (monster_cooldown <= 0):
		var monster = child_monster_scene.instantiate()
		monster.position = position + facing(364)
		monster_cooldown = monster_max_cooldown
		get_parent().add_child(monster)
		
	monster_cooldown -= delta
		
	var player = get_parent().find_child('player')
	if (player != null):
		destination = player.position
		healthbar.visible = position.distance_to(destination) <= agro_radius
		healthbar.max_value = max_hit_points
		healthbar.value = hit_points
	
	super._process(delta)
	
func _ready():
	healthbar = get_parent().find_child('EnemyHealthbar')
	wasd_direction = Vector2(0, 1)
