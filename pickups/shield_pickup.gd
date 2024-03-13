extends PickupActor

class_name ShieldPickup

var shields = 15

func apply_effect(body):
	body.give_shields(shields)	
