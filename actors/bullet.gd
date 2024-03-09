extends AreaActor

class_name Bullet

var damage = 10
var max_distance = 600
var speed = 1000
var starting_position
var shooter: Actor

func _ready():
	starting_position = position
	connect('body_entered', body_entered)
	
func  _process(delta):
	if (position.distance_to(starting_position) >= max_distance):
		queue_free()
	
func body_entered(item):
	if (item is Actor && shooter != item):
		item.onImpact(self)
		queue_free()
	
