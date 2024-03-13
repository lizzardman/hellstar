extends Bullet

class_name RocketBullet

var exp_scene = load("res://actors/rocket_explosion.tscn")
var exploded = false

func _init():
	max_distance = 1000
	damage = 0
	speed = 100
	
func _on_impact():
	if (exploded):
		return
	
	exploded = true
	var expl = exp_scene.instantiate()
	expl.position = position
	get_parent().call_deferred("add_child", expl)
	super._on_impact()
