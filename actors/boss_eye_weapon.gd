extends Weapon

class_name BossEyeWeapon

func _init():
	shooting_sound = preload("res://sounds/heavy_laser.wav")
	max_cooldown = 6
	
	var bullet_scene = "res://actors/eye_boss_laser_bullet.tscn"
	var bullet_left = WeaponProjectileConfig.new(bullet_scene)
	bullet_left.position = Vector2(150, -135)
	bullet_left.speed = 1
	bullet_left.is_enemy = true
	bullet_left.id = 'left'
		
	var bullet_right = WeaponProjectileConfig.new(bullet_scene)
	bullet_right.position = Vector2(140, 135)
	bullet_right.speed = 1
	bullet_right.is_enemy = true
	bullet_right.id = 'right'
	
	bullets.append(bullet_left)
	bullets.append(bullet_right)


