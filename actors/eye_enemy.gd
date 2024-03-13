extends EnemyActor

var rng = RandomNumberGenerator.new()
var energy_pick_up_scene = load("res://pickups/energy_pickup.tscn")
var repair_pick_up_scene = load("res://pickups/repair_pickup.tscn")
var shield_pick_up_scene = load("res://pickups/shield_pickup.tscn")

var possible_pickups = [energy_pick_up_scene, repair_pick_up_scene, shield_pick_up_scene] 
var possible_rings = ['EnergyRing', 'RepairRing', 'ShieldRing']
var drop_index

func _ready():
	drop_index = randi_range(0,2)
	find_child(possible_rings[drop_index]).visible = true
	super._ready()
	
func die():
	var pickup = possible_pickups[drop_index].instantiate()
	var rnd_pos = rng.randi_range(-30, 30)
	pickup.position = position + Vector2(rnd_pos, rnd_pos)
	get_parent().call_deferred("add_child", pickup)
	super.die()
