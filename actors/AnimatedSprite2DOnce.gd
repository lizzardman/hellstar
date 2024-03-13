extends AnimatedSprite2D

func _ready():
	self.connect("animation_finished", animation_finished)

func animation_finished():
	stop()
