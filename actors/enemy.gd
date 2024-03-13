extends EnemyActor

class_name Enemy

var close_to_boss = false;
var drops_hp = false;

var energy_pick_up_scene = load("res://pickups/energy_pickup.tscn")

func _process(delta):
	super._process(delta)
	var boss = get_parent().find_child('BossEye')
	if (boss != null):
		close_to_boss = (position - boss.position).length() < 500
	else:
		close_to_boss = false
		
	drops_hp = hit_points < 40 && !close_to_boss
	maxSpeed = 150 if close_to_boss else 390 

func die():
	if (close_to_boss):
		var energy_pick_up = energy_pick_up_scene.instantiate()
		energy_pick_up.position = position
		get_parent().call_deferred("add_child", energy_pick_up)
		
	super.die()
