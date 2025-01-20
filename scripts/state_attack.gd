extends State
class_name StateAttack

func calculated_speed():
	player.velocity.y = player.JUMP_VELOCITY * player.timer 

func get_next_state() -> State:
	if player.timer >= time_limit:
		#print("change state " + str(player.timer) )
		player.timer = 0
		player.velocity.y = 0
		return next_state
	return self
	pass
