extends Object

class_name Weapon

var max_cooldown = 0.2
var cooldown: float = 0
var bullets = []
var shooting_sound = preload("res://sounds/machinegun.wav")

func _init(bullets):
	self.bullets = bullets

func process(delta):
	if (cooldown > 0):
		cooldown = cooldown - delta;
		

func shoot(owner: Actor):
	if (cooldown <= 0):
		for b in bullets:
			var bullet = b.bullet_scene.instantiate()
			var rotation = 	owner.rotation + b.rotation
		
			bullet.rotation = rotation
			bullet.position = owner.position + b.position.rotated(rotation) 
			bullet.velocity = owner.facing(b.speed).rotated(b.rotation)
			bullet.shooter = owner
			bullet.is_enemy = b.is_enemy
			bullet.id = b.id
			
			owner.get_parent().add_child(bullet)
			
			var player = owner.find_child('AudioStreamPlayer')
			if (player != null):
				player.stream = shooting_sound
				player.play()
			
		cooldown = max_cooldown
		
		
