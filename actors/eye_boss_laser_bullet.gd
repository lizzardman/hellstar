extends Bullet

class_name EyeBossEnemyBullet

var follow_movement_vector;

var cooldown = 2

func _init():
	max_distance = 1
	damage = 0
	max_hits = 2
	
func _ready():
	super._ready()
	follow_movement_vector = (position - shooter.position).rotated(-rotation) 
	
func _process(delta):
	cooldown -= delta
	if (cooldown <= 0):
		queue_free()
	
func _physics_process(delta):
	super._physics_process(delta)
	rotate((3 if self.id == 'left' else -3) * delta)
	position = shooter.position + follow_movement_vector.rotated(shooter.rotation) 
	
	
