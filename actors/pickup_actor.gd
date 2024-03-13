extends Area2D

class_name PickupActor

var action_text_scene = load("res://pickups/action_text.tscn")

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
		var action_text = action_text_scene.instantiate()
		action_text.from_pickup(self)
		get_parent().call_deferred("add_child", action_text)
		queue_free()
