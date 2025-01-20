extends Node
class_name State
#base class
var time_limit : float = 0
var next_state :State = null
var player : Player

func calculated_speed():
	return 0

func get_next_state() -> State:
	return next_state
