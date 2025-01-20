extends State
class_name StateSustain

func calculated_speed():
	player.velocity.y =0

func get_next_state() -> State:
	if  not player.jump_pressed:
		player.timer = 0
		player.velocity.y = 0
		return next_state
	return self
	pass
