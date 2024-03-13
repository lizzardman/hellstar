extends Area2D

class_name Explosion

var impacted_targets = []

var lifetime = 0.2
var damage = 50

func _ready():
	connect('body_entered', body_entered)
	
func body_entered(body):
	impacted_targets.append(body)
	
func _process(delta):
	lifetime -= delta
	if (lifetime <= 0):
		impact()
	
func impact():
	for i in impacted_targets:
		if (i as Actor):
			i.onInpat(self)
	queue_free()
