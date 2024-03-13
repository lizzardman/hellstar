extends Area2D

class_name Explosion

var impacted_targets = []

var lifetime = 0.3
var damage = 50

var shield_pick_up_scene = load("res://pickups/shield_pickup.tscn")
var repair_pick_up_scene = load("res://pickups/repair_pickup.tscn")
var rng = RandomNumberGenerator.new()

func _ready():
	connect('body_entered', body_entered)
	
func body_entered(body):
	if (impacted_targets.count(body) == 0):
		impacted_targets.append(body)
		damage_object(body)
	
func _process(delta):
	lifetime -= delta
	if (lifetime <= 0):
		queue_free()
		
func damage_object(body):
	if (body as EnemyActor):
		body.onImpact(self)
		if (body is Enemy):
			if (body.close_to_boss):
				var shield_pick_up = shield_pick_up_scene.instantiate()
				var random_pos = rng.randf_range(-20.0, 20.0)
				shield_pick_up.position = position + Vector2(random_pos ,random_pos)
				get_parent().call_deferred('add_child', shield_pick_up)
			elif(body.drops_hp):
				var repair_pick_up = repair_pick_up_scene.instantiate()
				var random_pos = rng.randf_range(-20.0, 20.0)
				repair_pick_up.position = position + Vector2(random_pos ,random_pos)
				get_parent().call_deferred("add_child", repair_pick_up)
		
	
