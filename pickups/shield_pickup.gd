extends PickupActor

var shields = 15

func apply_effect(body):
	body.give_shields(shields)	
