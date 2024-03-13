extends Sprite2D

var actor;

func _ready():
	actor = get_parent()


func _process(delta):
	visible = actor.drops_hp
