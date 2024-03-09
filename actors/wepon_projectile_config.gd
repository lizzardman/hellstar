extends Object

class_name WeaponProjectileConfig

var speed = 1000
var rotation = 0
var position = Vector2.ZERO
var bullet_scene;
var scale = 1;

func _init(bullet_scene_name):
	bullet_scene = load(bullet_scene_name)
