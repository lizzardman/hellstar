extends Label

class_name ActionTextLabel

var lifetime = 1
var text_type: TextType

func _ready():
	if (text_type == TextType.REPAIR):
		set("theme_override_colors/font_color", Color.CRIMSON)
	if (text_type == TextType.ENERGY):
		set("theme_override_colors/font_color", Color.DARK_ORANGE)
	if (text_type == TextType.SHILD):
		set("theme_override_colors/font_color", Color.DODGER_BLUE)

func from_pickup(pickup):

	position = pickup.position
	if (pickup is PickupTutorial):
		text_type = TextType.TUTORIAL
		text = 'Good job!'
	if (pickup is EnergyPickup):
		text_type = TextType.ENERGY
		text = str("+", pickup.energy)
	if (pickup is RepairPickup):
		text_type = TextType.REPAIR
		text = str("+", pickup.hp)
	if (pickup is ShieldPickup):
		text_type = TextType.SHILD
		text = str("+", pickup.shields)
	

func _process(delta):
	position -= Vector2(0, 100 * delta)
	lifetime -= delta
	if (lifetime <= 0):
		queue_free()

enum TextType {REPAIR, ENERGY, SHILD, TUTORIAL}
