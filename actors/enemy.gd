extends Actor

func _process(delta):
	destination = get_parent().find_child('player').position
	super._process(delta)

func _ready():
	var detection = find_child("detection_area")
	detection.connect('body_entered', onImpact)
