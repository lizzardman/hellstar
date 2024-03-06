extends Object

class_name Movement

@export var maxSpeed = 300
@export var maxAccel = 400
@export var deceleration = 450

func _init(maxSpeed:int = 300, maxAccel:int = 400, deceleration:int = 450):
	self.maxSpeed = maxSpeed
	self.maxAccel = maxAccel
	self.deceleration = deceleration
