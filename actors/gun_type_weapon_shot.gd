extends Actor

class_name GunTypeWeaponShot

var _gunOrigin = null

func _init():
	_gunOrigin = position
	maxSpeed = 1000
	maxAccel = 2400

func _process(delta):
	destination = position + facing(maxSpeed * 2) 
	super._process(delta)
	
