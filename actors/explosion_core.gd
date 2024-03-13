extends Sprite2D

func _ready():
	var tween = create_tween().bind_node(self)
	tween.tween_property(self, "scale", Vector2(1, 1), 0.3)
	tween.tween_property(self, "scale", Vector2(2, 2), 0.3)
	tween.set_loops()
	
	tween.tween_property(self, "alpha", 0.3, 0.3)
	tween.tween_property(self, "alpha", 1, 0.3)
	tween.set_loops()


func _process(delta):
	pass
