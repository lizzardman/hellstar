extends PickupActor

class_name EnergyPickup

var energy = 35

func apply_effect(body):
	body.give_energy(energy)
