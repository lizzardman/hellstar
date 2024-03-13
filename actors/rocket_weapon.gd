extends Weapon

class_name RocketWeapon

func _init():
	var bullet_scene = "res://actors/rocket_bullet.tscn"
	var bullet = WeaponProjectileConfig.new(bullet_scene)
	bullet.speed = 500
	max_cooldown = 1
	bullets.append(bullet)
