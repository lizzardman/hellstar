extends Object

class_name Weapon

var max_cooldown = 0.1
var cooldown: float = 0
var bullets = []

func _init(bullets):
	self.bullets = bullets

func process(delta):
	if (cooldown > 0):
		cooldown = cooldown - delta;
	
func shoot(owner: Actor):
	if (cooldown <= 0):
		for b in bullets:
			var bullet: Bullet = b.bullet_scene.instantiate()
			var rotation = 	owner.rotation + b.rotation
		
			bullet.rotation = rotation
			bullet.position = owner.position + b.position.rotated(rotation) 
			bullet.velocity = owner.facing(b.speed).rotated(b.rotation)
			bullet.shooter = owner
			
			owner.get_parent().add_child(bullet)
		cooldown = max_cooldown
		
		
