extends Actor

func _process(delta):
	destination = get_parent().find_child('player').position
