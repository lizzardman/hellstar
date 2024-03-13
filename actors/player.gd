extends Actor

class_name Player

var bulletScene: Resource = null;

var rmb = false
var lmb = false
var iframes = 0

var evade_max_cooldown = 0.5;
var evade_energy_cost = 30
var evade_cooldown = 0

var rocket_energy_cost = 30

var energy = 120.0
var max_energy = 120.0
var energy_recharge_rate = 12.0

var evade_scene = load("res://effects/evade_effect.tscn")

func _init():
	weapons.append(MachineGun.new())
	weapons.append(RocketWeapon.new())
	
func give_energy(value):
	energy = min(max_energy, energy + value)

func _input(event):
	if (event is InputEventMouseButton):
		if (event.button_index == MOUSE_BUTTON_LEFT):
			lmb = event.is_pressed()
			
		if (event.button_index == MOUSE_BUTTON_RIGHT):
			rmb = event.is_pressed()
	
	if (event is InputEventKey && event.is_pressed() && event.keycode == KEY_SPACE):
		_evade()
		
func _evade():
	if (evade_cooldown > 0 || energy < 35):
		return
		
	var evade_node = evade_scene.instantiate()
	
	add_child(evade_node)
	
	find_child('AnimatedSprite2D').play()
	energy = energy - evade_energy_cost
	evade_cooldown = evade_max_cooldown
	iframes = 0.7
	
func  _process(delta):
	super._process(delta)
	
	if (iframes > 0):
		maxSpeed = 800
		maxAccel = 1800
	else:
		maxSpeed = 400
		maxAccel = 800
	
	if (iframes > 0):
		iframes -= delta
		
	if (evade_cooldown > 0):
		evade_cooldown -= delta
	
	var healthbar = get_parent().find_child('Healthbar')
	healthbar.max_value = self.max_hit_points
	healthbar.value = self.hit_points
	
	var energybar = get_parent().find_child('Energybar')
	energybar.max_value = self.max_energy
	energybar.value = self.energy
	
	var shieldsbar = get_parent().find_child('Shieldsbar')
	shieldsbar.max_value = self.max_shields
	shieldsbar.value = self.shields
	
	give_energy(delta * energy_recharge_rate)
	
	if (lmb):
		weapons[0].shoot(self)
		
	if (rmb && energy >= rocket_energy_cost):
		if (weapons[1].shoot(self)):
			energy = energy - rocket_energy_cost
	
	destination = get_global_mouse_position();
	
	var x = (Input.is_key_pressed(KEY_W) as int) - (Input.is_key_pressed(KEY_S) as int);
	var y = (Input.is_key_pressed(KEY_D) as int) - (Input.is_key_pressed(KEY_A) as int);
	
	wasd_direction = Vector2(y, x)
	
func onImpact(other):
	if (iframes <= 0):
		return super.onImpact(other)
	
	return false
