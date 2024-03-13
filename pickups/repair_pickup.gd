extends PickupActor

var hp = 25

func apply_effect(body):
	body.give_hit_points(hp)
