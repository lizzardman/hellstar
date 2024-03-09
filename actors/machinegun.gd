extends Weapon

class_name MachineGun

func _init():
	var bullet_scene = "res://actors/gun_bullet.tscn"
	var bullet_left = WeaponProjectileConfig.new(bullet_scene)
	bullet_left.position = Vector2(30, -30)
	var bullet_right = WeaponProjectileConfig.new(bullet_scene)
	bullet_right.position = Vector2(30, 30)
	
	bullets.append(bullet_right)
	bullets.append(bullet_left)

