extends Area2D

class_name AreaActor

var velocity: Vector2

func _physics_process(delta):
	position += velocity * delta
