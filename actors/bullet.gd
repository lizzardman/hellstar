extends AreaActor

class_name Bullet

var damage = 10
var max_distance = 600
var speed = 1000
var starting_position
var shooter: Actor
var is_enemy = false
var id

var max_hits = 1
var enemies_hit = []

func _ready():
	starting_position = position
	connect('body_entered', body_entered)
	
func  _process(delta):
	if (position.distance_to(starting_position) >= max_distance):
		queue_free()
		
func _on_impact():
	queue_free()
	
func body_entered(item):
	if (item is Actor && shooter != item):
		if (item is EnemyActor != is_enemy):
			if (enemies_hit.count(item) == 0 && max_hits > 0):
				if (item.onImpact(self)):
					enemies_hit.append(item)
					max_hits -= 1
					if (max_hits == 0):
						_on_impact()
	
