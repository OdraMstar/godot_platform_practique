extends State
class_name StateRelease

func calculated_speed():
	if not player.is_on_floor():
		player.velocity += player.get_gravity() * (player.timer ** 2) * 0.1

func get_next_state() -> State:
	if player.is_on_floor():
		player.timer = 0
		return next_state
	else:
		return self
	pass
