extends Area2D

class_name PickupActor

func _ready():
	var sprite = find_child('Sprite2D')
	var tween = create_tween().bind_node(sprite)
	tween.tween_property(sprite, "scale", Vector2(0.85, 0.85), 0.25)
	tween.tween_property(sprite, "scale", Vector2(1, 1), 0.25)
	tween.set_loops()
	connect('body_entered', body_entered)

func apply_effect(body):
	return

func body_entered(body):
	if (body is Player):
		apply_effect(body)
		queue_free()
