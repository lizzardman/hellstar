extends Weapon

class_name BossAoeWeapon

var shooter: Actor

var rng = RandomNumberGenerator.new()
var rng_rotation = 0

func _init(shooter):
	self.shooter = shooter
	shooting_sound = preload("res://sounds/heavy_laser.wav")
	max_cooldown = 5
	
	var bullet_scene = "res://actors/boss_aoe_bullet.tscn"
	
	var number_of_shots = 20
	var part = PI * 2 / number_of_shots
	for n in number_of_shots:
		var bullet = WeaponProjectileConfig.new(bullet_scene)
		bullet.is_enemy = true
		bullet.speed = 250 
		bullet.rotation = n * part
		bullets.append(bullet)
		
func process(delta):
	rng_rotation = rng.randf() * PI * 2;
	super.process(delta)
		
func get_bullet_rotation(config: WeaponProjectileConfig) -> float:
	return config.rotation + rng_rotation;
		
func shoot(owner: Actor):
	var player = shooter.get_parent().find_child('player')
	if (player != null):
		if ((player.position - shooter.position).length() > 700):
			super.shoot(owner)

