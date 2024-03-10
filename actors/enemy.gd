extends Actor


func _init():
	rotation_speed = 100
	maxSpeed = 100

func _process(delta):
	destination = get_parent().find_child('player').position
	super._process(delta)
	
func _ready():
	wasd_direction = Vector2(0, 1)
