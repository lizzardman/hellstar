extends Bullet

class_name GunTypeWeaponShot

func _init():
	maxSpeed = 1000
	maxAccel = 2400
	
func _ready():
	pass

func _process(delta):
	destination = position + facing(maxSpeed * 2) 
	super._process(delta)
	
