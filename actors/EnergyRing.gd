extends Sprite2D


var actor;

func _ready():
	actor = get_parent()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	visible = actor.close_to_boss
