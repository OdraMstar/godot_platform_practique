extends State
class_name StateFloor

func calculated_speed():
	if not player.is_on_floor():
		player.velocity += player.get_gravity() * (player.timer ** 2) 

func get_next_state() -> State:
	if player.jump_pressed and player.is_on_floor():
		player.timer =0
		return next_state
	if player.is_on_floor():
		player.timer=0
	return self
	pass
