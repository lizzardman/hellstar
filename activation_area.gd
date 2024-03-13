extends Area2D


func _ready():
	connect('body_entered', body_entered)
	
func body_entered(item):
	if (item is Player):
		var boss = get_parent().find_child('BossEye')
		if (boss != null):
			boss.active = true
