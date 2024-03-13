extends Weapon

class_name EyeEnemyGun

func _init():
	shooting_sound = preload("res://sounds/eye_weapon.wav")
	max_cooldown = 1
	
	var bullet_scene = "res://actors/eye_enemy_bullet.tscn"
	var bullet = WeaponProjectileConfig.new(bullet_scene)
	
	bullet.position = Vector2.ZERO
	bullet.speed = 150
	bullet.is_enemy = true
	bullets.append(bullet)



