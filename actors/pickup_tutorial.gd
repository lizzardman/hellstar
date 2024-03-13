extends PickupActor

class_name PickupTutorial

@export var text: String;

func _ready():
	find_child('Sprite2D').text = self.text
	super._ready()
