extends PickupActor

class_name RepairPickup

var hp = 15

func apply_effect(body):
	body.give_hit_points(hp)
